----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 07:49:03 PM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit_Sim - Behavioral
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

entity Mux_8_way_4_bit_Sim is
--  Port ( );
end Mux_8_way_4_bit_Sim;

architecture Behavioral of Mux_8_way_4_bit_Sim is
component Mux_8_way_4_bit
    Port ( In_Val : in bus_array_type;
           Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Val : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal in_val : bus_array_type;
signal reg_sel : STD_LOGIC_VECTOR (2 downto 0);
signal out_val : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : Mux_8_way_4_bit
    Port map( In_Val => in_val,
              Reg_Sel => reg_sel,
              Out_Val => out_val);
              
              
process
begin
    in_val(0) <= "1100";
    in_val(1) <= "0010";
    in_val(2) <= "0110";
    in_val(3) <= "1000";
    in_val(4) <= "1011";
    in_val(5) <= "1110";
    in_val(6) <= "0010";
    in_val(7) <= "0101";
    wait for 100 ns;
    
    reg_sel <= "000";
    wait for 50 ns;
    
    reg_sel <= "001";
    wait for 50 ns;
    
    reg_sel <= "010";
    wait for 50 ns;
    
    reg_sel <= "011";
    wait for 50 ns;
    
    reg_sel <= "100";
    wait for 50 ns;
    
    reg_sel <= "101";
    wait for 50 ns;
    
    reg_sel <= "110";
    wait for 50 ns;
            
    reg_sel <= "111";
    wait;
end process;

end Behavioral;
