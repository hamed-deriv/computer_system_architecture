library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1 is
	port(S: in std_ulogic; Input0, Input1: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
end entity MUX_2x1;

architecture Designe_MUX_2x1 of MUX_2x1 is 
	component MUX_2x1 is
		port(S: in std_ulogic; Input0, Input1: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
	end component MUX_2x1;
begin
	process(S, Input0, Input1)
	begin
		if(S = '1') then
			Output <= Input1;
		elsif( S = '0') then
			Output <= Input0;
		end if;
	end process;
end architecture Designe_MUX_2x1;