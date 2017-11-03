#!/bin/sh
echo "Running ghdl commands"
ghdl -a half_adder.vhd
ghdl -a full_adder.vhd
ghdl -a sommatore_ripple_carry.vhd
ghdl -a sommatore_ripple_carry_testbench.vhd
ghdl -e sommatore_ripple_carry_testbench
ghdl -r sommatore_ripple_carry_testbench --vcd=sommatore_ripple_carry.vcd
echo "Done. Running gtkwave"
gtkwave sommatore_ripple_carry.vcd

