library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Address_Adder is
	port(PC, Memory: in std_ulogic_vector(3 downto 0); Relative_Address: out std_ulogic_vector(3 downto 0));
end entity Address_Adder;

architecture Designe_Address_Adder of Address_Adder is
	component Address_Adder is
		port(PC, Memory: in std_ulogic_vector(3 downto 0); Relative_Address: out std_ulogic_vector(3 downto 0));
	end component Address_Adder;
begin
	process(PC, Memory) is
	variable Carry: unsigned(3 downto 0);
	begin
		Carry := unsigned(PC) + unsigned (Memory);
		Relative_Address <= std_ulogic_vector(Carry(3 downto 0));
	end process;
end architecture Designe_Address_Adder;