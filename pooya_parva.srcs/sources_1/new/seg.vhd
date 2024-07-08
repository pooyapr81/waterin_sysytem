----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/06/2024 02:29:27 PM
-- Design Name: 
-- Module Name: seg - Behavioral
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

--Seven Segment LED
entity seg is
    Port ( display : in STD_LOGIC;
           seg : out STD_LOGIC_vector(6 downto 0));
end seg;

architecture Behavioral of seg is

begin
		seg <= "1001000" WHEN display = '1' ELSE
			"1111110";

end Behavioral;
