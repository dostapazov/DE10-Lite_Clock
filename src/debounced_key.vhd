library ieee;
use ieee.std_logic_1164.all;

entity debounced_key is
generic (debounce_filter : integer := 1000);
port
(
	rst		: in	std_logic; 
	clk		: in	std_logic; 
	key_in	: in	std_logic; 
	key_out	: out	std_logic 
);
end debounced_key;

architecture debounced_key_arch of debounced_key is
 signal sig_key_state : std_logic;
 signal sig_counter	 : natural range 0 to debounce_filter;
 
begin
	key_out <= sig_key_state;
	
	process (clk,rst, key_in) begin
		if(rst = '1') then
			sig_key_state	<= '0';
			sig_counter		<=  0;
			
		elsif(rising_edge(clk)) then
			if(sig_key_state /= key_in) then
				if(sig_counter < debounce_filter) then
					sig_counter <= sig_counter +1;
				else
					sig_counter <= 0;
					sig_key_state <= key_in;
				end if;
					
			else
				sig_counter <= 0;
			end if;
			
		end if;
	end process;
	
end  architecture debounced_key_arch;
