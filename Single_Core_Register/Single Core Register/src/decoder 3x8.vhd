library ieee;
use ieee.std_logic_1164.all;

entity Decoder_3x8 is
	port(Input: in std_ulogic_vector(2 downto 0); Output: out std_ulogic_vector(7 downto 0));
end entity Decoder_3x8;

architecture Design_Decoder_3x8 of Decoder_3x8 is
	component Decoder_3x8 is
		port(Input: in std_ulogic_vector(1 downto 0); Output: out std_ulogic_vector(7 downto 0));
	end component Decoder_3x8;
begin
	process(Input) is
	begin
		case Input is
			when "000" => Output <= "00000001";
			when "001" => Output <= "00000010";
			when "010" => Output <= "00000100";
			when "011" => Output <= "00001000";
			when "100" => Output <= "00010000";
			when "101" => Output <= "00100000";
			when "110" => Output <= "01000000";
			when "111" => Output <= "10000000";
			when others => Output <= (others => 'Z');
		end case;
	end process;
end architecture Design_Decoder_3x8; 