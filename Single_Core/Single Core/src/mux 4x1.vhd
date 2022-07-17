library ieee;
use ieee.std_logic_1164.all;

entity MUX_4x1 is
	port(T: in std_ulogic_vector(2 downto 0); S: in std_ulogic_vector(1 downto 0); Input0, Input1, Input2, Input3: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
end entity MUX_4x1;

architecture Designe_MUX_4x1 of MUX_4x1 is 
	component MUX_4x1 is
		port(T: in std_ulogic_vector(2 downto 0); S: in std_ulogic_vector(1 downto 0); Input0, Input1, Input2, Input3: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
	end component MUX_4x1;
begin
	process(S, T, Input0, Input1, Input2, Input3)
	begin
		if(S = "00") then
			Output <= Input0;
		elsif(S = "01") then
			Output <= Input1;
		elsif( S = "10") then
			Output <= Input2;
		elsif( S = "11") then
			Output <= Input3;			
		end if;
	end process;
end architecture Designe_MUX_4x1;