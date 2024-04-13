from __init__ import app, get_db
from flask import render_template

#Endpont pagina principal
@app.route('/')
def login():
    return render_template('login.html')

#Valida login de usuario
@app.route('/validar-login', methods=['POST'])
def validar_login():
    if get_db() is None:
        return "Error en la base de datos"
    cur = get_db().cursor()
    sql=cur.execute("SELECT * FROM empleado")
    sql=cur.fetchall()
    print(sql)  
    
    
@app.route('/home')
def home():
    return "Welcome to the Home Page"
