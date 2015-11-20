#!/usr/bin/env python

space = ' '
semicon = ';'
comma = ','

header = '''-- This file generated using make_tmr.py script
-- AUTHOR: Youssef Zaki
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;\n\n'''
def replace(split_line, idx ,iter, end_char):
    ''' This function take one array of strings, appends _n 
    to the indexed item, and returns an array of two strings'''
    output = split_line
    element = output[idx]
    output.pop(idx)
    ret_array = []
    for i in range(iter):
        output.insert(idx,element+'_'+str(i))
        ret_array.append(space.join(output)+end_char+'\n')
        output.pop(idx)
    return ret_array

def tmr_entity(d, source_file):
    #with open(dest_file, 'w') as d:
    with open(source_file, 'r') as s:
        #print('ENTITY sem_tmr is\n')
        #print('PORT (\n')
        d.write('ENTITY sem_tmr is\n')
        for line in s.readlines():
            split_line = line.split()
            if 'port' and '(' in split_line:
                d.write('\tPORT (\n')
                #d.write(line)
                #d.write(line.rstrip('\n'))
                #print line.rstrip('\n')
            elif ');' in split_line:
                d.write('\t'+line)
                #print line.rstrip('\n')
                break
            elif ';' not in split_line[-1][-1]:
                for item in replace(split_line, 0, 2, semicon):
                    d.write('\t\t'+item)
                    #print item
                copy = line.split()
                first = copy[0]
                copy.pop(0)
                copy.insert(0,first+'_'+str(2))
                d.write('\t\t'+space.join(copy)+'\n')
                #print space.join(copy)
            else:
                for item in replace(split_line, 0, 3, space):
                    d.write('\t\t'+item)
                    #print item
        d.write('END sem_tmr;\n\n')
                        
def tmr_comp(d, source_file):
    for i in range(3):
        with open(source_file, 'r') as s:
            #print('COMPONENT sem_'+str(i)+'\n')
            #print('PORT (\n')
            d.write('COMPONENT sem_'+str(i)+'\n')
            for line in s.readlines():
                split_line = line.split()
                if 'port' and '(' in split_line:
                    d.write('\tPORT (\n')
                    #d.write(line)
                    #d.write(line.rstrip('\n'))
                    #print line.rstrip('\n')
                elif ');' in split_line:
                    d.write('\t'+line)
                    #print line.rstrip('\n')
                    break
                else:
                    copy = line.split()
                    first = copy[0]
                    copy.pop(0)
                    copy.insert(0,first+'_'+str(i))
                    d.write('\t\t'+space.join(copy)+'\n')
                    #print space.join(copy)
        d.write('END COMPONENT;\n\n')
        
def tmr_port_map(d, source_file):
    for i in range(3):
        with open(source_file, 'r') as s:
            d.write('S'+str(i)+' : sem_'+ str(i)+'\n')
            for line in s.readlines():
                split_line = line.split()
                if 'port' and '(' in split_line:
                    d.write('\tPORT MAP (\n')
                    #d.write(line)
                    #d.write(line.rstrip('\n'))
                    #print line.rstrip('\n')
                elif ');' in split_line:
                    d.write('\t'+line)
                    #print line.rstrip('\n')
                    break
                elif ';' not in split_line[-1][-1]:
                    first = split_line[0]
                    #print(len(first))
                    d.write('\t'+first+'_'+str(i)+'\t=> '+first+'_'+str(i)+'\n')
                    #print(first+'_'+str(i)+'\t=>\t'+first+'_'+str(i))
                else:
                    first = split_line[0]
                    #print(len(first))
                    d.write('\t'+first+'_'+str(i)+'\t=> '+first+'_'+str(i)+',\n')
                    #print(first+'_'+str(i)+'\t=>\t'+first+'_'+str(i))
                    
def signals(d, source_file):
    with open(source_file, 'r') as s:
        stdlv = []
        for line in s.readlines():
            split_line = line.split()
            if 'port' and '(' in split_line:
                d.write('-- Start Signals\n')
                #d.write(line)
                #d.write(line.rstrip('\n'))
                #print line.rstrip('\n')
            elif ');' in split_line:
                d.write(';\n-- End Signals'+line)
                #print line.rstrip('\n')
                break
            else:
                stdl = []
                copy = line.split()
                first = copy[0]
                copy.pop(0)
                for j in range(3):
                    stdl.append(first+'_'+str(j))
                cont_line = (comma+space).join(stdl)
                #print(cont_line)
                copy.insert(0,cont_line)
                print(space.join(copy))
                d.write('\t'+space.join(copy)+'\n')
                    
                    #last = split_line[3:]
                    #print(last)
                    #if len(last) <= 10:
                    #    stdl.append(first)
                    #else:
                    #    stdlv.append([first, last])
                    #d.write('\t'+first+'_'+str(i)+'\t=> '+first+'_'+str(i)+',\n')
                    #print(first+'_'+str(i)+'\t=>\t'+first+'_'+str(i))
           # print(stdl)
           # print(stdlv)

def main():
    #print('Converting component to TMR form')
    source_file = sys.argv[1]
    dest_file = sys.argv[2]
    with open(dest_file, 'w') as d:
        d.write(header)
        tmr_entity(d, source_file)
        d.write('architecture STRUCTURAL of tmr_sem is\n')
        tmr_comp(d, source_file)
        signals(d, source_file)
        d.write('BEGIN\n')
        tmr_port_map(d, source_file)
        d.write('END STRUCTURAL;\n')

if __name__=='__main__':
    import sys
    import os
    main()
