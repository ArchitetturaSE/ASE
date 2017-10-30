library ieee;
use ieee.std_logic_1164.all;

entity demux1_2 is
	port(
		a : in std_logic;
		x : out std_logic_vector(1 downto 0);
		s : in std_logic
	);

end demux1_2;

architecture dataflow of demux1_2 is

begin
	x(0) <= (a and (not s));
	x(1) <= (a and s);

end architecture;