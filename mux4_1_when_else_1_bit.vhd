LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------------------------------------
ENTITY mux4_1_when_else_1_bit IS
	PORT(		x1		:	IN		STD_LOGIC;
				x2		:	IN		STD_LOGIC;
				x3		:	IN		STD_LOGIC;
				x4		:	IN		STD_LOGIC;
				sel1 	:	IN		STD_LOGIC;
				sel2 	:	IN		STD_LOGIC;
				y		:	OUT	STD_LOGIC);
END ENTITY mux4_1_when_else_1_bit;
----------------------------------------------------------
ARCHITECTURE functional OF mux4_1_when_else_1_bit IS
BEGIN

	y <= x1	WHEN	sel1='0'	AND sel2='0'	ELSE
	     x2	WHEN	sel1='0'	AND sel2='1'	ELSE
		  x3	WHEN	sel1='1'	AND sel2='0'	ELSE
		  x4;

END ARCHITECTURE functional;