----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2015 14:21:30
-- Design Name: 
-- Module Name: tmrit - Behavioral
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

entity tmrit is
    Generic( ComputingCounterWidth : Natural := 30;
             HealingCounterWidth : Natural := 28);
    Port ( --comp_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           --heal_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           comp_s : out STD_LOGIC_VECTOR (3 downto 1);
           heal_s : out STD_LOGIC_VECTOR (3 downto 1);
           clk : in STD_LOGIC_VECTOR (3 downto 1);
           rst : in STD_LOGIC_VECTOR (3 downto 1));
end tmrit;

architecture Behavioral of tmrit is  
signal comp_s1,comp_s2,comp_s3: std_logic; --intermediate interconnects for comp
signal heal_s1,heal_s2,heal_s3: std_logic; --intermediate interconnects for heal

begin
--Instantiate the three timers
chtimer1: entity chtimer 
    Generic Map ( ComputingCounterWidth => ComputingCounterWidth,
             HealingCounterWidth => HealingCounterWidth)
    Port Map ( --comp_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           --heal_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           comp_s => comp_s1,
           heal_s => heal_s1,
           clk => clk(1),
           rst => rst(1));

chtimer2: entity chtimer 
    Generic Map ( ComputingCounterWidth => ComputingCounterWidth,
             HealingCounterWidth => HealingCounterWidth)
    Port Map ( --comp_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           --heal_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           comp_s => comp_s2,
           heal_s => heal_s2,
           clk => clk(2),
           rst => rst(2));

chtimer3: entity chtimer 
    Generic Map ( ComputingCounterWidth => ComputingCounterWidth,
             HealingCounterWidth => HealingCounterWidth)
    Port Map ( --comp_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           --heal_period : in STD_LOGIC_VECTOR (CounterWidth-1 downto 0);
           comp_s => comp_s3,
           heal_s => heal_s3,
           clk => clk(3),
           rst => rst(3));

--Instantiate the voters
tmrmvoter1c: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (comp_s1&comp_s2&comp_s3),
              Outs => comp_s(1 downto 1) );
tmrmvoter1h: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (heal_s1&heal_s2&heal_s3),
            Outs => heal_s(1 downto 1) );
tmrmvoter2c: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (comp_s1&comp_s2&comp_s3),
              Outs => comp_s(2 downto 2) );
tmrmvoter2h: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (heal_s1&heal_s2&heal_s3),
            Outs => heal_s(2 downto 2) );
tmrmvoter3c: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (comp_s1&comp_s2&comp_s3),
              Outs => comp_s(3 downto 3) );
tmrmvoter3h: entity tmrmvoter 
    Generic Map (BusWidth => 1)
    Port  Map ( Ins => (heal_s1&heal_s2&heal_s3),
            Outs => heal_s(3 downto 3) );

end architecture Behavioral;
