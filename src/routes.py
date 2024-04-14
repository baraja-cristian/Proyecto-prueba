from __init__ import app, get_db, mysql
from flask import render_template, request

#Endpont pagina principal
@app.route('/')
def login():
    return render_template('login.html')

#Valida login de usuario
@app.route('/validar-login', methods=['GET', 'POST'])
def validar_login():
    if get_db() is None:
        return "Error en la base de datos"

    if request.method == 'POST' and 'cedula_user' in request.form and 'password_user' in request.form:
        usuario = request.form['cedula_user'] 
        clave = request.form['password_user']     

        print(usuario)
        print(clave)

        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM empleados WHERE cedula = %s AND contraseña = %s', (usuario, clave))
        account = cur.fetchone()

        if account:
            return render_template('home.html')
        else:
            return render_template('login.html')

    else:
        return render_template('login.html')


        
@app.route('/home')
def home():
    return render_template('home.html')
