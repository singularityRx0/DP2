from app import app, mysql, datetime
import serial



def validateUID(UID):
	try:
		current_date = datetime.date.today()
		_tblCreated_name = str(current_date) + '_AttendenceLog'
		_tblCreated_date = str(current_date)
		_tblCreated_time = str(datetime.datetime.now().strftime('%H:%M:%S'))

		_UID = UID
		_timeStamp = str(datetime.datetime.now().strftime('%H:%M:%S'))

		conn = mysql.connect()
		cursor = conn.cursor()
		cursor.callproc('sp_duplicationWatchDogDataTable', (_tblCreated_name, _tblCreated_date, _tblCreated_time))
		data = cursor.fetchall()
		conn.commit()

			# if len(data1) == 0:
		cursor.close()
		conn.close()

		conn = mysql.connect()
		cursor = conn.cursor()
		cursor.execute("""
        	CREATE TABLE IF NOT EXISTS `%s` (`id` BIGINT NOT NULL AUTO_INCREMENT,
        	`name` VARCHAR(255) NOT NULL,
        	`UID` VARCHAR(255) NOT NULL,
        	`timeStamp` VARCHAR(255) NOT NULL,
        	PRIMARY KEY(`id`))ENGINE=MyISAM DEFAULT CHARSET=latin1;
        	""", (_tblCreated_name,))
		conn.commit()
		cursor.close()
		conn.close()

		conn = mysql.connect()
		cursor = conn.cursor()
		cursor.callproc('sp_UIDvalidate', (_UID,))
		data = cursor.fetchall()
		cursor.close()
		conn.close()
		
		if len(data) > 0:
			print('Welcome')
			conn = mysql.connect()
			cursor = conn.cursor()
			cursor.execute(""" INSERT into `%s` (name, UID, timeStamp) 
			Value ((select(name) from students where UID = %s), %s ,%s)""" ,
			(_tblCreated_name, _UID , _UID, _timeStamp))
			conn.commit()
			cursor.close()
			conn.close()
		else:
			print('UID NOT FOUND')

	except:
		pass
	#INSERT into `'2023-01-06_attendencelog'` (name, UID, timeStamp) 
	#value ( (select(name) from `students` where UID = '4d 3f 5'), '4362', '23545')
	finally:
		cursor.close()
		conn.close()
		pass
