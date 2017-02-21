----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2017 11:42:01 AM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux16 is
  Port (
  input : in std_logic_vector(15 downto 0);
  slct	: in std_logic_vector(3 downto 0);
  output: out std_logic
  );
end mux16;

architecture Behavioral of mux16 is

begin
with slct select
	output <=	input(0)  when "0000",
				input(1)  when "0001",
				input(2)  when "0010",
				input(3)  when "0011",
				input(4)  when "0100",
				input(5)  when "0101",
				input(6)  when "0110",
				input(7)  when "0111",
				input(8)  when "1000",
				input(9)  when "1001",
				input(10) when "1010",
				input(11) when "1011",
				input(12) when "1100",
				input(13) when "1101",
				input(14) when "1110",
				input(15) when "1111",
				'0' when others;
end Behavioral;
