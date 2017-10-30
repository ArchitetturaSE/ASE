--This file describes a demux1_4
--Mario Barbareschi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1_4 is
 port (	a : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		x : out std_logic_vector(3 downto 0)
     
      );
end demux1_4;

architecture dataflow of demux1_4 is

begin

	x(0) <= a when sel = "00" else '0';
	x(1) <= a when sel = "01" else '0';
	x(2) <= a when sel = "10" else '0';
	x(3) <= a when sel = "11" else '0';

end architecture;
