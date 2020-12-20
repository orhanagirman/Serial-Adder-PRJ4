----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:05 08/07/2020 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff is
    Port ( clk : in  STD_LOGIC;
	        rst : in  STD_LOGIC;
			  en : in STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end dff;

architecture Behavioral of dff is

begin
     process(clk,rst,en)
	  begin
	       if (rst='0') then
			     q<='0';
			 elsif (en = '1') then	  
			    if rising_edge (clk) then
                q<=d;
             end if;
			 end if;	 
     end process;			 


end Behavioral;

