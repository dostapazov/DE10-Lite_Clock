library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_to_7seg is
port (
	NUMBER_I	: in std_logic_vector(3 downto 0);
	SEG_O		: out std_logic_vector(6 downto 0));
end hex_to_7seg;

architecture rtl of hex_to_7seg is
begin
	process (NUMBER_I)
	begin
		case NUMBER_I is
			when x"0" => SEG_O <= "1000000";	-- 0
			when x"1" => SEG_O <= "1111001";	-- 1
			when x"2" => SEG_O <= "0100100";	-- 2
			when x"3" => SEG_O <= "0110000";	-- 3
			when x"4" => SEG_O <= "0011001";	-- 4
			when x"5" => SEG_O <= "0010010";	-- 5
			when x"6" => SEG_O <= "0000010";	-- 6
			when x"7" => SEG_O <= "1111000";	-- 7
			when x"8" => SEG_O <= "0000000";	-- 8
			when x"9" => SEG_O <= "0010000";	-- 9
			when x"a" => SEG_O <= "0001000";	-- A
			when x"b" => SEG_O <= "0000011";	-- B
			when x"c" => SEG_O <= "1000110";	-- C
			when x"d" => SEG_O <= "0100001";	-- D
			when x"e" => SEG_O <= "0000110";	-- E
			when x"f" => SEG_O <= "0001110";	-- F
			when others => null;
		end case;
	end process;
end architecture;
			
			
		
	