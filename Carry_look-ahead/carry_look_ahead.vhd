library ieee;
use ieee.std_logic_1164.all;

entity carry_look_ahead is
	generic (width : natural := 4);
	port (
		A : in std_logic_vector(width-1 downto 0);
		B : in std_logic_vector(width-1 downto 0);
		cin	: 	in 	std_logic;
		cout:	out std_logic;
		sum	: 	out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture structural of carry_look_ahead is
	component half_adder is
		port(
			x 	:	in std_logic;
			y	:	in std_logic;
			s	:	out std_logic;
			c	:	out	std_logic
		);
	end component;
	
	signal G : std_logic_vector(width-1 downto 0):=(others =>'0');
	signal P : std_logic_vector(width-1 downto 0):=(others =>'0');
	signal C : std_logic_vector(width-1 downto 0):=(others =>'0');
	signal S : std_logic_vector(width downto 0):=(others =>'0');
begin
	
	cout<=S(width);
	
	
	HA_gen: for i in 0 to width-1 generate
	
		HA : half_adder port map(
								x=>A(i),
								y=>B(i),
								s=>P(i),
								c=>G(i)								
		);
	end generate;

	CLA_gen: for i in 0 to width-1 generate
	
		C(i)<= G(i) or (P(i) and (cin));
		
	end generate;
	
	Xor_gen: for i in 0 to width-1 generate
	
		S(i) <= P(i) xor C(i);
		sum(i)<=s(i);
	end generate;
	
end architecture;