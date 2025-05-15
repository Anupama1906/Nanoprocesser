----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 11:51:19 AM
-- Design Name: 
-- Module Name: Program_ROM_Sim - Behavioral
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

entity Program_ROM_Sim is
--  Port ( );
end Program_ROM_Sim;

architecture Behavioral of Program_ROM_Sim is

component Program_ROM
  Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
         Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal address : STD_LOGIC_VECTOR (2 downto 0);
signal instruction : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT : Program_ROM
    Port map ( Address => address,
               Instruction => instruction);
process
begin
    address <= "000";
    wait for 80ns;
    
    address <= "001";
    wait for 80ns;
    
    address <= "010";
    wait for 80ns;
    
    address <= "011";
    wait for 80ns;
    
    address <= "100";
    wait for 80ns;
            
    address <= "101";
    wait for 80ns;
                
    address <= "110";
    wait for 80ns;
    
    address <= "111";
    wait for 80ns;

end process;

end Behavioral;
