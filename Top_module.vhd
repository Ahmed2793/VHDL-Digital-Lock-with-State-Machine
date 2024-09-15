library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Module is
    Port (
        reset   : in  STD_LOGIC;
        clk     : in  STD_LOGIC;
        clk_out : out STD_LOGIC;
        enable  : in  STD_LOGIC;
        start   : in  STD_LOGIC;
        d       : in  STD_LOGIC_VECTOR (11 downto 0);
        an      : out  STD_LOGIC_VECTOR (3 downto 0);
        led     : out STD_LOGIC_VECTOR (11 downto 0);
        error   : out STD_LOGIC;
        segout  : out STD_LOGIC_VECTOR (6 downto 0)
     
    );
end Top_Module;

architecture Behavioral of Top_Module is
type state_type is (digit1, digit2, digit3);
    signal state: state_type := digit1;
     signal segout0 :  STD_LOGIC_VECTOR (6 downto 0);
     signal segout1 :  STD_LOGIC_VECTOR (6 downto 0);
    signal   segout2 :  STD_LOGIC_VECTOR (6 downto 0);
    
    component RAGISTER is
        Port (
            clk    : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            d      : in  STD_LOGIC_VECTOR (11 downto 0);
            q      : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;
    
    component CLK_DIV is
        Port (
            reset   : in  STD_LOGIC;
            clk     : in  STD_LOGIC;
            clk_out : out STD_LOGIC
        );
    end component;
    
    component SM is
        Port (
            start  : in  STD_LOGIC;
             clk     : in  STD_LOGIC; 
            reset  : in  STD_LOGIC;
            f      : in  STD_LOGIC_VECTOR (11 downto 0);
             success:out STD_LOGIC_VECTOR (11 downto 0);
            led    : out STD_LOGIC_VECTOR (11 downto 0);
            error  : out STD_LOGIC
        );
    end component;
    
   component seven_segment is
        Port (
            numin  : in  STD_LOGIC_VECTOR (3 downto 0);
            segout : out STD_LOGIC_VECTOR (6 downto 0)
       );
    end component;
   signal success: STD_LOGIC_VECTOR (11 downto 0);
    signal clk_1hz : STD_LOGIC;
    signal e       : STD_LOGIC;
    signal r0, r1, r2 : STD_LOGIC_VECTOR (3 downto 0); 
    signal qt, r   : STD_LOGIC_VECTOR (11 downto 0);  

begin
    divider : CLK_DIV port map (reset => reset, clk => clk, clk_out => clk_1hz);
    shift_register : RAGISTER port map (clk => clk, enable => enable, reset => reset, d => d, q => qt);
    state_machine : SM port map (start => start, reset => reset,clk => clk_1hz, f => qt, success => success, led => r, error => e);
    
    r0 <= success(11 downto 8);
    r1 <= success(7 downto 4);
    r2 <= success(3 downto 0);
    
    seven0 : seven_segment port map (numin => r0, segout => segout0);
    seven1 : seven_segment port map (numin => r1, segout => segout1);
    seven2 : seven_segment port map (numin => r2, segout => segout2);
    
   
process(clk)
    begin
    
              if rising_edge(clk_1hz) then
            case state is
                when digit1 =>
                    an <= "1011";  -- Enable first digit
                    segout <= segout0;  -- Display '3'
                    state <= digit2;
                when digit2 =>
                    an <= "1101";  -- Enable second digit
                    segout <= segout1;  -- Display '5'
                    state <= digit3;
                when digit3 =>
                    an <= "1110";  -- Enable third digit
                    segout <= segout2;  -- Display '5'
                    state <= digit1;
                when others =>
                    state <= digit1;
                    
            end case;
        end if;
         
    end process;
    clk_out <= clk_1hz;
    error <= e; 
    led <= r;
end Behavioral;