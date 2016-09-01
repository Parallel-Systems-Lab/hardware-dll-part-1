-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.2
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HWA_func is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (31 downto 0);
    y : IN STD_LOGIC_VECTOR (31 downto 0);
    id : OUT STD_LOGIC_VECTOR (31 downto 0);
    id_ap_vld : OUT STD_LOGIC;
    out_r : OUT STD_LOGIC_VECTOR (31 downto 0);
    out_r_ap_vld : OUT STD_LOGIC );
end;


architecture behav of HWA_func is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "HWA_func,hls_ip_2014_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.122000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (5 downto 0) := "000011";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (5 downto 0) := "000101";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (5 downto 0) := "000110";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (5 downto 0) := "000111";
    constant ap_ST_st9_fsm_8 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_st10_fsm_9 : STD_LOGIC_VECTOR (5 downto 0) := "001001";
    constant ap_ST_st11_fsm_10 : STD_LOGIC_VECTOR (5 downto 0) := "001010";
    constant ap_ST_st12_fsm_11 : STD_LOGIC_VECTOR (5 downto 0) := "001011";
    constant ap_ST_st13_fsm_12 : STD_LOGIC_VECTOR (5 downto 0) := "001100";
    constant ap_ST_st14_fsm_13 : STD_LOGIC_VECTOR (5 downto 0) := "001101";
    constant ap_ST_st15_fsm_14 : STD_LOGIC_VECTOR (5 downto 0) := "001110";
    constant ap_ST_st16_fsm_15 : STD_LOGIC_VECTOR (5 downto 0) := "001111";
    constant ap_ST_st17_fsm_16 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_st18_fsm_17 : STD_LOGIC_VECTOR (5 downto 0) := "010001";
    constant ap_ST_st19_fsm_18 : STD_LOGIC_VECTOR (5 downto 0) := "010010";
    constant ap_ST_st20_fsm_19 : STD_LOGIC_VECTOR (5 downto 0) := "010011";
    constant ap_ST_st21_fsm_20 : STD_LOGIC_VECTOR (5 downto 0) := "010100";
    constant ap_ST_st22_fsm_21 : STD_LOGIC_VECTOR (5 downto 0) := "010101";
    constant ap_ST_st23_fsm_22 : STD_LOGIC_VECTOR (5 downto 0) := "010110";
    constant ap_ST_st24_fsm_23 : STD_LOGIC_VECTOR (5 downto 0) := "010111";
    constant ap_ST_st25_fsm_24 : STD_LOGIC_VECTOR (5 downto 0) := "011000";
    constant ap_ST_st26_fsm_25 : STD_LOGIC_VECTOR (5 downto 0) := "011001";
    constant ap_ST_st27_fsm_26 : STD_LOGIC_VECTOR (5 downto 0) := "011010";
    constant ap_ST_st28_fsm_27 : STD_LOGIC_VECTOR (5 downto 0) := "011011";
    constant ap_ST_st29_fsm_28 : STD_LOGIC_VECTOR (5 downto 0) := "011100";
    constant ap_ST_st30_fsm_29 : STD_LOGIC_VECTOR (5 downto 0) := "011101";
    constant ap_ST_st31_fsm_30 : STD_LOGIC_VECTOR (5 downto 0) := "011110";
    constant ap_ST_st32_fsm_31 : STD_LOGIC_VECTOR (5 downto 0) := "011111";
    constant ap_ST_st33_fsm_32 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_ST_st34_fsm_33 : STD_LOGIC_VECTOR (5 downto 0) := "100001";
    constant ap_ST_st35_fsm_34 : STD_LOGIC_VECTOR (5 downto 0) := "100010";
    constant ap_ST_st36_fsm_35 : STD_LOGIC_VECTOR (5 downto 0) := "100011";
    constant ap_const_lv32_7D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111101";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    signal grp_fu_86_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal c_reg_57 : STD_LOGIC_VECTOR (31 downto 0);
    signal b_reg_67 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_80_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_86_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_86_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start : STD_LOGIC;
    signal grp_fu_86_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);

    component HWA_func_srem_32ns_32ns_32_35_seq IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    HWA_func_srem_32ns_32ns_32_35_seq_U0 : component HWA_func_srem_32ns_32ns_32_35_seq
    generic map (
        ID => 0,
        NUM_STAGE => 35,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        start => HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start,
        din0 => grp_fu_86_p0,
        din1 => grp_fu_86_p1,
        ce => grp_fu_86_ce,
        dout => grp_fu_86_p2);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- b_reg_67 assign process. --
    b_reg_67_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st36_fsm_35 = ap_CS_fsm)) then 
                b_reg_67 <= c_reg_57;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                b_reg_67 <= y;
            end if; 
        end if;
    end process;

    -- c_reg_57 assign process. --
    c_reg_57_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st36_fsm_35 = ap_CS_fsm)) then 
                c_reg_57 <= grp_fu_86_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                c_reg_57 <= x;
            end if; 
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, tmp_fu_80_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((tmp_fu_80_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when ap_ST_st3_fsm_2 => 
                ap_NS_fsm <= ap_ST_st4_fsm_3;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st5_fsm_4;
            when ap_ST_st5_fsm_4 => 
                ap_NS_fsm <= ap_ST_st6_fsm_5;
            when ap_ST_st6_fsm_5 => 
                ap_NS_fsm <= ap_ST_st7_fsm_6;
            when ap_ST_st7_fsm_6 => 
                ap_NS_fsm <= ap_ST_st8_fsm_7;
            when ap_ST_st8_fsm_7 => 
                ap_NS_fsm <= ap_ST_st9_fsm_8;
            when ap_ST_st9_fsm_8 => 
                ap_NS_fsm <= ap_ST_st10_fsm_9;
            when ap_ST_st10_fsm_9 => 
                ap_NS_fsm <= ap_ST_st11_fsm_10;
            when ap_ST_st11_fsm_10 => 
                ap_NS_fsm <= ap_ST_st12_fsm_11;
            when ap_ST_st12_fsm_11 => 
                ap_NS_fsm <= ap_ST_st13_fsm_12;
            when ap_ST_st13_fsm_12 => 
                ap_NS_fsm <= ap_ST_st14_fsm_13;
            when ap_ST_st14_fsm_13 => 
                ap_NS_fsm <= ap_ST_st15_fsm_14;
            when ap_ST_st15_fsm_14 => 
                ap_NS_fsm <= ap_ST_st16_fsm_15;
            when ap_ST_st16_fsm_15 => 
                ap_NS_fsm <= ap_ST_st17_fsm_16;
            when ap_ST_st17_fsm_16 => 
                ap_NS_fsm <= ap_ST_st18_fsm_17;
            when ap_ST_st18_fsm_17 => 
                ap_NS_fsm <= ap_ST_st19_fsm_18;
            when ap_ST_st19_fsm_18 => 
                ap_NS_fsm <= ap_ST_st20_fsm_19;
            when ap_ST_st20_fsm_19 => 
                ap_NS_fsm <= ap_ST_st21_fsm_20;
            when ap_ST_st21_fsm_20 => 
                ap_NS_fsm <= ap_ST_st22_fsm_21;
            when ap_ST_st22_fsm_21 => 
                ap_NS_fsm <= ap_ST_st23_fsm_22;
            when ap_ST_st23_fsm_22 => 
                ap_NS_fsm <= ap_ST_st24_fsm_23;
            when ap_ST_st24_fsm_23 => 
                ap_NS_fsm <= ap_ST_st25_fsm_24;
            when ap_ST_st25_fsm_24 => 
                ap_NS_fsm <= ap_ST_st26_fsm_25;
            when ap_ST_st26_fsm_25 => 
                ap_NS_fsm <= ap_ST_st27_fsm_26;
            when ap_ST_st27_fsm_26 => 
                ap_NS_fsm <= ap_ST_st28_fsm_27;
            when ap_ST_st28_fsm_27 => 
                ap_NS_fsm <= ap_ST_st29_fsm_28;
            when ap_ST_st29_fsm_28 => 
                ap_NS_fsm <= ap_ST_st30_fsm_29;
            when ap_ST_st30_fsm_29 => 
                ap_NS_fsm <= ap_ST_st31_fsm_30;
            when ap_ST_st31_fsm_30 => 
                ap_NS_fsm <= ap_ST_st32_fsm_31;
            when ap_ST_st32_fsm_31 => 
                ap_NS_fsm <= ap_ST_st33_fsm_32;
            when ap_ST_st33_fsm_32 => 
                ap_NS_fsm <= ap_ST_st34_fsm_33;
            when ap_ST_st34_fsm_33 => 
                ap_NS_fsm <= ap_ST_st35_fsm_34;
            when ap_ST_st35_fsm_34 => 
                ap_NS_fsm <= ap_ST_st36_fsm_35;
            when ap_ST_st36_fsm_35 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;

    -- HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start assign process. --
    HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start_assign_proc : process(ap_CS_fsm, tmp_fu_80_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and (tmp_fu_80_p2 = ap_const_lv1_0))) then 
            HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start <= ap_const_logic_1;
        else 
            HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm, tmp_fu_80_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((tmp_fu_80_p2 = ap_const_lv1_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_CS_fsm, tmp_fu_80_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((tmp_fu_80_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_86_ce <= ap_const_logic_1;
    grp_fu_86_p0 <= b_reg_67;
    grp_fu_86_p1 <= c_reg_57;
    id <= ap_const_lv32_7D;

    -- id_ap_vld assign process. --
    id_ap_vld_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
            id_ap_vld <= ap_const_logic_1;
        else 
            id_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    out_r <= b_reg_67;

    -- out_r_ap_vld assign process. --
    out_r_ap_vld_assign_proc : process(ap_CS_fsm, tmp_fu_80_p2)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((tmp_fu_80_p2 = ap_const_lv1_0)))) then 
            out_r_ap_vld <= ap_const_logic_1;
        else 
            out_r_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_80_p2 <= "1" when (c_reg_57 = ap_const_lv32_0) else "0";
end behav;
