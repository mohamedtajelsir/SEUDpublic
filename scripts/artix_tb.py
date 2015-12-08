''' 
**********************************************************
Author:	Youssef Zaki
Date:	12/4/2015
** script requires python3 and serial library this ver- **
** sion runs on windows platform, but can be easily mo- **
** dified to run on linux system. Simply, include the   **
** following in the header				**
** #!/usr/bin/env/ python3                    		**
** and use ttyUSBx instead of COMx, where x refers to 	**
** active serial port	   		   		**
**********************************************************
System monitor can accept commands through the uart interface 
Comands are:
	I --> move to idle state
	S --> report status 
		(accepted in either idle or obsevation state
	O --> move to observation
	N --> error injection 
		ex:
		N (10 digit Hex value) == N (40 bits)
	R --> software reset (accepted in idle state)
		ex: R 00
	
Report decoding
	idle 		-- sc 00
	initialization 	-- sc 01
	observation	-- sc 02
	correction	-- sc 04
	classification	-- sc 08
	injection	-- sc 10
	fatal error	-- sc 1F
Artix-7:
	- Max Frame (MF) = 18903 in linear count (Ox49D7)
	- 101 words per frame is claimed in Xilinx's Doc PG036 (p.60)
	- @ 10 MHz 
		- scan_time 		= 180 ms
		- correction_time(avg) 	= 6.1 ms
		- initialization time	= 6.6 ms

'''
import serial
import random
import time
import os
import re

print('single error per frame injection test\n')

ser = serial.Serial(port='COM3', baudrate=9600, timeout=1)
ser.flushInput()
ser.flushOutput()

def pipebuffer(d):
	s = []
	while(ser.inWaiting()):
		temp = ser.read()
		s.append(chr(temp[-1])) 
	result = (''.join(s)).replace('\r', os.linesep)+'\n'
	d.write(result)
	#print(result)


def status(d):
	ser.write('S'.encode())
	pipebuffer(d)
	#time.sleep(1)

def randframe():
	# rword[0] is MSb of rbit
	rframe = '{:04x}'.format(random.randint(0,18903)).upper()
	rwb = '{:03x}'.format(random.randint(0,131)).upper()
	frame = ('N C00'
		+ rframe
		+ rwb)
	#print(frame+'\n')
	return frame 

def inject_errors(num_error, frame):
	for idx in range(num_error):
		for string in frame:
			ser.write(string.encode())
			#time.sleep(0.001)

def stats():
	with open('error_inject.txt', 'r') as d:
		tag = 'LA'
		num_corr = 0
		for line in d:
			idxs = [m.start() for m in re.finditer(tag, line)]
			num_corr = num_corr + len(idxs)
		return num_corr
		
	#	for idx in idxs:
	#		print(result[idx+3:idx+11])
		
	#d.write((''.join(s)).replace('\r', os.linesep)+'\n')
	#print((''.join(s)).replace('\r', os.linesep))
	#time.sleep(0.2)

def main():
	with open('error_inject.txt', 'w') as d:
		temp = ''
		count = 0
		itr = 9  # value should be n-1
		frames = ['N C000000000', 'N C000001000', 
			'N C000003000', 'N C000004000', 
			'N C000005000', 'N C000006000',
			'N C000007000', 'N C000008000', 
			'N C000009000', 'N C00000A000'] 
		# reset SEM IP core
		ser.write('I'.encode())
		ser.write('R 00'.encode())
		# wait for 7ms (SEM Core initialization) 
		time.sleep(0.007) 
		# controller is now in observation state
		pipebuffer(d)
		while(ser.isOpen() and count<itr+1):
			# put controller in idle mode
			ser.write('I'.encode())
			# print report
			pipebuffer(d)
			# inject single-bit error in a random frame
			num_errors = 1
			frame = randframe()
			#frame = frames[count] #'N C000000000'
			inject_errors(num_errors, frame)
			# put controller in observation state
			ser.write('O'.encode())
			# wait 1s -- correction period is defined here 
			time.sleep(0.4)
			# request status
			pipebuffer(d)
			#increase count
			count = count + 1
		pipebuffer(d)
	num_corr = stats()	
	print('number of injected errors is: '+ str(count) + '\n')
	print('number of corrected errors is: '+ str(num_corr) + '\n')
	


''' might reuse some of this code 
********************************************************
		#print(chr(temp[-1]))
		#if "b'\\r'" in temp:
			#print('got in\n')
		#	temp_s = '\n'
	#	else:
			#temp_s = temp[0][-2]
			#if temp_s == 'b':
			#	temp_s = ' '
			#print(temp_s)
		#s = s + temp_s
********************************************************
'''

if __name__ == '__main__':
	main()

