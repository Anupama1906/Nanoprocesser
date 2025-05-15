----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 08:42:36 PM
-- Design Name: 
-- Module Name: Add_Sub_Unit_4_bit_Sim - Behavioral
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

entity Add_Sub_Unit_4_bit_Sim is
--  Port ( );
end Add_Sub_Unit_4_bit_Sim;

architecture Behavioral of Add_Sub_Unit_4_bit_Sim is
component Add_Sub_Unit_4_bit
     Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Add_Neg_Sel : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            Carry : out STD_LOGIC;
            Zero : out STD_LOGIC);
end component;

signal add_neg_sel, carry, zero : STD_LOGIC:= '0';
signal a, b, s : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
UUT : Add_Sub_Unit_4_bit
     Port Map ( A => a,
                B => b,
                Add_Neg_Sel => add_neg_sel,
                S => s,
                Carry => carry,
                Zero => zero);
                
process
begin
    a <= "1100";
    b <= "0101";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "0110";
    b <= "0011";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "0100";
    b <= "1001";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "0000";
    b <= "0101";
    add_neg_sel <= '1';
    wait for 100 ns;
                
    a <= "1011";
    b <= "0110";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "0000";
    b <= "0100";
    add_neg_sel <= '1';
    wait for 100 ns;
        
    a <= "1100";
    b <= "0111";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "0001";
    b <= "0111";
    add_neg_sel <= '0';
    wait for 100 ns;
    
    a <= "1101";
    b <= "1111";
    add_neg_sel <= '0';
    wait for 100 ns;
    
                
end process;

end Behavioral;
