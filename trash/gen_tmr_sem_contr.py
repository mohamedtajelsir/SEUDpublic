#!/usr/bin/env python3

import sys
def main():
    
    infile = sys.argv[1]
    #infile = 'sem_0.vho'
    #outfile = 'tmr_sem.vhdl'
    outfile = sys.argv[2]
    write_en = 0
    space = ' '
    semic = ';'
    port_array = []
    with open(outfile, 'w') as d:
        d.write("""----------------------------------------------------------------------------------
        -- Company: 
        -- Engineer: 
        -- 
        -- Create Date: 11/17/2015 12:50:48 PM
        -- Design Name: 
        -- Module Name: tmr_sem - Behavioral
        -- Project Name: 
        -- Target Devices: 
        -- Tool Versions: 
        -- Description: 
        -- 
        -- Dependencies: 
        -- 
        -- Revision:
        -- Revision 0.01 - File Created
        -- Additional Comments:
        -- 
        ----------------------------------------------------------------------------------


        library IEEE;
        use IEEE.STD_LOGIC_1164.ALL;

        -- Uncomment the following library declaration if using
        -- arithmetic functions with Signed or Unsigned values
        --use IEEE.NUMERIC_STD.ALL;

        -- Uncomment the following library declaration if instantiating
        -- any Xilinx leaf cells in this code.
        --library UNISIM;
        --use UNISIM.VComponents.all;

        entity tmr_sem is\n""") 
        # include port definition
        with open(infile, 'r') as s:
            for line in s:
                rsline = line.rstrip(" ")
                if 'PORT' in rsline:
                    if 'MAP' in rsline:
                        write_en = 0
                    else:
                        write_en = 1
                        d.write('        '+line)
                elif 'END' in rsline and 'COMPONENT' in rsline:  
                    write_en = 0
                    port_def = 0
                elif write_en == 1:
                    for i in range(3):
                        sline = line.split()
                        if sline[0] == ');': 
                            #d.write('        '+line)
                            break
                        else:
                            #print(sline)
                            sline[0] = sline[0]+'_'+str(i)
                            #print(sline)
                            port_array.append(space.join(sline))
                            #d.write('        '+space.join(sline)+'\n')

        #semic.join(port_array[-3,-3]) 
        sec_to_last = len(port_array)-2
        third_to_last = len(port_array)-3
        #print(str(port_array[92])+semic)
        #semic.join(str(port_array[size-2]))
        port_array[sec_to_last] = str(port_array[sec_to_last])+semic
        port_array[third_to_last] = str(port_array[third_to_last])+semic
        for port in port_array:
            print(port)
            d.write('        '+ str(port)+'\n')
        #for i in range(len(port_array)):
        #    print(str(port_array(i)))
        #    d.write('        '+ str(port_array(i))+'\n')
        d.write(""");\n
        end;

        architecture Behavioral of tmr_sem is

        begin


        end Behavioral;""")



if __name__=='__main__':
    main()
