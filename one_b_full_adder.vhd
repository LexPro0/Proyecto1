LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY one_b_full_adder IS
	PORT(		A		:	IN		STD_LOGIC;
				B		:	IN		STD_LOGIC;
				Ci		:	IN		STD_LOGIC;
				s		:	OUT	STD_LOGIC;
				Co		:	OUT	STD_LOGIC);
END ENTITY one_b_full_adder;
------------------------------------------
ARCHITECTURE best OF one_b_full_adder IS
		SIGNAL 	p0		:	STD_LOGIC;
BEGIN
   p0 <= (NOT Ci);
	mux_4_1_0: ENTITY work.mux4_1_when_else_1_bit
	PORT MAP	(	x1		=>	Ci,
					x2		=>	p0,
					x3    => p0,
					x4    => Ci,
					sel1	=>	A,
					sel2	=>	B,
					y		=>	s);
					
	mux_4_1_1: ENTITY work.mux4_1_when_else_1_bit
	PORT MAP	(	x1		=>	'0',
					x2		=>	Ci,
					x3    => Ci,
					x4    => '1',
					sel1	=>	A,
					sel2	=>	B,
					y		=>	Co);
					
END ARCHITECTURE best;