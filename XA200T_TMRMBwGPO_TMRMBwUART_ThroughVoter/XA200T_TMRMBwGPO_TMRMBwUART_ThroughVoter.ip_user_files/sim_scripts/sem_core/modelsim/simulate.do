onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L sem_v4_1_5 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.sem_core xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {sem_core.udo}

run -all

quit -force
