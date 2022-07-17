library ieee;
use ieee.std_logic_1164.all;

entity Memory_16x16 is
	port(M_Read, M_Write: in std_ulogic; Address: in integer range 0 to 15; DataIn: in std_ulogic_vector(15 downto 0); DataOut: out std_ulogic_vector(15 downto 0));
end entity Memory_16x16;

architecture Designe_Memory_16x16 of Memory_16x16 is 
	component Memory_16x16 is
		port(M_Read, M_Write: in std_ulogic; Address: in integer range 0 to 15; DataIn: in std_ulogic_vector(15 downto 0); DataOut: out std_ulogic_vector(15 downto 0));
	end component Memory_16x16;
begin
	process(M_Read, M_Write, Address)
		type Ram_Array is array(0 to 15) of std_ulogic_vector(15 downto 0);
		variable Ram: Ram_Array := 
		(
			"0000000010000000", "0100000100001101", "0100000110001110", "0101000010001111",
			"0001000110110000", "1001000000000111", "1011000000000011", "0001000100100000",
			"1001000000001010", "1011000000000010", "0000000000000000", "0000000000000000",
			"0000000000000000", "1111111111111100", "1111111111111110", "0000000000000010"
		);
	begin
		if(M_Read = '1') then
			DataOut <= Ram(Address);
		elsif(M_Write = '1') then
			Ram(Address) := DataIn;
		end if;
	end process;
end architecture Designe_Memory_16x16;