--This file describes a demux1_n
--Mario Barbareschi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity demux1_n is
 generic(address_width : natural := 5
	);
 port (a : in std_logic;
       sel : in std_logic_vector(address_width-1 downto 0);
 	x : out std_logic_vector(2**address_width-1 downto 0)
     
      );
end demux1_n;

architecture behavioral of demux1_n is

begin

	main : process(a, sel)
	begin
	--	for i = 0 to 3 loop:
	--		if conv_integer(sel) = i then
	--			x(i) <= a;
	--		else
	--			x(i) <= '0';
	--		end if;
	--	end loop;
		x <= (others => '0');
		x(conv_integer(sel)) <= a;
	end process;

end architecture;

architecture dataflow of demux1_n is

begin

	demux_gen: for i in 0 to 2**address_width generate
		x(i) <= a when conv_integer(sel) = i else '0';
	end generate;

end architecture;
