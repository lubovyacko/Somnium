from flask import Flask,render_template,request, make_response
from flaskext.mysql import MySQL
import hashlib
import base64
import os
import json
from werkzeug.utils import secure_filename
app = Flask(__name__)
mysql = MySQL()
app.secret_key = os.urandom(24)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'somn'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()
session =  {}
@app.route("/")
def main():
    return render_template('index.html')
@app.route("/signin")
def signin():
    return render_template('signin.html')
@app.route("/register")
def register():
    return render_template('register.html')
@app.route("/add", methods = ["POST"])
def add_user():
    data = request.get_json(force=True)
    if data['check']=='on':
        data['check']=True
    cursor.execute('SELECT * FROM `users`')
    users = cursor.fetchall()
    if len(users)==0 or users[0][2] != data['email']:
        h = hashlib.md5(str(data['password']).encode("utf-8"))
        data['password'] = h.hexdigest()
        query = "INSERT INTO `users` (`firstname`,`email`,`password`,`argee`) VALUES ('{0}','{1}','{2}',{3})".format(str(data['name']),str(data['email']),str(data['password']),data['check'])
        cursor.execute(query)
    else:
        return 'Пользователь уже зарегистрирован'
    return str(1)

@app.route("/sign",methods=["POST"])
def sign():
    data = request.get_json(force=True)
    cursor.execute('SELECT * FROM `users`')
    users = cursor.fetchall()
    h = hashlib.md5(str(data['password']).encode("utf-8"))
    for i in range(len(users)):
        if(data['email']==users[i][2] and users[i][3]==h.hexdigest()):
            session['id']=users[i][0]
            return str(session['id'])
    return '0'
@app.route("/project")
def project():
    return render_template('project.html')
@app.route('/add_project', methods=["POST"])
def add_project():
    print(request.form)
    print(request.files)
    # f = request.files['img']
    # f.save('static/upload/'+request.form.get('name-project')+'.jpg')
    # query = "INSERT INTO `project` (`name-project`, `image-project`, `categories`, `about-project`, `city-project`, `tel-project`, `days-project`, `money`) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')".format(request.form.get('name-project'),'static/upload/'+request.form.get('name-project')+'.jpg',request.form.get('categories'),request.form.get('about-project'),request.form.get('city-project'),request.form.get('tel-project'),request.form.get('days-project'),request.form.get('money'))
    # cursor.execute(query)
    return '0'
@app.route("/view")
def view():
    cursor.execute('SELECT * FROM `project`')
    project = cursor.fetchall()
    return render_template('view.html', project=project)

@app.route('/users')
def user():
    if 'id' in session:
        cursor.execute('SELECT * FROM `users` WHERE id={0}'.format(session['id']))
        users = cursor.fetchall()
        return render_template('users.html',users=users)
    return render_template('signin.html')

@app.route('/edit_user', methods=["POST"])
def edit_user():
    # print(request.form.get('city'))
    # f = request.files['img']
    # f.save('static/upload/'+request.form.get('id')+'.jpg')
    query = "UPDATE `users` SET `firstname`='{0}',`city`='{1}',`about`='{2}',`lastname`='{3}',`phone`='{4}' WHERE id={5}".format(request.form.get('firstname'),request.form.get('city'),request.form.get('about'),request.form.get('lastname'),request.form.get('phone'),session['id'])
    cursor.execute(query)
    return '0'
if __name__ == "__main__":
    app.run()