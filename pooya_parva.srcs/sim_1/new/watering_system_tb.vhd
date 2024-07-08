library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity main_tb is
end;

architecture bench of main_tb is
constant CLK_PERIOD: time := 10 ns;
  component main
      Port (	
      clock, reset, T_i, L_i : IN std_logic;
  	M_i : IN std_logic_vector (2 DOWNTO 0);
  	seg_O : OUT std_logic_vector (6 DOWNTO 0);
  	T_o, L_o : OUT std_logic;
  	M_o : OUT std_logic_vector (2 DOWNTO 0);
  	water : OUT std_logic
  	);
  end component;

  signal clock, reset, T_i, L_i: std_logic;
  signal M_i: std_logic_vector (2 DOWNTO 0);
  signal seg_O: std_logic_vector (6 DOWNTO 0);
  signal T_o, L_o: std_logic;
  signal M_o: std_logic_vector (2 DOWNTO 0);
  signal water: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: main port map ( clock => clock,
                       reset => reset,
                       T_i   => T_i,
                       L_i   => L_i,
                       M_i   => M_i,
                       seg_O => seg_O,
                       T_o   => T_o,
                       L_o   => L_o,
                       M_o   => M_o,
                       water => water );

 
	clock_process: process
    begin
        while now < 1000 ns loop  
            clock <= '0';
            wait for CLK_PERIOD / 2;
            clock <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
	
	stimulus_process: process
	begin	   		
		reset <= '1';
		t_i <= '0';
		l_i <= '0';
		m_i <= "000";
		wait until falling_edge(clock);
		reset <= '0';
		
		wait until falling_edge(clock);
		t_i <= '1';
		l_i <= '0';
		m_i <= "000";	

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "000";	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "000";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "001";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "010";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "011";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "011";

		wait until falling_edge(clock);


		t_i <= '0';
		l_i <= '0';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "100";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "100";

		wait until falling_edge(clock);


		t_i <= '0';
		l_i <= '0';
		m_i <= "101";

		wait until falling_edge(clock);
		t_i <= '0';
		l_i <= '0';
		m_i <= "110";
	
		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '1';
		m_i <= "110";
	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "110";
		
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "110";
		
		wait until falling_edge(clock);

		t_i <= '0';
		l_i <= '0';
		m_i <= "111";
	
		wait until falling_edge(clock);
		
		t_i <= '0';
		l_i <= '1';
		m_i <= "111";
	
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '0';
		m_i <= "111";
		
		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "111";

		wait until falling_edge(clock);

		t_i <= '1';
		l_i <= '1';
		m_i <= "111";
		
		wait until falling_edge(clock);
	end process;

end;

configuration cfg_main_tb_Behavioral of main_tb is
  for bench
    for uut: main
      use entity work.main(Behavioral);
    end for;
  end for;
end cfg_main_tb_Behavioral;