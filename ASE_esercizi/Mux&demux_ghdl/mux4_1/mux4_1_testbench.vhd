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
	--i mux sono fatti tale che il mux 2-1 più in alto ha come primo ingresso a(0) e come secondo a(1) il secondo mux ha come primo ingresso a(2) e come scondo a(3).
	--gi ingressi di selezione sono tali che sel 0 seleziona i uno dei primi due mux e sel (1) decide se lasciar passare il segnale di sopra (1) o quello di sotto 8 0)
  	 begin
		A(0) <= '1';
		wait for 10 ns;
		A(0) <= '0';
		wait for 10 ns;
		SEL(1) <= '1';
		wait for 20 ns;
		SEL(0) <= '1';
		wait for 20 ns;
		A(0) <= '1';
		wait for 20 ns;
		




		wait;
	 end process;

END behavioral;
