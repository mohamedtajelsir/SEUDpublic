#!/usr/bin/env python

space = ' '
semicon = ';'

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


def main():
    print('Converting component to TMR form')
    source_file = sys.argv[1]
    dest_file = sys.argv[2]
    with open(dest_file, 'w') as d:
        with open(source_file, 'r') as s:
            for line in s.readlines():
                split_line = line.split()
                if 'port' and '(' in split_line:
                    d.write(line)
                    #d.write(line.rstrip('\n'))
                    print line.rstrip('\n')
                elif ');' in split_line:
                    d.write(line.rstrip('\n'))
                    print line.rstrip('\n')
                    break
                elif ';' not in split_line[-1][-1]:
                    for item in replace(split_line, 0, 2, semicon):
                        d.write(item)
                        print item
                    copy = line.split()
                    first = copy[0]
                    copy.pop(0)
                    copy.insert(0,first+'_'+str(2))
                    d.write(space.join(copy)+'\n')
                    print space.join(copy)
                else:
                    for item in replace(split_line, 0, 3, space):
                        d.write(item)
                        print item

if __name__=='__main__':
    import sys
    main()
