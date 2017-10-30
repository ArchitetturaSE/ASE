library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tsb is 
end entity;

architecture behavioral of full_adder_tsb is

	component full_adder is
	port(
		x	:in std_logic;
		y	:in std_logic;
		cin	:in std_logic;
		cout:out std_logic;
		sum	:out std_logic
	);
end component;
	
	 signal x :	std_logic :='0';
	 signal y :	std_logic :='0';
	 signal cin :	std_logic :='0';
	 signal cout:	std_logic :='0';
	 signal sum :	std_logic :='0';

	 begin

	uut: full_adder port map(x,y,cin,cout,sum);
	
	proc: process
	
	begin
	wait for 10 ns;
	x<='1';
	y<='0';
	cin<='1';
	wait for 10 ns;
	wait;
	
	end process;
end behavioral;