----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2015 14:19:43
-- Design Name: 
-- Module Name: tmrmvoter - Behavioral
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

entity tmrmvoter is
    Generic (BusWidth : Natural:=3);
    Port    ( Ins : in STD_LOGIC_VECTOR  ( (BusWidth*3) downto 1);
    --Ex of how Inputs are arranged for 3 redundancy and 2 bit buswidth 
    --Ins[6] is A2, Ins[5] is B2, Ins[4] is C2
    --Ins[3] is A1, Ins[2] is B1, Ins[1] is C1
              Outs : out STD_LOGIC_VECTOR ( (BusWidth)            downto 1));
     --Ex of how Outputs are arranged for 3 redundancy and 2 bit buswidth
     --Outs[2] is majority voted for A2, B2 and C2
     --Outs[1] is majority voted for A1, B1 and C1
end tmrmvoter;

Architecture Behavioral of tmrmvoter is
begin


Output_Width_Loop_R3 : for OutputIndex in BusWidth downto 1 GENERATE
 --The idea is that the output will be assigned to the input that has identical value with another input
   Outs(OutputIndex) <= 
   Ins(OutputIndex*3) 
        when (Ins(OutputIndex*3)= Ins(OutputIndex*3-1) OR Ins(OutputIndex*3)=Ins(OutputIndex*3-2)) 
   else Ins(OutputIndex*3-1) 
        when (Ins(OutputIndex*3-1)= Ins(OutputIndex*3) OR Ins(OutputIndex*3-1)=Ins(OutputIndex*3-2)) 
   else Ins(OutputIndex*3-2);

end GENERATE Output_Width_Loop_R3;


end Behavioral;
