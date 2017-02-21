----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2017 12:16:21 PM
-- Design Name: 
-- Module Name: counter16 - Behavioral
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

entity counter16 is
Port ( 
	clk			: in std_logic;
	enable		: in std_logic; --active low
	reset		: in std_logic; --active high
	output		: out std_logic_vector(15 downto 0);
	rollover	: out std_logic
);
end counter16;

architecture Behavioral of counter16 is

component counter8 is
 Port ( 
 clk		: in std_logic;
 enable		: in std_logic; --active low
 reset		: in std_logic; --active high
 output		: out std_logic_vector(7 downto 0);
 rollover	: out std_logic
 );
end component;
signal rollover_enable : std_logic;
begin
	LSB	: counter8 PORT MAP(clk => clk,
							enable => enable,
							reset => reset,
							output => output(7 downto 0),
							rollover => rollover_enable
							);
	MSB	: counter8 PORT MAP(clk => clk,
							enable => rollover_enable,
							reset => reset,
							output => output(15 downto 8),
							rollover => rollover
							);
end Behavioral;
