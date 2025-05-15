----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 11:28:22 AM
-- Design Name: 
-- Module Name: Program_Counter_Sim - Behavioral
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

entity Program_Counter_Sim is
--  Port ( );
end Program_Counter_Sim;

architecture Behavioral of Program_Counter_Sim is

component Program_Counter
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Jump_Flag : in STD_LOGIC;
           Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal jump_address, memory_sel : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal res, clk, jump_flag : STD_LOGIC := '0';

begin

UUT : Program_Counter
    Port map ( Clk => clk,
               Res => res,
               Jump_Flag => jump_flag,
               Jump_Address => jump_address,
               Memory_Sel => memory_sel);

process
begin
   Clk <= NOT(Clk);
   wait for 2ns;
end process;

process
begin

    jump_flag <= '0';
    res <= '1';
    wait for 80ns;
    
    res <= '0';
    wait for 160ns;
    
    jump_address <= "001";
    jump_flag <= '1';
    wait for 160ns;
    jump_flag <= '0';
    
    res <= '1';
    wait for 80ns;
    
    res <= '0';
    wait;

end process;
end Behavioral;
