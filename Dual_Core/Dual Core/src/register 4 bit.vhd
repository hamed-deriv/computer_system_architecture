library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_4_Bit is
	port(LD, INC, CLR, CLK: in std_ulogic; Input: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
end entity Register_4_Bit;																		   

architecture Design_Register_4_Bit of Register_4_Bit is
	component Register_4_Bit is
		port(LD, INC, CLR, CLK: in std_ulogic; Input: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(3 downto 0));
	end component Register_4_Bit;
begin		   
	process (CLK)
	variable Data: unsigned(3 downto 0);
	begin
		if(CLR = '1') then
			Data := (others => '0');
			Output <= std_ulogic_vector(Data);
		elsif(rising_edge(CLK)) then
			if(INC = '1') then
				Data := Data + 2;
				Output <= std_ulogic_vector(Data);
			elsif(LD = '1') then
				Data := unsigned(Input);
				Output <= std_ulogic_vector(Data);
			end if;	  
		end if;
	end process;
end architecture Design_Register_4_Bit;