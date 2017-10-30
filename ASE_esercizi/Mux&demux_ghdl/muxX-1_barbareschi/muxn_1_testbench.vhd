LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use std.textio.all;

-- entity declaration for your testbench. Dont declare any ports here
ENTITY muxn_1_testbench IS
END muxn_1_testbench;

ARCHITECTURE behavioral OF muxn_1_testbench IS

 -- Component Declaration for the Unit Under Test (UUT)

	component muxn_1 is
 	generic(Address_Width : natural := 3); 
	
 	port (	 A : in std_logic_vector(2**Address_Width-1 downto 0);
  		 sel : in std_logic_vector(Address_Width-1 downto 0);
		 x: out std_logic
	 );
         end component;

--declare inputs and initialize them

constant mux_selection_lenght : natural := 4;

signal SEL :	std_logic_vector(mux_selection_lenght-1 downto 0) := (others => '0');
signal A   :	std_logic_vector(2**mux_selection_lenght-1 downto 0) := (others => '0');
--declare outputs and initialize them
signal X   : 	STD_LOGIC := '0';


begin
-- Instantiate the Unit Under Test (UUT)

uut: muxn_1 generic map(mux_selection_lenght) port map(
    SEL => SEL,
    A => A,
    X => X
    );

 -- Stimulus process
  	stim_proc: process
    variable l : line;
	begin
        write (l, String'("Testbench for muxn_1"));
        writeline (output, l);

	wait for 10 ns;
		SEL <= "0001";
        	A <= x"BABA";
        wait for 10 ns;
		SEL <= "0010";
        wait for 10 ns;
		SEL <= "0111";
        wait for 10 ns;
        assert (X = '0') report "X should be 1" severity error;
       		A <= x"0000";
        wait for 10 ns;
		wait;
	 end process;

END behavioral;
