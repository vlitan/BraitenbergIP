----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2017 03:47:27 PM
-- Design Name: 
-- Module Name: pwm - Behavioral
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

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

entity pwm is
  Port (
  	clk		: in std_logic;
  	enable	: in std_logic;
	value	: in std_logic_vector(7 downto 0);
	div		: in std_logic_vector(3 downto 0);
	output	: out std_logic
   );
end pwm;

architecture Behavioral of pwm is

component frequency_divider16 is
  Port (
  clk	: in std_logic;							--input clock
  enable: in std_logic;
  div	: in std_logic_vector(3 downto 0);		--division factor
  output: out std_logic 						--output clock
  );
end component;

component counter8 is
 Port ( 
 clk		: in std_logic;
 enable		: in std_logic; --active low
 reset		: in std_logic; --active high
 output		: out std_logic_vector(7 downto 0);
 rollover	: out std_logic
 );
 end component;
 
 component comparator8 is
   Port ( 
   a		: in std_logic_vector(7 downto 0);
   b		: in std_logic_vector(7 downto 0);
   output	: out std_logic
   );
 end component;
 signal counter_out : std_logic_vector(7 downto 0);
 signal aux_clk		: std_logic;
 signal nll			: std_logic;
begin
	F_DIVIDER:	frequency_divider16 port map(clk	=> clk,							--input clock
										  	enable	=> enable,
										  	div		=> div,
										  	output	=>aux_clk 
										  );
	COMPARATOR: counter8 port map(clk		=> aux_clk,
								  enable	=> enable,
								  reset 	=> '0',
								  output	=> counter_out,
								  rollover	=> nll
								  );
	COUNTER: comparator8 port map(a		=> counter_out,
								  b		=> value,
								  output=> output
								  );
end Behavioral;
