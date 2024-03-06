onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+v_tc_0  -L xpm -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.v_tc_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {v_tc_0.udo}

run 1000ns

endsim

quit -force
