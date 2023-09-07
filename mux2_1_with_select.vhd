LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY mux2_1_with_select IS
   PORT(    x1    :  IN   STD_LOGIC_VECTOR(6 DOWNTO 0);
	         x2    :  IN   STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
				sel   :  IN   STD_LOGIC;
				y     :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY mux2_1_with_select;
------------------------------------------------
ARCHITECTURE functional OF mux2_1_with_select IS
BEGIN
   with sel select
	   y <= x1 when '1',
		     x2 when others;
			  
END ARCHITECTURE functional;