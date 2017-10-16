LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- entity declaration for your testbench. Dont declare any ports here
ENTITY mux4_1_testbench IS 
END mux4_1_testbench;

ARCHITECTURE behavioral OF mux4_1_testbench IS

 -- Component Declaration for the Unit Under Test (UUT)

	component mux4_1 is
		Port (
			SEL : in  STD_LOGIC_VECTOR(1 downto 0);
			A   : in  STD_LOGIC_VECTOR(3 downto 0);
			X   : out STD_LOGIC
		);
	end component;

--declare inputs and initialize them

signal SEL 	: 	STD_LOGIC_VECTOR (1 downto 0):= "00";
signal A 	: 		STD_LOGIC_VECTOR (3 downto 0):= "0000";	
--declare outputs and initialize them
signal X   :  STD_LOGIC := '0';


begin
-- Instantiate the Unit Under Test (UUT)

	uut: mux4_1 port map (
					SEL(1 downto 0) => SEL(1 downto 0),
					A (3 downto 0) => A(3 downto 0),
					X => X
					);

--uut: mux2_1 port map(sel, a, b, x);

 -- Stimulus process
  	stim_proc: process
  	 begin
		WAIT FOR 10 NS;
		SEL(0) <= '1';
		SEL(1) <= '1';
		wait for 10 ns;
		A(3) <= '1';
		wait for 10 ns;
		SEL(0) <= '0';
		wait for 10 ns;
		SEL(1) <= '0';
		wait for 20 ns;
		wait;
	 end process;

END behavioral;
