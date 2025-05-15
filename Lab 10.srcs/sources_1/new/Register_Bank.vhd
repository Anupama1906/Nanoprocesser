----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 02:49:27 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Val : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Bus : out bus_array_type);
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg is
    Port( D : in STD_LOGIC_VECTOR (3 downto 0);
          En : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 is
    Port( I : in STD_LOGIC_VECTOR(2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal en : STD_LOGIC_VECTOR(7 downto 0);

begin
    
    Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
    I => Reg_EN,
    EN => '1', 
    Y => en);
    
    Reg_0 : Reg
    PORT MAP(
    D => Val,
    En => en(0),
    Clk => Clk,
    Q => Data_Bus(0));
    
    Reg_1 : Reg
    PORT MAP(
    D => Val,
    En => en(1),
    Clk => Clk,
    Q => Data_Bus(1));
    
    Reg_2 : Reg
    PORT MAP(
    D => Val,
    En => en(2),
    Clk => Clk,
    Q => Data_Bus(2));
    
    Reg_3 : Reg
    PORT MAP(
    D => Val,
    En => en(3),
    Clk => Clk,
    Q => Data_Bus(3));
    
    Reg_4 : Reg
    PORT MAP(
    D => Val,
    En => en(4),
    Clk => Clk,
    Q => Data_Bus(4));
    
    Reg_5 : Reg
    PORT MAP(
     D => Val,
     En => en(5),
     Clk => Clk,
     Q => Data_Bus(5));
    
    Reg_6 : Reg
    PORT MAP(
     D => Val,
     En => en(6),
     Clk => Clk,
     Q => Data_Bus(6));
    
    Reg_7 : Reg
    PORT MAP(
     D => Val,
     En => en(7),
     Clk => Clk,
     Q => Data_Bus(7));
     
     
end Behavioral;
