-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.2
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ==============================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity HWA_func_srem_32ns_32ns_32_35_seq_div_u is
  port (
    clk: in std_logic;
    reset : in std_logic;

    ce : in std_logic;
    start : in std_logic;
    dividend: in std_logic_vector(30 downto 0);
    divisor: in std_logic_vector(30 downto 0);
    quot: out std_logic_vector(30 downto 0);
    sign_in: in std_logic_vector(1 downto 0);
    sign_out: out std_logic_vector(1 downto 0);
    remd: out std_logic_vector(30 downto 0));
end entity;

architecture rtl of HWA_func_srem_32ns_32ns_32_35_seq_div_u is
  signal divisor_tmp, dividend_tmp, quot_tmp, remd_tmp, comb_tmp, quot_o, remd_o : std_logic_vector(30 downto 0);
  signal divisor_tmp_mux, dividend_tmp_mux, quot_tmp_mux, remd_tmp_mux : std_logic_vector(30 downto 0);
  signal cal_tmp : std_logic_vector(31 downto 0);
  signal sign_tmp : std_logic_vector(1 downto 0);
  signal do_start, ce0 : std_logic := '0';
  signal dividend0 : std_logic_vector(30 downto 0);
  signal divisor0 : std_logic_vector(30 downto 0);
  signal sign0 : std_logic_vector(1 downto 0);
  signal sel : std_logic := '0';
  signal cnt : std_logic_vector(30 downto 0);
begin

  sel               <=  '0' when (cnt = 0) else
                        '1';
  dividend_tmp_mux  <=  dividend_tmp when (sel = '1') else
                        dividend0;
  divisor_tmp_mux   <=  divisor_tmp when (sel = '1') else
                        divisor0;
  quot_tmp_mux      <=  quot_tmp when (sel = '1') else
                        (others => '0');
  remd_tmp_mux      <=  remd_tmp when (sel = '1') else
                        (others => '0');

  comb_tmp <= remd_tmp_mux(29 downto 0) & dividend_tmp_mux(30);
  cal_tmp <= ('0' & comb_tmp) - ('0' & divisor_tmp_mux);

  quot <= quot_o;
  remd <= remd_o;
  sign_out <= sign0;

  state: process (clk)
  begin
      if clk'event and clk = '1' then
          if reset = '1' then
              ce0 <= '0';
          else
              ce0 <= ce;
          end if;
      end if;
  end process;

  counter: process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        cnt <= conv_std_logic_vector(0, 31);
      else
        if cnt  /=  31 and (sel = '1' or do_start = '1') then
          cnt   <=  cnt + 1;
        elsif cnt = 31 then
          cnt   <=  conv_std_logic_vector(0, 31);
        end if;
      end if;
    end if;
  end process;

  tran0 : process (clk)
  begin
    if (clk'event and clk='1') then
      divisor0  <= divisor;
      dividend0 <= dividend;
      sign0     <= sign_in;
      do_start  <= start;
    end if;
  end process;

  divisor_tran : process (clk)
  begin
    if (clk'event and clk='1') then
      divisor_tmp <= divisor_tmp_mux;
    end if;
  end process;

  dividend_tran : process (clk)
  begin
    if (clk'event and clk='1') then
      dividend_tmp <= dividend_tmp_mux(29 downto 0) & '0';
    end if;
  end process;

  remain_trans :  process (clk)
  begin
    if (clk'event and clk='1') then
      if (cal_tmp(31)='0') then
        remd_tmp <= cal_tmp(30 downto 0);
      else
        remd_tmp <= comb_tmp;
      end if;
    end if;
  end process;

  ret_trans : process (clk)
  begin
    if (clk'event and clk='1') then
      quot_tmp <= quot_tmp(29 downto 0) & not cal_tmp(31);
    end if;
  end process;

  remd_out : process (clk)
  begin
    if (clk'event and clk='1') then
      if (cnt = 31) then
        remd_o <= remd_tmp;
      else
        remd_o <= remd_o;
      end if;
    end if;
  end process;

  quot_out : process (clk)
  begin
    if (clk'event and clk='1') then
      if (cnt = 31) then
        quot_o <= quot_tmp;
      else
        quot_o <= quot_o;
      end if;
    end if;
  end process;

end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity HWA_func_srem_32ns_32ns_32_35_seq_div is
  port (
    clk: in std_logic;
    reset : in std_logic;
    ce : in std_logic;
    start: in std_logic;
    dividend: in std_logic_vector(31 downto 0);
    divisor: in std_logic_vector(31 downto 0);
    quot: out std_logic_vector(31 downto 0);
    remd: out std_logic_vector(31 downto 0));
end entity;

architecture rtl of HWA_func_srem_32ns_32ns_32_35_seq_div is
  component HWA_func_srem_32ns_32ns_32_35_seq_div_u is
    port (
      reset : in std_logic;
      clk : in std_logic;
      ce : in std_logic;
      start : in std_logic;
      dividend: in std_logic_vector(30 downto 0);
      divisor: in std_logic_vector(30 downto 0);
      quot: out std_logic_vector(30 downto 0);
      sign_in: in std_logic_vector(1 downto 0);
      sign_out: out std_logic_vector(1 downto 0);
      remd: out std_logic_vector(30 downto 0));
  end component;

  signal ce0 : std_logic;
  signal start0 : std_logic;
  signal dividend0: std_logic_vector(31 downto 0);
  signal divisor0: std_logic_vector(31 downto 0);
  signal dividend_s, divisor_s : signed(31 downto 0);
  signal dividend_u,divisor_u : std_logic_vector(31 downto 0);
  signal quot_u, remd_u : std_logic_vector(30 downto 0);
  signal sign : std_logic_vector(1 downto 0);
  signal sign_in : std_logic_vector(1 downto 0);
begin
  dividend_s <= abs signed(dividend0);
  divisor_s <= abs signed(divisor0);
  dividend_u <= std_logic_vector(dividend_s);
  divisor_u <= std_logic_vector(divisor_s);
  sign_in <= (dividend0(31) xor divisor0(31)) & dividend0(31);

  HWA_func_srem_32ns_32ns_32_35_seq_div_u_0 : HWA_func_srem_32ns_32ns_32_35_seq_div_u
    port map
      (clk => clk,
       reset => reset,
       ce => ce0,
       start => start0,
       dividend => dividend_u(30 downto 0),
       divisor => divisor_u(30 downto 0),
       quot => quot_u,
       sign_out => sign,
       sign_in => sign_in,
       remd => remd_u);

  tran0 : process (clk)
  begin
    if (clk'event and clk='1') then
      ce0 <= ce;
      start0 <= start;
      divisor0 <= divisor;
      dividend0 <= dividend;
    end if;
  end process;

  result : process (sign(1), quot_u)
    variable quot_s : signed(31 downto 0);
  begin
    if (sign(1)) = '1' then 
      quot_s := -signed('0' & quot_u);
      quot <= std_logic_vector(quot_s);
    else
      quot <= '0' & quot_u;
    end if;
  end process;

  remain : process (sign(0), remd_u)
    variable remd_s : signed(31 downto 0);
  begin
    if sign(0) = '1' then
      remd_s := -signed('0' & remd_u);
      remd <= std_logic_vector(remd_s);
    else
      remd <= '0' & remd_u;
    end if;
  end process;
end architecture;

Library IEEE;
use IEEE.std_logic_1164.all;

entity HWA_func_srem_32ns_32ns_32_35_seq is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        start : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of HWA_func_srem_32ns_32ns_32_35_seq is
    component HWA_func_srem_32ns_32ns_32_35_seq_div is
        port (
            dividend : IN STD_LOGIC_VECTOR;
            divisor : IN STD_LOGIC_VECTOR;
            remd : OUT STD_LOGIC_VECTOR;
            quot : OUT STD_LOGIC_VECTOR;
            clk : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            start : IN STD_LOGIC);
    end component;

    signal sig_quot : STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0);
    signal sig_remd : STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0);



begin
    HWA_func_srem_32ns_32ns_32_35_seq_div_U :  component HWA_func_srem_32ns_32ns_32_35_seq_div
    port map (
        dividend => din0,
        divisor => din1,
        remd => dout,
        quot => sig_quot,
        clk => clk,
        ce => ce,
        reset => reset,
        start => start);

end architecture;


