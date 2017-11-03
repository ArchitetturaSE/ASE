library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sommatore_ripple_carry is
generic (N : natural);
    Port ( a   		: in  STD_LOGIC_VECTOR(N-1 downto 0);
		   b   		: in  STD_LOGIC_VECTOR(N-1 downto 0);
		   c_in 	: in  STD_LOGIC;
           sum   	: out STD_LOGIC_VECTOR(N-1 downto 0);
		   c_out	: out STD_LOGIC
   );
end sommatore_ripple_carry;

architecture structural of sommatore_ripple_carry is

	component full_adder port(
		   a   		: in  STD_LOGIC;
           b   		: in  STD_LOGIC;
		   c_in 	: in  STD_LOGIC;
           sum   	: out STD_LOGIC;
		   c_out	: out STD_LOGIC
	);
	end component;
	
constant N_VALUE : natural := 2;
	
signal carry : STD_LOGIC_VECTOR(N_VALUE downto 0) := (others => '0');
	
begin 	
	carry(0) <= c_in;
	
	sum_bits : for i in 0 to N_VALUE-1 generate
		full_add : full_adder port map(
										a => a(i),
										b => b(i),
										c_in => carry(i),
										sum => sum(i),
										c_out => carry(i+1)				
										);
	end generate;
	
	c_out <= carry(N_VALUE);

end structural;