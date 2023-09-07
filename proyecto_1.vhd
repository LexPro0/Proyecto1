LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------
ENTITY proyecto_1 IS
   PORT( binA   :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			binB   :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			psum   :  IN  STD_LOGIC;
			pmul   :  IN  STD_LOGIC;
			ssegA_o : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegB_o : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegC_o : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegD_o : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY proyecto_1;
----------------------------------------------------------
ARCHITECTURE behaviour OF proyecto_1 IS
   SIGNAL comp1  : STD_LOGIC;
	SIGNAL comp2  : STD_LOGIC;
	SIGNAL ssegA  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL ssegB  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL mux1o  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL mux2o  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL ad_s_o : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL sg_ad  : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL Ci_m	  : STD_LOGIC := '0';
	SIGNAL Ci2_m  : STD_LOGIC := '0';
	Signal Ci3_m  : STD_LOGIC := '0';
	SIGNAL mul_so : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL s_t_de : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL bcd1_o : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL bcd2_o : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL bcd3_o : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL ssegC  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL ssegD  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL compf  : STD_LOGIC;
	SIGNAL mux3o  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL mux4o  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL p_sum  : STD_LOGIC;
	SIGNAL sel    : STD_LOGIC;
	SIGNAL y1_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL y2_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
	

BEGIN

  sseg_3 : ENTITY work.bin_to_sseg_nine_1
  PORT MAP(  bin_1  => binA,
             sseg_1 => ssegA);
  
  sseg_2 : ENTITY work.bin_to_sseg_nine_1
  PORT MAP(  bin_1  => binB,
             sseg_1 => ssegB);
				 
  comparator: ENTITY work.four_bit_comparator
  PORT MAP(  x  => binA,
             eq => comp1);
  
  comparator2: ENTITY work.four_bit_comparator
  PORT MAP(  x  => binB,
             eq => comp2);  
  
  mux1: ENTITY work.mux2_1_with_select
  PORT MAP(  x1  => ssegA,
             sel => comp1,
				 y   => ssegA_o);
				 
  mux2: ENTITY work.mux2_1_with_select
  PORT MAP(  x1  => ssegB,
             sel => comp2,
				 y   => ssegB_o);
  
  sel <= '1' WHEN ((psum = '0') AND (binB > binA)) ELSE '0';
  inversion: ENTITY work.muxes_inversor
  PORT MAP(  x1_1  => binA,
             x2_2  => binB,
				 sel_1 => sel,
				 y1    => y1_out,
				 y2    => y2_out);
  
  p_sum <= (NOT psum);
  add_sub: ENTITY work.four_b_full_adder_sub
  PORT MAP(  A   => y1_out,
             B   => y2_out,
			    Ci  => p_sum,
				 BNA => binA,
				 BNB => binB,
				 s   => ad_s_o);
				 
  multi: ENTITY work.four_b_multi
  PORT MAP(  A   => binA,
             B   => binB,
			    Ci  => Ci_m,
				 Ci2 => Ci2_m,
				 Ci3 => Ci3_m,
				 s   => mul_so);
				 
  selection: ENTITY work.mux2_1_with_select_2
  PORT MAP(  x1  => ad_s_o,
	          x2  => mul_so,
             sel => pmul,
				 y   => s_t_de);
				 
  descomposicion: ENTITY work.bin_to_bcd2
  PORT MAP(  Res  => s_t_de,
  				 bcd1 => bcd1_o,
  			    bcd2 => bcd2_o);
				 
  bcd_t_sseg1: ENTITY work.bin_to_sseg_nine_2
  PORT MAP(  bin_1  => bcd2_o,
             sseg_1 => ssegC);
  
  bcd_t_sseg2: ENTITY work.bin_to_sseg_nine_1
  PORT MAP(  bin_1  => bcd1_o,
             sseg_1 => ssegD);
				 
  compf <= (comp1 AND comp2);
  
  mux3: ENTITY work.mux2_1_with_select
  PORT MAP(  x1  => ssegC,
             sel => compf,
				 y   => ssegC_o);
				 
  mux4: ENTITY work.mux2_1_with_select
  PORT MAP(  x1  => ssegD,
             sel => compf,
				 y   => ssegD_o);
				 
				 
END ARCHITECTURE behaviour;