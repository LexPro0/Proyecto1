LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_multi_tb IS
END ENTITY four_b_multi_tb;
------------------------------------------
ARCHITECTURE testbench OF four_b_multi_tb IS
	SIGNAL   A_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	B_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	Ci_tb	 :	STD_LOGIC := '0';
	SIGNAL	Ci2_tb :	STD_LOGIC := '0';
	SIGNAL	Ci3_tb :	STD_LOGIC := '0';
	SIGNAL	s_tb	 :	STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	
	A_tb <= "0001" AFTER 200ns,
			  "0101" AFTER 400ns,
			  "0010" AFTER 600ns,
			  "0001" AFTER 800ns,
			  "1000" AFTER 1000ns,
			  "1001" AFTER 1200ns,
			  "0011" AFTER 1400ns,
			  "1001" AFTER 1600ns,
			  "0111" AFTER 1800ns,
			  "0110" AFTER 2000ns,
			  "0010" AFTER 2200ns;

	
	B_tb <= "0010" AFTER 200ns,
	        "0100" AFTER 400ns,
			  "0110" AFTER 600ns,
			  "0001" AFTER 800ns,
			  "1000" AFTER 1000ns,
			  "1001" AFTER 1200ns,
			  "0111" AFTER 1400ns,
			  "0000" AFTER 1600ns,
			  "0111" AFTER 1800ns,
			  "0101" AFTER 2000ns,
			  "0100" AFTER 2200ns;
	

					
	multi: ENTITY work.four_b_multi
	PORT MAP	(	A		=> A_tb,
					B		=> B_tb,
					Ci		=> Ci_tb,
					Ci2	=> Ci2_tb,
					Ci3	=> Ci3_tb,
					s		=> s_tb);
					
END ARCHITECTURE testbench;