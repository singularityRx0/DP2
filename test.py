######################################################
#####         TEST FILE (Can be deleted)	 #####
######################################################

from app import mysql, datetime

current_date = datetime.date.today()
_tblCreated_name = str(current_date) + '_AttendenceLog'
_tblCreated_date = str(current_date)
_tblCreated_time = str(datetime.datetime.now().strftime('%H:%M:%S'))
_UID = ''
_timeStamp = str(datetime.datetime.now().strftime('%H:%M:%S'))
conn = mysql.connect()
cursor = conn.cursor()
cursor.callproc('sp_duplicationWatchDogDataTable', (_tblCreated_name, _tblCreated_date, _tblCreated_time))
data = cursor.fetchall()
conn.commit()

			# if len(data1) == 0:
cursor.close()
