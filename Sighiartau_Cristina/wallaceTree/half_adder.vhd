library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           res : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin

res <= x xor y;
carry <= x and y;

end Behavioral;