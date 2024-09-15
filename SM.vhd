library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SM is
 Port (start:     in STD_LOGIC;
       reset:     in STD_LOGIC;
       clk:       IN STD_LOGIC;
        f :       in STD_LOGIC_VECTOR (11 downto 0);
        success:  out STD_LOGIC_VECTOR (11 downto 0);
        led :     out STD_LOGIC_VECTOR (11 downto 0);
        error  :  OUT STD_LOGIC

        ); 
end SM;

architecture Behavioral of SM is
    signal ps: STD_LOGIC_VECTOR (11 downto 0) := "000010010100";
signal led12     : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
 signal led_temp     : STD_LOGIC_VECTOR (11 downto 0):= (others => '0') ;
 signal led_reset     : STD_LOGIC_VECTOR (11 downto 0):= (others => '0') ;

signal led1     : STD_LOGIC_VECTOR (11 downto 0) ;
begin
    process(clk, reset)
    begin
        if reset = '1'  then
            led12 <= led_reset;
            error <= '0';
             led_temp<=led_reset;

        else 
            if start = '1' then
                error <= '0';
                for i in 11 downto 0 loop
               
                    if f(i) /= ps(i)  then
                        error <= '1';
                        exit;  -- Exit the loop on the first mismatch
                    else
                       led_temp(i)<=f(i);
                        led12(i) <= '1';

                    end if;
                     
                    
                  
                end loop;
            end if;
        end if;
      
    end process;

 success<=led_temp;
    led <= led12;

end Behavioral;