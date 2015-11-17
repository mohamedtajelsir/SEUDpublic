#!/usr/bin/env python3
import sys

def main(*args):
    write_en = 0
    space = ' '
    with open('tmr_sem.vhdl', 'w') as d:
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
        with open('sem_0.vho', 'r') as s:
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
                if write_en == 1:
                    for i in range(3):
                        sline = line.split()
                        print(sline)
                        sline[0] = sline[0]+'_'+str(i)
                        print(sline)
                        d.write('        '+space.join(sline)+'\n')
                
        d.write("""
        end tmr_sem;

        architecture Behavioral of tmr_sem is

        begin


        end Behavioral;""")



if __name__=="__main__":
    import sys
    main(*sys.argv)
