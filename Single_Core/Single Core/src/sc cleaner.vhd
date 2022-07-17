library ieee;
use ieee.std_logic_1164.all;

entity SC_Cleaner is
	port(Set_CPU: in std_ulogic; Clear: out std_ulogic; D: in std_ulogic_vector(15 downto 0); T: in std_ulogic_vector(7 downto 0));
end entity SC_Cleaner;

architecture Design_SC_Cleaner of SC_Cleaner is
	component SC_Cleaner is
		port(Set_CPU: in std_ulogic; Clear: out std_ulogic; D: in std_ulogic_vector(15 downto 0); T: in std_ulogic_vector(7 downto 0));
	end component SC_Cleaner;
begin
	process(T, D, Set_CPU)
	begin 
		if(Set_CPU = '1') then
			Clear <= '1';
		elsif((T(5) = '1' and (D(0) = '1' or D(1) = '1' or D(2) = '1' or D(3) = '1' or D(5) = '1' or D(6) = '1' or D(7) = '1' or D(8) = '1' or D(9) = '1' or D(10) = '1' or D(11) = '1' or D(12) = '1' or D(13) = '1'))) then
			Clear <= '1';	
		else
			Clear <= '0';
		end if;	
	end process;
end architecture Design_SC_Cleaner; 
			
			
			