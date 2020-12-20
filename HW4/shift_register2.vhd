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

entity shift_register2 is
    generic (
	          sr_depth : integer:=10
	 ); 
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  en : in STD_LOGIC;
			  S_sr: in STD_LOGIC;
			  sr_port : out STD_LOGIC_VECTOR (sr_depth - 2 downto 0));
end shift_register2;

architecture Behavioral of shift_register2 is

signal sr : STD_LOGIC_VECTOR(sr_depth - 2 downto 0);
signal count : STD_LOGIC_VECTOR (3 downto 0):= "1001";

begin
	 process(clk,rst,sr,S_sr,count)
	 begin 	
			if (rst = '1') then
				 sr<= "000000000";		 
         elsif (en = '1') then		 
				 if rising_edge (clk) then
				    if(count/= "0000") then
					    sr <=  S_sr & sr(sr'high downto sr'low + 1) ;
					    count <= count - 1;
					 end if;
				 end if;
			end if;	 	  
	 end process;
	 sr_port <= sr;
		  
		  


end Behavioral;

