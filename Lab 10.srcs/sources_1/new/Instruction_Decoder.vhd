----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2025 03:11:27 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           --Load_En : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Neg_Sel : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal OP_code : STD_LOGIC_VECTOR (1 downto 0);
signal R_A : STD_LOGIC_VECTOR (2 downto 0);
signal R_B : STD_LOGIC_VECTOR (2 downto 0);
signal D : STD_LOGIC_VECTOR (3 downto 0);
begin
    process(Instruction,Jump_Check)
    begin
        Reg_En <= "000";
        Load_Sel <= '0';
        Imm_Val <= "0000";
        Reg_A <= "000";
        Reg_B <= "000";
        Add_Neg_Sel <= '0';
        Jump_Flag <= '0';
        Jump_Address <= "000";
        
    OP_code <= Instruction (11 downto 10);
    R_A <= Instruction (9 downto 7);
    R_B <= Instruction (6 downto 4);
    D <= Instruction (3 downto 0);
    
    case OP_code is
    
        when "00" =>
            Reg_A <= R_A;
            Reg_B <= R_B;
            Load_Sel <= '0';
            Reg_En <= R_A;
        
        when "01" =>
            Reg_B <= R_A;
            Add_Neg_Sel <= '1';
            Load_Sel <= '0';
            Reg_En <= R_A;    
        
        when "10" =>
            Imm_Val <= D;
            Load_Sel <= '1';
            Reg_En <= R_A;
            
        when "11" =>
            Reg_A <= R_A;
            Jump_Address <= D (2 downto 0);
            if Jump_Check = "0000" then
                Jump_Flag <= '1';
            else
                Jump_Flag <= '0';   
            end if;
            
         when others =>
            null;
    end case;                  
    end process;

end Behavioral;
