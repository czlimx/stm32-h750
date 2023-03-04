    .thumb
    .syntax unified
    .cpu cortex-m7
    .fpu softvfp

    .global reset_handler

    .extern _stack
    .extern _data_start
    .extern _data_end
    .extern _bss_start
    .extern _bss_end
    .extern _data_load_addr
    .extern main
    .extern early_init

    .section .text.boot
    .type reset_handler, %function

reset_handler:
    ldr sp, =_stack

copy_data_from_flash:
    ldr r0, =_data_start
    ldr r1, =_data_end
    ldr r2, =_data_load_addr

copy_data_loop:
    ldr r3, [r2], #0x4
    str r3, [r0], #0x4
    cmp r0, r1
    bcc copy_data_loop

clear_bss:
    ldr r0, =_bss_start
    ldr r1, =_bss_end
    mov r2, #0x0

clear_bss_loop:
    str r2, [r0], #0x4
    cmp r0, r1
    bcc clear_bss_loop

    bl early_init
    bl main

loop:
    b loop

    .end