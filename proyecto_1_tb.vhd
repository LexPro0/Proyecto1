LIBRARY IEEE;
USE ieee.std_logic_1164.all;
------------------------------------------
ENTITY proyecto_1_tb IS
END ENTITY proyecto_1_tb;
------------------------------------------
ARCHITECTURE testbench OF proyecto_1_tb IS
	SIGNAL   binA_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	binB_tb	 :	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL	psum_tb	 :	STD_LOGIC := '1';
	SIGNAL	pmul_tb	 :	STD_LOGIC := '1';
	SIGNAL	sseA_tb	 :	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	sseB_tb	 :	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	sseC_tb	 :	STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL	sseD_tb	 :	STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	
	psum_tb <= '0' AFTER 1600ns;
	pmul_tb <= '0' AFTER 3200ns;
	
	binA_tb <= "1001" AFTER 200ns,
			  "0010" AFTER 400ns,
			  "0111" AFTER 600ns,
			  "0100" AFTER 800ns,
			  "0011" AFTER 1000ns,
			  "1000" AFTER 1200ns,
			  "0000" AFTER 1400ns,
			  "0000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "0010" AFTER 2000ns,
			  "0010" AFTER 2200ns,
			  "0100" AFTER 2400ns,
			  "0011" AFTER 2600ns,
			  "1000" AFTER 2800ns,
			  "0000" AFTER 3000ns,
			  "0001" AFTER 3200ns,
			  "0101" AFTER 3400ns,
			  "0010" AFTER 3600ns,
			  "0001" AFTER 3800ns,
			  "1000" AFTER 4000ns,
			  "1001" AFTER 4200ns,
			  "0011" AFTER 4400ns,
			  "1001" AFTER 4600ns;
	
	binB_tb <= "1001" AFTER 200ns,
			  "0011" AFTER 400ns,
			  "1000" AFTER 600ns,
			  "0110" AFTER 800ns,
			  "0001" AFTER 1000ns,
			  "0101" AFTER 1200ns,
			  "1001" AFTER 1400ns,
			  "0000" AFTER 1600ns,
			  "1001" AFTER 1800ns,
			  "0011" AFTER 2000ns,
			  "0010" AFTER 2200ns,
			  "0110" AFTER 2400ns,
			  "0001" AFTER 2600ns,
			  "0101" AFTER 2800ns,
			  "1001" AFTER 3000ns,
			  "0010" AFTER 3200ns,
	        "0100" AFTER 3400ns,
			  "0110" AFTER 3600ns,
			  "0001" AFTER 3800ns,
			  "1000" AFTER 4000ns,
			  "1001" AFTER 4200ns,
			  "0111" AFTER 4400ns,
			  "0000" AFTER 4600ns;

					
	proyect: ENTITY work.proyecto_1
	PORT MAP	(	binA		=> binA_tb,
					binB		=> binB_tb,
					psum     => psum_tb,
			      pmul     => pmul_tb,
			      ssegA_o  => sseA_tb,
			      ssegB_o  => sseB_tb,
			      ssegC_o  => sseC_tb,
			      ssegD_o  => sseD_tb);
					
END ARCHITECTURE testbench;