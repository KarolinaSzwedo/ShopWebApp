from flask_wtf import FlaskForm
from wtforms import TextField, SubmitField, PasswordField, BooleanField, FloatField, DecimalField, TextAreaField, validators, SelectField

class RegistrationForm(FlaskForm):
    username = TextField("Username:", [validators.Length(min = 4, max = 20)], render_kw={"placeholder": "Username"})
    email = TextField("Email address:", [validators.Length(min = 6, max = 50)], render_kw={"placeholder": "email@example.com"})
    password = PasswordField("Password:", [validators.DataRequired(), validators.EqualTo("confirm", message = "Passwords not match")],
                              render_kw={"placeholder": "Password"})
    confirm = PasswordField("Repeat password:", render_kw={"placeholder": "Password"})
    accept_tos = BooleanField("I accept terms of service.", [validators.DataRequired()])

class LoginForm(FlaskForm):
    username = TextField("Username:", render_kw={"placeholder": "Username"})
    password = PasswordField("Password:", render_kw={"placeholder": "Password"})

class SettingsForm(FlaskForm):
    password = PasswordField("Password:", [validators.DataRequired(), validators.EqualTo("confirm", message = "Passwords not match")], render_kw={"placeholder": "Password"})
    new_password = PasswordField("New password:")
    confirm = PasswordField("Repeat password:", render_kw={"placeholder": "Password"})

class NewOfferForm(FlaskForm):
    product = TextField("Product:", [validators.Length(min = 2, max = 20)], render_kw={"placeholder": "Product"})
    description = TextAreaField("Descripion:", [validators.optional(), validators.length(max=1000)])
    price = TextField("Price:", render_kw={"placeholder": "0.00"})
