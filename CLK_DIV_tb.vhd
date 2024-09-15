library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clkdiv_tb is
end clkdiv_tb;

architecture Behavioral of clkdiv_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component clkdiv
        Port (
            clk_in  : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            clk_out : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal clk_in  : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';

    -- Outputs
    signal clk_out : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: clkdiv
        Port map (
            clk_in => clk_in,
            reset => reset,
            clk_out => clk_out
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk_in <= '0';
        wait for clk_period/2;
        clk_in <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 20 ns.
        wait for 20 ns;  
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Let the simulation run for a sufficient amount of time to observe clk_out
        wait for 500 ms;  -- Adjust this time as necessary to see enough clk_out cycles

        -- End of simulation
        wait;
    end process;

end Behavioral;
