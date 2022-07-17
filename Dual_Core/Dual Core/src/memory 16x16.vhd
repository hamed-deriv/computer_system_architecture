library ieee;
use ieee.std_logic_1164.all;

entity Memory_16x16 is
	port(M_Read0, M_Write0, M_Read1, M_Write1: in std_ulogic;Address0, Address1: in integer range 0 to 15; 
	     DataIn0, DataIn1: in std_ulogic_vector(15 downto 0); DataOut0, DataOut1: out std_ulogic_vector(15 downto 0));
end entity Memory_16x16;

architecture Designe_Memory_16x16 of Memory_16x16 is 
	component Memory_16x16 is
		port(M_Read0, M_Write0, M_Read1, M_Write1: in std_ulogic;Address0, Address1: in integer range 0 to 15; 
	    	 DataIn0, DataIn1: in std_ulogic_vector(15 downto 0); DataOut0, DataOut1: out std_ulogic_vector(15 downto 0));
	end component Memory_16x16;
begin
	process(M_Read0, M_Write0, Address0, M_Read1, M_Write1, Address1)
		type Ram_Array is array(0 to 15) of std_ulogic_vector(15 downto 0);
		variable Ram: Ram_Array := 
		(
			"0100000100001010", "0100000110001001", "0000000000000000", "0000000000000000",
			"0000000000000000", "0000000000000000", "0000000000000000", "0000000000000000",
			"0000000000000000", "0000000000001001", "0000000000001010", "0000000000000000",
			"0000000000000000", "0000000000000000", "0000000000000000", "0000000000000000"
		);
	begin
		if(M_Read0 = '1') then
			DataOut0 <= Ram(Address0);
		elsif(M_Write0 = '1') then
			Ram(Address0) := DataIn0;
		end if;
		if(M_Read1 = '1') then
			DataOut1 <= Ram(Address1);
		elsif(M_Write1 = '1') then
			Ram(Address1) := DataIn1;
		end if;
	end process;
end architecture Designe_Memory_16x16;