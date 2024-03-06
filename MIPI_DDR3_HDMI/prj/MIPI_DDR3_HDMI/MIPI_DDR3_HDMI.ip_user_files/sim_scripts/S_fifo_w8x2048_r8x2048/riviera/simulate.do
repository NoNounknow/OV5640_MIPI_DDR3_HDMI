onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+S_fifo_w8x2048_r8x2048  -L xpm -L fifo_generator_v13_2_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.S_fifo_w8x2048_r8x2048 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {S_fifo_w8x2048_r8x2048.udo}

run 1000ns

endsim

quit -force
