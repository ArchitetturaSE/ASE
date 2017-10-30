rm *.cf *.vcd

ghdl -a half_adder.vhd

ghdl -a half_adder_tsb.vhd

ghdl -e half_adder_tsb

ghdl -r half_adder_tsb --vcd=HA.vcd --stop-time=100us

gtkwave HA.vcd
