----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 06:10:32 AM
-- Design Name: 
-- Module Name: Nano_Processer_Sim - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all

entity Nano_Processor_Sim is
end Nano_Processor_Sim;

architecture Behavioral of Nano_Processor_Sim is

component Nano_Processer
    Port ( Clk : in STD_LOGIC;
           Switch : in STD_LOGIC_VECTOR(7 downto 0);
           Res : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR(3 downto 0);
           Reg_LED : out STD_LOGIC_VECTOR(3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal clk, res, carry, zero : STD_LOGIC := '0';
signal switch : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal s_led, reg_led : STD_LOGIC_VECTOR(3 downto 0);

begin


UUT: Nano_Processer
    port map (
        Clk => clk,
        Switch => switch,
        Res => res,
        S_LED => s_led,
        Reg_LED => reg_led,
        Carry => carry,
        Zero => zero);

process
begin
   Clk <= NOT(Clk);
   wait for 2ns;
end process;

process
begin

    Res <= '1';
    wait for 20 ns;
    Res <= '0';

    wait for 500 ns;
    
    for i in 0 to 7 loop
        Switch <= (others => '0');
        Switch(i) <= '1';
        wait for 50 ns;
    end loop;

    wait;
end process;

end Behavioral;