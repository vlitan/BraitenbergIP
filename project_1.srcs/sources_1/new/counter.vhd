----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2017 05:51:03 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
 generic (
	DATA_WIDTH : POSITIVE := 4
 );
 Port ( 
 clk	: in std_logic;
 enable	: in std_logic; --active low
 reset	: in std_logic; --active high
 output	: out std_logic_vector(DATA_WIDTH - 1 downto 0)
 );
end counter;

architecture Behavioral of counter is
	signal temp : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin 
process(clk, reset)
	begin
		if reset = '1' then
			temp <= "0000";--0000";
		elsif (rising_edge(clk)) then
			if enable = '0' then
				temp <= temp + 1;
			end if;
		end if;
	end process;
	output <= temp;
end Behavioral;
