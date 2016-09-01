#run fix16.tcl file
source ./fix_16.tcl
read_verilog temp.v
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top hwa_func_top -part xc7z020clg484-1
cd ../../../../
write_checkpoint hwa_ip.dcp -force
close_design
file delete -force ./impl/ip/hdl/verilog/temp.v

read_checkpoint -cell HWA_func_0 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_1 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_2 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_3 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_4 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_5 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_6 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_7 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_8 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_9 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_10 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_11 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_12 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_13 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_14 ./hwa_ip.dcp
read_checkpoint -cell HWA_func_15 ./hwa_ip.dcp


opt_design
place_design
route_design

write_checkpoint ./new_HWA_func.dcp

pr_verify ./new_HWA_func.dcp ../../checkpoints/top_route_design.dcp
write_bitstream -file ./HWA_func_bitstreams.bit


