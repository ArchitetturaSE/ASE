library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( a   		: in  STD_LOGIC;
           b   		: in  STD_LOGIC;
		   c_in 	: in  STD_LOGIC;
           sum   	: out STD_LOGIC;
		   c_out	: out STD_LOGIC
   );
end full_adder;

architecture structural of full_adder is

	component half_adder port (
		a   		: in  STD_LOGIC;
        b   		: in  STD_LOGIC;
        sum		   	: out STD_LOGIC;
		c_out		: out STD_LOGIC
	);
	end component;

signal c0 : STD_LOGIC := '0';
signal c1 : STD_LOGIC := '0';
signal partial_sum : STD_LOGIC := '0';

begin
	
inst_ha0 : half_adder port map(
								a => a,
								b => b,
								sum => partial_sum,
								c_out => c0

								);
inst_ha1 : half_adder port map(
								a => c_in,
								b => partial_sum,
								sum => sum,
								c_out => c1
								);

c_out <= c0 or c1;								

end structural;
