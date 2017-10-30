LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity dmx1_4_tsb is
end dmx1_4_tsb;

architecture behavioral of dmx1_4_tsb is
	
	component dmx1_4 is
		port(
			a	:	in std_logic;
			sel	:	in std_logic_vector(1	downto	0);
			x	:	out	std_logic_vector(3	downto	0)
		);
	end component;
	
	signal	a	:	std_logic:='0';
	signal	sel	:	std_logic_vector(1	downto 0):="00";
	signal	x	:	std_logic_vector(3	downto	0):="0000";
	
	begin
		uut:dmx1_4	port	map(
								a	=>	a,
								sel	=> sel,
								x	=>	x
		);
		
		
	stimulus_process: process
	begin
	
	wait for 10 ns;
	a	<= '1';
	wait for 10 ns;
	sel	<= "01";
	wait for 10 ns;
	sel	<= "00";
	wait for 10 ns;
	sel	<= "10";
	wait for 10 ns;
	sel	<= "11";
	wait for 10 ns;
	wait;
	end process;
	
end architecture;