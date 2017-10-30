library ieee;
use ieee.std_logic_1164.all;

entity dmx1_2_tsb is
end dmx1_2_tsb;

architecture behavioral of dmx1_2_tsb is

	signal a : std_logic := '0';
	signal s : std_logic := '0';
	signal x : std_logic_vector(1 downto 0) := "00";
	
	component demux1_2 is
		port (
			a : in std_logic;
			s : in std_logic;
			x : out std_logic_vector(1 downto 0)
		);
	end component;
	begin 
	uut: demux1_2 port map (
					s=>s,
					a=>a,
					x=>x
					);
	simulus: process
	begin
	wait for 10 ns;
	a <= '1';
	wait for 10 ns;
	s <= '1';
	wait for 10 ns;
	wait;
	
	end process;
end behavioral;