-- This file generated using make_tmr.py script
-- AUTHOR: Youssef Zaki
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY sem_tmr is
	PORT (
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
		fecc_synword_0 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		fecc_synword_1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		fecc_synword_2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
	  );
END sem_tmr;

architecture STRUCTURAL of tmr_sem is
COMPONENT sem
  PORT (
    status_heartbeat : OUT STD_LOGIC;
    status_initialization : OUT STD_LOGIC;
    status_observation : OUT STD_LOGIC;
    status_correction : OUT STD_LOGIC;
    status_classification : OUT STD_LOGIC;
    status_injection : OUT STD_LOGIC;
    status_essential : OUT STD_LOGIC;
    status_uncorrectable : OUT STD_LOGIC;
    monitor_txdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    monitor_txwrite : OUT STD_LOGIC;
    monitor_txfull : IN STD_LOGIC;
    monitor_rxdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    monitor_rxread : OUT STD_LOGIC;
    monitor_rxempty : IN STD_LOGIC;
    inject_strobe : IN STD_LOGIC;
    inject_address : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    icap_o : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    icap_csib : OUT STD_LOGIC;
    icap_rdwrb : OUT STD_LOGIC;
    icap_i : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    icap_clk : IN STD_LOGIC;
    icap_request : OUT STD_LOGIC;
    icap_grant : IN STD_LOGIC;
    fecc_crcerr : IN STD_LOGIC;
    fecc_eccerr : IN STD_LOGIC;
    fecc_eccerrsingle : IN STD_LOGIC;
    fecc_syndromevalid : IN STD_LOGIC;
    fecc_syndrome : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    fecc_far : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
    fecc_synbit : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    fecc_synword : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END COMPONENT;

-- Start Signals
	status_heartbeat_0, status_heartbeat_1, status_heartbeat_2 : OUT STD_LOGIC;
	status_initialization_0, status_initialization_1, status_initialization_2 : OUT STD_LOGIC;
	status_observation_0, status_observation_1, status_observation_2 : OUT STD_LOGIC;
	status_correction_0, status_correction_1, status_correction_2 : OUT STD_LOGIC;
	status_classification_0, status_classification_1, status_classification_2 : OUT STD_LOGIC;
	status_injection_0, status_injection_1, status_injection_2 : OUT STD_LOGIC;
	status_essential_0, status_essential_1, status_essential_2 : OUT STD_LOGIC;
	status_uncorrectable_0, status_uncorrectable_1, status_uncorrectable_2 : OUT STD_LOGIC;
	monitor_txdata_0, monitor_txdata_1, monitor_txdata_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	monitor_txwrite_0, monitor_txwrite_1, monitor_txwrite_2 : OUT STD_LOGIC;
	monitor_txfull_0, monitor_txfull_1, monitor_txfull_2 : IN STD_LOGIC;
	monitor_rxdata_0, monitor_rxdata_1, monitor_rxdata_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	monitor_rxread_0, monitor_rxread_1, monitor_rxread_2 : OUT STD_LOGIC;
	monitor_rxempty_0, monitor_rxempty_1, monitor_rxempty_2 : IN STD_LOGIC;
	inject_strobe_0, inject_strobe_1, inject_strobe_2 : IN STD_LOGIC;
	inject_address_0, inject_address_1, inject_address_2 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
	icap_o_0, icap_o_1, icap_o_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	icap_csib_0, icap_csib_1, icap_csib_2 : OUT STD_LOGIC;
	icap_rdwrb_0, icap_rdwrb_1, icap_rdwrb_2 : OUT STD_LOGIC;
	icap_i_0, icap_i_1, icap_i_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	icap_clk_0, icap_clk_1, icap_clk_2 : IN STD_LOGIC;
	icap_request_0, icap_request_1, icap_request_2 : OUT STD_LOGIC;
	icap_grant_0, icap_grant_1, icap_grant_2 : IN STD_LOGIC;
	fecc_crcerr_0, fecc_crcerr_1, fecc_crcerr_2 : IN STD_LOGIC;
	fecc_eccerr_0, fecc_eccerr_1, fecc_eccerr_2 : IN STD_LOGIC;
	fecc_eccerrsingle_0, fecc_eccerrsingle_1, fecc_eccerrsingle_2 : IN STD_LOGIC;
	fecc_syndromevalid_0, fecc_syndromevalid_1, fecc_syndromevalid_2 : IN STD_LOGIC;
	fecc_syndrome_0, fecc_syndrome_1, fecc_syndrome_2 : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
	fecc_far_0, fecc_far_1, fecc_far_2 : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
	fecc_synbit_0, fecc_synbit_1, fecc_synbit_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	fecc_synword_0, fecc_synword_1, fecc_synword_2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
;
-- End Signals  );
BEGIN
S0 : sem
	PORT MAP (
	status_heartbeat	=> status_heartbeat_0,
	status_initialization	=> status_initialization_0,
	status_observation	=> status_observation_0,
	status_correction	=> status_correction_0,
	status_classification	=> status_classification_0,
	status_injection	=> status_injection_0,
	status_essential	=> status_essential_0,
	status_uncorrectable	=> status_uncorrectable_0,
	monitor_txdata	=> monitor_txdata_0,
	monitor_txwrite	=> monitor_txwrite_0,
	monitor_txfull	=> monitor_txfull_0,
	monitor_rxdata	=> monitor_rxdata_0,
	monitor_rxread	=> monitor_rxread_0,
	monitor_rxempty	=> monitor_rxempty_0,
	inject_strobe	=> inject_strobe_0,
	inject_address	=> inject_address_0,
	icap_o	=> icap_o_0,
	icap_csib	=> icap_csib_0,
	icap_rdwrb	=> icap_rdwrb_0,
	icap_i	=> icap_i_0,
	icap_clk	=> icap_clk_0,
	icap_request	=> icap_request_0,
	icap_grant	=> icap_grant_0,
	fecc_crcerr	=> fecc_crcerr_0,
	fecc_eccerr	=> fecc_eccerr_0,
	fecc_eccerrsingle	=> fecc_eccerrsingle_0,
	fecc_syndromevalid	=> fecc_syndromevalid_0,
	fecc_syndrome	=> fecc_syndrome_0,
	fecc_far	=> fecc_far_0,
	fecc_synbit	=> fecc_synbit_0,
	fecc_synword	=> fecc_synword_0
	  );
S1 : sem
	PORT MAP (
	status_heartbeat	=> status_heartbeat_1,
	status_initialization	=> status_initialization_1,
	status_observation	=> status_observation_1,
	status_correction	=> status_correction_1,
	status_classification	=> status_classification_1,
	status_injection	=> status_injection_1,
	status_essential	=> status_essential_1,
	status_uncorrectable	=> status_uncorrectable_1,
	monitor_txdata	=> monitor_txdata_1,
	monitor_txwrite	=> monitor_txwrite_1,
	monitor_txfull	=> monitor_txfull_1,
	monitor_rxdata	=> monitor_rxdata_1,
	monitor_rxread	=> monitor_rxread_1,
	monitor_rxempty	=> monitor_rxempty_1,
	inject_strobe	=> inject_strobe_1,
	inject_address	=> inject_address_1,
	icap_o	=> icap_o_1,
	icap_csib	=> icap_csib_1,
	icap_rdwrb	=> icap_rdwrb_1,
	icap_i	=> icap_i_1,
	icap_clk	=> icap_clk_1,
	icap_request	=> icap_request_1,
	icap_grant	=> icap_grant_1,
	fecc_crcerr	=> fecc_crcerr_1,
	fecc_eccerr	=> fecc_eccerr_1,
	fecc_eccerrsingle	=> fecc_eccerrsingle_1,
	fecc_syndromevalid	=> fecc_syndromevalid_1,
	fecc_syndrome	=> fecc_syndrome_1,
	fecc_far	=> fecc_far_1,
	fecc_synbit	=> fecc_synbit_1,
	fecc_synword	=> fecc_synword_1
	  );
S2 : sem
	PORT MAP (
	status_heartbeat	=> status_heartbeat_2,
	status_initialization	=> status_initialization_2,
	status_observation	=> status_observation_2,
	status_correction	=> status_correction_2,
	status_classification	=> status_classification_2,
	status_injection	=> status_injection_2,
	status_essential	=> status_essential_2,
	status_uncorrectable	=> status_uncorrectable_2,
	monitor_txdata	=> monitor_txdata_2,
	monitor_txwrite	=> monitor_txwrite_2,
	monitor_txfull	=> monitor_txfull_2,
	monitor_rxdata	=> monitor_rxdata_2,
	monitor_rxread	=> monitor_rxread_2,
	monitor_rxempty	=> monitor_rxempty_2,
	inject_strobe	=> inject_strobe_2,
	inject_address	=> inject_address_2,
	icap_o	=> icap_o_2,
	icap_csib	=> icap_csib_2,
	icap_rdwrb	=> icap_rdwrb_2,
	icap_i	=> icap_i_2,
	icap_clk	=> icap_clk_2,
	icap_request	=> icap_request_2,
	icap_grant	=> icap_grant_2,
	fecc_crcerr	=> fecc_crcerr_2,
	fecc_eccerr	=> fecc_eccerr_2,
	fecc_eccerrsingle	=> fecc_eccerrsingle_2,
	fecc_syndromevalid	=> fecc_syndromevalid_2,
	fecc_syndrome	=> fecc_syndrome_2,
	fecc_far	=> fecc_far_2,
	fecc_synbit	=> fecc_synbit_2,
	fecc_synword	=> fecc_synword_2
	  );
END STRUCTURAL;
