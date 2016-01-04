/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "intc_header.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "xbram.h"
#include "bram_header.h"
#include "bram_intr_header.h"
int main() 
{
   static XIntc intc;
   static XBram microblaze_2_local_memory_dlmb_bram_if_cntlr_Bram;
   static XBram microblaze_2_local_memory_ilmb_bram_if_cntlr_Bram;
   Xil_ICacheEnable();
   Xil_DCacheEnable();
   print("---Entering main---\n\r");
   

   {
      int status;

      print("\r\n Running IntcSelfTestExample() for microblaze_2_axi_intc...\r\n");

      status = IntcSelfTestExample(XPAR_MICROBLAZE_2_AXI_INTC_DEVICE_ID);

      if (status == 0) {
         print("IntcSelfTestExample PASSED\r\n");
      }
      else {
         print("IntcSelfTestExample FAILED\r\n");
      }
   }

   {
       int Status;

       Status = IntcInterruptSetup(&intc, XPAR_MICROBLAZE_2_AXI_INTC_DEVICE_ID);
       if (Status == 0) {
          print("Intc Interrupt Setup PASSED\r\n");
       }
       else {
         print("Intc Interrupt Setup FAILED\r\n");
      }
   }
   
   /*
    * Peripheral SelfTest will not be run for axi_uartlite_1
    * because it has been selected as the STDOUT device
    */

   

   {
      u32 status;
      
      print("\r\nRunning GpioOutputExample() for axi_gpio_4...\r\n");

      status = GpioOutputExample(XPAR_AXI_GPIO_4_DEVICE_ID,1);
      
      if (status == 0) {
         print("GpioOutputExample PASSED.\r\n");
      }
      else {
         print("GpioOutputExample FAILED.\r\n");
      }
   }
   

   {
      int status;
      
      print("\r\nRunning Bram Example() for microblaze_2_local_memory_dlmb_bram_if_cntlr...\r\n");

      status = BramExample(XPAR_MICROBLAZE_2_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_DEVICE_ID);

      if (status == 0) {
         xil_printf("Bram Example PASSED.\r\n");
      }
      else {
         print("Bram Example FAILED.\r\n");
      }
   }

   {
      int Status;

      Status = BramIntrExample(&intc, \
                               &microblaze_2_local_memory_dlmb_bram_if_cntlr_Bram, \
                               XPAR_MICROBLAZE_2_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_DEVICE_ID, \
                               XPAR_MICROBLAZE_2_AXI_INTC_MICROBLAZE_2_LOCAL_MEMORY_DLMB_BRAM_IF_CNTLR_INTERRUPT_INTR);

      if (Status == 0 ) {
         print("Bram Interrupt Test PASSED. \r\n"); 
      }
      else {
         print("Bram Interrupt Test FAILED.\r\n");
      }
   }

   

   {
      int status;
      
      print("\r\nRunning Bram Example() for microblaze_2_local_memory_ilmb_bram_if_cntlr...\r\n");

      status = BramExample(XPAR_MICROBLAZE_2_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_DEVICE_ID);

      if (status == 0) {
         xil_printf("Bram Example PASSED.\r\n");
      }
      else {
         print("Bram Example FAILED.\r\n");
      }
   }

   {
      int Status;

      Status = BramIntrExample(&intc, \
                               &microblaze_2_local_memory_ilmb_bram_if_cntlr_Bram, \
                               XPAR_MICROBLAZE_2_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_DEVICE_ID, \
                               XPAR_MICROBLAZE_2_AXI_INTC_MICROBLAZE_2_LOCAL_MEMORY_ILMB_BRAM_IF_CNTLR_INTERRUPT_INTR);

      if (Status == 0 ) {
         print("Bram Interrupt Test PASSED. \r\n"); 
      }
      else {
         print("Bram Interrupt Test FAILED.\r\n");
      }
   }

   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
