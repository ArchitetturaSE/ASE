library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder_tsb is 
	generic (width : integer := 8);
end ripple_carry_adder_tsb;

architecture behavioral of ripple_carry_adder_tsb is

	component ripple_carry_adder is  
		port(                                                                     
		X	: in  std_logic_vector(width-1 downto 0);                             
		Y	: in  std_logic_vector(width-1 downto 0);                             
		cin : in  std_logic;
		cout: out std_logic;
		sum : out std_logic_vector(width-1 downto 0)
		
	);
	end component;
	
	signal x	: 	std_logic_vector (width-1 downto 0):= (others=>'0');
	signal y	: 	std_logic_vector (width-1 downto 0):= (others=>'0');
	signal cin	: 	std_logic := '0';
	--outputs
	signal cout : 	std_logic := '0';
	signal sum  : 	std_logic_vector(width-1 downto 0) := (others=>'0');
	begin
	uut: ripple_carry_adder port map (
								x=>x,
								y=>y,
								cin=>cin,
								cout=>cout,
								sum=>sum
					);
					
	stim_proc: process
	begin
	wait for 10 ns;
	X <=b"00000001";
	Y <=b"00000001";
	wait for 10 ns;
	wait;
	end process;
end behavioral;