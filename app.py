from flask import Flask, render_template, flash, request, url_for, session, redirect
from Forms import RegistrationForm, LoginForm, SettingsForm,  NewOfferForm
from MySQLdb import escape_string as thwart
import os
import gc
from dbconnect import connection
from datetime import date
import flask_resize


# settings for uploading files
UPLOAD_FOLDER = 'static/img'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# to resize images
app.config['RESIZE_URL'] = 'http://127.0.0.1:5000/static/img/'
app.config['RESIZE_ROOT'] = 'static/img/'
resize = flask_resize.Resize(app)

app.secret_key = 'development key'

# settings for uploading files
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/register/', methods = ['GET', 'POST'])
def register_page():
    try:
        form = RegistrationForm(request.form)
        if request.method == 'POST':
            if form.validate() == False:
                flash('All fields are required.', 'danger')
                return render_template('register.html', form = form)
            else:
                username  = form.username.data
                email = form.email.data
                password = form.password.data
                c, conn = connection()

                x = c.execute("SELECT * FROM users WHERE username = (%s)",
                          (thwart(username),))
                y = c.execute("SELECT * FROM users WHERE email = (%s)",
                          (thwart(email),))

                if int(x) > 0:
                    flash("That username is already taken, please choose another", 'danger')
                    return render_template('register.html', form=form)

                if int(y) > 0:
                    flash("That email is already assigned to existing account", 'danger')
                    return render_template('register.html', form=form)

                else:
                    c.execute("INSERT INTO users (username, password, email) VALUES (%s, %s, %s)",
                              (thwart(username), thwart(password), thwart(email)))

                    conn.commit()
                    flash("Thank you for registering!", 'success')

                    c.close()
                    conn.close()
                    gc.collect()

                    return redirect(url_for('register_page'))

        return render_template("register.html", form=form)

    except Exception as e:
        return(str(e))

@app.route('/login/', methods = ['GET', 'POST'])
def login():
    try:
        form = LoginForm(request.form)
        if request.method == 'POST':
            username = form.username.data
            password = form.password.data
            c, conn = connection()

            c.execute('SELECT * FROM users WHERE username = (%s) AND password = (%s)', (username,password,))
            account = c.fetchone()

            if account:
                session['logged_in'] = True
                session['id'] = account[0]
                session['username'] = account[1]
                flash("Logged in successfully !", 'success')

                return render_template('login.html', form = form)
            else:
                flash("Incorrect username / password!", "danger")

        return render_template('login.html', form=form)

    except Exception as e:
        return(str(e))

@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out!", "info")
    gc.collect()
    return redirect(url_for('index'))

@app.route('/products/')
def products():
    if 'logged_in' in session:
        c, conn = connection()
        c.execute('SELECT * FROM products')
        products = c.fetchall()
        return render_template('products.html', products = products)
    else:
        flash('You are not logged in', 'info')
        return redirect(url_for('index'))

@app.route('/archive/')
def archive():
    if 'logged_in' in session:
        c, conn = connection()
        c.execute('SELECT * FROM archive')
        archive = c.fetchall()
        return render_template('archive.html', archive = archive)
    else:
        flash('You are not logged in', 'info')
        return redirect(url_for('index'))

@app.route('/buy/<string:product_id>', methods = ['POST','GET'])
def buy_product(product_id):
    data= date.today()
    c, conn = connection()
    c.execute('INSERT INTO archive (pid, uid,seller, product, description, price, add_date, image) SELECT pid, uid,seller, product, description, price, add_date, image FROM products WHERE pid = {0}'.format(product_id))
    c.execute('UPDATE archive SET buyer = (%s), sale_date=(%s) WHERE pid=(%s)',(thwart(session['username']),data,product_id))
    c.execute('DELETE FROM products WHERE pid = {0}'.format(product_id))
    conn.commit()
    flash('Product bought successfully', 'success')
    return redirect(url_for('purchased'))


@app.route('/settings/', methods = ['GET', 'POST'])
def settings_page():
    form = SettingsForm(request.form)
    if request.method == 'POST':
        if form.validate() == False:
            flash('All fields are required.', 'danger')
            return render_template('settings.html', form = form)
        else:
            password = form.password.data
            new_password = form.new_password.data

            c, conn = connection()
            c.execute('SELECT * FROM users WHERE username = (%s)', (session['username'],))
            already_password = c.fetchone()
            if password != already_password[2]:

                flash("Incorrect password", 'danger')
                return render_template('settings.html', form=form)

            elif password == new_password:
                flash("New password is the same as old password!", 'danger')

            else:
                c.execute("UPDATE users SET password=(%s) WHERE username=(%s)",(thwart(new_password), thwart(session['username'])))

                conn.commit()
                flash("Your password has been changed", 'success')
                c.close()
                conn.close()
                gc.collect()
                return redirect(url_for('settings_page'))

    return render_template("settings.html", form=form)


@app.route('/purchased/', methods = ['GET', 'POST'])
def purchased():
    c, conn = connection()
    c.execute('SELECT * FROM archive WHERE buyer = (%s)', (session['username'],))
    purchased = c.fetchall()
    return render_template('purchased.html', purchased = purchased)


@app.route('/my_offers/', methods = ['GET', 'POST'])
def my_offers():
    c, conn = connection()
    c.execute('SELECT * FROM products WHERE seller = (%s)', (session['username'],))
    my_offers = c.fetchall()
    c.execute('SELECT * FROM archive WHERE seller = (%s)', (session['username'],))
    sold = c.fetchall()
    return render_template('my_offers.html', my_offers = my_offers, sold=sold)

@app.route('/new_offer/', methods = ['GET', 'POST'])
def new_offer():
    if 'logged_in' in session:
        form = NewOfferForm(request.form)
        if request.method == 'POST':
            if form.validate() == False:
                flash('All fields are required.', 'danger')
                return render_template('new_offer.html', form = form)
            else:
                product  = form.product.data
                description = form.description.data
                price = form.price.data
                data=date.today()

                # aading image
                if 'file' not in request.files:
                    flash('No file part', 'danger')
                    return redirect(request.url)
                file = request.files['file']

                if file.filename == '':
                    flash('No selected file', 'danger')
                    return redirect(request.url)

                if file and allowed_file(file.filename):
                    c, conn = connection()
                    c.execute("INSERT INTO products (uid, seller, product, description, price, add_date, image) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                                  (session['id'], session['username'], thwart(product), thwart(description), thwart(price), data, thwart(file.filename)))
                    conn.commit()
                    c.close()
                    conn.close()
                    gc.collect()
                    # saving image
                    file.save(os.path.join(app.config['UPLOAD_FOLDER'], file.filename))
                    flash("Product successfully added", 'success')
                    return redirect(url_for('new_offer'))

        return render_template("new_offer.html", form=form)
    else:
        flash('You are not logged in', 'info')
        return redirect(url_for('index'))


if __name__ == '__main__':
    app.run(debug=True)
