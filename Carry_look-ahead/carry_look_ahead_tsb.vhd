library ieee;
use ieee.std_logic_1164.all;

entity carry_look_ahead_tsb is
end entity;

architecture behavioral of carry_look_ahead_tsb is
		component carry_look_ahead is 
			generic (width : natural := 4);
			port (
				A : in std_logic_vector(width-1 downto 0);
				B : in std_logic_vector(width-1 downto 0);
				cin	: 	in 	std_logic;
				cout:	out std_logic;
				sum	: 	out std_logic_vector(width-1 downto 0)
			);
	end component;
	constant l : natural :=4;
	signal A : std_logic_vector(l-1 downto 0):=(others =>'0');
	signal B : std_logic_vector(l-1 downto 0):=(others =>'0');
	signal sum : std_logic_vector(l-1 downto 0):=(others =>'0');
	signal cin : std_logic:='0';
	signal cout : std_logic:='0';
begin

	uut: carry_look_ahead port map(
		A=>A,
		B=>B,
		sum=>sum,
		cin=>cin,
		cout=>cout
	);
stim_proc: process
begin
	wait for 10 ns;
	A<=x"2";
	B<=x"1";
	wait for 10 ns;
	A<=x"4";
	B<=x"2";
	wait for 10 ns;
	wait;
end process;
end architecture;