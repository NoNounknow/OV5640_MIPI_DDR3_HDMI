onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L xpm -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.v_tc_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {v_tc_0.udo}

run 1000ns

quit -force
