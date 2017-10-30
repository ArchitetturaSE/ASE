library ieee;                                                              
use ieee.std_logic_1164.all;                                               
                                                                           
entity half_adder_tsb is                                                   
end entity;                                                                
                                                                           
architecture behavioral of half_adder_tsb is                               
	                  
	signal x	: std_logic :='0';                                           
	signal y	: std_logic :='0';                                           
	signal s	: std_logic :='0';                                          
	signal c	: std_logic :='0';
					  
	component half_adder is                                                
		port(                                                              
			x	: in std_logic;                                            
			y	: in std_logic;                                            
			s	: out std_logic;                                           
			c	: out std_logic                                            
		);                                                                 
	end component;                                                         
                                                                                                                   
	                                                                       
	begin                                                                  
	                                                                       
	uut:	half_adder port map (                                          
								x => x,                                    
								y => y,                                    
								c => c,                                    
								s => s                                     
	);                                                                     
	stim_proc: process                                                     
	begin                                                                  
	                                                                       
	wait for 10 ns;                                                        
	x <= '1';                                                              
	wait for 10 ns;                                                        
	y <= '1'; 
	wait for 10 ns;
	wait;                                                                  
	end process;
	
end behavioral;