LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
-------------------------------------------------------------
ENTITY four_bit_comparator IS
   GENERIC ( MAX_WIDHT    :   INTEGER := 4);
	PORT(	    x	           :	IN		STD_LOGIC_VECTOR(MAX_WIDHT-1 DOWNTO 0);
			    y	           :	IN 	STD_LOGIC_VECTOR(MAX_WIDHT-1 DOWNTO 0) := "1001";
				 eq           :   OUT   STD_LOGIC);
END ENTITY four_bit_comparator;
-------------------------------------------------------------
ARCHITECTURE gateLevel OF four_bit_comparator IS
BEGIN
	
   eq <= '1' WHEN (x = y OR x < y) ELSE '0';

END ARCHITECTURE gateLevel;