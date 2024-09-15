library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SM is
-- No ports in testbench
end TB_SM;

architecture Behavioral of TB_SM is

    -- Component Declaration for the Unit Under Test (UUT)
    component SM
        Port ( start    : in  STD_LOGIC;
               reset    : in  STD_LOGIC;
               clk      : in  STD_LOGIC;
               f        : in  STD_LOGIC_VECTOR (11 downto 0);
               success  : out STD_LOGIC_VECTOR (11 downto 0);
               led      : out STD_LOGIC_VECTOR (11 downto 0);
               error    : out STD_LOGIC );
    end component;

    -- Signals for connecting to the UUT
    signal start   : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal clk     : STD_LOGIC := '0';
    signal f       : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal success : STD_LOGIC_VECTOR (11 downto 0);
    signal led     : STD_LOGIC_VECTOR (11 downto 0);
    signal error   : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: SM PORT MAP (
        start    => start,
        reset    => reset,
        clk      => clk,
        f        => f,
        success  => success,
        led      => led,
        error    => error
    );

    -- Clock generation
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Reset the system
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Test case 2: Apply a matching vector
        start <= '1';
        f <= "000010010100";  -- This matches ps signal in SM
        wait for 20 ns;
        start <= '0';
        wait for 40 ns;

        -- Test case 3: Apply a non-matching vector
        start <= '1';
        f <= "000010010101";  -- This does not match ps signal in SM
        wait for 20 ns;
        start <= '0';
        wait for 40 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
