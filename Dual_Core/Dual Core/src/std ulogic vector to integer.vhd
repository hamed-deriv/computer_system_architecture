library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity Convertor is
	port(Input: in std_ulogic_vector(3 downto 0); Output: out integer range 0 to 15);
end entity Convertor;  

architecture Designe_Convertor of Convertor is
	component Convertor is
		port(Input: in std_ulogic_vector(3 downto 0); Output: out integer range 0 to 15);
	end component Convertor;
begin
	process(Input)
		variable Temp: unsigned(3 downto 0); 
	begin
		Temp := unsigned(Input);
		Output <= to_integer(Temp);
	end process;
end architecture Designe_Convertor;
	
