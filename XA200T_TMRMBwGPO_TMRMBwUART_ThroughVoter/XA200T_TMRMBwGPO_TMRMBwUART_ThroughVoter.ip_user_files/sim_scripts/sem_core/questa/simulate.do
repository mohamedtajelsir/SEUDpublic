onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sem_core_opt

do {wave.do}

view wave
view structure
view signals

do {sem_core.udo}

run -all

quit -force
