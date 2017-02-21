----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2017 12:10:47 PM
-- Design Name: 
-- Module Name: frequency_divider16 - Behavioral
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

entity frequency_divider16 is
  Port (
  clk	: in std_logic;							--input clock
  enable: in std_logic;
  div	: in std_logic_vector(3 downto 0);		--division factor
  output: out std_logic 						--output clock
  );
end frequency_divider16;

architecture Behavioral of frequency_divider16 is

component counter16 is
Port ( 
	clk			: in std_logic;
	enable		: in std_logic; --active low
	reset		: in std_logic; --active high
	output		: out std_logic_vector(15 downto 0);
	rollover	: out std_logic
);
end component;

component mux16 is
  Port (
  input : in std_logic_vector(15 downto 0);
  slct	: in std_logic_vector(3 downto 0); --DATA_WIDTH<->dependent
  output: out std_logic
  );
end component;
signal aux	: std_logic_vector(15 downto 0);
signal nll	: std_logic;
begin
	COUNT	: counter16 port map(clk	=> clk,
								enable	=> enable,
								reset	=> '0',
								output	=> aux,
								rollover=> nll 
								); 
								
	MUX		: mux16 port map(input	=> aux,
		 					slct	=> div,
		 					output	=>  output
							);

end Behavioral;
