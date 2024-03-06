onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib Sfifo_Raw2RGB_w32x1024_r32x1024_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {Sfifo_Raw2RGB_w32x1024_r32x1024.udo}

run 1000ns

quit -force
