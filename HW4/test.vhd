--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:36:42 08/10/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/yeni/homework4/test.vhd
-- Project Name:  homework4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: homework4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT homework4
    PORT(
         clock : IN  std_logic;
			resetn : IN  STD_LOGIC;
         load_fsm : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
	signal resetn : in  STD_LOGIC:= '0'; 
   signal load_fsm : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal sum : std_logic_vector(8 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: homework4 PORT MAP (
          clock => clock,
			 resetn => resetn;
          load_fsm => load_fsm,
          A => A,
          B => B,
          sum => sum
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		resetn<='1';
		load_fsm<= '0';
		A<="10011101";
		B<="11100111";
      wait for 100 ns;
      resetn<='0';		
		load_fsm<= '1';
		A<="10011101";
		B<="11100111";

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
