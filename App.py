from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = "Secret Key"

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'dbDesign'
app.config['MYSQL_PASSWORD'] = 'dbDesign'
app.config['MYSQL_DB'] = 'game_review'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

mysql = MySQL(app)


@app.route('/')
def Index():

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users")
    data = cur.fetchall()
    cur.close()

    return render_template("index.html", users = data)


@app.route('/insert', methods=['POST'])
def insert():
    if request.method == 'POST':
        flash("User Created Successfully")

        firstname = request.form['firstname']
        lastname = request.form['lastname']
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        dob = request.form['dob']

        cur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO users (first_name, last_name, username, password, email, DOB) VALUES (%s, %s, %s, %s, %s, %s)",
            (firstname, lastname, username, password, email, dob))
        mysql.connection.commit()

        return redirect(url_for('Index'))


@app.route('/update',methods = ['POST', 'GET'])
def update():
    if request.method == 'POST':
        id_data = request.form['id']
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        dob = request.form['dob']

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE users
        SET first_name = %s, last_name = %s, username = %s, password = %s, email = %s, DOB = %s
        WHERE id = %s
        """, (firstname,lastname, username, password, email, dob, id_data))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/delete/<string:id_data>',methods = ['POST', 'GET'])
def delete(id_data):
    flash("User Deleted Successfully")

    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM users WHERE id = %s", (id_data))
    mysql.connection.commit()
    return redirect(url_for('Index'))


if __name__ == "__main__":
    app.run(debug=True)
