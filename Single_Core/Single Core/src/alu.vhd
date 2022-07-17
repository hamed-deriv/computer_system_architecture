library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port(Input0, Input1: in std_ulogic_vector(15 downto 0); D: in std_ulogic_vector(15 downto 0); 
	   	 T: in std_ulogic_vector(7 downto 0); N, E, C, Z: out std_ulogic; Output: out std_ulogic_vector(15 downto 0));
end entity ALU;

architecture Design_ALU of ALU is
	component ALU is
		port(Input0, Input1: in std_ulogic_vector(15 downto 0); D: in std_ulogic_vector(15 downto 0); 
	   	 	 T: in std_ulogic_vector(7 downto 0); N, E, C, Z: out std_ulogic; Output: out std_ulogic_vector(15 downto 0));
	end component ALU;
begin
	process(T, D, Input0, Input1)
		variable Carry: signed(16 downto 0); 
	begin
		if(D(0) = '1' and T(4) = '1') then
			Output <= (others => '0'); 
			N <= '0';
			Z <= '1';
		elsif(D(1) = '1' and T(4) = '1') then
			Carry := (Input1(15) & signed(Input1)) + 1;
			Output <= std_ulogic_vector(Carry(15 downto 0));
			C <= Carry(16);
			if(Carry < 0) then
				N <= '1';
			else
				N <= '0';
			end if;
			if(Carry = 0) then
				Z <= '1';
			else
				Z <= '0';
			end if;
		elsif(D(2) = '1' and T(4) = '1') then
			Output <= not(Input1);	
			if(not Input1(15) = '1') then
				N <= '1';
			else
				N <= '0';
			end if;	 
			if(Input1 = "0000000000000000") then
				Z <= '1';
			else
				Z <= '0';
			end if;
		elsif(D(3) = '1' and T(4) = '1') then
			C <= '0';	
		elsif(D(4) = '1' and T(4) = '1') then
			Output <= Input1;	
			if(Input1(15) = '1') then
				N <= '1';
			else
				N <= '0';
			end if;
			if(Input1 = "0000000000000000") then
				Z <= '1';
			else
				Z <= '0';
			end if;
		elsif(D(5) = '1' and T(4) = '1') then
			Carry := (Input1(15) & signed(Input1)) + (Input0(15) & signed(Input0));
			Output <= std_ulogic_vector(Carry(15 downto 0));
			C <= Carry(16);
			if(Input0 = Input1) then
				E <= '1';
			else
				E <= '0';
			end if;
			if(Carry < 0) then
				N <= '1';
			else
				N <= '0';
			end if;	
			if(Carry = 0) then
				Z <= '1';
			else
				Z <= '0';
			end if;
		elsif(D(6) = '1' and T(4) = '1') then
			Output <= (Input0 and Input1);
			if(Input0 = Input1) then
				E <= '1';
			else
				E <= '0';
			end if;
			if((Input0(15) and Input1(15)) = '1') then
				N <= '1';
			else
				N <= '0';
			end if;	
			if((Input0 and Input1) = "0000000000000000") then
				Z <= '1';
			else
				Z <= '0';
			end if;
		end if;
	end process;
end architecture Design_ALU;
		
		
		