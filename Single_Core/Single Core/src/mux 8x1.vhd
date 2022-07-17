library ieee;
use ieee.std_logic_1164.all;

entity MUX_8x1 is
	port(S: in std_ulogic_vector(2 downto 0); Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
end entity MUX_8x1;

architecture Designe_MUX_8x1 of MUX_8x1 is 
	component MUX_8x1 is
		port(S: in std_ulogic_vector(2 downto 0); Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
	end component MUX_8x1;
begin
	process(S, Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7)
	begin	 
		if(S = "000") then
			Output <= Input0;
		elsif( S = "001") then
			Output <= Input1;
		elsif( S = "010") then
			Output <= Input2;
		elsif( S = "011") then
			Output <= Input3;
		elsif( S = "100") then
			Output <= Input4;
		elsif( S = "101") then
			Output <= Input5;
		elsif( S = "110") then
			Output <= Input6;
		elsif( S = "111") then
			Output <= Input7;
		end if;
	end process;
end architecture Designe_MUX_8x1;