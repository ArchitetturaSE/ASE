LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;

-- entity declaration for your testbench. Don't declare any ports here
ENTITY sommatore_ripple_carry_testbench IS 
END sommatore_ripple_carry_testbench;

ARCHITECTURE behavioural OF sommatore_ripple_carry_testbench IS

	-- Component Declaration for the Unit Under Test (UUT)
	component sommatore_ripple_carry is
	generic (N : natural);
		 Port ( a   	: in  STD_LOGIC_VECTOR(N-1 downto 0);
				b   	: in  STD_LOGIC_VECTOR(N-1 downto 0);
				c_in 	: in  STD_LOGIC;
				sum   	: out STD_LOGIC_VECTOR(N-1 downto 0);
				c_out	: out STD_LOGIC
				);
	end component;

--declare constant
constant N_VALUE : natural := 2;

--declare inputs and initialize them
signal a : STD_LOGIC_VECTOR(N_VALUE-1 downto 0) := (others => '0');
signal b : STD_LOGIC_VECTOR(N_VALUE-1 downto 0) := (others => '0');
signal c_in : STD_LOGIC := '0';

--declare outputs and initialize them
signal sum : STD_LOGIC_VECTOR(N_VALUE - 1 downto 0) := (others => '0');
signal c_out : STD_LOGIC := '0';

begin
	-- Instantiate the Unit Under Test (UUT)
	-- TODO
	uut: sommatore_ripple_carry GENERIC MAP(N_VALUE) PORT MAP(
						a => a,
						b => b,
						c_in => c_in,
						sum => sum,
						c_out => c_out
						);
	
	-- Stimulus process
  	stim_proc: process
  	variable l : line;
  	 begin
			write (l, String'("Testbench for sommatore_ripple_carry"));
			writeline (output, l);
			
			wait for 10 ns;
			a <= "10";
			b <= "11";
			
			wait for 10 ns;
			
			wait;
	 end process;

END behavioural;
