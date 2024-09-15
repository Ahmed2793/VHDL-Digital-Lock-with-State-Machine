library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CLK_DIV is
    Port ( reset,clk : in  STD_LOGIC;
           clk_out : out STD_LOGIC);
end CLK_DIV;

architecture Behavioral of CLK_DIV is
    signal counter : integer range 0 to 49999999 := 0; -- for 100MHz clock
    signal clk_1hz : STD_LOGIC := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) and reset ='0' then
            if counter = 49999999 then
                clk_1hz <= not clk_1hz;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_1hz ;
end Behavioral;
