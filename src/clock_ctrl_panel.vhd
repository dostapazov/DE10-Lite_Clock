library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity clock_ctrl_panel is
generic (input_clock : integer  );
port
(
	clk			: in	std_logic;
	reset		: in	std_logic;
	start 		: in	std_logic;
	up			: in	std_logic;
	dn			: in	std_logic;
	ed_hours	: in	std_logic; 
	ed_mins		: in	std_logic;
	sec_clk_out	: out	std_logic := '0';	
	
	minuts_clk_in	: in	std_logic := '0';
	minuts_clk_out	: out	std_logic := '0';
	hours_clk_in	: in	std_logic := '0';
	hours_clk_out	: out	std_logic := '0';
	dir				: out	std_logic := '0'
);
end clock_ctrl_panel;


architecture clock_ctrl_panel_arch of clock_ctrl_panel is
signal sig_sec_clk_out	: std_logic;
signal sig_key_dn	 	: std_logic := '0';
signal sig_key_up	 	: std_logic := '0';
signal sig_minuts_dir	: std_logic := '0';
signal sig_minuts_clk	: std_logic := '0';
begin

  deb_key_up : entity work.debounced_key
  generic map(input_clock/100000)
  port map
  (
   rst => reset,
	clk => clk,
	key_in => up,
	key_out =>sig_key_up
  );
  
  deb_key_dn : entity work.debounced_key
  generic map(input_clock/10000)
  port map
  (
   rst => reset,
	clk => clk,
	key_in => dn,
	key_out =>sig_key_dn
  );
  
  
  clock_divider1 : entity work.divisor
  generic map (input_clock)
  port map
  (
	clk_in => clk,
	clk_out => sig_sec_clk_out
  );
   
  sec_clk_out	<= sig_sec_clk_out and start;
  
  dir <= sig_key_up and ( ed_mins or ed_hours);
  minuts_clk_out <= minuts_clk_in or   ( sig_sec_clk_out and ed_mins  and not ed_hours and ( sig_key_dn or sig_key_up ) );
  hours_clk_out  <= hours_clk_in  or   ( sig_sec_clk_out and ed_hours and not ed_mins  and ( sig_key_dn or sig_key_up ) );
  
	
end  architecture  clock_ctrl_panel_arch;


