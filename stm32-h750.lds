MEMORY
{
    DTCMRAM (xrw) : ORIGIN = 0x20000000, LENGTH = 128K
    AXI_SRAM(xrw) : ORIGIN = 0x24000000, LENGTH = 512K
    SRAM1_3 (xrw) : ORIGIN = 0x30000000, LENGTH = 288K
    SRAM4   (xrw) : ORIGIN = 0x38000000, LENGTH = 64K
    ITCMRAM (xrw) : ORIGIN = 0x00000000, LENGTH = 64K
    FLASH   (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
}
OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
ENTRY(reset_handler)
SECTIONS
{
    .vectors : {
        . = ALIGN(4);
        KEEP(*(.vectors))
    } >FLASH

    .text : {
        . = ALIGN(4);
        *(.text.default_handler)
        *(.text.exception)
        *(.text.boot)
        *(.text.init)
        *(.text.interrupt)
        *(.text.cache)
        *(.text.mpu)
        *(.text.cp15)
        *(.text)
        *(.text*)
        *(.glue*)
        *(.vfp*)
        *(.v4*)
        *(*.iplt*)
    } > FLASH
    
	.rodata : {
        . = ALIGN(4);
		*(.rodata)
	} >FLASH

	.data : {
        . = ALIGN(4);
        _data_start = .;
        *(.data*)
        *(.igot*)
        _data_end  = .;
	} >AXI_SRAM AT> FLASH
    _data_load_addr = LOADADDR(.data);

	.bss :{
		. = ALIGN(4);
		_bss_start = .;
        *(.bss*)
        *(.COMMON*)
        . = ALIGN(4);
		_bss_end = .;
	} >AXI_SRAM

    .stack :
    {
        . = ALIGN(4);
        __StackLimit = .;
        *(.stack*)
        . = . + 0x20000;
        __StackTop = .;
    } >DTCMRAM
    _stack = __StackTop;
}
