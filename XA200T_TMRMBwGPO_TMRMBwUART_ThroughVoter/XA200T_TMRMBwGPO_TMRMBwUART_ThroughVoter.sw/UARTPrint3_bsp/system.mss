
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = standalone
 PARAMETER OS_VER = 5.3
 PARAMETER PROC_INSTANCE = microblaze_3
 PARAMETER stdin = axi_uartlite_2
 PARAMETER stdout = axi_uartlite_2
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 2.3
 PARAMETER HW_INSTANCE = microblaze_3
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = AXItmrmvoter
 PARAMETER DRIVER_VER = 1.0
 PARAMETER HW_INSTANCE = AXItmrmvoter_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 4.0
 PARAMETER HW_INSTANCE = axi_gpio_5
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 3.1
 PARAMETER HW_INSTANCE = axi_uartlite_2
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = intc
 PARAMETER DRIVER_VER = 3.4
 PARAMETER HW_INSTANCE = microblaze_3_axi_intc
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.0
 PARAMETER HW_INSTANCE = microblaze_3_local_memory_dlmb_bram_if_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.0
 PARAMETER HW_INSTANCE = microblaze_3_local_memory_ilmb_bram_if_cntlr
END


