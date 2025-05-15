----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2025 08:48:53 AM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit_0 - Behavioral
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

entity Mux_8_way_4_bit is
    Port ( In_Val : in bus_array_type;
           Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Val : out STD_LOGIC_VECTOR (3 downto 0)
          );
          
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is

begin
    process(Reg_Sel, In_Val)
    begin
        case Reg_Sel is
            when "000" => Out_Val <= In_Val(0);
            when "001" => Out_Val <= In_Val(1);
            when "010" => Out_Val <= In_Val(2);
            when "011" => Out_Val <= In_Val(3);
            when "100" => Out_Val <= In_Val(4);
            when "101" => Out_Val <= In_Val(5);
            when "110" => Out_Val <= In_Val(6);
            when "111" => Out_Val <= In_Val(7);
            when others => Out_Val <= (others => '0');      --safe default
        
        end case;
    end process;


end Behavioral;
