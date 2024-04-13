from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'CrisBaraja10042'
app.config['MYSQL_DB'] = 'sistema_facturacion'

mysql = MySQL(app)


def get_db():
    try:
        return mysql.connection
    except Exception as e:
        print('ERROR EN LA BASE DE DATOS ', e)
        return None
    