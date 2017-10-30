--This file describes a mux4_1
--Mario Barbareschi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1 is
    Port ( SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           A   : in  STD_LOGIC_VECTOR(3 downto 0);
           X   : out STD_LOGIC
   );
end mux4_1;

architecture structural of mux4_1 is

	component mux2_1 is
    	Port( 
       		SEL : in  STD_LOGIC;
           	A   : in  STD_LOGIC;
           	B   : in  STD_LOGIC;
           	X   : out STD_LOGIC
  	 );
	end component;

signal mux_out1, muxout2: std_logic := '0';

begin

	inst_mux0: mux2_1 port map(
				   SEL => SEL(1),
				   A => A(0),
				   B => A(1),
				   X => mux_out1
				   );

	inst_mux1: mux2_1 port map(
					SEL => SEL(1),
					A => A(2),
					B => A(3),
					X => muxout2
					);
					
	--X<= ( mux_out1 AND SEL(1) ) or (muxout2 and (not SEL(1)));
	inst_mux3: mux2_1 port map(
					SEL => SEL(0),
					A => mux_out1,
					B => muxout2,
					X => X
					);
end structural;
