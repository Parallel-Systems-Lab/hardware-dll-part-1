// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.2
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="HWA_func,hls_ip_2014_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.122000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}" *)

module HWA_func (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        y,
        id,
        id_ap_vld,
        out_r,
        out_r_ap_vld
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 6'b000000;
parameter    ap_ST_st2_fsm_1 = 6'b1;
parameter    ap_ST_st3_fsm_2 = 6'b10;
parameter    ap_ST_st4_fsm_3 = 6'b11;
parameter    ap_ST_st5_fsm_4 = 6'b100;
parameter    ap_ST_st6_fsm_5 = 6'b101;
parameter    ap_ST_st7_fsm_6 = 6'b110;
parameter    ap_ST_st8_fsm_7 = 6'b111;
parameter    ap_ST_st9_fsm_8 = 6'b1000;
parameter    ap_ST_st10_fsm_9 = 6'b1001;
parameter    ap_ST_st11_fsm_10 = 6'b1010;
parameter    ap_ST_st12_fsm_11 = 6'b1011;
parameter    ap_ST_st13_fsm_12 = 6'b1100;
parameter    ap_ST_st14_fsm_13 = 6'b1101;
parameter    ap_ST_st15_fsm_14 = 6'b1110;
parameter    ap_ST_st16_fsm_15 = 6'b1111;
parameter    ap_ST_st17_fsm_16 = 6'b10000;
parameter    ap_ST_st18_fsm_17 = 6'b10001;
parameter    ap_ST_st19_fsm_18 = 6'b10010;
parameter    ap_ST_st20_fsm_19 = 6'b10011;
parameter    ap_ST_st21_fsm_20 = 6'b10100;
parameter    ap_ST_st22_fsm_21 = 6'b10101;
parameter    ap_ST_st23_fsm_22 = 6'b10110;
parameter    ap_ST_st24_fsm_23 = 6'b10111;
parameter    ap_ST_st25_fsm_24 = 6'b11000;
parameter    ap_ST_st26_fsm_25 = 6'b11001;
parameter    ap_ST_st27_fsm_26 = 6'b11010;
parameter    ap_ST_st28_fsm_27 = 6'b11011;
parameter    ap_ST_st29_fsm_28 = 6'b11100;
parameter    ap_ST_st30_fsm_29 = 6'b11101;
parameter    ap_ST_st31_fsm_30 = 6'b11110;
parameter    ap_ST_st32_fsm_31 = 6'b11111;
parameter    ap_ST_st33_fsm_32 = 6'b100000;
parameter    ap_ST_st34_fsm_33 = 6'b100001;
parameter    ap_ST_st35_fsm_34 = 6'b100010;
parameter    ap_ST_st36_fsm_35 = 6'b100011;
parameter    ap_const_lv32_7D = 32'b1111101;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] x;
input  [31:0] y;
output  [31:0] id;
output   id_ap_vld;
output  [31:0] out_r;
output   out_r_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg id_ap_vld;
reg out_r_ap_vld;
reg   [5:0] ap_CS_fsm = 6'b000000;
wire   [31:0] grp_fu_86_p2;
reg   [31:0] c_reg_57;
reg   [31:0] b_reg_67;
wire   [0:0] tmp_fu_80_p2;
wire   [31:0] grp_fu_86_p0;
wire   [31:0] grp_fu_86_p1;
reg    HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start;
wire    grp_fu_86_ce;
reg   [5:0] ap_NS_fsm;


HWA_func_srem_32ns_32ns_32_35_seq #(
    .ID( 0 ),
    .NUM_STAGE( 35 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
HWA_func_srem_32ns_32ns_32_35_seq_U0(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .start( HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start ),
    .din0( grp_fu_86_p0 ),
    .din1( grp_fu_86_p1 ),
    .ce( grp_fu_86_ce ),
    .dout( grp_fu_86_p2 )
);



/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st36_fsm_35 == ap_CS_fsm)) begin
        b_reg_67 <= c_reg_57;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_start == ap_const_logic_0))) begin
        b_reg_67 <= y;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((ap_ST_st36_fsm_35 == ap_CS_fsm)) begin
        c_reg_57 <= grp_fu_86_p2;
    end else if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_start == ap_const_logic_0))) begin
        c_reg_57 <= x;
    end
end

/// HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start assign process. ///
always @ (ap_CS_fsm or tmp_fu_80_p2)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & (tmp_fu_80_p2 == ap_const_lv1_0))) begin
        HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start = ap_const_logic_1;
    end else begin
        HWA_func_srem_32ns_32ns_32_35_seq_U0_ap_start = ap_const_logic_0;
    end
end

/// ap_done assign process. ///
always @ (ap_CS_fsm or tmp_fu_80_p2)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(tmp_fu_80_p2 == ap_const_lv1_0))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_CS_fsm)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_ST_st1_fsm_0 == ap_CS_fsm))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_CS_fsm or tmp_fu_80_p2)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(tmp_fu_80_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// id_ap_vld assign process. ///
always @ (ap_start or ap_CS_fsm)
begin
    if (((ap_ST_st1_fsm_0 == ap_CS_fsm) & ~(ap_start == ap_const_logic_0))) begin
        id_ap_vld = ap_const_logic_1;
    end else begin
        id_ap_vld = ap_const_logic_0;
    end
end

/// out_r_ap_vld assign process. ///
always @ (ap_CS_fsm or tmp_fu_80_p2)
begin
    if (((ap_ST_st2_fsm_1 == ap_CS_fsm) & ~(tmp_fu_80_p2 == ap_const_lv1_0))) begin
        out_r_ap_vld = ap_const_logic_1;
    end else begin
        out_r_ap_vld = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_start or ap_CS_fsm or tmp_fu_80_p2)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(tmp_fu_80_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : 
        begin
            ap_NS_fsm = ap_ST_st7_fsm_6;
        end
        ap_ST_st7_fsm_6 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : 
        begin
            ap_NS_fsm = ap_ST_st9_fsm_8;
        end
        ap_ST_st9_fsm_8 : 
        begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        ap_ST_st10_fsm_9 : 
        begin
            ap_NS_fsm = ap_ST_st11_fsm_10;
        end
        ap_ST_st11_fsm_10 : 
        begin
            ap_NS_fsm = ap_ST_st12_fsm_11;
        end
        ap_ST_st12_fsm_11 : 
        begin
            ap_NS_fsm = ap_ST_st13_fsm_12;
        end
        ap_ST_st13_fsm_12 : 
        begin
            ap_NS_fsm = ap_ST_st14_fsm_13;
        end
        ap_ST_st14_fsm_13 : 
        begin
            ap_NS_fsm = ap_ST_st15_fsm_14;
        end
        ap_ST_st15_fsm_14 : 
        begin
            ap_NS_fsm = ap_ST_st16_fsm_15;
        end
        ap_ST_st16_fsm_15 : 
        begin
            ap_NS_fsm = ap_ST_st17_fsm_16;
        end
        ap_ST_st17_fsm_16 : 
        begin
            ap_NS_fsm = ap_ST_st18_fsm_17;
        end
        ap_ST_st18_fsm_17 : 
        begin
            ap_NS_fsm = ap_ST_st19_fsm_18;
        end
        ap_ST_st19_fsm_18 : 
        begin
            ap_NS_fsm = ap_ST_st20_fsm_19;
        end
        ap_ST_st20_fsm_19 : 
        begin
            ap_NS_fsm = ap_ST_st21_fsm_20;
        end
        ap_ST_st21_fsm_20 : 
        begin
            ap_NS_fsm = ap_ST_st22_fsm_21;
        end
        ap_ST_st22_fsm_21 : 
        begin
            ap_NS_fsm = ap_ST_st23_fsm_22;
        end
        ap_ST_st23_fsm_22 : 
        begin
            ap_NS_fsm = ap_ST_st24_fsm_23;
        end
        ap_ST_st24_fsm_23 : 
        begin
            ap_NS_fsm = ap_ST_st25_fsm_24;
        end
        ap_ST_st25_fsm_24 : 
        begin
            ap_NS_fsm = ap_ST_st26_fsm_25;
        end
        ap_ST_st26_fsm_25 : 
        begin
            ap_NS_fsm = ap_ST_st27_fsm_26;
        end
        ap_ST_st27_fsm_26 : 
        begin
            ap_NS_fsm = ap_ST_st28_fsm_27;
        end
        ap_ST_st28_fsm_27 : 
        begin
            ap_NS_fsm = ap_ST_st29_fsm_28;
        end
        ap_ST_st29_fsm_28 : 
        begin
            ap_NS_fsm = ap_ST_st30_fsm_29;
        end
        ap_ST_st30_fsm_29 : 
        begin
            ap_NS_fsm = ap_ST_st31_fsm_30;
        end
        ap_ST_st31_fsm_30 : 
        begin
            ap_NS_fsm = ap_ST_st32_fsm_31;
        end
        ap_ST_st32_fsm_31 : 
        begin
            ap_NS_fsm = ap_ST_st33_fsm_32;
        end
        ap_ST_st33_fsm_32 : 
        begin
            ap_NS_fsm = ap_ST_st34_fsm_33;
        end
        ap_ST_st34_fsm_33 : 
        begin
            ap_NS_fsm = ap_ST_st35_fsm_34;
        end
        ap_ST_st35_fsm_34 : 
        begin
            ap_NS_fsm = ap_ST_st36_fsm_35;
        end
        ap_ST_st36_fsm_35 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign grp_fu_86_ce = ap_const_logic_1;
assign grp_fu_86_p0 = b_reg_67;
assign grp_fu_86_p1 = c_reg_57;
assign id = ap_const_lv32_7D;
assign out_r = b_reg_67;
assign tmp_fu_80_p2 = (c_reg_57 == ap_const_lv32_0? 1'b1: 1'b0);


endmodule //HWA_func

