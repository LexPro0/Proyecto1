LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_multi IS
	PORT(		A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				Ci		:	IN		STD_LOGIC;
				Ci2	:	IN		STD_LOGIC;
				Ci3	:	IN		STD_LOGIC;
				s		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY four_b_multi;
------------------------------------------
ARCHITECTURE functional OF four_b_multi IS
		SIGNAL 	p0		:	STD_LOGIC;
		SIGNAL 	p1		:	STD_LOGIC;
		SIGNAL 	p2		:	STD_LOGIC;
		SIGNAL 	p3		:	STD_LOGIC;
		SIGNAL 	p4		:	STD_LOGIC;
		SIGNAL 	p00	:	STD_LOGIC;
		SIGNAL 	p11	:	STD_LOGIC;
		SIGNAL 	p22	:	STD_LOGIC;
		SIGNAL 	p000	:	STD_LOGIC;
		SIGNAL 	p111	:	STD_LOGIC;
		SIGNAL 	p222	:	STD_LOGIC;
		SIGNAL 	s1		:	STD_LOGIC;
		SIGNAL 	s2		:	STD_LOGIC;
		SIGNAL 	s3		:	STD_LOGIC;
		SIGNAL 	s4		:	STD_LOGIC;
		SIGNAL 	s5		:	STD_LOGIC;
		SIGNAL 	s6		:	STD_LOGIC;
		SIGNAL 	op1	:	STD_LOGIC;
		SIGNAL 	op2	:	STD_LOGIC;
		SIGNAL 	op3	:	STD_LOGIC;
		SIGNAL 	op4	:	STD_LOGIC;
		SIGNAL 	op5	:	STD_LOGIC;
		SIGNAL 	op6	:	STD_LOGIC;
		SIGNAL 	op7	:	STD_LOGIC;
		SIGNAL 	op8	:	STD_LOGIC;
		SIGNAL 	op9	:	STD_LOGIC;
		SIGNAL 	op10	:	STD_LOGIC;
		SIGNAL 	op11	:	STD_LOGIC;
		SIGNAL 	op12	:	STD_LOGIC;
		SIGNAL 	op13	:	STD_LOGIC;
		SIGNAL 	op14	:	STD_LOGIC;
		SIGNAL 	op15	:	STD_LOGIC;
BEGIN

   s(0) <= (A(0) AND B(0));
	
	op1 <= (A(1) AND B(0));
	op2 <= (A(0) AND B(1));
	multi_4_1_0: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op1,
					B		=> op2,
					Ci		=> Ci,
					s		=> s(1),
					Co		=> p0);
	
   op3 <= (A(1) AND B(1));
	op4 <= (A(2) AND B(0));	
	multi_4_1_1: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op3,
					B		=> op4,
					Ci		=> p0,
					s		=> s1,
					Co		=> p1);
	
	op15 <= (A(0) AND B(2));	
	full_4_1_1_2: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op15,
					B		=> s1,
					Ci		=> Ci2,
					s		=> s(2),
					Co		=> p00);
					
	op5 <= (A(2) AND B(1));
	op6 <= (A(3) AND B(0));
	full_4_1_3: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op5,
					B		=> op6,
					Ci		=> p1,
					s		=> s2,
					Co		=> p2);
					
	op7 <= (A(1) AND B(2));
	full_4_1_1_3: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op7,
					B		=> s2,
					Ci		=> p00,
					s		=> s3,
					Co		=> p11);
					
	op8 <= (A(0) AND B(3));
	full_4_1_2_3: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op8,
					B		=> s3,
					Ci		=> Ci3,
					s		=> s(3),
					Co		=> p000);
					
	op9 <= (A(3) AND B(1));
	op10 <= (A(2) AND B(2));
	full_4_1_4: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op9,
					B		=> op10,
					Ci		=> p2,
					s		=> s4,
					Co		=> p3);
					
	op11 <= (A(1) AND B(3));
	full_4_1_1_4: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op11,
					B		=> s4,
					Ci		=> p11,
					s		=> s5,
					Co		=> p22);
					
	full_4_1_2_4: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> s5,
					B		=> '0',
					Ci		=> p000,
					s		=> s(4),
					Co		=> p111);
					
	op12 <= (A(3) AND B(2));
	op13 <= (A(2) AND B(3));
	full_4_1_5: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op12,
					B		=> op13,
					Ci		=> p3,
					s		=> s6,
					Co		=> p4);
					
	full_4_1_1_5: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> s6,
					B		=> p22,
					Ci		=> p111,
					s		=> s(5),
					Co		=> p222);
					
	op14 <= (A(3) AND B(3));
	full_4_1_6: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> op14,
					B		=> p4,
					Ci		=> p222,
					s		=> s(6),
					Co		=> s(7));
					
END ARCHITECTURE functional;