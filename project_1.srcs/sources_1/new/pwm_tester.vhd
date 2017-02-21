----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2017 02:37:19 PM
-- Design Name: 
-- Module Name: pwm_tester - Behavioral
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

entity pwm_tester is
  Port (
  	clk100	: in std_logic;
  	value 	: in std_logic_vector(7 downto 0);
  	output	: out std_logic
  );
end pwm_tester;

architecture Behavioral of pwm_tester is

component pwm is
  Port (
  	clk		: in std_logic;
  	enable	: in std_logic;
	value	: in std_logic_vector(7 downto 0);
	div		: in std_logic_vector(3 downto 0);
	output	: out std_logic
   );
end component;

begin

	PWM_user: pwm port map( clk		=> clk100,
					  		enable	=> '1',
					  		value	=> value,
					  		div		=> "0001",
					 		output	=> output
					);
end Behavioral;
