----------------------------------------------------------------------------------
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

        entity tmr_sem is
          PORT (
        PORT_0 (
        PORT_1 (
        PORT_2 (
        status_heartbeat_0 : OUT STD_LOGIC;
        status_heartbeat_1 : OUT STD_LOGIC;
        status_heartbeat_2 : OUT STD_LOGIC;
        status_initialization_0 : OUT STD_LOGIC;
        status_initialization_1 : OUT STD_LOGIC;
        status_initialization_2 : OUT STD_LOGIC;
        status_observation_0 : OUT STD_LOGIC;
        status_observation_1 : OUT STD_LOGIC;
        status_observation_2 : OUT STD_LOGIC;
        status_correction_0 : OUT STD_LOGIC;
        status_correction_1 : OUT STD_LOGIC;
        status_correction_2 : OUT STD_LOGIC;
        status_classification_0 : OUT STD_LOGIC;
        status_classification_1 : OUT STD_LOGIC;
        status_classification_2 : OUT STD_LOGIC;
        status_injection_0 : OUT STD_LOGIC;
        status_injection_1 : OUT STD_LOGIC;
        status_injection_2 : OUT STD_LOGIC;
        status_essential_0 : OUT STD_LOGIC;
        status_essential_1 : OUT STD_LOGIC;
        status_essential_2 : OUT STD_LOGIC;
        status_uncorrectable_0 : OUT STD_LOGIC;
        status_uncorrectable_1 : OUT STD_LOGIC;
        status_uncorrectable_2 : OUT STD_LOGIC;
        monitor_txdata_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_txdata_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_txdata_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_txwrite_0 : OUT STD_LOGIC;
        monitor_txwrite_1 : OUT STD_LOGIC;
        monitor_txwrite_2 : OUT STD_LOGIC;
        monitor_txfull_0 : IN STD_LOGIC;
        monitor_txfull_1 : IN STD_LOGIC;
        monitor_txfull_2 : IN STD_LOGIC;
        monitor_rxdata_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_rxdata_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_rxdata_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        monitor_rxread_0 : OUT STD_LOGIC;
        monitor_rxread_1 : OUT STD_LOGIC;
        monitor_rxread_2 : OUT STD_LOGIC;
        monitor_rxempty_0 : IN STD_LOGIC;
        monitor_rxempty_1 : IN STD_LOGIC;
        monitor_rxempty_2 : IN STD_LOGIC;
        inject_strobe_0 : IN STD_LOGIC;
        inject_strobe_1 : IN STD_LOGIC;
        inject_strobe_2 : IN STD_LOGIC;
        inject_address_0 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
        inject_address_1 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
        inject_address_2 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
        icap_o_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_o_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_o_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_csib_0 : OUT STD_LOGIC;
        icap_csib_1 : OUT STD_LOGIC;
        icap_csib_2 : OUT STD_LOGIC;
        icap_rdwrb_0 : OUT STD_LOGIC;
        icap_rdwrb_1 : OUT STD_LOGIC;
        icap_rdwrb_2 : OUT STD_LOGIC;
        icap_i_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_i_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_i_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        icap_clk_0 : IN STD_LOGIC;
        icap_clk_1 : IN STD_LOGIC;
        icap_clk_2 : IN STD_LOGIC;
        icap_request_0 : OUT STD_LOGIC;
        icap_request_1 : OUT STD_LOGIC;
        icap_request_2 : OUT STD_LOGIC;
        icap_grant_0 : IN STD_LOGIC;
        icap_grant_1 : IN STD_LOGIC;
        icap_grant_2 : IN STD_LOGIC;
        fecc_crcerr_0 : IN STD_LOGIC;
        fecc_crcerr_1 : IN STD_LOGIC;
        fecc_crcerr_2 : IN STD_LOGIC;
        fecc_eccerr_0 : IN STD_LOGIC;
        fecc_eccerr_1 : IN STD_LOGIC;
        fecc_eccerr_2 : IN STD_LOGIC;
        fecc_eccerrsingle_0 : IN STD_LOGIC;
        fecc_eccerrsingle_1 : IN STD_LOGIC;
        fecc_eccerrsingle_2 : IN STD_LOGIC;
        fecc_syndromevalid_0 : IN STD_LOGIC;
        fecc_syndromevalid_1 : IN STD_LOGIC;
        fecc_syndromevalid_2 : IN STD_LOGIC;
        fecc_syndrome_0 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        fecc_syndrome_1 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        fecc_syndrome_2 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        fecc_far_0 : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
        fecc_far_1 : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
        fecc_far_2 : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
        fecc_synbit_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        fecc_synbit_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        fecc_synbit_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        fecc_synword_0 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
        fecc_synword_1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
        fecc_synword_2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
        );_0
        );_1
        );_2

        end tmr_sem;

        architecture Behavioral of tmr_sem is

        begin


        end Behavioral;