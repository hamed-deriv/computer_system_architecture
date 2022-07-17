library ieee;
use ieee.std_logic_1164.all;

entity Decoder_4x16 is
	port(Input: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(15 downto 0));
end entity Decoder_4x16;

architecture Design_Decoder_4x16 of Decoder_4x16 is
	component Decoder_4x16 is
		port(Input: in std_ulogic_vector(3 downto 0); Output: out std_ulogic_vector(15 downto 0));
	end component Decoder_4x16;
begin
	process(Input) is
	begin
		case Input is
			when "0000" => Output <= "0000000000000001";
			when "0001" => Output <= "0000000000000010";
			when "0010" => Output <= "0000000000000100";
			when "0011" => Output <= "0000000000001000";
			when "0100" => Output <= "0000000000010000";
			when "0101" => Output <= "0000000000100000";
			when "0110" => Output <= "0000000001000000";
			when "0111" => Output <= "0000000010000000";
			when "1000" => Output <= "0000000100000000";
			when "1001" => Output <= "0000001000000000";
			when "1010" => Output <= "0000010000000000";
			when "1011" => Output <= "0000100000000000";
			when "1100" => Output <= "0001000000000000";
			when "1101" => Output <= "0010000000000000";
			when "1110" => Output <= "0100000000000000";
			when "1111" => Output <= "1000000000000000";
			when others => Output <= (others => 'Z');
		end case;
	end process;
end architecture Design_Decoder_4x16; 