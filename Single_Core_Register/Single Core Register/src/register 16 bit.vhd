library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_16_Bit is
	port(LD, Inc, CLK: in std_ulogic; Is_Zero: out std_ulogic; Input: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
end entity Register_16_Bit;																		   

architecture Design_Register_16_Bit of Register_16_Bit is
	component Register_16_Bit is
		port(LD, Inc, CLK: in std_ulogic; Is_Zero: out std_ulogic; Input: in std_ulogic_vector(15 downto 0); Output: out std_ulogic_vector(15 downto 0));
	end component Register_16_Bit;
begin		   
	process (CLK)
	variable Data: unsigned(15 downto 0);
	begin
		if(rising_edge(CLK)) then
			if(INC = '1') then
				Data := Data + 1;
				Output <= std_ulogic_vector(Data);
			elsif(LD = '1') then
				Data := unsigned(Input);
				Output <= std_ulogic_vector(Data);
			end if;	
			if(Data = 0) then
				Is_Zero <= '1';
			else
				Is_Zero <= '0';
			end if;
		end if;
	end process;
end architecture Design_Register_16_Bit;