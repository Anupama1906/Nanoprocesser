----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 06:18:06 AM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
    component Slow_Clk
        Port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC
        );
    end component;

    signal clk_in : STD_LOGIC := '0';
    signal clk_out : STD_LOGIC;   


    constant Clk_period : time := 10 ns;

begin
    UUT: Slow_Clk
        port map (
            Clk_in => clk_in,
            Clk_out => clk_out
        );

    Clk_process: process
    begin
        clk_in <= '0';
        wait for Clk_period / 2;
        clk_in <= '1';
        wait for Clk_period / 2;
    end process;

    stim_proc: process
    begin
        wait for 1000 ns;
        wait;
    end process;

end Behavioral;
