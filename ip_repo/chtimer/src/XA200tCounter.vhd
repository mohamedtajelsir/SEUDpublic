----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2015 15:11:52
-- Design Name: 
-- Module Name: XA200tCounter - Behavioral
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
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work; use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XA200tCounter is
    Generic(CounterWidth : Natural :=32);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           synch_rst : in STD_LOGIC;
           en : in STD_LOGIC;
           s1 : out STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0)); --only the 4 MSB bits in the counter
end XA200tCounter;

architecture Behavioral of XA200tCounter is
signal temp: STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
signal s1_temp: std_logic;
constant CountingMax: std_logic_vector (CounterWidth-1 downto 0) := (others => '1');
begin
--1. Start by the clocking process implement asynchronous active-low reset and increment 
    clocking_process : process (clk,synch_rst,en, rst) is
        begin
        if rst = '0' or rising_edge(synch_rst) then
        temp <= (others => '0');
        elsif rising_edge(clk) then
        if (en ='1' and temp < CountingMax) then temp <= temp + 1; end if;
        end if;
    end process clocking_process;

--2. Define how the output is done
--the intended output behaviour is to get toggled every time the counter reaches 15   
    outputing_process : process (rst,synch_rst,temp) is
        begin
        if rst = '0'  or rising_edge(synch_rst) then
        s1_temp <= '0';
        elsif (temp=CountingMax) then
        s1_temp <= '1';
        else s1_temp <= '0';
        end if;
    end process outputing_process;

--3. Tie S1_temp to S1
s1 <= s1_temp;
count <= temp(CounterWidth-1 downto CounterWidth-4);

end Behavioral;
