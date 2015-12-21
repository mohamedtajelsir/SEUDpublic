----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2015 22:54:12
-- Design Name: 
-- Module Name: chtimer - Behavioral
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
library work; use work.all;
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
library work; use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chtimer is
    Generic( ComputingCounterWidth : Natural := 30;
             HealingCounterWidth : Natural := 28);
    Port ( --comp_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           --heal_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           comp_s : out STD_LOGIC;
           heal_s : out STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end chtimer;

architecture Behavioral of chtimer is  
Type STATE_TYPE is (s0, s1, s2, s3);
signal state   : STATE_TYPE:=s0;
signal compute_counter_synch_rst: std_logic;
signal compute_counter_en: std_logic;
signal heal_counter_en: std_logic;
signal heal_counter_synch_rst: std_logic;
signal compute_counter_maxed: std_logic;
signal heal_counter_maxed: std_logic;
begin
   PROCESS (clk, rst)
BEGIN
   IF rst = '0' THEN
      state <= s0;
   ELSIF (rising_edge(clk)) THEN
      CASE state IS
        WHEN s0=>
           state <= s1;
        WHEN s1=>
        IF (compute_counter_maxed='1') THEN
           state <= s2;
        ELSE
           state <= s1;
        END IF;
        WHEN s2=>
        IF (heal_counter_maxed='1') THEN
           state <= s3;
        ELSE
           state <= s2;
        END IF;     
        WHEN s3=>
           IF (compute_counter_maxed='1') THEN
              state <= s2;
           ELSE
              state <= s3;
           END IF;
      END CASE;
   END IF;
END PROCESS;

--Output stage and intermediate logic
PROCESS (state)
BEGIN
CASE state IS
    WHEN s0 =>
        compute_counter_en <= '0';
        compute_counter_synch_rst <= '0';
        heal_counter_synch_rst <= '0';
        heal_counter_en  <= '0';
        comp_s <= '1';
        heal_s <= '0';
    WHEN s1 =>
        compute_counter_en <= '1';
        compute_counter_synch_rst <= '0';
        heal_counter_synch_rst <= '1';
        heal_counter_en  <= '0';
        comp_s <= '1';
        heal_s <= '0';
    WHEN s2 =>
        compute_counter_en <= '0';
        compute_counter_synch_rst <= '1';
        heal_counter_synch_rst <= '0';
        heal_counter_en  <= '1';
        comp_s <= '0';
        heal_s <= '1';
    WHEN s3 =>
        compute_counter_en <= '1';
        compute_counter_synch_rst <= '0';
        heal_counter_synch_rst <= '1';
        heal_counter_en  <= '0';
        comp_s <= '1';
        heal_s <= '0';
END CASE;
END PROCESS;
--Instantiating the blocks and connecting the signals
--the compute counter
compute_counter: entity XA200tCounter 
    Generic Map (CounterWidth => ComputingCounterWidth)
    Port Map ( clk => clk,
           rst => rst,
           synch_rst => compute_counter_synch_rst,
           en => compute_counter_en,
           s1 => compute_counter_maxed,
           count => open); --leave the unsused counter MSB unconnected
--the heal counter
heal_counter: entity XA200tCounter 
    Generic Map (CounterWidth => HealingCounterWidth)
    Port Map ( clk => clk,
           rst => rst,
           synch_rst => heal_counter_synch_rst,
           en => heal_counter_en,
           s1 => heal_counter_maxed,
           count => open); --leave the unsused counter MSB unconnected


end architecture Behavioral;
