library ieee;
use ieee.std_logic_1164.all;

entity IR_Parser is
	 port(Input: in std_ulogic_vector(15 downto 0); Operator, Address: out std_ulogic_vector(3 downto 0); Destination, Source: out std_ulogic_vector(2 downto 0); Addressing_Mode: out std_ulogic_vector(1 downto 0));
end entity IR_Parser;


architecture IR_Parser of IR_Parser is
	component IR_Parser is
   		port(Input: in std_ulogic_vector(15 downto 0); Operator, Address: out std_ulogic_vector(3 downto 0); Destination, Source: out std_ulogic_vector(2 downto 0); Addressing_Mode: out std_ulogic_vector(1 downto 0));
	end component IR_Parser;
begin
	Operator <= Input(15 downto 12);
	Addressing_Mode <= Input(11 downto 10);
	Destination <= Input(9 downto 7);
	Source <= Input(6 downto 4);
	Address <= Input(3 downto 0);
end architecture IR_Parser;
