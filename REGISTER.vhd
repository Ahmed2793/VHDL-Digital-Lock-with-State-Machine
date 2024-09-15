library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAGISTER is
    Port (
        clk    : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        d      : in  STD_LOGIC_VECTOR (11 downto 0);
        q      : out STD_LOGIC_VECTOR (11 downto 0)
    );
end RAGISTER;

architecture Behavioral of RAGISTER is
 signal q1     : STD_LOGIC_VECTOR (11 downto 0) ;


begin
    process(clk,enable, reset)
    begin
    
    if reset = '0' then
        if   enable = '1' and rising_edge(clk) then
        q<=d;
        end if;
elsif reset='1' then
q<=q1;
        end if;

    end process;

 
end Behavioral;
