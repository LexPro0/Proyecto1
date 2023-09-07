LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY mux2_1_with_select_2 IS
   PORT(    x1    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
	         x2    :  IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
				sel   :  IN   STD_LOGIC;
				y     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY mux2_1_with_select_2;
------------------------------------------------
ARCHITECTURE functional OF mux2_1_with_select_2 IS
BEGIN
   with sel select
	   y <= x1 when '1',
		     x2 when others;
			  
END ARCHITECTURE functional;