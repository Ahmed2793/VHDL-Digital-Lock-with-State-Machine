library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_tb is
end seven_segment_tb;

architecture test_gate of seven_segment_tb is
    component SEVEN_SEGMENT is
        port (
            numin  : in STD_LOGIC_VECTOR (3 downto 0); 
            segout : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal numin_t : std_logic_vector(3 downto 0) := "0000";
    signal F_t : std_logic_vector(6 downto 0);
begin
    UUT: SEVEN_SEGMENT port map (
        numin  => numin_t,
        segout => F_t
    );

    process begin
        numin_t <= "0000";
        wait for 1 ns;
        numin_t <= "0001";
        wait for 1 ns;
        numin_t <= "0010";
        wait for 1 ns;
        numin_t <= "0011";
        wait for 1 ns;
        numin_t <= "0100";
        wait for 1 ns;
        numin_t <= "0101";
        wait for 1 ns;
        numin_t <= "0110";
        wait for 1 ns;
        numin_t <= "0111";
        wait for 1 ns;
        numin_t <= "1000";
        wait for 1 ns;
        numin_t <= "1001";
        wait for 1 ns;
        numin_t <= "1010";
        wait for 1 ns;
        numin_t <= "1011";
        wait for 1 ns;
        numin_t <= "1100";
        wait for 1 ns;
        numin_t <= "1101";
        wait for 1 ns;
        numin_t <= "1110";
        wait for 1 ns;
        numin_t <= "1111";
        wait;
    end process;
end test_gate;
