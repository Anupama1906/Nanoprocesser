----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjula M.D.N
-- 
-- Create Date: 11.05.2025 09:20:28
-- Design Name: Program Counter (2 way 3 bit MUX and 3 bit adder included)
-- Module Name: Program_Counter - Behavioral
-- Project Name: 
-- Target Devices: Basys
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
use IEEE.NUMERIC_STD.ALL;   -- this library is used to do logical things easily rather than implementing separate components for adder

entity Program_Counter is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Jump_Flag : in STD_LOGIC;
           Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Memory_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is
    
    -- component declaration for the D flip flop
    
    -- declaring internal signals
    signal PC_reg : UNSIGNED(2 downto 0) := "000";  -- initializing the programme counter value
    signal PC_next : UNSIGNED(2 downto 0);  -- signal to store the next value to be loaded to program counter
    signal PC_inc : UNSIGNED(2 downto 0);   -- signal to store the program counter value incremented by one

begin
    
    -- incrementing the program counter value by 1  (job of 3 bit adder)
    PC_inc <= PC_reg + 1;
    
    -- depending on the Load value, assigning the PC_next (job of 2 way 3 bit MUX)
    process(Jump_Flag, Jump_Address, PC_inc)
    begin
        if Jump_Flag = '1' then
            PC_next <= UNSIGNED(Jump_Address);
        else
            PC_next <= PC_inc;
        end if;
    end process;
    
    -- declaring D flip flops to store the next Program Counter value
   process(Clk, Res)
        begin
            if Res = '1' then
                PC_reg <= (others => '0');
            elsif rising_edge(Clk) then
                PC_reg <= PC_next;
            end if;
        end process;
     
     -- making the output the Program Counter value (this output should be connected to program ROM)   
     Memory_Sel <= STD_LOGIC_VECTOR(PC_reg);


end Behavioral;
