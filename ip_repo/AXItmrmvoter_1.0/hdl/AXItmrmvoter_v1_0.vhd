----------------------------------------------------------------------------------
-- Company: kth.se
-- Engineer: Tage (mtme@kth.se)
-- 
-- Design Name: AXI Triple Modular Redundancy Majority Voter
-- Module Name: AXItmrmvoter - Behavioral
-- Project Name: SEUD
-- Target Devices: Artix-7
-- Tool Versions: Vivado 2015.4
-- Description:
--This is the top-level hdl file defining interfaces and submodules required to implement a modular functionality that helps triple modular processor to vote on values by writing to the 1st 4 registers memory mapped registers and receiving values on other subsequent 4 memory mapped registers. The memory address of the 1st register is at the IP base address generated, manually or automatically, during IP based design flow. It uses Xilinx AXI bus protocol. The princple of operation is as follows:
----------I.  The processors can send values to any of the  4 registers (32bits each) through their correponding 3 AXI buses. 
----------II. The module has 4 32-bit wide combinatorial majority voters that continuously put the voting result from the corresponding registers to a read-only registers accessible by the processors.
----------III. The processor can get the voted values in the next clock cycle from the other 4 registers. For example p1 writes a value to reg1 through its own AXI bus (AXI_S00), and so does p2 and p3 in the second set of registers accessible from the 3 axi busses
-- Dependencies: *AXI_S00*, *AXI_S01*, *AXI_S02* and TMRmvoter (TMR majority voter)
--Version: 1.0
--Date of Design: 15th/Dec/2015
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;
library xil_defaultlib;
use xil_defaultlib.all;

entity AXItmrmvoter_v1_0 is
	generic (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON : integer :=4;
        -- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 5;

		-- Parameters of Axi Slave Bus Interface S01_AXI
		C_S01_AXI_DATA_WIDTH	: integer	:= 32;
		C_S01_AXI_ADDR_WIDTH	: integer	:= 5;

		-- Parameters of Axi Slave Bus Interface S02_AXI
		C_S02_AXI_DATA_WIDTH	: integer	:= 32;
		C_S02_AXI_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S01_AXI
		s01_axi_aclk	: in std_logic;
		s01_axi_aresetn	: in std_logic;
		s01_axi_awaddr	: in std_logic_vector(C_S01_AXI_ADDR_WIDTH-1 downto 0);
		s01_axi_awprot	: in std_logic_vector(2 downto 0);
		s01_axi_awvalid	: in std_logic;
		s01_axi_awready	: out std_logic;
		s01_axi_wdata	: in std_logic_vector(C_S01_AXI_DATA_WIDTH-1 downto 0);
		s01_axi_wstrb	: in std_logic_vector((C_S01_AXI_DATA_WIDTH/8)-1 downto 0);
		s01_axi_wvalid	: in std_logic;
		s01_axi_wready	: out std_logic;
		s01_axi_bresp	: out std_logic_vector(1 downto 0);
		s01_axi_bvalid	: out std_logic;
		s01_axi_bready	: in std_logic;
		s01_axi_araddr	: in std_logic_vector(C_S01_AXI_ADDR_WIDTH-1 downto 0);
		s01_axi_arprot	: in std_logic_vector(2 downto 0);
		s01_axi_arvalid	: in std_logic;
		s01_axi_arready	: out std_logic;
		s01_axi_rdata	: out std_logic_vector(C_S01_AXI_DATA_WIDTH-1 downto 0);
		s01_axi_rresp	: out std_logic_vector(1 downto 0);
		s01_axi_rvalid	: out std_logic;
		s01_axi_rready	: in std_logic;

		-- Ports of Axi Slave Bus Interface S02_AXI
		s02_axi_aclk	: in std_logic;
		s02_axi_aresetn	: in std_logic;
		s02_axi_awaddr	: in std_logic_vector(C_S02_AXI_ADDR_WIDTH-1 downto 0);
		s02_axi_awprot	: in std_logic_vector(2 downto 0);
		s02_axi_awvalid	: in std_logic;
		s02_axi_awready	: out std_logic;
		s02_axi_wdata	: in std_logic_vector(C_S02_AXI_DATA_WIDTH-1 downto 0);
		s02_axi_wstrb	: in std_logic_vector((C_S02_AXI_DATA_WIDTH/8)-1 downto 0);
		s02_axi_wvalid	: in std_logic;
		s02_axi_wready	: out std_logic;
		s02_axi_bresp	: out std_logic_vector(1 downto 0);
		s02_axi_bvalid	: out std_logic;
		s02_axi_bready	: in std_logic;
		s02_axi_araddr	: in std_logic_vector(C_S02_AXI_ADDR_WIDTH-1 downto 0);
		s02_axi_arprot	: in std_logic_vector(2 downto 0);
		s02_axi_arvalid	: in std_logic;
		s02_axi_arready	: out std_logic;
		s02_axi_rdata	: out std_logic_vector(C_S02_AXI_DATA_WIDTH-1 downto 0);
		s02_axi_rresp	: out std_logic_vector(1 downto 0);
		s02_axi_rvalid	: out std_logic;
		s02_axi_rready	: in std_logic
	);
end AXItmrmvoter_v1_0;

architecture arch_imp of AXItmrmvoter_v1_0 is
-- Users to add ports here
--Signals to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
Signal S00_TO_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S00_AXI_DATA_WIDTH-1 downto 0);
Signal S01_TO_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S01_AXI_DATA_WIDTH-1 downto 0);
Signal S02_TO_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S02_AXI_DATA_WIDTH-1 downto 0);
Signal TO_TMRMVOTER: std_logic_vector(3*NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S00_AXI_DATA_WIDTH-1 downto 0);
Signal S00_FROM_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S00_AXI_DATA_WIDTH-1 downto 0);
Signal S01_FROM_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S01_AXI_DATA_WIDTH-1 downto 0);
Signal S02_FROM_TMRMVOTER: std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S02_AXI_DATA_WIDTH-1 downto 0);

-- User signals ends
	-- component declaration
	component AXItmrmvoter_v1_0_S00_AXI is
		generic (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON : integer :=4;
        -- User parameters ends
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5
		);
		port (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    : out std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        FROM_TMRMVOTER    : in std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        -- User ports ends
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component AXItmrmvoter_v1_0_S00_AXI;

	component AXItmrmvoter_v1_0_S01_AXI is
		generic (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON : integer :=4;
        -- User parameters ends
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        C_S_AXI_ADDR_WIDTH    : integer    := 5
        );
        port (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    : out std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        FROM_TMRMVOTER    : in std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        -- User ports ends
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component AXItmrmvoter_v1_0_S01_AXI;

	component AXItmrmvoter_v1_0_S02_AXI is
		generic (
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON : integer :=4;
        -- User parameters ends
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        C_S_AXI_ADDR_WIDTH    : integer    := 5
        );
        port (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    : out std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        FROM_TMRMVOTER    : in std_logic_vector(NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S_AXI_DATA_WIDTH-1 downto 0);
        -- User ports ends
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component AXItmrmvoter_v1_0_S02_AXI;

begin
--Fix the input to the TMRMVoter by arranging corresponding bits together in a tuple of 3
TMRMVOTER_INPUT : for index in NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S00_AXI_DATA_WIDTH downto 1 GENERATE
TO_TMRMVOTER(3*index-1 downto 3*(index-1)) <= S00_TO_TMRMVOTER(index-1) & S01_TO_TMRMVOTER(index-1) & S02_TO_TMRMVOTER(index-1);
end GENERATE TMRMVOTER_INPUT;

--Instantiation 3 voters
tmrvoter0: entity tmrmvoter 
    Generic Map (NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S00_AXI_DATA_WIDTH)
    Port   Map (TO_TMRMVOTER,S00_FROM_TMRMVOTER);
tmrvoter1: entity tmrmvoter 
    Generic Map (NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S01_AXI_DATA_WIDTH)
    Port   Map (TO_TMRMVOTER,S01_FROM_TMRMVOTER);
tmrvoter2: entity tmrmvoter 
    Generic Map (NUMBER_OF_REGISTERS_TO_BE_VOTED_ON*C_S02_AXI_DATA_WIDTH)
    Port   Map (TO_TMRMVOTER,S02_FROM_TMRMVOTER);
    
-- Instantiation of Axi Bus Interface S00_AXI
AXItmrmvoter_v1_0_S00_AXI_inst : AXItmrmvoter_v1_0_S00_AXI
	generic map (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON => NUMBER_OF_REGISTERS_TO_BE_VOTED_ON,
        -- User parameters ends
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    => S00_TO_TMRMVOTER,
        FROM_TMRMVOTER    => S00_FROM_TMRMVOTER,
        -- User ports ends
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

-- Instantiation of Axi Bus Interface S01_AXI
AXItmrmvoter_v1_0_S01_AXI_inst : AXItmrmvoter_v1_0_S01_AXI
	generic map (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON => NUMBER_OF_REGISTERS_TO_BE_VOTED_ON,
        -- User parameters ends
		C_S_AXI_DATA_WIDTH	=> C_S01_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S01_AXI_ADDR_WIDTH
	)
	port map (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    => S01_TO_TMRMVOTER,
        FROM_TMRMVOTER    => S01_FROM_TMRMVOTER,
        -- User ports ends
		S_AXI_ACLK	=> s01_axi_aclk,
		S_AXI_ARESETN	=> s01_axi_aresetn,
		S_AXI_AWADDR	=> s01_axi_awaddr,
		S_AXI_AWPROT	=> s01_axi_awprot,
		S_AXI_AWVALID	=> s01_axi_awvalid,
		S_AXI_AWREADY	=> s01_axi_awready,
		S_AXI_WDATA	=> s01_axi_wdata,
		S_AXI_WSTRB	=> s01_axi_wstrb,
		S_AXI_WVALID	=> s01_axi_wvalid,
		S_AXI_WREADY	=> s01_axi_wready,
		S_AXI_BRESP	=> s01_axi_bresp,
		S_AXI_BVALID	=> s01_axi_bvalid,
		S_AXI_BREADY	=> s01_axi_bready,
		S_AXI_ARADDR	=> s01_axi_araddr,
		S_AXI_ARPROT	=> s01_axi_arprot,
		S_AXI_ARVALID	=> s01_axi_arvalid,
		S_AXI_ARREADY	=> s01_axi_arready,
		S_AXI_RDATA	=> s01_axi_rdata,
		S_AXI_RRESP	=> s01_axi_rresp,
		S_AXI_RVALID	=> s01_axi_rvalid,
		S_AXI_RREADY	=> s01_axi_rready
	);

-- Instantiation of Axi Bus Interface S02_AXI
AXItmrmvoter_v1_0_S02_AXI_inst : AXItmrmvoter_v1_0_S02_AXI
    generic map (
        -- Users to add parameters here
        NUMBER_OF_REGISTERS_TO_BE_VOTED_ON => NUMBER_OF_REGISTERS_TO_BE_VOTED_ON,
        -- User parameters ends
        C_S_AXI_DATA_WIDTH    => C_S02_AXI_DATA_WIDTH,
        C_S_AXI_ADDR_WIDTH    => C_S02_AXI_ADDR_WIDTH
    )
    port map (
        -- Users to add ports here
        -- Read data (issued by slave)
        --Port to Export Data to and From TMR majority Voter ... The width of 4 indicates 4 registers
        TO_TMRMVOTER    => S02_TO_TMRMVOTER,
        FROM_TMRMVOTER    => S02_FROM_TMRMVOTER,
        -- User ports ends
        S_AXI_ACLK    => s02_axi_aclk,
		S_AXI_ARESETN	=> s02_axi_aresetn,
		S_AXI_AWADDR	=> s02_axi_awaddr,
		S_AXI_AWPROT	=> s02_axi_awprot,
		S_AXI_AWVALID	=> s02_axi_awvalid,
		S_AXI_AWREADY	=> s02_axi_awready,
		S_AXI_WDATA	=> s02_axi_wdata,
		S_AXI_WSTRB	=> s02_axi_wstrb,
		S_AXI_WVALID	=> s02_axi_wvalid,
		S_AXI_WREADY	=> s02_axi_wready,
		S_AXI_BRESP	=> s02_axi_bresp,
		S_AXI_BVALID	=> s02_axi_bvalid,
		S_AXI_BREADY	=> s02_axi_bready,
		S_AXI_ARADDR	=> s02_axi_araddr,
		S_AXI_ARPROT	=> s02_axi_arprot,
		S_AXI_ARVALID	=> s02_axi_arvalid,
		S_AXI_ARREADY	=> s02_axi_arready,
		S_AXI_RDATA	=> s02_axi_rdata,
		S_AXI_RRESP	=> s02_axi_rresp,
		S_AXI_RVALID	=> s02_axi_rvalid,
		S_AXI_RREADY	=> s02_axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
