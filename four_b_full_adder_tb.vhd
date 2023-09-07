LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_full_adder_tb IS
END ENTITY four_b_full_adder_tb;
------------------------------------------
ARCHITECTURE testbench OF four_b_full_adder_tb IS
	SIGNAL   A_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	B_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	Ci_tb	 :	STD_LOGIC := '0';
	SIGNAL	s_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	Co_tb	 :	STD_LOGIC;
BEGIN
	
	A_tb <= "0001" AFTER 200ns,
			  "0010" AFTER 400ns,
			  "0011" AFTER 600ns,
			  "0100" AFTER 800ns,
			  "0101" AFTER 1000ns,
			  "0110" AFTER 1200ns,
			  "0111" AFTER 1400ns,
			  "1000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "1010" AFTER 2000ns,
			  "1011" AFTER 2200ns,
			  "1100" AFTER 2400ns,
			  "1101" AFTER 2600ns,
			  "1110" AFTER 2800ns,
			  "1111" AFTER 3000ns;
	
	B_tb <= "0001" AFTER 200ns,
			  "0010" AFTER 400ns,
			  "0011" AFTER 600ns,
			  "0100" AFTER 800ns,
			  "0101" AFTER 1000ns,
			  "0110" AFTER 1200ns,
			  "0111" AFTER 1400ns,
			  "1000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "1010" AFTER 2000ns,
			  "1011" AFTER 2200ns,
			  "1100" AFTER 2400ns,
			  "1101" AFTER 2600ns,
			  "1110" AFTER 2800ns,
			  "1111" AFTER 3000ns;
	

					
	full_adder: ENTITY work.four_b_full_adder
	PORT MAP	(	A		=> A_tb,
					B		=> B_tb,
					Ci		=> Ci_tb,
					s		=> s_tb,
					Co		=> Co_tb);
					
END ARCHITECTURE testbench;