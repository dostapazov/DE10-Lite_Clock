-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/29/2020 17:37:31"
                                                            
-- Vhdl Test Bench template for design  :  clock
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY clock_vhd_tst IS
END clock_vhd_tst;
ARCHITECTURE clock_arch OF clock_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ADC_CLK_10 : STD_LOGIC ;
SIGNAL HEX0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT clock
	PORT (
	ADC_CLK_10 : IN STD_LOGIC;
	HEX0 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX1 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX2 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX3 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX4 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX5 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDR : BUFFER STD_LOGIC_VECTOR(9 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : clock
	PORT MAP (
-- list connections between master ports and signals
	ADC_CLK_10 => ADC_CLK_10,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDR => LEDR,
	SW => SW
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
		  ADC_CLK_10 <= '0';
		  for clk in 0 to 10000 loop
			wait for 1ns;
			ADC_CLK_10 <= not ADC_CLK_10;
		  end loop;
WAIT;                                                        
END PROCESS always;                                          
END clock_arch;
