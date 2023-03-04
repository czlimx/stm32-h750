    .thumb
    .syntax unified
    .cpu cortex-m7
    .fpu softvfp

    .global _start
    .extern _stack
    .extern reset_handler
/**
 * @brief  This is the code that gets called when the processor receives an
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 * @param  None
 * @retval None
*/
    .section .text.default_handler,"ax",%progbits
default_handler:
default_handler_loop:
  b  default_handler_loop
    .size  default_handler, .-default_handler   
/******************************************************************************
*
* The minimal vector table for a Cortex M. Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
*
*******************************************************************************/
    .section .vectors,"a",%progbits
    .type  is_vectors, %object
    .size  is_vectors, .-is_vectors

is_vectors:
    .word     _stack
    .word     reset_handler

    .word     nmi_handler
    .word     hardfault_handler
    .word     memmanage_handler
    .word     busfault_handler
    .word     usagefault_handler
    .word     0
    .word     0
    .word     0
    .word     0
    .word     svc_handler
    .word     debugmon_handler
    .word     0
    .word     pendsv_handler
    .word     systick_handler

  /* External Interrupts */
    .word     wwdg_handler                   /* window watchdog              */
    .word     pvd_avd_handler                /* pvd/avd through exti line detection */
    .word     tamp_stamp_handler             /* tamper and timestamps through the exti line */
    .word     rtc_wkup_handler               /* rtc wakeup through the exti line */
    .word     flash_handler                  /* flash                        */
    .word     rcc_handler                    /* rcc                          */
    .word     exti0_handler                  /* exti line0                   */
    .word     exti1_handler                  /* exti line1                   */
    .word     exti2_handler                  /* exti line2                   */
    .word     exti3_handler                  /* exti line3                   */
    .word     exti4_handler                  /* exti line4                   */
    .word     dma1_stream0_handler           /* dma1 stream 0                */
    .word     dma1_stream1_handler           /* dma1 stream 1                */
    .word     dma1_stream2_handler           /* dma1 stream 2                */
    .word     dma1_stream3_handler           /* dma1 stream 3                */
    .word     dma1_stream4_handler           /* dma1 stream 4                */
    .word     dma1_stream5_handler           /* dma1 stream 5                */
    .word     dma1_stream6_handler           /* dma1 stream 6                */
    .word     adc_handler                    /* adc1, adc2 and adc3s         */
    .word     fdcan1_it0_handler             /* fdcan1 interrupt line 0      */
    .word     fdcan2_it0_handler             /* fdcan2 interrupt line 0      */
    .word     fdcan1_it1_handler             /* fdcan1 interrupt line 1      */
    .word     fdcan2_it1_handler             /* fdcan2 interrupt line 1      */
    .word     exti9_5_handler                /* external line[9:5]s          */
    .word     tim1_brk_handler               /* tim1 break interrupt         */
    .word     tim1_up_handler                /* tim1 update interrupt        */
    .word     tim1_trg_com_handler           /* tim1 trigger and commutation interrupt */
    .word     tim1_cc_handler                /* tim1 capture compare         */
    .word     tim2_handler                   /* tim2                         */
    .word     tim3_handler                   /* tim3                         */
    .word     tim4_handler                   /* tim4                         */
    .word     i2c1_ev_handler                /* i2c1 event                   */
    .word     i2c1_er_handler                /* i2c1 error                   */
    .word     i2c2_ev_handler                /* i2c2 event                   */
    .word     i2c2_er_handler                /* i2c2 error                   */
    .word     spi1_handler                   /* spi1                         */
    .word     spi2_handler                   /* spi2                         */
    .word     usart1_handler                 /* usart1                       */
    .word     usart2_handler                 /* usart2                       */
    .word     usart3_handler                 /* usart3                       */
    .word     exti15_10_handler              /* external line[15:10]s        */
    .word     rtc_alarm_handler              /* rtc alarm (a and b) through exti line */
    .word     0                              /* reserved                     */
    .word     tim8_brk_tim12_handler         /* tim8 break and tim12         */
    .word     tim8_up_tim13_handler          /* tim8 update and tim13        */
    .word     tim8_trg_com_tim14_handler     /* tim8 trigger and commutation and tim14 */
    .word     tim8_cc_handler                /* tim8 capture compare         */
    .word     dma1_stream7_handler           /* dma1 stream7                 */
    .word     fmc_handler                    /* fmc                          */
    .word     sdmmc1_handler                 /* sdmmc1                       */
    .word     tim5_handler                   /* tim5                         */
    .word     spi3_handler                   /* spi3                         */
    .word     uart4_handler                  /* uart4                        */
    .word     uart5_handler                  /* uart5                        */
    .word     tim6_dac_handler               /* tim6 and dac1&2 underrun errors */
    .word     tim7_handler                   /* tim7                         */
    .word     dma2_stream0_handler           /* dma2 stream 0                */
    .word     dma2_stream1_handler           /* dma2 stream 1                */
    .word     dma2_stream2_handler           /* dma2 stream 2                */
    .word     dma2_stream3_handler           /* dma2 stream 3                */
    .word     dma2_stream4_handler           /* dma2 stream 4                */
    .word     eth_handler                    /* ethernet                     */
    .word     eth_wkup_handler               /* ethernet wakeup through exti line */
    .word     fdcan_cal_handler              /* fdcan calibration unit interrupt*/
    .word     0                              /* reserved                     */
    .word     0                              /* reserved                     */
    .word     0                              /* reserved                     */
    .word     0                              /* reserved                     */
    .word     dma2_stream5_handler           /* dma2 stream 5                */
    .word     dma2_stream6_handler           /* dma2 stream 6                */
    .word     dma2_stream7_handler           /* dma2 stream 7                */
    .word     usart6_handler                 /* usart6                       */
    .word     i2c3_ev_handler                /* i2c3 event                   */
    .word     i2c3_er_handler                /* i2c3 error                   */
    .word     otg_hs_ep1_out_handler         /* usb otg hs end point 1 out   */
    .word     otg_hs_ep1_in_handler          /* usb otg hs end point 1 in    */
    .word     otg_hs_wkup_handler            /* usb otg hs wakeup through exti */
    .word     otg_hs_handler                 /* usb otg hs                   */
    .word     dcmi_handler                   /* dcmi                         */
    .word     cryp_handler                   /* crypto                       */
    .word     hash_rng_handler               /* hash and rng                 */
    .word     fpu_handler                    /* fpu                          */
    .word     uart7_handler                  /* uart7                        */
    .word     uart8_handler                  /* uart8                        */
    .word     spi4_handler                   /* spi4                         */
    .word     spi5_handler                   /* spi5                         */
    .word     spi6_handler                   /* spi6                         */
    .word     sai1_handler                   /* sai1                         */
    .word     ltdc_handler                   /* ltdc                         */
    .word     ltdc_er_handler                /* ltdc error                   */
    .word     dma2d_handler                  /* dma2d                        */
    .word     sai2_handler                   /* sai2                         */
    .word     quadspi_handler                /* quadspi                      */
    .word     lptim1_handler                 /* lptim1                       */
    .word     cec_handler                    /* hdmi_cec                     */
    .word     i2c4_ev_handler                /* i2c4 event                   */
    .word     i2c4_er_handler                /* i2c4 error                   */
    .word     spdif_rx_handler               /* spdif_rx                     */
    .word     otg_fs_ep1_out_handler         /* usb otg fs end point 1 out   */
    .word     otg_fs_ep1_in_handler          /* usb otg fs end point 1 in    */
    .word     otg_fs_wkup_handler            /* usb otg fs wakeup through exti */
    .word     otg_fs_handler                 /* usb otg fs                   */
    .word     dmamux1_ovr_handler            /* dmamux1 overrun interrupt    */
    .word     hrtim1_master_handler          /* hrtim master timer global interrupt */
    .word     hrtim1_tima_handler            /* hrtim timer a global interrupt */
    .word     hrtim1_timb_handler            /* hrtim timer b global interrupt */
    .word     hrtim1_timc_handler            /* hrtim timer c global interrupt */
    .word     hrtim1_timd_handler            /* hrtim timer d global interrupt */
    .word     hrtim1_time_handler            /* hrtim timer e global interrupt */
    .word     hrtim1_flt_handler             /* hrtim fault global interrupt   */
    .word     dfsdm1_flt0_handler            /* dfsdm filter0 interrupt        */
    .word     dfsdm1_flt1_handler            /* dfsdm filter1 interrupt        */
    .word     dfsdm1_flt2_handler            /* dfsdm filter2 interrupt        */
    .word     dfsdm1_flt3_handler            /* dfsdm filter3 interrupt        */
    .word     sai3_handler                   /* sai3 global interrupt          */
    .word     swpmi1_handler                 /* serial wire interface 1 global interrupt */
    .word     tim15_handler                  /* tim15 global interrupt      */
    .word     tim16_handler                  /* tim16 global interrupt      */
    .word     tim17_handler                  /* tim17 global interrupt      */
    .word     mdios_wkup_handler             /* mdios wakeup  interrupt     */
    .word     mdios_handler                  /* mdios global interrupt      */
    .word     jpeg_handler                   /* jpeg global interrupt       */
    .word     mdma_handler                   /* mdma global interrupt       */
    .word     0                              /* reserved                    */
    .word     sdmmc2_handler                 /* sdmmc2 global interrupt     */
    .word     hsem1_handler                  /* hsem1 global interrupt      */
    .word     0                              /* reserved                    */
    .word     adc3_handler                   /* adc3 global interrupt       */
    .word     dmamux2_ovr_handler            /* dmamux overrun interrupt    */
    .word     bdma_channel0_handler          /* bdma channel 0 global interrupt */
    .word     bdma_channel1_handler          /* bdma channel 1 global interrupt */
    .word     bdma_channel2_handler          /* bdma channel 2 global interrupt */
    .word     bdma_channel3_handler          /* bdma channel 3 global interrupt */
    .word     bdma_channel4_handler          /* bdma channel 4 global interrupt */
    .word     bdma_channel5_handler          /* bdma channel 5 global interrupt */
    .word     bdma_channel6_handler          /* bdma channel 6 global interrupt */
    .word     bdma_channel7_handler          /* bdma channel 7 global interrupt */
    .word     comp1_handler                  /* comp1 global interrupt     */
    .word     lptim2_handler                 /* lp tim2 global interrupt   */
    .word     lptim3_handler                 /* lp tim3 global interrupt   */
    .word     lptim4_handler                 /* lp tim4 global interrupt   */
    .word     lptim5_handler                 /* lp tim5 global interrupt   */
    .word     lpuart1_handler                /* lp uart1 interrupt         */
    .word     0                              /* reserved                   */
    .word     crs_handler                    /* clock recovery global interrupt */
    .word     ecc_handler                    /* ecc diagnostic global interrupt */
    .word     sai4_handler                   /* sai4 global interrupt      */
    .word     0                              /* reserved                   */
    .word     0                              /* reserved                   */
    .word     wakeup_pin_handler             /* interrupt for all 6 wake-up pins */

/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the default_handler.
* As they are weak aliases, any function with the same name will override
* this definition.
*
*******************************************************************************/
    .weak      nmi_handler
    .thumb_set nmi_handler,default_handler

    .weak      hardfault_handler
    .thumb_set hardfault_handler,default_handler

    .weak      memmanage_handler
    .thumb_set memmanage_handler,default_handler

    .weak      busfault_handler
    .thumb_set busfault_handler,default_handler

    .weak      usagefault_handler
    .thumb_set usagefault_handler,default_handler

    .weak      svc_handler
    .thumb_set svc_handler,default_handler

    .weak      debugmon_handler
    .thumb_set debugmon_handler,default_handler

    .weak      pendsv_handler
    .thumb_set pendsv_handler,default_handler

    .weak      systick_handler
    .thumb_set systick_handler,default_handler

    .weak      wwdg_handler
    .thumb_set wwdg_handler,default_handler

    .weak      pvd_avd_handler
    .thumb_set pvd_avd_handler,default_handler

    .weak      tamp_stamp_handler
    .thumb_set tamp_stamp_handler,default_handler

    .weak      rtc_wkup_handler
    .thumb_set rtc_wkup_handler,default_handler

    .weak      flash_handler
    .thumb_set flash_handler,default_handler

    .weak      rcc_handler
    .thumb_set rcc_handler,default_handler

    .weak      exti0_handler
    .thumb_set exti0_handler,default_handler

    .weak      exti1_handler
    .thumb_set exti1_handler,default_handler

    .weak      exti2_handler
    .thumb_set exti2_handler,default_handler

    .weak      exti3_handler
    .thumb_set exti3_handler,default_handler

    .weak      exti4_handler
    .thumb_set exti4_handler,default_handler

    .weak      dma1_stream0_handler
    .thumb_set dma1_stream0_handler,default_handler

    .weak      dma1_stream1_handler
    .thumb_set dma1_stream1_handler,default_handler

    .weak      dma1_stream2_handler
    .thumb_set dma1_stream2_handler,default_handler

    .weak      dma1_stream3_handler
    .thumb_set dma1_stream3_handler,default_handler

    .weak      dma1_stream4_handler
    .thumb_set dma1_stream4_handler,default_handler

    .weak      dma1_stream5_handler
    .thumb_set dma1_stream5_handler,default_handler

    .weak      dma1_stream6_handler
    .thumb_set dma1_stream6_handler,default_handler

    .weak      adc_handler
    .thumb_set adc_handler,default_handler

    .weak      fdcan1_it0_handler
    .thumb_set fdcan1_it0_handler,default_handler

    .weak      fdcan2_it0_handler
    .thumb_set fdcan2_it0_handler,default_handler

    .weak      fdcan1_it1_handler
    .thumb_set fdcan1_it1_handler,default_handler

    .weak      fdcan2_it1_handler
    .thumb_set fdcan2_it1_handler,default_handler

    .weak      exti9_5_handler
    .thumb_set exti9_5_handler,default_handler

    .weak      tim1_brk_handler
    .thumb_set tim1_brk_handler,default_handler

    .weak      tim1_up_handler
    .thumb_set tim1_up_handler,default_handler

    .weak      tim1_trg_com_handler
    .thumb_set tim1_trg_com_handler,default_handler

    .weak      tim1_cc_handler
    .thumb_set tim1_cc_handler,default_handler

    .weak      tim2_handler
    .thumb_set tim2_handler,default_handler

    .weak      tim3_handler
    .thumb_set tim3_handler,default_handler

    .weak      tim4_handler
    .thumb_set tim4_handler,default_handler

    .weak      i2c1_ev_handler
    .thumb_set i2c1_ev_handler,default_handler

    .weak      i2c1_er_handler
    .thumb_set i2c1_er_handler,default_handler

    .weak      i2c2_ev_handler
    .thumb_set i2c2_ev_handler,default_handler

    .weak      i2c2_er_handler
    .thumb_set i2c2_er_handler,default_handler

    .weak      spi1_handler
    .thumb_set spi1_handler,default_handler

    .weak      spi2_handler
    .thumb_set spi2_handler,default_handler

    .weak      usart1_handler
    .thumb_set usart1_handler,default_handler

    .weak      usart2_handler
    .thumb_set usart2_handler,default_handler

    .weak      usart3_handler
    .thumb_set usart3_handler,default_handler

    .weak      exti15_10_handler
    .thumb_set exti15_10_handler,default_handler

    .weak      rtc_alarm_handler
    .thumb_set rtc_alarm_handler,default_handler

    .weak      tim8_brk_tim12_handler
    .thumb_set tim8_brk_tim12_handler,default_handler

    .weak      tim8_up_tim13_handler
    .thumb_set tim8_up_tim13_handler,default_handler

    .weak      tim8_trg_com_tim14_handler
    .thumb_set tim8_trg_com_tim14_handler,default_handler

    .weak      tim8_cc_handler
    .thumb_set tim8_cc_handler,default_handler

    .weak      dma1_stream7_handler
    .thumb_set dma1_stream7_handler,default_handler

    .weak      fmc_handler
    .thumb_set fmc_handler,default_handler

    .weak      sdmmc1_handler
    .thumb_set sdmmc1_handler,default_handler

    .weak      tim5_handler
    .thumb_set tim5_handler,default_handler

    .weak      spi3_handler
    .thumb_set spi3_handler,default_handler

    .weak      uart4_handler
    .thumb_set uart4_handler,default_handler

    .weak      uart5_handler
    .thumb_set uart5_handler,default_handler

    .weak      tim6_dac_handler
    .thumb_set tim6_dac_handler,default_handler

    .weak      tim7_handler
    .thumb_set tim7_handler,default_handler

    .weak      dma2_stream0_handler
    .thumb_set dma2_stream0_handler,default_handler

    .weak      dma2_stream1_handler
    .thumb_set dma2_stream1_handler,default_handler

    .weak      dma2_stream2_handler
    .thumb_set dma2_stream2_handler,default_handler

    .weak      dma2_stream3_handler
    .thumb_set dma2_stream3_handler,default_handler

    .weak      dma2_stream4_handler
    .thumb_set dma2_stream4_handler,default_handler

    .weak      eth_handler
    .thumb_set eth_handler,default_handler

    .weak      eth_wkup_handler
    .thumb_set eth_wkup_handler,default_handler

    .weak      fdcan_cal_handler
    .thumb_set fdcan_cal_handler,default_handler

    .weak      dma2_stream5_handler
    .thumb_set dma2_stream5_handler,default_handler

    .weak      dma2_stream6_handler
    .thumb_set dma2_stream6_handler,default_handler

    .weak      dma2_stream7_handler
    .thumb_set dma2_stream7_handler,default_handler

    .weak      usart6_handler
    .thumb_set usart6_handler,default_handler

    .weak      i2c3_ev_handler
    .thumb_set i2c3_ev_handler,default_handler

    .weak      i2c3_er_handler
    .thumb_set i2c3_er_handler,default_handler

    .weak      otg_hs_ep1_out_handler
    .thumb_set otg_hs_ep1_out_handler,default_handler

    .weak      otg_hs_ep1_in_handler
    .thumb_set otg_hs_ep1_in_handler,default_handler

    .weak      otg_hs_wkup_handler
    .thumb_set otg_hs_wkup_handler,default_handler

    .weak      otg_hs_handler
    .thumb_set otg_hs_handler,default_handler

    .weak      dcmi_handler
    .thumb_set dcmi_handler,default_handler

    .weak      cryp_handler
    .thumb_set cryp_handler,default_handler

    .weak      hash_rng_handler
    .thumb_set hash_rng_handler,default_handler

    .weak      fpu_handler
    .thumb_set fpu_handler,default_handler

    .weak      uart7_handler
    .thumb_set uart7_handler,default_handler

    .weak      uart8_handler
    .thumb_set uart8_handler,default_handler

    .weak      spi4_handler
    .thumb_set spi4_handler,default_handler

    .weak      spi5_handler
    .thumb_set spi5_handler,default_handler

    .weak      spi6_handler
    .thumb_set spi6_handler,default_handler

    .weak      sai1_handler
    .thumb_set sai1_handler,default_handler

    .weak      ltdc_handler
    .thumb_set ltdc_handler,default_handler

    .weak      ltdc_er_handler
    .thumb_set ltdc_er_handler,default_handler

    .weak      dma2d_handler
    .thumb_set dma2d_handler,default_handler

    .weak      sai2_handler
    .thumb_set sai2_handler,default_handler

    .weak      quadspi_handler
    .thumb_set quadspi_handler,default_handler

    .weak      lptim1_handler
    .thumb_set lptim1_handler,default_handler

    .weak      cec_handler
    .thumb_set cec_handler,default_handler

    .weak      i2c4_ev_handler
    .thumb_set i2c4_ev_handler,default_handler

    .weak      i2c4_er_handler
    .thumb_set i2c4_er_handler,default_handler

    .weak      spdif_rx_handler
    .thumb_set spdif_rx_handler,default_handler

    .weak      otg_fs_ep1_out_handler
    .thumb_set otg_fs_ep1_out_handler,default_handler

    .weak      otg_fs_ep1_in_handler
    .thumb_set otg_fs_ep1_in_handler,default_handler

    .weak      otg_fs_wkup_handler
    .thumb_set otg_fs_wkup_handler,default_handler

    .weak      otg_fs_handler
    .thumb_set otg_fs_handler,default_handler

    .weak      dmamux1_ovr_handler
    .thumb_set dmamux1_ovr_handler,default_handler

    .weak      hrtim1_master_handler
    .thumb_set hrtim1_master_handler,default_handler

    .weak      hrtim1_tima_handler
    .thumb_set hrtim1_tima_handler,default_handler

    .weak      hrtim1_timb_handler
    .thumb_set hrtim1_timb_handler,default_handler

    .weak      hrtim1_timc_handler
    .thumb_set hrtim1_timc_handler,default_handler

    .weak      hrtim1_timd_handler
    .thumb_set hrtim1_timd_handler,default_handler

    .weak      hrtim1_time_handler
    .thumb_set hrtim1_time_handler,default_handler

    .weak      hrtim1_flt_handler
    .thumb_set hrtim1_flt_handler,default_handler

    .weak      dfsdm1_flt0_handler
    .thumb_set dfsdm1_flt0_handler,default_handler

    .weak      dfsdm1_flt1_handler
    .thumb_set dfsdm1_flt1_handler,default_handler

    .weak      dfsdm1_flt2_handler
    .thumb_set dfsdm1_flt2_handler,default_handler

    .weak      dfsdm1_flt3_handler
    .thumb_set dfsdm1_flt3_handler,default_handler

    .weak      sai3_handler
    .thumb_set sai3_handler,default_handler

    .weak      swpmi1_handler
    .thumb_set swpmi1_handler,default_handler

    .weak      tim15_handler
    .thumb_set tim15_handler,default_handler

    .weak      tim16_handler
    .thumb_set tim16_handler,default_handler

    .weak      tim17_handler
    .thumb_set tim17_handler,default_handler

    .weak      mdios_wkup_handler
    .thumb_set mdios_wkup_handler,default_handler

    .weak      mdios_handler
    .thumb_set mdios_handler,default_handler

    .weak      jpeg_handler
    .thumb_set jpeg_handler,default_handler

    .weak      mdma_handler
    .thumb_set mdma_handler,default_handler

    .weak      sdmmc2_handler
    .thumb_set sdmmc2_handler,default_handler

    .weak      hsem1_handler
    .thumb_set hsem1_handler,default_handler

    .weak      adc3_handler
    .thumb_set adc3_handler,default_handler

    .weak      dmamux2_ovr_handler
    .thumb_set dmamux2_ovr_handler,default_handler

    .weak      bdma_channel0_handler
    .thumb_set bdma_channel0_handler,default_handler

    .weak      bdma_channel1_handler
    .thumb_set bdma_channel1_handler,default_handler

    .weak      bdma_channel2_handler
    .thumb_set bdma_channel2_handler,default_handler

    .weak      bdma_channel3_handler
    .thumb_set bdma_channel3_handler,default_handler

    .weak      bdma_channel4_handler
    .thumb_set bdma_channel4_handler,default_handler

    .weak      bdma_channel5_handler
    .thumb_set bdma_channel5_handler,default_handler

    .weak      bdma_channel6_handler
    .thumb_set bdma_channel6_handler,default_handler

    .weak      bdma_channel7_handler
    .thumb_set bdma_channel7_handler,default_handler

    .weak      comp1_handler
    .thumb_set comp1_handler,default_handler

    .weak      lptim2_handler
    .thumb_set lptim2_handler,default_handler

    .weak      lptim3_handler
    .thumb_set lptim3_handler,default_handler

    .weak      lptim4_handler
    .thumb_set lptim4_handler,default_handler

    .weak      lptim5_handler
    .thumb_set lptim5_handler,default_handler

    .weak      lpuart1_handler
    .thumb_set lpuart1_handler,default_handler

    .weak      crs_handler
    .thumb_set crs_handler,default_handler

    .weak      ecc_handler
    .thumb_set ecc_handler,default_handler

    .weak      sai4_handler
    .thumb_set sai4_handler,default_handler

    .weak      wakeup_pin_handler
    .thumb_set wakeup_pin_handler,default_handler

    .end