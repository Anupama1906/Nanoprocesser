----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2025 06:48:07 PM
-- Design Name: 
-- Module Name: Add_Sub_Unit_4_bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add_Sub_Unit_4_bit is
     Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Add_Neg_Sel : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Carry : out STD_LOGIC;
            Zero : out STD_LOGIC);
end Add_Sub_Unit_4_bit;

architecture Behavioral of Add_Sub_Unit_4_bit is

component RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

signal Y, S_RCA, B_xor_M : STD_LOGIC_VECTOR (3 downto 0);

begin
    
    Y <= A when Add_Neg_Sel = '0' else
         "0001" when Add_Neg_Sel = '1'; 

    B_xor_M(0) <= B(0) xor Add_Neg_Sel;
    B_xor_M(1) <= B(1) xor Add_Neg_Sel;
    B_xor_M(2) <= B(2) xor Add_Neg_Sel;
    B_xor_M(3) <= B(3) xor Add_Neg_Sel;
    
    
    
    RCA_4_0 : RCA_4 
    port map( 
       A => Y,
       B => B_xor_M,
       C_in => Add_Neg_Sel,
       S => S_RCA,
       C_out => Carry ); 
       
       S <= S_RCA;
       Zero <= NOT( S_RCA(0) OR S_RCA(1) OR S_RCA(2) OR S_RCA(3) );

end Behavioral;

