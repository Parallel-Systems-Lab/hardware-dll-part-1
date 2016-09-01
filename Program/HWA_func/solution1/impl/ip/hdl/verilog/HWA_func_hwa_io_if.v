// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.2
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================

`timescale 1ns/1ps
module HWA_func_hwa_io_if
#(parameter
    C_ADDR_WIDTH = 6,
    C_DATA_WIDTH = 32
)(
    // axi4 lite slave signals
    input  wire                      ACLK,
    input  wire                      ARESETN,
    input  wire [C_ADDR_WIDTH-1:0]   AWADDR,
    input  wire                      AWVALID,
    output wire                      AWREADY,
    input  wire [C_DATA_WIDTH-1:0]   WDATA,
    input  wire [C_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                      WVALID,
    output wire                      WREADY,
    output wire [1:0]                BRESP,
    output wire                      BVALID,
    input  wire                      BREADY,
    input  wire [C_ADDR_WIDTH-1:0]   ARADDR,
    input  wire                      ARVALID,
    output wire                      ARREADY,
    output wire [C_DATA_WIDTH-1:0]   RDATA,
    output wire [1:0]                RRESP,
    output wire                      RVALID,
    input  wire                      RREADY,
    output wire                      interrupt,
    // user signals
    output wire [31:0]               I_x,
    output wire [31:0]               I_y,
    input  wire [31:0]               O_id,
    input  wire                      O_id_ap_vld,
    input  wire [31:0]               O_out_r,
    input  wire                      O_out_r_ap_vld,
    output wire                      I_ap_start,
    input  wire                      O_ap_ready,
    input  wire                      O_ap_done,
    input  wire                      O_ap_idle
);
//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : reserved
// 0x14 : Data signal of x
//        bit 31~0 - x[31:0] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of y
//        bit 31~0 - y[31:0] (Read/Write)
// 0x20 : Control signal of id
//        bit 0  - id_ap_vld (Read/COR)
//        others - reserved
// 0x24 : Data signal of id
//        bit 31~0 - id[31:0] (Read)
// 0x28 : Control signal of out_r
//        bit 0  - out_r_ap_vld (Read/COR)
//        others - reserved
// 0x2c : Data signal of out_r
//        bit 31~0 - out_r[31:0] (Read)
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
// address bits
localparam
    ADDR_BITS = 6;

// address
localparam
    ADDR_AP_CTRL      = 6'h00,
    ADDR_GIE          = 6'h04,
    ADDR_IER          = 6'h08,
    ADDR_ISR          = 6'h0c,
    ADDR_X_CTRL       = 6'h10,
    ADDR_X_DATA_0     = 6'h14,
    ADDR_Y_CTRL       = 6'h18,
    ADDR_Y_DATA_0     = 6'h1c,
    ADDR_ID_CTRL      = 6'h20,
    ADDR_ID_DATA_0    = 6'h24,
    ADDR_OUT_R_CTRL   = 6'h28,
    ADDR_OUT_R_DATA_0 = 6'h2c;

// axi write fsm
localparam
    WRIDLE = 2'd0,
    WRDATA = 2'd1,
    WRRESP = 2'd2;

// axi read fsm
localparam
    RDIDLE = 2'd0,
    RDDATA = 2'd1;

//------------------------Local signal-------------------
// axi write
reg  [1:0]           wstate;
reg  [1:0]           wnext;
reg  [ADDR_BITS-1:0] waddr;
wire [31:0]          wmask;
wire                 aw_hs;
wire                 w_hs;
// axi read
reg  [1:0]           rstate;
reg  [1:0]           rnext;
reg  [31:0]          rdata;
wire                 ar_hs;
wire [ADDR_BITS-1:0] raddr;
// internal registers
wire                 ap_idle;
reg                  ap_done;
wire                 ap_ready;
reg                  ap_start;
reg                  auto_restart;
reg                  gie;
reg  [1:0]           ier;
reg  [1:0]           isr;
reg  [31:0]          _x;
reg  [31:0]          _y;
wire [31:0]          _id;
reg                  _id_ap_vld;
wire [31:0]          _out_r;
reg                  _out_r_ap_vld;

//------------------------Body---------------------------
//++++++++++++++++++++++++axi write++++++++++++++++++++++
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (~ARESETN)
        wstate <= WRIDLE;
    else
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (aw_hs)
        waddr <= AWADDR[ADDR_BITS-1:0];
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++axi read+++++++++++++++++++++++
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (~ARESETN)
        rstate <= RDIDLE;
    else
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ar_hs) begin
        rdata <= 1'b0;
        case (raddr)
            ADDR_AP_CTRL: begin
                rdata[0] <= ap_start;
                rdata[1] <= ap_done;
                rdata[2] <= ap_idle;
                rdata[3] <= ap_ready;
                rdata[7] <= auto_restart;
            end
            ADDR_GIE: begin
                rdata <= gie;
            end
            ADDR_IER: begin
                rdata <= ier;
            end
            ADDR_ISR: begin
                rdata <= isr;
            end
            ADDR_X_DATA_0: begin
                rdata <= _x[31:0];
            end
            ADDR_Y_DATA_0: begin
                rdata <= _y[31:0];
            end
            ADDR_ID_CTRL: begin
                rdata[0] <= _id_ap_vld;
            end
            ADDR_ID_DATA_0: begin
                rdata <= _id[31:0];
            end
            ADDR_OUT_R_CTRL: begin
                rdata[0] <= _out_r_ap_vld;
            end
            ADDR_OUT_R_DATA_0: begin
                rdata <= _out_r[31:0];
            end
        endcase
    end
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++internal registers+++++++++++++
assign interrupt  = gie & (|isr);
assign I_ap_start = ap_start;
assign ap_idle    = O_ap_idle;
assign ap_ready   = O_ap_ready;
assign I_x        = _x;
assign I_y        = _y;
assign _id        = O_id;
assign _out_r     = O_out_r;

// ap_start
always @(posedge ACLK) begin
    if (~ARESETN)
        ap_start <= 1'b0;
    else if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
        ap_start <= 1'b1;
    else if (O_ap_ready)
        ap_start <= auto_restart; // clear on handshake/auto restart
end

// ap_done
always @(posedge ACLK) begin
    if (~ARESETN)
        ap_done <= 1'b0;
    else if (O_ap_done)
        ap_done <= 1'b1;
    else if (ar_hs && raddr == ADDR_AP_CTRL)
        ap_done <= 1'b0; // clear on read
end

// auto_restart
always @(posedge ACLK) begin
    if (~ARESETN)
        auto_restart <= 1'b0;
    else if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
        auto_restart <=  WDATA[7];
end

// gie
always @(posedge ACLK) begin
    if (~ARESETN)
        gie <= 1'b0;
    else if (w_hs && waddr == ADDR_GIE && WSTRB[0])
        gie <= WDATA[0];
end

// ier
always @(posedge ACLK) begin
    if (~ARESETN)
        ier <= 1'b0;
    else if (w_hs && waddr == ADDR_IER && WSTRB[0])
        ier <= WDATA[1:0];
end

// isr[0]
always @(posedge ACLK) begin
    if (~ARESETN)
        isr[0] <= 1'b0;
    else if (ier[0] & O_ap_done)
        isr[0] <= 1'b1;
    else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
        isr[0] <= isr[0] ^ WDATA[0]; // toggle on write
end

// isr[1]
always @(posedge ACLK) begin
    if (~ARESETN)
        isr[1] <= 1'b0;
    else if (ier[1] & O_ap_ready)
        isr[1] <= 1'b1;
    else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
        isr[1] <= isr[1] ^ WDATA[1]; // toggle on write
end

// _x[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_X_DATA_0)
        _x[31:0] <= (WDATA[31:0] & wmask) | (_x[31:0] & ~wmask);
end

// _y[31:0]
always @(posedge ACLK) begin
    if (w_hs && waddr == ADDR_Y_DATA_0)
        _y[31:0] <= (WDATA[31:0] & wmask) | (_y[31:0] & ~wmask);
end

// _id_ap_vld
always @(posedge ACLK) begin
    if (~ARESETN)
        _id_ap_vld <= 1'b0;
    else if (O_id_ap_vld)
        _id_ap_vld <= 1'b1;
    else if (ar_hs && raddr == ADDR_ID_CTRL)
        _id_ap_vld <= 1'b0; // clear on read
end

// _out_r_ap_vld
always @(posedge ACLK) begin
    if (~ARESETN)
        _out_r_ap_vld <= 1'b0;
    else if (O_out_r_ap_vld)
        _out_r_ap_vld <= 1'b1;
    else if (ar_hs && raddr == ADDR_OUT_R_CTRL)
        _out_r_ap_vld <= 1'b0; // clear on read
end

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
