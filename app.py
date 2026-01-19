from flask import Flask, render_template, request, redirect, url_for, send_file, flash, session
from flask_sqlalchemy import SQLAlchemy
from flask import abort
from werkzeug.security import generate_password_hash, check_password_hash
import os
from client import upload, download
from socket import socket, AF_INET, SOCK_STREAM
import os
from datetime import datetime


app = Flask(__name__)
app.secret_key = 'your_secret_key_here'


basedir = os.path.abspath(os.path.dirname(__file__))   
database_path = os.path.join(basedir, 'database.db')

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + database_path

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


# Create the database and tables if they dont exist
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(150), nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    is_admin = db.Column(db.Boolean, default=False)



class Log(db.Model):
    _tablename_ = 'logs'
    id         = db.Column(db.Integer, primary_key=True)
    username   = db.Column(db.String(150), nullable=False)
    filename   = db.Column(db.String(255), nullable=False)
    action     = db.Column(db.String(15),  nullable=False)  
    created_at = db.Column(db.DateTime,   default=datetime.utcnow)   


print('SQLAlchemy URI  ➜', app.config['SQLALCHEMY_DATABASE_URI'])

with app.app_context():
    target = db.engine.url.database          
    
    db.create_all()

HOST = '127.0.0.1'
PORT = 23456
BUFFER_SIZE = 4096
# Create a socket connection to the server
def get_socket():
    sock = socket(AF_INET, SOCK_STREAM)
    sock.connect((HOST, PORT))
    return sock


@app.route('/logs')
def view_logs():
    logs = Log.query.order_by(Log.created_at.desc()).all()   # newest first
    return render_template('logs.html', logs=logs)

@app.route('/')
def index():
    return render_template('index.html')

#create a new user and save it to the database
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form.get('Username')
        email = request.form.get('email')
        password = request.form.get('password')
        confirm_password = request.form.get('Confirmpassword')


        user = User.query.filter_by(email=email).first()
        if user:
            flash('Email already exists.', category='error')
        elif len(email) < 4:
            flash('Email must be greater than 3 characters.', category='error')
        elif len(username) < 2:
            flash('Username must be greater than 1 character.', category='error')
        elif password != confirm_password:
            flash('Passwords do not match.', category='error')
        elif len(password) < 7:
            flash('Password must be at least 7 characters.', category='error')
        else:
            new_user = User(
                username=username,
                email=email,
                password=generate_password_hash(password)
            )
            db.session.add(new_user)
            db.session.commit()
            flash('Account created successfully!', category='success')
            return redirect(url_for('login'))

    return render_template('signup.html')

#check if the user exists in and redirect to the index page
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        user = User.query.filter_by(email=email).first()
        if user and check_password_hash(user.password, password):
            session['user_id'] = user.id
            session['is_admin'] = bool(user.is_admin) 
            flash('Logged in successfully!', category='success')
            return redirect(url_for('index'))
        else:
            flash('Incorrect email or password.', category='error')

    return render_template('login.html')

#if any action is performed on a file log it to the database
def log_action(username: str, filename: str, action: str) -> None:
    """Write one row to the logs table and commit immediately."""
    db.session.add(Log(username=username, filename=filename, action=action))
    db.session.commit()

#handle file uploads
@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash('No file selected')
            return redirect(request.url)

        file = request.files['file']
        if file.filename == '':
            flash('No file selected')
            return redirect(request.url)

        if file:
            temp_path = os.path.join('temp', file.filename)
            file.save(temp_path)

            sock = get_socket()
            upload(sock, temp_path)
            sock.close()

            os.remove(temp_path)
            u = User.query.get(session.get('user_id'))  
            log_action(u.username if u else 'guest', file.filename, 'upload')
            flash('File uploaded successfully')
            return redirect(url_for('view_files'))

    return render_template('upload.html')
#list all files in the server and allow the user to download them
@app.route('/view')
def view_files():
    sock = get_socket()
    sock.sendall(b"list")
    resp = sock.recv(BUFFER_SIZE).decode()
    sock.close()

    files = [f for f in resp.strip().split('\n') if f]
    return render_template('view.html', files=files)
#handle file downloads
@app.route('/download/<filename>')
def download_file(filename):
    sock = get_socket()
    download(sock, filename)
    sock.close()
    u = User.query.get(session.get('user_id'))
    log_action(u.username if u else 'guest', filename, 'download')

    return send_file(
        os.path.join('downloads', filename),
        as_attachment=True
    )

def admin_only():
    if not session.get('is_admin'):
        abort(403)
#handles file deletions
@app.post('/delete/<path:filename>')
def delete_file(filename):
    admin_only()                                   
    sock = get_socket()                           
    sock.sendall(f"delete {filename}".encode())
    resp = sock.recv(BUFFER_SIZE).decode().strip()
    sock.close()

    if not resp.startswith("Success"):
        flash(resp, category='error')
    else:
        u = User.query.get(session['user_id'])    
        log_action(u.username, filename, 'delete')
        flash(f'{filename} deleted.', category='success')

    return redirect(url_for('view_files'))

#logout the user and clear the session
@app.route('/logout')
def logout():
    session.clear()
    flash('Logged out.', 'success')
    return redirect(url_for('index'))

if __name__ == '__main__':
    os.makedirs('temp', exist_ok=True)
    os.makedirs('downloads', exist_ok=True)
    os.makedirs('logs', exist_ok=True)

    app.run(debug=True)
