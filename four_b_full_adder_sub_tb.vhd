LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY four_b_full_adder_sub_tb IS
END ENTITY four_b_full_adder_sub_tb;
------------------------------------------
ARCHITECTURE testbench OF four_b_full_adder_sub_tb IS
	SIGNAL   A_tb	    :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	B_tb	    :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	Ci_tb	    :	STD_LOGIC := '0';
	SIGNAL	s_tb	    :	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	BNA_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL	BNB_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	
	Ci_tb <= '1' AFTER 1600ns;
	
	A_tb <= "1001" AFTER 200ns,
			  "0010" AFTER 400ns,
			  "0111" AFTER 600ns,
			  "0100" AFTER 800ns,
			  "0011" AFTER 1000ns,
			  "1000" AFTER 1200ns,
			  "0000" AFTER 1400ns,
			  "0000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "0010" AFTER 2000ns,
			  "0111" AFTER 2200ns,
			  "0100" AFTER 2400ns,
			  "0011" AFTER 2600ns,
			  "1000" AFTER 2800ns,
			  "0000" AFTER 3000ns;
	
	B_tb <= "1001" AFTER 200ns,
			  "0011" AFTER 400ns,
			  "1000" AFTER 600ns,
			  "0110" AFTER 800ns,
			  "0001" AFTER 1000ns,
			  "0101" AFTER 1200ns,
			  "1001" AFTER 1400ns,
			  "0000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "0011" AFTER 2000ns,
			  "1000" AFTER 2200ns,
			  "0110" AFTER 2400ns,
			  "0001" AFTER 2600ns,
			  "0101" AFTER 2800ns,
			  "1001" AFTER 3000ns;

					
	multi: ENTITY work.four_b_full_adder_sub
	PORT MAP	(	A		=> A_tb,
					B		=> B_tb,
					Ci		=> Ci_tb,
					BNA   => BNA_tb,
					BNB   => BNB_tb,
					s		=> s_tb);
					
END ARCHITECTURE testbench;