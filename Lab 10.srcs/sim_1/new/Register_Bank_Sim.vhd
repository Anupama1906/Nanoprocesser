----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 10:20:52 AM
-- Design Name: 
-- Module Name: Register_Bank_Sim - Behavioral
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

entity Register_Bank_Sim is
--  Port ( );
end Register_Bank_Sim;

architecture Behavioral of Register_Bank_Sim is
component Register_Bank 
Port ( Clk : in STD_LOGIC;
       Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
       Val : in STD_LOGIC_VECTOR (3 downto 0);
       Data_Bus : out bus_array_type);
end component;

signal clk : STD_LOGIC:= '0';
signal reg_en : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal val : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal data_bus : bus_array_type;

begin

UUT : Register_Bank
    Port map ( Clk => clk,
               Reg_EN => reg_en,
               Val => val,
               Data_Bus => data_bus);
               
process
begin
   Clk <= NOT(Clk);
   wait for 2ns;
end process;

process
begin
    reg_en <= "000";
    wait for 40ns;
    val <= "0010";
    wait for 40ns;
    
    reg_en <= "001";
    wait for 40ns;
    val <= "1010";
    wait for 40ns;
      
    reg_en <= "010";
    wait for 40ns;
    val <= "1000";
    wait for 40ns;
    
    reg_en <= "011";
    wait for 40ns;
    val <= "1110";
    wait for 40ns;  
    
    reg_en <= "100";
    wait for 40ns;
    val <= "1010";
    wait for 40ns;
    
    reg_en <= "101";
    wait for 40ns;
    val <= "0100";
    wait for 40ns;
     
    reg_en <= "110";
    wait for 40ns;
    val <= "1111";
    wait for 40ns;
    
    reg_en <= "111";
    wait for 40ns;
    val <= "0110";
    wait;   
end process;

end Behavioral;
