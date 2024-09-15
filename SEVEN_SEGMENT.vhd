library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SEVEN_SEGMENT is
port(
numin :in STD_LOGIC_VECTOR (3 downto 0); 
segout : out STD_LOGIC_VECTOR (6 downto 0)
);
end SEVEN_SEGMENT;
architecture Behavioral of SEVEN_SEGMENT is
begin
 segout(6) <= (numin(3) and numin(1)) or (numin(3) and numin(2))or (not(numin(3)) and not(numin(2))and not(numin(1))and numin(0))or (numin(2) and not(numin(1))and not(numin(0)));
 segout(5)<=(numin(3) and numin(2)) or (numin(2) and not(numin(1))and numin(0)) or (numin(2) and numin(1)and not(numin(0))) or (numin(3) and numin(1));
 segout(4)<=(numin(3) and numin(2)) or (numin(3) and not(numin(2))and numin(1)) or (not(numin(2)) and numin(1)and not(numin(0)));
 segout(3)<=(numin(3) and numin(2)) or (numin(2) and numin(1)and numin(0)) or (numin(3) and numin(1)) or (not(numin(3)) and not(numin(2))and not(numin(1))and numin(0))or (numin(2) and not(numin(1))and not(numin(0)));
segout(2)<=(numin(3) and numin(1)) or (numin(2) and not(numin(1))) or (numin(0));
segout(1)<=(numin(3) and numin(2)) or (numin(1) and not(numin(2))) or (numin(1) and numin(0)) or (not(numin(3)) and not(numin(2)) and numin(0)) ;
segout(0)<=(numin(3) and numin(1)) or(numin(3) and numin(2)) or(numin(2) and numin(1) and numin(0) ) or  (not(numin(3)) and not(numin(2))and not(numin(1))) ;
   
end Behavioral;