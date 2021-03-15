import MySQLdb

def connection():
    conn = MySQLdb.connect(host="localhost", user = "root",
    passwd = "", db = "auction")
    c = conn.cursor()

    return c, conn
