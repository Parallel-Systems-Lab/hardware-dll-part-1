// (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:HWA_func:1.0
// IP Revision: 1501211609

(* X_CORE_INFO = "hwa_func_top,Vivado 2014.2" *)
(* CHECK_LICENSE_TYPE = "system_HWA_func_0_3,hwa_func_top,{}" *)
(* CORE_GENERATION_INFO = "system_HWA_func_0_3,hwa_func_top,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=HWA_func,x_ipVersion=1.0,x_ipCoreRevision=1501211609,x_ipLanguage=VERILOG,C_S_AXI_HWA_IO_ADDR_WIDTH=16,C_S_AXI_HWA_IO_DATA_WIDTH=32}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_HWA_func_0_3 (
  s_axi_hwa_io_AWADDR,
  s_axi_hwa_io_AWVALID,
  s_axi_hwa_io_AWREADY,
  s_axi_hwa_io_WDATA,
  s_axi_hwa_io_WSTRB,
  s_axi_hwa_io_WVALID,
  s_axi_hwa_io_WREADY,
  s_axi_hwa_io_BRESP,
  s_axi_hwa_io_BVALID,
  s_axi_hwa_io_BREADY,
  s_axi_hwa_io_ARADDR,
  s_axi_hwa_io_ARVALID,
  s_axi_hwa_io_ARREADY,
  s_axi_hwa_io_RDATA,
  s_axi_hwa_io_RRESP,
  s_axi_hwa_io_RVALID,
  s_axi_hwa_io_RREADY,
  interrupt,
  aclk,
  aresetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO AWADDR" *)
input wire [15 : 0] s_axi_hwa_io_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO AWVALID" *)
input wire s_axi_hwa_io_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO AWREADY" *)
output wire s_axi_hwa_io_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO WDATA" *)
input wire [31 : 0] s_axi_hwa_io_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO WSTRB" *)
input wire [3 : 0] s_axi_hwa_io_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO WVALID" *)
input wire s_axi_hwa_io_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO WREADY" *)
output wire s_axi_hwa_io_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO BRESP" *)
output wire [1 : 0] s_axi_hwa_io_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO BVALID" *)
output wire s_axi_hwa_io_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO BREADY" *)
input wire s_axi_hwa_io_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO ARADDR" *)
input wire [15 : 0] s_axi_hwa_io_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO ARVALID" *)
input wire s_axi_hwa_io_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO ARREADY" *)
output wire s_axi_hwa_io_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO RDATA" *)
output wire [31 : 0] s_axi_hwa_io_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO RRESP" *)
output wire [1 : 0] s_axi_hwa_io_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO RVALID" *)
output wire s_axi_hwa_io_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_HWA_IO RREADY" *)
input wire s_axi_hwa_io_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  hwa_func_top #(
    .C_S_AXI_HWA_IO_ADDR_WIDTH(16),
    .C_S_AXI_HWA_IO_DATA_WIDTH(32)
  ) inst (
    .s_axi_hwa_io_AWADDR(s_axi_hwa_io_AWADDR),
    .s_axi_hwa_io_AWVALID(s_axi_hwa_io_AWVALID),
    .s_axi_hwa_io_AWREADY(s_axi_hwa_io_AWREADY),
    .s_axi_hwa_io_WDATA(s_axi_hwa_io_WDATA),
    .s_axi_hwa_io_WSTRB(s_axi_hwa_io_WSTRB),
    .s_axi_hwa_io_WVALID(s_axi_hwa_io_WVALID),
    .s_axi_hwa_io_WREADY(s_axi_hwa_io_WREADY),
    .s_axi_hwa_io_BRESP(s_axi_hwa_io_BRESP),
    .s_axi_hwa_io_BVALID(s_axi_hwa_io_BVALID),
    .s_axi_hwa_io_BREADY(s_axi_hwa_io_BREADY),
    .s_axi_hwa_io_ARADDR(s_axi_hwa_io_ARADDR),
    .s_axi_hwa_io_ARVALID(s_axi_hwa_io_ARVALID),
    .s_axi_hwa_io_ARREADY(s_axi_hwa_io_ARREADY),
    .s_axi_hwa_io_RDATA(s_axi_hwa_io_RDATA),
    .s_axi_hwa_io_RRESP(s_axi_hwa_io_RRESP),
    .s_axi_hwa_io_RVALID(s_axi_hwa_io_RVALID),
    .s_axi_hwa_io_RREADY(s_axi_hwa_io_RREADY),
    .interrupt(interrupt),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
