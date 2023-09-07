LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY muxes_inversor IS
   PORT(    x1_1  :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
	         x2_2  :  IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
				sel_1 :  IN   STD_LOGIC;
				y1    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
				y2    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY muxes_inversor;
------------------------------------------------
ARCHITECTURE functional OF muxes_inversor IS
BEGIN
  salida_a: ENTITY work.mux2_1_with_select_3
  PORT MAP(  x1  => x2_2,
             x2  => x1_1,
				 sel => sel_1,
				 y   => y1);
  
  salida_b: ENTITY work.mux2_1_with_select_3
  PORT MAP(  x1  => x1_1,
             x2  => x2_2,
				 sel => sel_1,
				 y   => y2);
				 
END ARCHITECTURE functional;