cd ./impl/ip/hdl/verilog
#get a list of files with .v extension
set ext "v"
set contents [glob -directory "./" *$ext]

#this will be the new file
set hole_file ""

#add in to the new file the incluseds needed, they are automatic inside a project but automation needs this step 
foreach item $contents {
		if {$item != "./hwa_func_top.v"} {
			set data [string range $item 2 end]
			append hole_file "\`include \"$data\"" "\n"
		}
    }
		
#open main file
set f [open ./hwa_func_top.v r]

set file_data [read $f]
close $f

#make a file named temp.v to hold all the corrected code
set f [open ./temp.v w+]
puts $f $hole_file 

#search and change the address with to 16 bits in all needed places
set addrlen "C_S_AXI_HWA_IO_ADDR_WIDTH"
set location [string first $addrlen $file_data 0]
puts "************ string location is $location ******************"
#cd ../../../../
set new_one [split $file_data "\n"]
puts "lenth is [llength $new_one]"
for {set i 0} {$i < [llength $new_one]} {incr i} {
	set bool [string match "*C_S_AXI_HWA_IO_ADDR_WIDTH*" [lindex $new_one $i]]
	if {$bool} {
		puts "found match at $i , size is [string length [lindex $new_one $i]]"
		if {[string length [lindex $new_one $i]] == 40} {
			set actual_addr [string range [lindex $new_one $i] 38 38]
			set line [lindex $new_one $i]
			#puts "old line is: $line"
			#puts "actual addr: $actual_addr"
			set line [string replace $line 38 38 "16"]
			#puts "after change line is: $line"
			set new_one [lreplace $new_one $i $i $line]
		} else {
			set actual_addr [string range [lindex $new_one $i] 38 39]
			set line [lindex $new_one $i]
			#puts "old line is: $line"
			#puts "actual addr: $actual_addr"
			set line [string replace $line 38 39 "16"]
			#puts "after change line is: $line"
			set new_one [lreplace $new_one $i $i $line]
		}
		puts "new line is: [lindex $new_one $i]"
		break
	}
}
set start 0
for {set i 0} {$i < [llength $new_one]} {incr i} {
	set bool [string match "*C_ADDR_WIDTH*" [lindex $new_one $i]]
	set line [lindex $new_one $i]
	if {$bool} {
		set line [string replace $line 18 42 $actual_addr]
		#puts "new line is $line"
		set new_one [lreplace $new_one $i $i $line]
	}
	set bool [string match "*\.AWADDR*" [lindex $new_one $i]]
	if {$bool} {
		set new_one [lreplace $new_one $i $i "    .AWADDR(s_axi_hwa_io_AWADDR\[$actual_addr-1:0\]),"]
		puts "new line is: [lindex $new_one $i]"
		puts "changed line $i"
	}
	set bool [string match "*\.ARADDR*" [lindex $new_one $i]]
	if {$bool} {
		set new_one [lreplace $new_one $i $i "    .ARADDR(s_axi_hwa_io_ARADDR\[$actual_addr-1:0\]),"]
		puts "new line is: [lindex $new_one $i]"
		puts "changed line $i"
	}
	puts $f [lindex $new_one $i]
}
#write the file itself

close $f











