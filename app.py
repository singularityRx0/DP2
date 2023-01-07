from flask import Flask, render_template, request, session, redirect, flash, url_for
from flaskext.mysql import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
import datetime



app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root' #commonly named rooy
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'arduino_attendence'
app.config['MYSQL_DATABASE_HOST'] = 'localhost' #commonly named rooy
mysql = MySQL()
mysql.init_app(app)

app.secret_key = 'why would I tell you my secret key?'

#######################################################################
############################## main page ##############################
#######################################################################
@app.route('/')
def main():
    if session.get('user'):
        return render_template('userhome.html')
    else:
        return render_template('index.html')

############################## End main ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##




##########################################################################
############################## Sign-up page ##############################
##########################################################################
@app.route('/signup')
def showSignUp():
    return render_template('signup.html')

@app.route('/api/signup', methods=['POST'])
def signUp():
    try:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _name and _email and _password:

            # All Good, call MySQL

            conn = mysql.connect()
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            cursor.callproc('sp_createUser', (_name, _email, _hashed_password))
            data = cursor.fetchall()

            #no error from Mysql
            if len(data) == 0:
                conn.commit()
                render_template('signupSucc.html', msg='User created successfully')
                return redirect('/signin')
            else:
                return render_template('error.html', error=str(data[0]))

        else:
            flash('Enter required fields')
            return render_template('error.html', error='Enter the required fields') 

    except Exception as e:
        return render_template('error.html', error=str(e)) 

    finally:
        cursor.close()
        conn.close()
############################## End sign-up ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#



##########################################################################
############################## Sing-in page ##############################
##########################################################################
@app.route('/signin')
def showSignin():
    return render_template('signin.html')

@app.route('/api/validateLogin', methods=['POST'])
def validateLogin():
    try:
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.callproc('sp_validateLogin', (_email,))
        data = cursor.fetchall()
        if len(data) > 0:
            if check_password_hash(str(data[0][3]), _password):
                session['user'] = data[0][0]
                return redirect('/userhome')
            else:
                return render_template('error.html', error='Wrong Email address or Password')
        else:
            return render_template('error.html', error='Wrong Email address or Password')

    except Exception as e:
        return render_template('error.html', error=str(e))

    finally:
        cursor.close()
        conn.close()

@app.route('/userhome')
def userHome():
    if session.get('user'):
        return render_template('userhome.html')
    else:
        return render_template('error.html', error='Unauthorized Access')

############################## End sing-in ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#



###########################################################################
############################## attendee page ##############################
###########################################################################
@app.route('/attendee')
def attendee():
    if session.get('user'):
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM students')
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('attendence3.html', students=data)
    else:
        return render_template('error.html', error='Unauthorized Access')

@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        UID = request.form['UID']
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO students (name, email, phone , UID) VALUES (%s, %s, %s, %s)", 
        (name, email, phone, UID))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect(url_for('attendee'))

@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    flash("Record Has Been Deleted Successfully")
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM students WHERE id=%s", (id_data,))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('attendee'))

@app.route('/update', methods= ['POST', 'GET'])
def update():
    if request.method == 'POST':
        id_data = request.form['id']
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        UID = request.form['UID']

        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("""
        UPDATE students SET name=%s, email=%s, phone=%s, UID=%s
        WHERE id=%s
        """, (name, email, phone, UID, id_data))
        cursor.close()
        conn.close()
        flash("Data Updated Successfully")
        return redirect(url_for('attendee'))

############################## End attendee ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#



##################################################################################
############################## Attendence data page ##############################
##################################################################################
@app.route('/attendence_data')
def attend_data():
    if session.get('user'):
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM attendence_table_list')
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('tableList.html', table=data)
    else:
        return render_template('error.html', error='Unauthorized Access')

@app.route('/insert_tblList', methods = ['POST'])
def insert_tblList():
    if request.method == "POST":
        current_date = datetime.date.today()
        _tblCreated_name = str(current_date) + '_AttendenceLog'
        _tblCreated_date = str(current_date)
        _tblCreated_time = str(datetime.datetime.now().strftime('%H:%M:%S'))

        conn = mysql.connect()
        cursor = conn.cursor()
        #cursor.execute("INSERT INTO attendence_table_list (tblCreated_name, tblCreated_date, tblCreated_time) VALUES (%s, %s, %s)", 
        #(_tbl_name, _tbl_createdDate, _tbl_createdTime))
        cursor.callproc('sp_duplicationWatchDogDataTable', (_tblCreated_name, _tblCreated_date, _tblCreated_time))
        data = cursor.fetchall()

        if len(data) == 0:
            conn.commit()
            cursor.close()
            conn.close()
            flash("Table Created Successfully")
            return redirect(url_for('attend_data'))
        else:
            conn.commit()
            cursor.close()
            conn.close()
            flash("Table Already Exist")
            return redirect(url_for('attend_data'))
            


@app.route('/delete_tblList/<string:id_data>', methods = ['GET'])
def delete_tblList(id_data):
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM attendence_table_list where id=%s", (id_data,))
    conn.commit()
    cursor.close()
    conn.close()
    flash("Record Has Been Deleted Successfully")
    return redirect(url_for('attend_data'))

@app.route('/select_tblList', methods= ['POST', 'GET'])
def select_tblList():
    if request.method == 'POST':
        # _id_data = request.form['id']
        _tblCreated_name = request.form['tblCreated_name']
        # _tblCreated_date = request.form['tblCreated_date']
        # _tblCreated_time = request.form['tblCreated_time']

        conn = mysql.connect()
        cursor = conn.cursor()
        #cursor.callproc('sp_createLogTable', (_tblCreated_name,))
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS `%s` (`id` BIGINT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(255) NOT NULL,
        `UID` VARCHAR(255) NOT NULL,
        `timeStamp` VARCHAR(255) NOT NULL,
        PRIMARY KEY(`id`))ENGINE=MyISAM DEFAULT CHARSET=latin1;
        """, (_tblCreated_name))
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        # return redirect(url_for('attend_data'))

        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM `%s`', (_tblCreated_name,))
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('logs.html', Logs=data)


############################## End attendence data ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#



#########################################################################
############################## Logout page ##############################
#########################################################################
@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')

############################## End log out ##############################
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#

if __name__ == "__main__":
    app.run(debug=True)
