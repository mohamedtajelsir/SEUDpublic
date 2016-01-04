----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2015 19:20:14
-- Design Name: 
-- Module Name: memconformitymodule - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work; use work.all;

entity memconformitymodule is
    Generic (AddBusWidth : Natural := 32;
    DataBusWidth : Natural := 40);
    Port ( add : out STD_LOGIC_VECTOR (AddBusWidth-1 downto 0);
           rw : out STD_LOGIC;
           datao : out STD_LOGIC_VECTOR (DataBusWidth-1 downto 0);
           datai1 : in STD_LOGIC_VECTOR (DataBusWidth-1 downto 0);
           datai2 : in STD_LOGIC_VECTOR (DataBusWidth-1 downto 0);
           datai3 : in STD_LOGIC_VECTOR (DataBusWidth-1 downto 0);
           clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC);
end memconformitymodule;

architecture Behavioral of memconformitymodule is
Signal TO_TMRMVOTER: std_logic_vector(3*DataBusWidth-1 downto 0);
Signal Counter: std_logic_vector(AddBusWidth+1 downto 0);
begin
--Generate the logic for the data
--Fix the input to the TMRMVoter by arranging corresponding bits together in a tuple of 3
TMRMVOTER_INPUT : for index in DataBusWidth downto 1 GENERATE
TO_TMRMVOTER(3*index-1 downto 3*(index-1)) <= datai1(index-1) & datai2(index-1) & datai3(index-1);
end GENERATE TMRMVOTER_INPUT;

tmrvoter_inst: entity tmrmvoter 
    Generic Map (DataBusWidth)
    Port   Map (TO_TMRMVOTER,datao);

--This is the process for generating the addresses through linear increment (32 MSB)
--The least 2 LSB are for the R/W and digit to provide 1 clock delay before r/w toggles
address_rw_gen: process(clk, en, rst) is
Variable CounterMax : std_logic_vector(AddBusWidth+1 downto 0) :=(others => '1');
 begin
        if rst = '1' then
          Counter <= (others => '0');
        elsif rising_edge(clk) then
          if en = '1' then
                  if ( Counter < CounterMax ) then
                      Counter <= Counter + 1;
                  end if;
          end if;
        end if;
 end process address_rw_gen;

--now attaching the counter to the address bus
add <= Counter (AddBusWidth+1 downto 2);
rw  <= Counter (1);
end Behavioral;
