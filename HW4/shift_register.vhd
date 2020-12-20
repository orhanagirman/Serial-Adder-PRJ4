----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:08 08/10/2020 
-- Design Name: 
-- Module Name:    shift_register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_register is
    generic (
	          sr_depth : integer:=9
	 ); 
    Port ( clk : in  STD_LOGIC;
			  load : in  STD_LOGIC;
			  en : in STD_LOGIC;
			  S_sr: in STD_LOGIC_VECTOR (7 downto 0);
			  sr_port : out STD_LOGIC_VECTOR (sr_depth - 2 downto 0));
end shift_register;

architecture Behavioral of shift_register is

signal sr : STD_LOGIC_VECTOR(sr_depth - 2 downto 0);

begin
	 process(clk,load,sr,S_sr)
	 begin 	
			if (load = '1') and (en = '0') then
				 sr<= S_sr;		 
         elsif (en = '1') and (load = '0') then		 
				 if rising_edge (clk) then
					 sr <=  '0' & sr(sr'high downto sr'low + 1) ;
				 end if;
			end if;	 	  
	 end process;
	 sr_port <= sr;
		  
		  


end Behavioral;

