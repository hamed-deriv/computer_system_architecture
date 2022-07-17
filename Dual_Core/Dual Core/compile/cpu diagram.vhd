---------------------------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Dual Core
-- Author      : Microsoft
-- Company     : Microsoft
--
---------------------------------------------------------------------------------------------------
--
-- File        : d:\Programming\Superior Expert\Computer System Architectre\Computer System Architecture - Rezaee\Dual_Core\Dual Core\compile\cpu diagram.vhd
-- Generated   : Sat Aug  6 11:37:09 2011
-- From        : d:\Programming\Superior Expert\Computer System Architectre\Computer System Architecture - Rezaee\Dual_Core\Dual Core\src\cpu diagram.bde
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
       Address0 : in INTEGER range 0 to 15;
       Address1 : in INTEGER range 0 to 15;
       DataIn0 : in std_ulogic_vector(15 downto 0);
       DataIn1 : in std_ulogic_vector(15 downto 0);
       M_Read0 : in std_ulogic;
       M_Read1 : in std_ulogic;
       M_Write0 : in std_ulogic;
       M_Write1 : in std_ulogic;
       DataOut0 : out std_ulogic_vector(15 downto 0);
       DataOut1 : out std_ulogic_vector(15 downto 0)
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
component PC_4_Bit
  port (
       CLK : in std_ulogic;
       CLR : in std_ulogic;
       INC : in std_ulogic;
       Input : in std_ulogic_vector(3 downto 0);
       LD : in std_ulogic;
       Output : out std_ulogic_vector(3 downto 0)
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
signal NET21065 : std_ulogic;
signal NET21071 : INTEGER;
signal NET21103 : std_ulogic;
signal NET21111 : std_ulogic;
signal NET21115 : std_ulogic;
signal NET21119 : std_ulogic;
signal NET21133 : std_ulogic;
signal NET21139 : std_ulogic;
signal NET21147 : std_ulogic;
signal NET21155 : std_ulogic;
signal NET21691 : std_ulogic;
signal NET23333 : std_ulogic;
signal NET24711 : std_ulogic;
signal NET24747 : std_ulogic;
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
signal BUS21077 : std_ulogic_vector (3 downto 0);
signal BUS21081 : std_ulogic_vector (3 downto 0);
signal BUS21090 : std_ulogic_vector (3 downto 0);
signal BUS21097 : std_ulogic_vector (3 downto 0);
signal BUS21163 : std_ulogic_vector (15 downto 0);
signal BUS21165 : std_ulogic_vector (15 downto 0);
signal BUS21175 : std_ulogic_vector (15 downto 0);
signal BUS21181 : std_ulogic_vector (15 downto 0);
signal BUS21188 : std_ulogic_vector (2 downto 0);
signal BUS21192 : std_ulogic_vector (3 downto 0);
signal BUS21202 : std_ulogic_vector (3 downto 0);
signal BUS21214 : std_ulogic_vector (3 downto 0);
signal BUS21220 : std_ulogic_vector (3 downto 0);
signal BUS21226 : std_ulogic_vector (3 downto 0);
signal BUS21234 : std_ulogic_vector (1 downto 0);
signal BUS21244 : std_ulogic_vector (3 downto 0);
signal BUS21250 : std_ulogic_vector (3 downto 0);
signal BUS21256 : std_ulogic_vector (3 downto 0);
signal BUS21262 : std_ulogic_vector (15 downto 0);
signal BUS21268 : std_ulogic_vector (15 downto 0);
signal BUS21274 : std_ulogic_vector (15 downto 0);
signal BUS21280 : std_ulogic_vector (15 downto 0);
signal BUS21287 : std_ulogic_vector (15 downto 0);
signal BUS21293 : std_ulogic_vector (15 downto 0);
signal BUS21313 : std_ulogic_vector (2 downto 0);
signal BUS21321 : std_ulogic_vector (15 downto 0);
signal BUS21369 : std_ulogic_vector (7 downto 0);
signal BUS21400 : std_ulogic_vector (15 downto 0);
signal BUS21422 : std_ulogic_vector (7 downto 0);
signal BUS21447 : std_ulogic_vector (2 downto 0);
signal BUS21585 : std_ulogic_vector (7 downto 0);
signal BUS2168 : std_ulogic_vector (15 downto 0);
signal BUS2209 : std_ulogic_vector (15 downto 0);
signal BUS23544 : std_ulogic_vector (15 downto 0);
signal BUS2415 : std_ulogic_vector (2 downto 0);
signal BUS2490 : std_ulogic_vector (15 downto 0);
signal BUS2830 : std_ulogic_vector (7 downto 0);
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

AC_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(1),
       Output => BUS1029
  );

AC_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(1),
       Output => BUS21181
  );

ALU_Unit_0 : ALU
  port map(
       C => NET744,
       D => BUS2490,
       E => NET784,
       Input0 => BUS1029,
       Input1 => BUS1017,
       N => NET887,
       Output => BUS23544,
       T => BUS3782,
       Z => NET20165
  );

ALU_Unit_1 : ALU
  port map(
       C => NET21139,
       D => BUS21321,
       E => NET21147,
       Input0 => BUS21181,
       Input1 => BUS21175,
       N => NET21155,
       Output => BUS21400,
       T => BUS21422,
       Z => NET21691
  );

AR_0 : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS1742,
       LD => NET648,
       Output => BUS1491
  );

AR_1 : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS21244,
       LD => NET21119,
       Output => BUS21202
  );

Address_Convertor_0 : Convertor
  port map(
       Input => BUS1491,
       Output => NET327
  );

Address_Convertor_1 : Convertor
  port map(
       Input => BUS21202,
       Output => NET21071
  );

Addressing_MUX_0 : MUX_4x1
  port map(
       Input0 => BUS1491,
       Input1 => BUS467,
       Input2 => BUS544,
       Input3 => BUS373,
       Output => BUS1776,
       S => BUS1738,
       T => BUS9486
  );

Addressing_MUX_1 : MUX_4x1
  port map(
       Input0 => BUS21202,
       Input1 => BUS21090,
       Input2 => BUS21097,
       Input3 => BUS21077,
       Output => BUS21250,
       S => BUS21234,
       T => BUS21447
  );

CR_0 : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS451,
       LD => NET703,
       Output => BUS1494
  );

CR_1 : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Dangling_Input_Signal_STD_ULOGIC,
       INC => Dangling_Input_Signal_STD_ULOGIC,
       Input => BUS21081,
       LD => NET21133,
       Output => BUS21214
  );

Destination_Decoder_0 : Decoder_3x8
  port map(
       Input => BUS1087,
       Output => BUS9076
  );

Destination_Decoder_1 : Decoder_3x8
  port map(
       Input => BUS21188,
       Output => BUS21585
  );

Destination_Synchron_0 : destination_sync
  port map(
       Destination_In => BUS9076,
       Destination_Out => BUS2830,
       T => BUS9486
  );

Destination_Synchron_1 : destination_sync
  port map(
       Destination_In => BUS21585,
       Destination_Out => BUS21369,
       T => BUS21447
  );

Flow_Control_Unit_0 : Flow_Control
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

Flow_Control_Unit_1 : Flow_Control
  port map(
       C => NET21139,
       D => BUS21321,
       E => NET21147,
       Inc_PC => NET24747,
       Load_AR => NET21119,
       Load_CR => NET21133,
       Load_PC => NET24711,
       MUX_0 => NET21115,
       MUX_1 => NET21111,
       MUX_2 => NET21103,
       N => NET21155,
       Read_M => NET23333,
       Source => BUS21313,
       T => BUS21422,
       Z => NET21691
  );

IR_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS1014,
       LD => BUS3782(1),
       Output => BUS1000
  );

IR_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21165,
       LD => BUS21422(1),
       Output => BUS21163
  );

IR_Parser_Unit_0 : IR_Parser
  port map(
       Address => BUS1637,
       Addressing_Mode => BUS1738,
       Destination => BUS1087,
       Input => BUS1000,
       Operator => BUS1152,
       Source => BUS2415
  );

IR_Parser_Unit_1 : IR_Parser
  port map(
       Address => BUS21226,
       Addressing_Mode => BUS21234,
       Destination => BUS21188,
       Input => BUS21163,
       Operator => BUS21192,
       Source => BUS21313
  );

MUX0_0 : MUX_2x1
  port map(
       Input0 => BUS1494,
       Input1 => BUS1491,
       Output => BUS1517,
       S => NET635
  );

MUX0_1 : MUX_2x1
  port map(
       Input0 => BUS21214,
       Input1 => BUS21202,
       Output => BUS21220,
       S => NET21115
  );

MUX1_0 : MUX_2x1
  port map(
       Input0 => BUS451,
       Input1 => BUS1637,
       Output => BUS1788,
       S => NET622
  );

MUX1_1 : MUX_2x1
  port map(
       Input0 => BUS21081,
       Input1 => BUS21226,
       Output => BUS21256,
       S => NET21111
  );

MUX2_0 : MUX_2x1
  port map(
       Input0 => BUS1788,
       Input1 => BUS1776,
       Output => BUS1742,
       S => NET601
  );

MUX2_1 : MUX_2x1
  port map(
       Input0 => BUS21256,
       Input1 => BUS21250,
       Output => BUS21244,
       S => NET21103
  );

Memory_Adapter_0 : Address_Adapter
  port map(
       Input => BUS1014,
       Output => BUS467
  );

Memory_Adapter_1 : Address_Adapter
  port map(
       Input => BUS21165,
       Output => BUS21090
  );

Operator_Decoder_0 : Decoder_4x16
  port map(
       Input => BUS1152,
       Output => BUS2490
  );

Operator_Decoder_1 : Decoder_4x16
  port map(
       Input => BUS21192,
       Output => BUS21321
  );

PC_0 : Register_4_Bit
  port map(
       CLK => Clock,
       CLR => Reset,
       INC => NET656,
       Input => BUS1517,
       LD => NET688,
       Output => BUS451
  );

PC_1 : PC_4_Bit
  port map(
       CLK => Clock,
       CLR => Reset,
       INC => NET24747,
       Input => BUS21220,
       LD => NET24711,
       Output => BUS21081
  );

R0_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(2),
       Output => BUS2064
  );

R0_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(1),
       Output => BUS21280
  );

R1_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(3),
       Output => BUS1866
  );

R1_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(3),
       Output => BUS21262
  );

R2_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(4),
       Output => BUS1964
  );

R2_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(4),
       Output => BUS21268
  );

R3_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(5),
       Output => BUS2041
  );

R3_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(5),
       Output => BUS21274
  );

R4_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(6),
       Output => BUS2168
  );

R4_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(6),
       Output => BUS21287
  );

R5_0 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS23544,
       LD => BUS2830(7),
       Output => BUS2209
  );

R5_1 : Register_16_Bit
  port map(
       CLK => Clock,
       Input => BUS21400,
       LD => BUS21369(7),
       Output => BUS21293
  );

Regisster_Adapter_1 : Address_Adapter
  port map(
       Input => BUS21280,
       Output => BUS21077
  );

Register_Adapter_0 : Address_Adapter
  port map(
       Input => BUS2064,
       Output => BUS373
  );

Relative_Address_Unit_0 : Address_Adder
  port map(
       Memory => BUS467,
       PC => BUS451,
       Relative_Address => BUS544
  );

Relative_Address_Unit_1 : Address_Adder
  port map(
       Memory => BUS21090,
       PC => BUS21081,
       Relative_Address => BUS21097
  );

SC_0 : Sequence_Counter
  port map(
       CLK => Clock,
       CLR => NET304,
       Output => BUS9486
  );

SC_1 : Sequence_Counter
  port map(
       CLK => Clock,
       CLR => NET21065,
       Output => BUS21447
  );

SC_Clean_0 : SC_Cleaner
  port map(
       Clear => NET304,
       D => BUS2490,
       Set_CPU => Reset,
       T => BUS3782
  );

SC_Clean_1 : SC_Cleaner
  port map(
       Clear => NET21065,
       D => BUS21321,
       Set_CPU => Reset,
       T => BUS21422
  );

SC_Decoder_0 : Decoder_3x8
  port map(
       Input => BUS9486,
       Output => BUS3782
  );

SC_Decoder_1 : Decoder_3x8
  port map(
       Input => BUS21447,
       Output => BUS21422
  );

Source_MUX_0 : MUX_8x1
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

Source_MUX_1 : MUX_8x1
  port map(
       Input0 => BUS21165,
       Input1 => BUS21181,
       Input2 => BUS21280,
       Input3 => BUS21262,
       Input4 => BUS21268,
       Input5 => BUS21274,
       Input6 => BUS21287,
       Input7 => BUS21293,
       Output => BUS21175,
       S => BUS21313
  );

Synchron_Memory_Unit : Memory_16x16
  port map(
       Address0 => NET327,
       Address1 => NET21071,
       DataIn0 => BUS23544,
       DataIn1 => BUS21400,
       DataOut0 => BUS1014,
       DataOut1 => BUS21165,
       M_Read0 => NET609,
       M_Read1 => NET23333,
       M_Write0 => BUS2830(0),
       M_Write1 => BUS21369(0)
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end \CPU Diagram\;
