# Dp2

## Task LIst
- [x] Sign-up module
- [x] Sign-in module
- [x] Log out module
- [x] Attendee data module
- [x] Attendence log module
- [ ] Arduino to python module
- [x] UID validation, Insert into database
- [ ] All tasks are complete :tada:



## **Project uses `MySQL` not `MsSQL`**
[MySQL download link](https://dev.mysql.com/downloads/windows/installer/8.0.html).\
download the one with `431MB`

Once downloaded, move the folder `arduino_attendence` to your `MySQL` save directory. This folder contains all the tables and store procedures.\
It can be found in `C:\ProgramData\MySQL\MySQL Server 8.0\Data`. 



## Libraries used
Flask, to install `py -m pip install flask` \
Flask-MySQL, to install `py -m pip install flask-mysql`\
Serial, to install `py -m pip install pyserial`


## Importing the database
To do this you need to open **MySQL 8.0 Command Line Client** which can be found by using window search

<img src="https://user-images.githubusercontent.com/94662590/211267974-10fd4f59-b1dc-4b60-aa68-e55cbee20053.png" width=50% height=50%>

1. Enter your password and then create a new database. 
2. Then find the file path for the file `arduino_attendence.sql` in the folder `arduino_attendence` from the `DP2-main` folder after extracting the .zip folder.  
   **example:** `C:\Users\User\Downloads\DP2-main\DP2-main\arduino_attendence\arduino_attendence.sql`
   ```MySQL
   create database arduino_attendence;
   use arduino_attendence
   source C:\Users\User\Downloads\DP2-main\DP2-main\arduino_attendence\arduino_attendence.sql
   ```
   Enter the code one by one\
   What it would look like : **(example as it may differ for others)**
   
   <img src="https://user-images.githubusercontent.com/94662590/211270787-b1eda236-1b4f-49d6-9926-24c1a197189d.png" width=70% height=50%>
   
3. The `store procedures` has to be executed one-by-one in the `MySQL workbench` as it is not found in the `arduino_attendence.sql`.\
   Code can be copy and pased into the workbench. Store Procedures are named with `sp_` in the front.




## Connect to `MySQL` 

from file `app.py` change the configs on `line 10` to `line14`
```python
app.config['MYSQL_DATABASE_USER'] = 'root' #commonly named root
app.config['MYSQL_DATABASE_PASSWORD'] = ' '
app.config['MYSQL_DATABASE_DB'] = ' '
app.config['MYSQL_DATABASE_HOST'] = 'localhost' #commonly named localhost
mysql = MySQL()
mysql.init_app(app)
```

## Running the app

1. In Visual Studio Code
   - run the `app.py` file
   - The link to open the website will be given in the `python` terminal. (ctrl+left click) to open the link.
   - http://localhost:5000/  can also be used to open the website if the `app.py` is running
   
   ![image](https://user-images.githubusercontent.com/94662590/211275292-e82b683d-2edf-4481-a9c8-4fd19fba1411.png)
