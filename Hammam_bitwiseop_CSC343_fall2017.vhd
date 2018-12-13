library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bitwise is --AMR HAMMAM
	port(
		a, b: in std_logic_vector(5 downto 0);
		operation: in std_logic_vector(2 downto 0);
		power: in std_logic;
		result: out std_logic_vector(5 downto 0)
		);
end bitwise;

architecture arch of bitwise is
begin
process(power)
	begin
	if(power = '1') then
		case operation is
			when "000" =>
				result <= a and b;
			when "001" =>
				result <= a or b;
			when "010" =>
				result <= a xor b;
			when "011" =>
				result <= not a;
			when "100" =>
				result <= to_stdlogicvector(to_bitvector(a) sll 1);
			when "101" =>
				result <= to_stdlogicvector(to_bitvector(a) srl 1);
			when "110" =>
				result <= to_stdlogicvector(to_bitvector(a) rol 1);
			when "111" =>
				result <= to_stdlogicvector(to_bitvector(a) ror 1);
			when others => NULL;
		end case;
	--	wait on operation;
	end if;
end process;
end arch;