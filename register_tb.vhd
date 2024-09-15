library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerr_tb is
end registerr_tb;

architecture Behavioral of registerr_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component registerr
        Port (
            Clk     : in  STD_LOGIC;
            Reset   : in  STD_LOGIC;
            Enable  : in  STD_LOGIC;
            SW      : in  STD_LOGIC_VECTOR(11 downto 0);
            RegOut  : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    -- Inputs
    signal Clk     : STD_LOGIC := '0';
    signal Reset   : STD_LOGIC := '0';
    signal Enable  : STD_LOGIC := '0';
    signal SW      : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

    -- Outputs
    signal RegOut  : STD_LOGIC_VECTOR(11 downto 0);

    -- Clock period definition
    constant Clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: registerr
        Port map (
            Clk => Clk,
            Reset => Reset,
            Enable => Enable,
            SW => SW,
            RegOut => RegOut
        );

    -- Clock process definitions
    Clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 20 ns.
        wait for 20 ns;  
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        
        -- Add stimulus here
        -- Test case 1: Enable is '0', SW changes but RegOut should not change
        SW <= "101010101010";
        wait for 20 ns;
        Enable <= '0';
        wait for 20 ns;
        
        -- Test case 2: Enable is '1', SW changes and RegOut should change
        Enable <= '1';
        wait for 20 ns;
        SW <= "010101010101";
        wait for 20 ns;
        
        -- Test case 3: Assert Reset, RegOut should reset to '0's
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        wait for 20 ns;
        
        -- Test case 4: Disable enable, SW changes but RegOut should not change
        Enable <= '0';
        wait for 20 ns;
        SW <= "111111111111";
        wait for 20 ns;
        
        -- Test case 5: Enable again, SW changes and RegOut should change
        Enable <= '1';
        wait for 20 ns;
        SW <= "000000000000";
        wait for 20 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
