----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sanjula M.D.N
-- 
-- Create Date: 11.05.2025 11:41:31
-- Design Name: Program ROM
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;   -- to deal with numerics easily


entity Program_ROM is

    -- this take 3 bit address from the program counter as input and outputs a 12 bit instruction.
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    
    -- we are declaring the ROM as an array of size 8 where each compartment consist of 12 bit vector (instruction)
    type ROM_Array is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);
    
    -- signal declaration
    signal ROM: ROM_Array := (
        0 => "100010001010", -- MOVI R1, 10
        1 => "100100000001", -- MOVI R2, 1
        2 => "010100000000", -- NEG R2
        3 => "000010100000", -- ADD R1, R2
        4 => "110010000111", -- JZR R1, 7
        5 => "110000000011", -- JZR R0, 3
        6 => "000000000000", -- not used
        7 => "000000000000" -- not used
    );

begin
    
    -- Giving the output corrsponding to the address from the program counter 
    Instruction <= ROM(to_integer(UNSIGNED(Address)));

end Behavioral;
