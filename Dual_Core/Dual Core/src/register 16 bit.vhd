library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_16_Bit is
	port(LD, CLK: in std_ulogic; Input: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
end entity Register_16_Bit;																		   

architecture Design_Register_16_Bit of Register_16_Bit is
	component Register_16_Bit is
		port(LD, CLK: in std_ulogic; Input: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
	end component Register_16_Bit;
begin		   
	process (CLK)
	variable Data: unsigned(15 downto 0);
	begin
		if(rising_edge(CLK)) then
			if(LD = '1') then
				Data := unsigned(Input);
				Output <= std_ulogic_vector(Data);
			end if;	
		end if;
	end process;
end architecture Design_Register_16_Bit;