library ieee;
use ieee.std_logic_1164.all;

entity Flow_Control is
	port(C,Z,N,E: in std_ulogic; Load_AR, Load_PC, Inc_PC, Load_CR, Read_M, MUX_0, MUX_1, MUX_2: out std_ulogic;
	     Source: in std_ulogic_vector(2 downto 0); D: in std_ulogic_vector(15 downto 0); T: in std_ulogic_vector(7 downto 0));
end entity Flow_Control;

architecture Designe_Flow_Control of Flow_Control is 
	component Flow_Control is
		port(C,Z,N,E: in std_ulogic; Load_AR, Load_PC, Inc_PC, Load_CR, Read_M, MUX_0, MUX_1, MUX_2: out std_ulogic;
	         Source: in std_ulogic_vector(2 downto 0); D: in std_ulogic_vector(15 downto 0); T: in std_ulogic_vector(7 downto 0));
	end component Flow_Control;
begin
	process(T, D, C, Z, N, E, Source)
	begin	  
		if(T(0) = '1' or T(2) = '1' or T(3) = '1')then
			Load_AR <= '1';
		else
			Load_AR <= '0';
		end if;
		if((T(4) = '1' and ((D(7) = '1' and C = '1') or (D(8) = '1' and N = '1') or (D(9) = '1' and Z = '1') or (D(10) = '1' and E = '1') or D(11) = '1' or D(12) = '1')))then
			Load_PC <= '1';
		else
			Load_PC <= '0';
		end if;
		if(T(1) = '1') then
			Inc_PC <= '1';
		else
			Inc_PC <= '0';
		end if;	
		if(T(4) = '1' and D(12) = '1')then
			Load_CR <= '1';
		else
			Load_CR <= '0';
		end if;
		if(T(1) = '1' or T(3) = '1' or (T(4) = '1' and Source = "000")) then
			Read_M <= '1';
		else
			Read_M <= '0';
		end if;
		if((T(4) = '1' and ((D(7) = '1' and C = '1') or (D(8) = '1' and N = '1') or (D(9) = '1' and Z = '1') or (D(10) = '1' and E = '1') or D(11) = '1' or D(12) = '1')))then
			MUX_0 <= '1';
		elsif(T(4) = '1' and D(13) = '1') then
			MUX_0 <= '0';
		end if;
		if(T(0) = '1') then
			MUX_1 <= '0';
		elsif(T(2) = '1') then
			MUX_1 <= '1';
		end if;
		if(T(0) = '1' or T(2) = '1') then
			MUX_2 <= '0';
		elsif(T(3) = '1') then
			MUX_2 <= '1';
		end if;
	end process;
end architecture Designe_Flow_Control;