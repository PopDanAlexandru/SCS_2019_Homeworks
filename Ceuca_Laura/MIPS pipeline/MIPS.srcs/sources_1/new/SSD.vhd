library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SSD is
port(   digits: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		clk: in STD_LOGIC;
		an: out STD_LOGIC_VECTOR(3 DOWNTO 0);
		cat: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end SSD;

architecture Behavioral of SSD is

signal countSSD: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal mux_out:STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

process(clk)
begin
	if rising_edge(clk) then
		countSSD<=countSSD+1;
		end if;
end process;

process(countSSD(15 downto 0),digits)
begin
	case (countSSD(15 downto 14)) is
		when "00" => mux_out <= digits(3 downto 0); 
						an<="1110";
		when "01" => mux_out <= digits(7 downto 4); 
						an<="1101";
		when "10" => mux_out <= digits(11 downto 8); 
						an<="1011";
		when "11" => mux_out <= digits(15 downto 12); 
						an<="0111";
		when others => mux_out<="0000";
					an <="1111";
	end case;
end process;

   with mux_out Select
   cat<= "1111001" when "0001",  
         "0100100" when "0010",   
         "0110000" when "0011",   
         "0011001" when "0100",   
         "0010010" when "0101",   
         "0000010" when "0110",   
         "1111000" when "0111",  
         "0000000" when "1000",  
         "0010000" when "1001",   
         "0001000" when "1010",   
         "0000011" when "1011",  
         "1000110" when "1100",   
         "0100001" when "1101",   
         "0000110" when "1110",   
         "0001110" when "1111",  
         "1000000" when others;   
 			
end Behavioral;
