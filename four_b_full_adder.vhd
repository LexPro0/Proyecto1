LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_full_adder IS
	PORT(		A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				Ci		:	IN		STD_LOGIC;
				s		:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
				Co		:	OUT	STD_LOGIC);
END ENTITY four_b_full_adder;
------------------------------------------
ARCHITECTURE best OF four_b_full_adder IS
		SIGNAL 	p0		:	STD_LOGIC;
		SIGNAL 	p1		:	STD_LOGIC;
		SIGNAL 	p2		:	STD_LOGIC;
BEGIN
	full_4_1_0: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(0),
					B		=> B(0),
					Ci		=> Ci,
					s		=> s(0),
					Co		=> p0);
					
	full_4_1_1: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(1),
					B		=> B(1),
					Ci		=> p0,
					s		=> s(1),
					Co		=> p1);
	
	full_4_1_2: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(2),
					B		=> B(2),
					Ci		=> p1,
					s		=> s(2),
					Co		=> p2);
					
	full_4_1_3: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(3),
					B		=> B(3),
					Ci		=> p2,
					s		=> s(3),
					Co		=> Co);
END ARCHITECTURE best;