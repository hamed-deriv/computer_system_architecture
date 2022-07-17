library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity Sequence_Counter is
	port(CLK, CLR: in std_ulogic; Output: out std_ulogic_vector(2 downto 0));
end entity Sequence_Counter;

architecture Design_Sequence_Counter of Sequence_Counter is
	component Sequence_Counter is
		port(CLK, CLR, INC: in std_ulogic; Output: out std_ulogic_vector(2 downto 0));
	end component Sequence_Counter;
begin
	process(CLK, CLR)
	variable Data: unsigned(2 downto 0);
	begin
		if(CLR = '1' or Data > 4) then
			Data := (others => '0');
			Output <= std_ulogic_vector(Data);
		elsif(rising_edge(CLK)) then
			Data := Data + 1;
			Output <= std_ulogic_vector(Data);
		end if;
	end process;
end architecture Design_Sequence_Counter; 
			
			
			