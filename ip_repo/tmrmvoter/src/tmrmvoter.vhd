----------------------------------------------------------------------------------
-- Company: kth.se
-- Engineer: Tage (mtme@kth.se)
-- 
-- Create Date: 17.11.2015 14:19:43
-- Design Name: Triple Modular Redundancy Majority Voter
-- Module Name: tmrmvoter - Behavioral
-- Project Name: SEUD
-- Target Devices: Artix-7
-- Tool Versions: Vivado 2015.4
-- Description: 
-- Triple Modular Redundancy Majority Voter: 
--By default it takes into account 3 Inputs of BusWidth = 3 and gives as output and 3 bit wide that is majority voted based on the inputs...
--The inputs are ordered in multiplexed fashion .... 
--For example if A(5:1), B(5:1) and C(5:1) they would be connected as A5,B5,C5,A4,B4,C4,.... A1,B1,C1 at the input port
-- Dependencies: 
-- None
-- Revision:
-- Version 2.00 - Accept Inputs as 3 consecutive buses instead of set of individual signals
--for examples (Ins(3*buswidth)) would be treated as (Ins(3*buswidth),Ins(2*buswidth),Ins(buswidth))
--instead of earlier version which treats (Ins(3*buswidth),Ins(3*buswidth-1),Ins(3*buswidth-2))
-- Version 1.01 - File Created
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
    Generic (BusWidth : Natural:=1);
    Port    ( Ins : in STD_LOGIC_VECTOR  ( (BusWidth*3) downto 1);
    --Ex of how Inputs are arranged for 3 redundancy and 2 bit buswidth 
    --Ins[6] is A2, Ins[4] is B2, Ins[2] is C2
    --Ins[5] is A1, Ins[3] is B1, Ins[1] is C1
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
        when (Ins(OutputIndex*3)= Ins(OutputIndex*2) OR Ins(OutputIndex*3)=Ins(OutputIndex*1)) 
   else Ins(OutputIndex*2) 
        when (Ins(OutputIndex*2)= Ins(OutputIndex*3) OR Ins(OutputIndex*2)=Ins(OutputIndex*1)) 
   else Ins(OutputIndex*1);

end GENERATE Output_Width_Loop_R3;


end Behavioral;
