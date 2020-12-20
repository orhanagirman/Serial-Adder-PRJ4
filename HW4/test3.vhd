--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:12:12 08/10/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/yeni/homework4/test3.vhd
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
 
ENTITY test3 IS
END test3;
 
ARCHITECTURE behavior OF test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT homework4
    PORT(
         clock : IN  std_logic;
         resetn : IN  std_logic;
         start : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal resetn : std_logic := '0';
   signal start : std_logic := '0';
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
          resetn => resetn,
          start => start,
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
		A <= "11101101";
		B <= "10100111";
      resetn<='1';
      start<='0';		
      wait for 50 ns;
		A <= "11101101";
		B <= "10100111";
		resetn<='0';
		start<='1';
		wait for 300 ns;
		A <= "11101101";
		B <= "10100111";
		resetn<='1';
		start<='0';
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
