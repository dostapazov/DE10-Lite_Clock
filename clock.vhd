library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;


entity clock is 
generic (CLK_FREQ : integer := 10000000);
port
(
CLK		 	: in 	std_logic;
KEY_DN		: in	std_logic;
KEY_UP		: in	std_logic;
RESET			: in	std_logic;
START			: in	std_logic;
SET_HOUR		: in	std_logic;
SET_MINUTES : in	std_logic;
SECUNDS_LO	: out	std_logic_vector(6 downto 0) := (others =>'0');
SECUNDS_HI	: out	std_logic_vector(6 downto 0) := (others =>'0');
MINUTES_LO	: out	std_logic_vector(6 downto 0) := (others =>'0');
MINUTES_HI	: out	std_logic_vector(6 downto 0) := (others =>'0');
HOURS_LO		: out	std_logic_vector(6 downto 0) := (others =>'0');
HOURS_HI		: out	std_logic_vector(6 downto 0) := (others =>'0');
SECUND_FLASH: out std_logic
);
end clock;

architecture clock_arch of clock is

constant SECUNDS_COUNT: integer := 60;
constant MINUTES_COUNT: integer := 60;
constant HOURS_COUNT : integer := 24;

signal tmp_clk 		: std_logic := '0';
signal tmp_clk_half	: std_logic := '0';

signal minuts_clk_in	: std_logic := '0';
signal minuts_clk_out: std_logic := '0';
signal dir 			    : std_logic := '0';

signal hours_clk_in	: std_logic := '0';
signal hours_clk_out : std_logic := '0';

signal sig_secunds_hi 	: std_logic_vector(3 downto 0);
signal sig_secunds_lo 	: std_logic_vector(3 downto 0);
signal sig_minutes_hi 	: std_logic_vector(3 downto 0);
signal sig_minutes_lo 	: std_logic_vector(3 downto 0);
signal sig_hours_hi 		: std_logic_vector(3 downto 0);
signal sig_hours_lo 		: std_logic_vector(3 downto 0);

begin
 
 SECUND_FLASH  <= tmp_clk;
 
 ctrl_panel : work.clock_ctrl_panel
 generic map(CLK_FREQ)
 port map
 (
   clk 		=> CLK,
	reset 	=> RESET,
	ed_hours	=> SET_HOUR,
	ed_mins	=> SET_MINUTES,
	start 	=> START,
	up 		=> KEY_UP,
	dn			=> KEY_DN,
	sec_clk_out		=> tmp_clk,
	dir				=> dir,
	minuts_clk_in 	=> minuts_clk_in,
	minuts_clk_out	=> minuts_clk_out,
	
	hours_clk_in 	=> hours_clk_in,
	hours_clk_out	=> hours_clk_out

 );

 
 
 
 secunds : work.clock_digits
 generic map (SECUNDS_COUNT)
 port map
 (
	clk		=> tmp_clk,
	reset		=> reset,
	dir		=> '0',
	clk_out	=> minuts_clk_in,
	digit_lo	=> sig_secunds_lo,
	digit_hi	=> sig_secunds_hi
	
 );
 
 minutes : work.clock_digits
 generic map (MINUTES_COUNT)
 port map
 (
	clk 		=> minuts_clk_out,
	reset 	=> reset,
	dir	 	=> dir,
	clk_out  => hours_clk_in,
	digit_lo	=> sig_minutes_lo,
	digit_hi	=> sig_minutes_hi
	
 );
 
 hours : work.clock_digits
 generic map (HOURS_COUNT)
 port map
 (
	clk 		=> hours_clk_out,
	reset 	=> reset,
	dir	 	=> dir,
	digit_lo	=> sig_hours_lo,
	digit_hi	=> sig_hours_hi
 );

 
 sdigit_lo : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_secunds_lo,
  SEG_O		=> SECUNDS_LO
 );
 
 sdigit_hi : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_secunds_hi,
  SEG_O		=> SECUNDS_HI
 );
 
 mdigit_lo : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_minutes_lo,
  SEG_O		=> MINUTES_LO
 );

 mdigit_hi : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_minutes_hi,
  SEG_O		=> MINUTES_HI
 );
 
 hdigit_lo : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_hours_lo,
  SEG_O		=> HOURS_LO
 );

 hdigit_hi : work.hex_to_7seg
 port map
 (
  NUMBER_I	=> sig_hours_hi,
  SEG_O		=> HOURS_HI
 );


end architecture clock_arch;
