library ieee;
use ieee.std_logic_1164.all;

entity Address_Adapter is
	port(Input: in std_ulogic_vector(15 downto 0); Output: inout std_ulogic_vector(3 downto 0));
end entity Address_Adapter;

architecture Designe_Address_Adapter of Address_Adapter is
	component Address_Adapter is
		port(Input: in std_ulogic_vector(15 downto 0); Output: inout std_ulogic_vector(3 downto 0));
	end component Address_Adapter;
begin
	Output <= Input(3 downto 0);
end architecture Designe_Address_Adapter;