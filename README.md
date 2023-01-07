# Dp2

### Project uses `MySQL` not `MsSQL`
[MySQL download link](https://dev.mysql.com/downloads/windows/installer/8.0.html).\
download the one with `431MB`

Once downloaded, move the folder `arduino_attendence` to your `MySQL` save directory. This folder contains all the tables and store procedures.\
It can be found in `C:\ProgramData\MySQL\MySQL Server 8.0\Data`. 

## Libraries used
Flask, to install `py -m pip install flask` \
Flask-MySQL, to install `py -m pip install flask-mysql`\
Serial, to install `py -m pip install pyserial`



## Connect to `MySQL` 

from file `app.py` change the configs from `line 10` to `line13`
```
app.config['MYSQL_DATABASE_USER'] = 'root' `#commonly named root
app.config['MYSQL_DATABASE_PASSWORD'] = ' '
app.config['MYSQL_DATABASE_DB'] = ' '
app.config['MYSQL_DATABASE_HOST'] = 'localhost' #commonly named localhost
mysql = MySQL()
mysql.init_app(app)
```
