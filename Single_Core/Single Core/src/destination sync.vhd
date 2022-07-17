library ieee;
use ieee.std_logic_1164.all;

entity Destination_Sync is
	 port(T: in std_ulogic_vector(2 downto 0); Destination_In: in std_ulogic_vector(7 downto 0); Destination_Out: out std_ulogic_vector(7 downto 0));
end entity Destination_Sync;


architecture Designe_Destination_Sync of Destination_Sync is
	component Destination_Sync is
		port(T: in std_ulogic_vector(2 downto 0); Destination_In: in std_ulogic_vector(7 downto 0); Destination_Out: out std_ulogic_vector(7 downto 0));
	end component Destination_Sync;
begin
	process(T)
	begin
		if(T = "100") then
			Destination_Out <= Destination_In;
		else
			Destination_Out <= (others => '0'); 
		end if;	 
	end process;
end architecture Designe_Destination_Sync;
