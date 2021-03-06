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
