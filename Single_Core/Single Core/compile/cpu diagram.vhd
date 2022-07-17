---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Single Core
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : d:\Programming\Superior Expert\Computer System Architectre\Computer System Architecture - Rezaee\Single_Core\Single Core\compile\cpu diagram.vhd
-- Generated   : Sun Aug  7 11:04:05 2011
-- From        : d:\Programming\Superior Expert\Computer System Architectre\Computer System Architecture - Rezaee\Single_Core\Single Core\src\cpu diagram.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity \CPU Diagram\ is
  port(
       Clock : in std_ulogic;
       Reset : in std_ulogic
  );
end \CPU Diagram\;

architecture \CPU Diagram\ of \CPU Diagram\ is

---- Component declarations -----

component Address_Adapter
  port (
       Input : in std_ulogic_vector(15 downto 0);
       Output : inout std_ulogic_vector(3 downto 0)
  );
end component;
component Address_Adder
  port (
       Memory : in std_ulogic_vector(3 downto 0);
       PC : in std_ulogic_vector(3 downto 0);
       Relative_Address : out std_ulogic_vector(3 downto 0)
  );
end component;
component ALU
  port (
       D : in std_ulogic_vector(15 downto 0);
       Input0 : in std_ulogic_vector(15 downto 0);
       Input1 : in std_ulogic_vector(15 downto 0);
       T : in std_ulogic_vector(7 downto 0);
       C : out std_ulogic;
       E : out std_ulogic;
       N : out std_ulogic;
       Output : out std_ulogic_vector(15 downto 0);
       Z : out std_ulogic
  );
end component;
component Convertor
  port (
       Input : in std_ulogic_vector(3 downto 0);
       Output : out INTEGER range 0 to 15
  );
end component;
component Decoder_3x8
  port (
       Input : in std_ulogic_vector(2 downto 0);
       Output : out std_ulogic_vector(7 downto 0)
  );
end component;
component Decoder_4x16
  port (
       Input : in std_ulogic_vector(3 downto 0);
       Output : out std_ulogic_vector(15 downto 0)
  );
end component;
component destination_sync
  port (
       Destination_In : in std_ulogic_vector(7 downto 0);
       T : in std_ulogic_vector(2 downto 0);
       Destination_Out : out std_ulogic_vector(7 downto 0)
  );
end component;
component Flow_Control
  port (
       C : in std_ulogic;
       D : in std_ulogic_vector(15 downto 0);
       E : in std_ulogic;
       N : in std_ulogic;
       Source : in std_ulogic_vector(2 downto 0);
       T : in std_ulogic_vector(7 downto 0);
       Z : in std_ulogic;
       Inc_PC : out std_ulogic;
       Load_AR : out std_ulogic;
       Load_CR : out std_ulogic;
       Load_PC : out std_ulogic;
       MUX_0 : out std_ulogic;
       MUX_1 : out std_ulogic;
       MUX_2 : out std_ulogic;
       Read_M : out std_ulogic
  );
end component;
component IR_Parser
  port (
       Input : in std_ulogic_vector(15 downto 0);
       Address : out std_ulogic_vector(3 downto 0);
       Addressing_Mode : out std_ulogic_vector(1 downto 0);
       Destination : out std_ulogic_vector(2 downto 0);
       Operator : out std_ulogic_vector(3 downto 0);
       Source : out std_ulogic_vector(2 downto 0)
  );
end component;
component Memory_16x16
  port (
       Address : in INTEGER range 0 to 15;
       DataIn : in std_ulogic_vector(15 downto 0);
       M_Read : in std_ulogic;
       M_Write : in std_ulogic;
       DataOut : out std_ulogic_vector(15 downto 0)
  );
end component;
component MUX_2x1
  port (
       Input0 : in std_ulogic_vector(3 downto 0);
       Input1 : in std_ulogic_vector(3 downto 0);
       S : in std_ulogic;
       Output : out std_ulogic_vector(3 downto 0)
  );
end component;
component MUX_4x1
  port (
       Input0 : in std_ulogic_vector(3 downto 0);
       Input1 : in std_ulogic_vector(3 downto 0);
       Input2 : in std_ulogic_vector(3 downto 0);
       Input3 : in std_ulogic_vector(3 downto 0);
       S : in std_ulogic_vector(1 downto 0);
       T : in std_ulogic_vector(2 downto 0);
       Output : out std_ulogic_vector(3 downto 0)
  );
end component;
component MUX_8x1
  port (
       Input0 : in std_ulogic_vector(15 downto 0);
       Input1 : in std_ulogic_vector(15 downto 0);
       Input2 : in std_ulogic_vector(15 downto 0);
       Input3 : in std_ulogic_vector(15 downto 0);
       Input4 : in std_ulogic_vector(15 downto 0);
       Input5 : in std_ulogic_vector(15 downto 0);
       Input6 : in std_ulogic_vector(15 downto 0);
       Input7 : in std_ulogic_vector(15 downto 0);
       S : in std_ulogic_vector(2 downto 0);
       Output : out std_ulogic_vector(15 downto 0)
  );
end component;
component Register_16_Bit
  port (
       CLK : in std_ulogic;
       Input : in std_ulogic_vector(15 downto 0);
       LD : in std_ulogic;
       Output : out std_ulogic_vector(15 downto 0)
  );
end component;
component Register_4_Bit
  port (
       CLK : in std_ulogic;
       CLR : in std_ulogic;
       INC : in std_ulogic;
       Input : in std_ulogic_vector(3 downto 0);
       LD : in std_ulogic;
       Output : out std_ulogic_vector(3 downto 0)
  );
end component;
component SC_Cleaner
  port (
       D : in std_ulogic_vector(15 downto 0);
       Set_CPU : in std_ulogic;
       T : in std_ulogic_vector(7 downto 0);
       Clear : out std_ulogic
  );
end component;
component Sequence_Counter
  port (
       CLK : in std_ulogic;
       CLR : in std_ulogic;
       Output : out std_ulogic_vector(2 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET20165 : std_ulogic;
signal NET304 : std_ulogic;
signal NET327 : INTEGER;
signal NET601 : std_ulogic;
signal NET609 : std_ulogic;
signal NET622 : std_ulogic;
signal NET635 : std_ulogic;
signal NET648 : std_ulogic;
signal NET656 : std_ulogic;
signal NET688 : std_ulogic;
signal NET703 : std_ulogic;
signal NET744 : std_ulogic;
signal NET784 : std_ulogic;
signal NET887 : std_ulogic;
signal BUS1000 : std_ulogic_vector (15 downto 0);
signal BUS1014 : std_ulogic_vector (15 downto 0);
signal BUS1017 : std_ulogic_vector (15 downto 0);
signal BUS1029 : std_ulogic_vector (15 downto 0);
signal BUS1087 : std_ulogic_vector (2 downto 0);
signal BUS1152 : std_ulogic_vector (3 downto 0);
signal BUS1491 : std_ulogic_vector (3 downto 0);
signal BUS1494 : std_ulogic_vector (3 downto 0);
signal BUS1517 : std_ulogic_vector (3 downto 0);
signal BUS1637 : std_ulogic_vector (3 downto 0);
signal BUS1738 : std_ulogic_vector (1 downto 0);
signal BUS1742 : std_ulogic_vector (3 downto 0);
signal BUS1776 : std_ulogic_vector (3 downto 0);
signal BUS1788 : std_ulogic_vector (3 downto 0);
signal BUS1866 : std_ulogic_vector (15 downto 0);
signal BUS1964 : std_ulogic_vector (15 downto 0);
signal BUS2041 : std_ulogic_vector (15 downto 0);
signal BUS2064 : std_ulogic_vector (15 downto 0);
signal BUS2168 : std_ulogic_vector (15 downto 0);
signal BUS2209 : std_ulogic_vector (15 downto 0);
signal BUS2415 : std_ulogic_vector (2 downto 0);
signal BUS2490 : std_ulogic_vector (15 downto 0);
signal BUS2830 : std_ulogic_vector (7 downto 0);
signal BUS3584 : std_ulogic_vector (15 downto 0);
signal BUS373 : std_ulogic_vector (3 downto 0);
signal BUS3782 : std_ulogic_vector (7 downto 0);
signal BUS451 : std_ulogic_vector (3 downto 0);
signal BUS467 : std_ulogic_vector (3 downto 0);
signal BUS544 : std_ulogic_vector (3 downto 0);
signal BUS9076 : std_ulogic_vector (7 downto 0);
signal BUS9486 : std_ulogic_vector (2 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;
signal Dangling_Input_Signal_STD_ULOGIC : std_ulogic;

begin

----  Component instantiations  ----

AC : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(1),
       Output => BUS1029
  );

ALU_Unit : ALU
  port map(
       C => NET744,
       D => BUS2490,
       E => NET784,
       Input0 => BUS1029,
       Input1 => BUS1017,
       N => NET887,
       Output => BUS3584,
       T => BUS3782,
       Z => NET20165
  );

AR : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS1742,
       LD => NET648,
       Output => BUS1491
  );

Address_Convertor : Convertor
  port map(
       Input => BUS1491,
       Output => NET327
  );

Addressing_MUX : MUX_4x1
  port map(
       Input0 => BUS1491,
       Input1 => BUS467,
       Input2 => BUS544,
       Input3 => BUS373,
       Output => BUS1776,
       S => BUS1738,
       T => BUS9486
  );

CR : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS451,
       LD => NET703,
       Output => BUS1494
  );

Destination_Decoder : Decoder_3x8
  port map(
       Input => BUS1087,
       Output => BUS9076
  );

Destination_Synchron : destination_sync
  port map(
       Destination_In => BUS9076,
       Destination_Out => BUS2830,
       T => BUS9486
  );

Flow_Control_Unit : Flow_Control
  port map(
       C => NET744,
       D => BUS2490,
       E => NET784,
       Inc_PC => NET656,
       Load_AR => NET648,
       Load_CR => NET703,
       Load_PC => NET688,
       MUX_0 => NET635,
       MUX_1 => NET622,
       MUX_2 => NET601,
       N => NET887,
       Read_M => NET609,
       Source => BUS2415,
       T => BUS3782,
       Z => NET20165
  );

IR : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS1014,
       LD => BUS3782(1),
       Output => BUS1000
  );

IR_Parser_Unit : IR_Parser
  port map(
       Address => BUS1637,
       Addressing_Mode => BUS1738,
       Destination => BUS1087,
       Input => BUS1000,
       Operator => BUS1152,
       Source => BUS2415
  );

MUX0 : MUX_2x1
  port map(
       Input0 => BUS1494,
       Input1 => BUS1491,
       Output => BUS1517,
       S => NET635
  );

MUX1 : MUX_2x1
  port map(
       Input0 => BUS451,
       Input1 => BUS1637,
       Output => BUS1788,
       S => NET622
  );

MUX2 : MUX_2x1
  port map(
       Input0 => BUS1788,
       Input1 => BUS1776,
       Output => BUS1742,
       S => NET601
  );

Memory_Adapter : Address_Adapter
  port map(
       Input => BUS1014,
       Output => BUS467
  );

Memory_Unit_16x16 : Memory_16x16
  port map(
       Address => NET327,
       DataIn => BUS3584,
       DataOut => BUS1014,
       M_Read => NET609,
       M_Write => BUS2830(0)
  );

Operator_Decoder : Decoder_4x16
  port map(
       Input => BUS1152,
       Output => BUS2490
  );

PC : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Reset,
       INC => NET656,
       Input => BUS1517,
       LD => NET688,
       Output => BUS451
  );

R0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(2),
       Output => BUS2064
  );

R1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(3),
       Output => BUS1866
  );

R2 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(4),
       Output => BUS1964
  );

R3 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(5),
       Output => BUS2041
  );

R4 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(6),
       Output => BUS2168
  );

R5 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS3584,
       LD => BUS2830(7),
       Output => BUS2209
  );

Register_Adapter : Address_Adapter
  port map(
       Input => BUS2064,
       Output => BUS373
  );

Relative_Address : Address_Adder
  port map(
       Memory => BUS467,
       PC => BUS451,
       Relative_Address => BUS544
  );

SC : Sequence_Counter
  port map(
       CLK => Clock,
       CLR => NET304,
       Output => BUS9486
  );

SC_Clean : SC_Cleaner
  port map(
       Clear => NET304,
       D => BUS2490,
       Set_CPU => Reset,
       T => BUS3782
  );

SC_Decoder : Decoder_3x8
  port map(
       Input => BUS9486,
       Output => BUS3782
  );

Source_MUX : MUX_8x1
  port map(
       Input0 => BUS1014,
       Input1 => BUS1029,
       Input2 => BUS2064,
       Input3 => BUS1866,
       Input4 => BUS1964,
       Input5 => BUS2041,
       Input6 => BUS2168,
       Input7 => BUS2209,
       Output => BUS1017,
       S => BUS2415
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end \CPU Diagram\;
