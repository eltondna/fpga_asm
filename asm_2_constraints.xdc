set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -period 10.00 [get_ports clk]

set_property PACKAGE_PIN L1 [get_ports led]					
set_property IOSTANDARD LVCMOS33 [get_ports led]


set_property PACKAGE_PIN V17 [get_ports enable]					
set_property IOSTANDARD LVCMOS33 [get_ports enable]
set_property PACKAGE_PIN V16 [get_ports reset]					
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN U2 [get_ports {ssdAnode[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdAnode[0]}]
set_property PACKAGE_PIN U4 [get_ports {ssdAnode[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdAnode[1]}]
set_property PACKAGE_PIN V4 [get_ports {ssdAnode[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdAnode[2]}]
set_property PACKAGE_PIN W4 [get_ports {ssdAnode[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdAnode[3]}]



set_property PACKAGE_PIN W7 [get_ports {ssdCathode[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[0]}]
set_property PACKAGE_PIN W6 [get_ports {ssdCathode[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[1]}]
set_property PACKAGE_PIN U8 [get_ports {ssdCathode[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[2]}]
set_property PACKAGE_PIN V8 [get_ports {ssdCathode[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[3]}]
set_property PACKAGE_PIN U5 [get_ports {ssdCathode[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[4]}]
set_property PACKAGE_PIN V5 [get_ports {ssdCathode[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[5]}]
set_property PACKAGE_PIN U7 [get_ports {ssdCathode[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ssdCathode[6]}]

