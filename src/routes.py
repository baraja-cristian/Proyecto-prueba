from __init__ import app, get_db, mysql
from flask import render_template, request

#Endpoint para login de usuario
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

        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM empleados WHERE cedula = %s AND contraseña = %s', (usuario, clave))
        account = cur.fetchone()
        
        datos_usuario = (account[0], account[1], account[2], account[3],)
        
        if account:
            return render_template('home.html', datos_usuario=datos_usuario)
        else:
            return render_template('login.html')
    else:
        return render_template('login.html')

#Endpoint pagina principal
@app.route('/home')
def home():
    return render_template('home.html')


#Endpoint para cerrar sesion
@app.route('/logout')
def logout():
    return render_template('login.html')