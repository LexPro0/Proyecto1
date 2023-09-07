LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_full_adder_sub IS
	PORT(		A		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				B		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				Ci		:	IN		STD_LOGIC;
				BNA	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				BNB	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
				s		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY four_b_full_adder_sub;
------------------------------------------
ARCHITECTURE best OF four_b_full_adder_sub IS
		SIGNAL 	p0		:	STD_LOGIC;
		SIGNAL 	p1		:	STD_LOGIC;
		SIGNAL 	p2		:	STD_LOGIC;
		SIGNAL 	p3		:	STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL 	sum	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL 	sg 	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
		SIGNAL 	pci	:	STD_LOGIC;
		SIGNAL 	p4		:	STD_LOGIC;
BEGIN
   
	sg <= "111" WHEN ((BNB > BNA) AND (Ci = '1')) ELSE "000";
	
	p3(0) <= (B(0) XOR Ci);
	p3(1) <= (B(1) XOR Ci);
	p3(2) <= (B(2) XOR Ci);
	p3(3) <= (B(3) XOR Ci);

	full_4_1_0: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(0),
					B		=> p3(0),
					Ci		=> Ci,
					s		=> sum(0),
					Co		=> p0);
					
	full_4_1_1: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(1),
					B		=> p3(1),
					Ci		=> p0,
					s		=> sum(1),
					Co		=> p1);
	
	full_4_1_2: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(2),
					B		=> p3(2),
					Ci		=> p1,
					s		=> sum(2),
					Co		=> p2);
					
	full_4_1_3: ENTITY work.one_b_full_adder
	PORT MAP	(	A		=> A(3),
					B		=> p3(3),
					Ci		=> p2,
					s		=> sum(3),
					Co		=> p4);
					
	s <= (sg & '1' & sum) WHEN ((Ci = '1') AND (BNB > BNA)) ELSE
        (sg & '0' & sum) WHEN ((Ci = '1') AND (BNB < BNA)) ELSE
	     (sg & p4 & sum)  WHEN  (Ci = '0') ELSE
		  ("00000000") WHEN ((A = "0000") AND (B = "0000")) ELSE
		  ("00000000") WHEN ((Ci = '1') AND (BNB = BNA));
 
END ARCHITECTURE best;