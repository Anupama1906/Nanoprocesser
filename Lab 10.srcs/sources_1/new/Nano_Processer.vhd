----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2025 10:00:14 PM
-- Design Name: 
-- Module Name: Nano_Processer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.BusTypes.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nano_Processer is
    Port ( Clk : in STD_LOGIC;
           Switch : in STD_LOGIC_VECTOR(7 downto 0);
           Res : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR(3 downto 0);
           Reg_LED : out STD_LOGIC_VECTOR(3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Nano_Processer;

architecture Behavioral of Nano_Processer is

component Register_Bank
Port ( Clk : in STD_LOGIC;
       Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
       Val : in STD_LOGIC_VECTOR (3 downto 0);
       Data_Bus : out bus_array_type);
end component;

component Mux_8_way_4_bit
    Port ( In_Val : in bus_array_type;
           Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Val : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Instruction_Decoder
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Neg_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_ROM
  Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
         Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Add_Sub_Unit_4_bit
     Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Add_Neg_Sel : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Carry : out STD_LOGIC;
            Zero : out STD_LOGIC);
end component;

component Program_Counter
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Jump_Flag : in STD_LOGIC;
           Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Slow_Clock ,Jump_Flag, Load_Sel, Add_Neg_Sel : STD_LOGIC;
signal Memory_Sel, Jump_Address, Reg_EN, Reg_A, Reg_B : STD_LOGIC_VECTOR(2 downto 0);
signal Val, Add_0, Add_1, Imm_Val, Sum : STD_LOGIC_VECTOR(3 downto 0);
signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
signal Data_Bus : bus_array_type;

begin

Slow_Clk_0 : Slow_Clk
    Port map( Clk_in => Clk,
              Clk_out => Slow_Clock);

Register_Bank_0 : Register_Bank
    Port map( Clk => Slow_Clock,
              Reg_EN => Reg_EN,
              Val => Val,
              Data_Bus => Data_Bus);
          
Program_Counter_0 : Program_Counter
    Port map( Clk => Slow_Clock,
              Res => Res,
              Jump_Flag => Jump_Flag,
              Jump_Address => Jump_Address,
              Memory_Sel => Memory_Sel);
              
Program_ROM_0 : Program_ROM
    Port map( Address => Memory_Sel,
              Instruction => Instruction);

Mux_8_way_4_bit_0 : Mux_8_way_4_bit
    Port map( In_Val => Data_Bus,
              Reg_Sel => Reg_A,
              Out_Val => Add_0);
              
              
Mux_8_way_4_bit_1 : Mux_8_way_4_bit
    Port map( In_Val => Data_Bus,
              Reg_Sel => Reg_B,
              Out_Val => Add_1);

Instruction_Decoder_0 : Instruction_Decoder
    Port map( Instruction => Instruction,
              Jump_Check => Add_0,
              Reg_EN => Reg_EN,
              Load_Sel => Load_Sel,
              Imm_Val => Imm_Val,
              Reg_A => Reg_A,
              Reg_B => Reg_B,
              Add_Neg_Sel => Add_Neg_Sel,
              Jump_Flag => Jump_Flag,
              Jump_Address => Jump_Address);
              
Val <= Imm_Val when Load_Sel = '1' else
       Sum when Load_Sel = '0';

Add_Sub_Unit_4_bit_0 : Add_Sub_Unit_4_bit
     Port map( A => Add_0,
               B => Add_1,
               Add_Neg_Sel => Add_Neg_Sel,
               S => Sum,
               Carry => Carry,
               Zero => Zero);

S_LED <= Sum;
Reg_LED <= Data_Bus(0) when Switch(0) = '1' else
           Data_Bus(1) when Switch(1) = '1' else
           Data_Bus(2) when Switch(2) = '1' else
           Data_Bus(3) when Switch(3) = '1' else
           Data_Bus(4) when Switch(4) = '1' else
           Data_Bus(5) when Switch(5) = '1' else
           Data_Bus(6) when Switch(6) = '1' else
           Data_Bus(7) when Switch(7) = '1' else
           (others => '0'); 

end Behavioral;
