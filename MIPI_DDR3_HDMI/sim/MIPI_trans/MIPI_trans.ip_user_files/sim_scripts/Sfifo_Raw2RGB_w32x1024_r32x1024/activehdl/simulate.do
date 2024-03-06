onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+Sfifo_Raw2RGB_w32x1024_r32x1024  -L xpm -L fifo_generator_v13_2_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Sfifo_Raw2RGB_w32x1024_r32x1024 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {Sfifo_Raw2RGB_w32x1024_r32x1024.udo}

run 1000ns

endsim

quit -force
