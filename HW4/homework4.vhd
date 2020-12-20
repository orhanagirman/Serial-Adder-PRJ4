----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:46:38 08/10/2020 
-- Design Name: 
-- Module Name:    homework4 - Behavioral 
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

entity homework4 is
    Port ( clock : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           start : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (8 downto 0));
end homework4;

architecture Behavioral of homework4 is

component shift_register
    generic (
	          sr_depth : integer:=9
	 ); 
    Port ( clk : in  STD_LOGIC;
			  load : in  STD_LOGIC;
			  en : in STD_LOGIC;
			  S_sr: in STD_LOGIC_VECTOR (7 downto 0);
			  sr_port : out STD_LOGIC_VECTOR (sr_depth - 2 downto 0));
end component;	

component shift_register2
    generic (
	          sr_depth : integer:=10
	 ); 
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  en : in STD_LOGIC;
			  S_sr: in STD_LOGIC;
			  sr_port : out STD_LOGIC_VECTOR (sr_depth - 2 downto 0));
end component;	

component full_adder
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

component dff
	Port ( clk : in  STD_LOGIC;
			 rst : in  STD_LOGIC;
			 en : in STD_LOGIC;
			 d : in  STD_LOGIC;
			 q : out  STD_LOGIC);
end component;				  



signal en_fsm : STD_LOGIC;
signal load_fsm : STD_LOGIC;
signal sr_out1 : STD_LOGIC_VECTOR (7 downto 0);
signal sr_out2 : STD_LOGIC_VECTOR (7 downto 0);
signal sr_out3 : STD_LOGIC_VECTOR (8 downto 0);
signal fas_port : STD_LOGIC;
signal fac_port : STD_LOGIC;
signal q_dff : STD_LOGIC;

type state_type IS(reset, load, enable);
signal state: state_type;

		  
begin

sr1 : shift_register port map (clk => clock, load => load_fsm, en => en_fsm, S_sr => A, sr_port => sr_out1);
sr2 : shift_register port map (clk => clock, load => load_fsm, en => en_fsm, S_sr => B, sr_port => sr_out2);
fa : full_adder port map ( a=> sr_out1(0), b=> sr_out2(0), cin => q_dff, s => fas_port, cout => fac_port);
df : dff port map (clk => clock, rst => not resetn, en => en_fsm,d =>fac_port, q => q_dff);
sr3 : shift_register2 port map (clk => clock, rst => resetn, en => en_fsm, S_sr => fas_port, sr_port => sr_out3);

     process(clock,resetn,start)
	  begin
	       if (resetn = '1') then
			    state <= reset;
				 load_fsm <= '0';
				 en_fsm <= '0';
				 
			 elsif rising_edge(clock) then
             case state is
                   when reset => 
						            if start = '1' then
										    state <= load;
											 load_fsm <= '1';
										end if;
                   when load => 
						            if start = '1' then
										    state <= enable;
											 en_fsm <= '1';
											 load_fsm <= '0';
										end if;
						 when enable => 
						            if start = '1' then
										    state <= enable;
											 en_fsm <= '1';
											 load_fsm <= '0';
										end if;				
						 when others =>
                        		state <= reset;				 
				 end case;
          end if;				
      end process;
      sum <= sr_out3;		
                    										
	 					       


end Behavioral;

