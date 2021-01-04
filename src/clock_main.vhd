library ieee;
	use ieee.std_logic_1164.all;

library work;
	use work.all;

entity clock_main is 
port
(
ADC_CLK_10 		: in 	std_logic;
KEY				: in	std_logic_vector(1 downto 0);
SW				: in	std_logic_vector(9 downto 0);
HEX0			: out	std_logic_vector(7 downto 0) := (others =>'0');
HEX1			: out	std_logic_vector(7 downto 0) := (others =>'0');
HEX2			: out	std_logic_vector(7 downto 0) := (others =>'0');
HEX3			: out	std_logic_vector(7 downto 0) := (others =>'0');
HEX4			: out	std_logic_vector(7 downto 0) := (others =>'0');
HEX5			: out	std_logic_vector(7 downto 0) := (others =>'0');
LEDR			: out	std_logic_vector(9 downto 0) := (others =>'0')
);
end clock_main;

architecture clock_main_arch of clock_main is
	constant FREQ_10_MHZ : integer := 10000000;
begin
 
 HEX1(7)	<='1';
 HEX2(7)	<='0';
 HEX3(7)	<='1';
 HEX4(7)	<='0';
 HEX5(7)	<='1';

  clock_instance : entity work.clock
  generic map (FREQ_10_MHZ)
  port map
  (
	CLK 		=> ADC_CLK_10,
	KEY_DN 		=> not KEY(0),
	KEY_UP 		=> not KEY(1),
	RESET		=> SW (9),
	START		=> SW (0),
	SET_MINUTES	=> SW (1),
	SET_HOUR	=> SW (2),
	SECUNDS_LO	=> HEX0(6 downto 0),
	SECUNDS_HI	=> HEX1(6 downto 0),
	MINUTES_LO	=> HEX2(6 downto 0),
	MINUTES_HI	=> HEX3(6 downto 0),
	HOURS_LO	=> HEX4(6 downto 0),
	HOURS_HI	=> HEX5(6 downto 0),
	SECUND_FLASH=> HEX0(7)
  );
  
end architecture clock_main_arch;
