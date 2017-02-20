----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2017 04:21:01 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
 generic (
 DATA_WIDTH : POSITIVE := 2
);
  Port ( 
  a : in std_logic_vector(DATA_WIDTH - 1 downto 0);
  b : in std_logic_vector(DATA_WIDTH - 1 downto 0);
  output: out std_logic
  );
end comparator;

architecture Behavioral of comparator is--TODO use generate

begin
	output <= (a(0) xnor b(0)) and (a(1) xnor b(1));
end Behavioral;
