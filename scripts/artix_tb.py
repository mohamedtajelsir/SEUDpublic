''' 
**********************************************************
Author:	Youssef Zaki
Date:	12/4/2015
** script requires python3 and serial library this ver-   **
** sion runs on windows platform, but can be easily mo-   **
** dified to run on linux system. Simply, include the     **
** following in the header		                      		  **
** #!/usr/bin/env/ python3                    		        **
** and use ttyUSBx instead of COMx, where x refers to 	  **
** active serial port	   		   		                        **
** Script uses 2-tab spacing and not 4. This could cause  **
** a problem since python is sensitive to indentations    **
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

The constant itr specifies the number of errors to inject
	
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

#################################
#           HEADER START
#################################
import serial
import random
import time
import os
import re
#import sys


print('single error per frame injection test\n')

''' Change the log_file string value to output log data into a different 
file. You could also use the Python system library by
uncommenting line 51 and line 62, and type the output 
log file string in the command shell when executing the script
such as:  python artix_tb.py 'error_inject_test.txt' '''
log_file = 'error_inject_100err_025s.txt'
#log_file = sys.argv[0]

ser = serial.Serial(port='COM4', baudrate=9600, timeout=1)
ser.flushInput()
ser.flushOutput()
################################
#           HEADER END
################################


def pipebuffer(d):
	s = []
	while(ser.inWaiting()):
		temp = ser.read()
		s.append(chr(temp[-1])) 
	result = (''.join(s)).replace('\r', os.linesep)+'\n'
	d.write(result)
	#print(result)



def status(d):
  ''' This function pings the SEM core
  to send a Status Report. This function
  can be called from either Idle state
  of Observation state. The function
  also writes the report into an the
  log file'''
	ser.write('S'.encode())
	pipebuffer(d)
	#time.sleep(1)

def randframe():
  ''' This function generates a random frame that 
  can be used during the error injection test. The
  frame address follows the linear address format, which
  is set by rframe. This value is concatenated with rwb,
  which contains the target word and bit address'''
	# rword[0] is MSb of rbit
	rframe = '{:04x}'.format(random.randint(0,18903)).upper()
	rwb = '{:03x}'.format(random.randint(0,131)).upper()
	frame = ('N C00'
		+ rframe
		+ rwb)
	#print(frame+'\n')
	return frame 

def inject_errors(num_error, frame):
  ''' Sends error injection command to the SEM core
  via the uart channel'''
	for idx in range(num_error):
		for string in frame:
			ser.write(string.encode())
			#time.sleep(0.001)

def stats():
  ''' Post process data collected in the log file
  and counts the number of instances the tag has occured
  and return the count value. This same function can be
  reused to check for other tags in the log file and 
  perform other analysis.'''
	with open(log_file, 'r') as d:
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
  with open(log_file, 'w') as d:
    temp = ''
    count = 0
    ''' itr controls the number errors to inject
    change this value to 13 when injecting fixed
    frames. When using random frames, you can 
    specify any number of iterations'''
    itr = 20  # value should be n-1
    ''' These are fixed set of frames that can be 
    used as input for the test instead of a random
    frame. '''
    frames = ['N C000000000', 'N C000001000', 
              'N C000300000', 'N C000400000', 
              'N C000005000', 'N C000006000',
              'N C000700000', 'N C000800000', 
              'N C000009000', 'N C00000A000', 
              'N C000B00000', 'N C000C00000',
              'N C00000E000', 'N C00000F000']
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
      if (count == itr):
        time.sleep(1)
      else:
        time.sleep(1)
      # request status
      pipebuffer(d)
      #increase count
      count = count + 1
      pipebuffer(d)
  num_corr = stats()	
  print('number of injected errors is: '+ str(count) + '\n')
  print('number of corrected errors is: '+ str(num_corr) + '\n')

if __name__ == '__main__':
	main()

