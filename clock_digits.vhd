library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity clock_digits is
generic (limit : integer := 60);
port
(
  clk			: in	std_logic;  
  reset		: in	std_logic;
  dir			: in	std_logic;
  clk_out   : out std_logic;
  digit_hi	: out std_logic_vector(3 downto 0);
  digit_lo	: out std_logic_vector(3 downto 0)
);
end clock_digits;

architecture clock_digits_arch of clock_digits is
	procedure change_number
	(
		signal dir : in std_logic; 
		limit : in integer; 
		signal number : inout  integer;
		signal carry : out std_logic
		) 
   is
	begin
		carry  <= '0';
		if(dir = '0') then
			if( number >= (limit-1)) then
					number <= 0;
					carry  <= '1';
				else
					number <= number + 1;
			end if;	
		else
			if (number <= 0) then
					number <= limit - 1;
				else
					number <= number - 1;
			end if;
		end if;
			
	end procedure change_number;

signal sig_number		: integer := 0;	
signal sig_clk			: std_logic := '0';
begin

	count_process : process(clk,reset,sig_number) 
	begin

		if(reset = '1') then
			sig_number<= 0;
			sig_clk <= '0';
		else
			if(rising_edge(clk)) then
				change_number(dir, limit, sig_number, sig_clk);
			end if;	
		end if;
		
	end process count_process;
	
	clk_out	<= sig_clk;
	
	digit_hi <= conv_std_logic_vector(sig_number / 10  , digit_hi'length);
	digit_lo <= conv_std_logic_vector(sig_number rem 10, digit_lo'length);
	
end  architecture clock_digits_arch;

