from __init__ import app, get_db
from flask import render_template, request

#Endpont pagina principal
@app.route('/')
def login():
    return render_template('login.html')

#Valida login de usuario
@app.route('/validar-login', methods=['POST'])
def validar_login():
    if get_db() is None:
        return "Error en la base de datos"
    else:
        # Obtener los datos de un campo del formulario
        usuario = request.form['cedula_user'] 
        clave = request.form['password_user']       
         
        print(request.form['cedula_user'])
        print(request.form['password_user'])
        
@app.route('/home')
def home():
    return "Welcome to the Home Page"
