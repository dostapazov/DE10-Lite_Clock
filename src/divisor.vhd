library ieee;
use ieee.std_logic_1164.all;

entity divisor is
generic(
DIVIDER : integer :=10
);
port
(
CLK_IN  : in 	std_logic;
CLK_OUT : out 	std_logic
);
end divisor;

architecture divisor_arch of divisor is
signal counter: natural  range 0 to DIVIDER :=0;
signal result : std_logic := '0';
begin
CLK_OUT <= result;
	process (CLK_IN)  
	begin
		if(rising_edge(CLK_IN))	then
			if(counter < DIVIDER-1) then
				counter <= counter+1;
				result <= '0';
			else
				counter <= 0;
				result <= '1';
			end if;
		end if;
	end process;	



end architecture divisor_arch;
