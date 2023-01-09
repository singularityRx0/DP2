import serial
from threading import Thread
from app import app
from UIDvalidation import validateUID

def ardui():

	arduino = serial.Serial(port = 'COM10', baudrate = 9600, timeout=1)

	while True:
		data = arduino.readline()[1:-2] #the last bit gets rid of the new-line chars
		if data:
			print(data)
			validateUID(data)

def website():
	app.run()


Thread(target = ardui).start()
Thread(target = website).start()

