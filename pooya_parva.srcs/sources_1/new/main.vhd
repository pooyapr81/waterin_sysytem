----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2024 04:52:29 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port (	
    clock, reset, T_i, L_i : IN std_logic;
	M_i : IN std_logic_vector (2 DOWNTO 0);
	seg_O : OUT std_logic_vector (6 DOWNTO 0);
	T_o, L_o : OUT std_logic;
	M_o : OUT std_logic_vector (2 DOWNTO 0);
	water : OUT std_logic
	);
end main;

architecture Behavioral of main is
	COMPONENT seg
		PORT (
			display : IN std_logic;
			seg: OUT std_logic_vector ( 6 DOWNTO 0)
		);
		END COMPONENT;
			Type state_string is (ST0, ST1);
	ATTRIBUTE enum_encoding : string;
	ATTRIBUTE enum_encoding OF state_string : type is "00 01";
	Signal present_state, next_state : state_string;
	Signal seg_input : std_logic := '0';
begin
seg_device : seg PORT MAP (display => seg_input, seg => seg_O);
	
	process1 : PROCESS (clock, reset, next_state)

		BEGIN
			IF (reset = '1') THEN
				 present_state <= ST0;
			ELSIF (clock'EVENT and clock = '1') THEN
				present_state <= next_state; 
				IF present_state = ST1 then
					water <= '1';	  
					seg_input <= '1';
				ELSE
					water <= '0';	 
					seg_input <= '0';
				END IF;
			END IF;
	END PROCESS process1;


	process2 : PROCESS (M_i, L_i, T_i , present_state)
		BEGIN
			CASE present_state IS
				WHEN ST0 =>
					IF (T_i = '1' or L_i = '1') and (M_i <= "001") THEN
						 next_state <= ST1; 
					ELSIF (T_i = '0' and L_i = '0') and (M_i <= "011") THEN
						 next_state <= ST1; 
					ELSE 
						next_state <= ST0;
					END IF;

				WHEN ST1 =>
					IF (M_i >= "111") THEN
						 next_state <= ST0; 
					ELSIF (T_i = '1' or L_i = '1') and (M_i >= "011") THEN
						 next_state <= ST0;
					ELSE 
						next_state <= ST1;
					END IF;
				WHEN OTHERS =>
					next_state <= ST1;
			END CASE;
	END PROCESS process2;
	

	M_o <= M_i;
	T_o <= T_i;
	L_o <= L_i;
end Behavioral;
