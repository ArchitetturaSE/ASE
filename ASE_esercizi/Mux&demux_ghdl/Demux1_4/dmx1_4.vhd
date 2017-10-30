library ieee;
use ieee.std_logic_1164.all;

entity dmx1_4 is
	port(	
		a	:	in std_logic;
		sel	:	in std_logic_vector(1	downto	0);
		x	:	out std_logic_vector(3	downto	0)
	);
end entity;


architecture dataflow of dmx1_4 is
	begin
	x(0) <= a when sel = "00" else '0';
	x(1) <= a when sel = "01" else '0';
	x(2) <= a when sel = "10" else '0';
	x(3) <= a when sel = "11" else '0';
end architecture;

--architecture structural of dmx1_4 is
--	component demux1_2 is
--		port(
--			a	:	in	std_logic;
--			s	:	in	std_logic;
--			x	:	out	std_logic_vector(1	downto	0)
--		);
--	end component;
	
--	signal	dmx0_out	:	std_logic_vector(1 downto 0):="00";
	
--	begin
	
--	dmx0:demux1_2	port	map(
--					a	=>	a,
--					s	=>	sel(1),
--					x	=>	dmx0_out
--	);
	
--	dmx1:demux1_2	port	map(
--						dmx1_out(1)	=>	a,
--						s			=>	sel(0),
--						x			=>	x(3 downto 2)
--	);
	
--	dmx2:demux1_2	port	map(
--						dmx1_out(0)	=>	a,
--						s			=>	sel(0),
--						x			=>	x(1 downto 0)
--	);
--end architecture;