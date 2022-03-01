OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
    . = CONFIG_SYS_TEXT_BASE;

    . = ALIGN(4);
    .text :
    {
        *(.vectors)
        *(.text*)
    }

    . = ALIGN(4);
    .rodata :
    {
        *(.rodata)
    }

    . = ALIGN(4);
    .data :
    {
        *(.data*)
    }

    . = ALIGN(4);
    .bss :
    {
        __bss_start = .;
        *(.bss*)
        . = ALIGN(4);
		__bss_end = .;
    }

    __bss_size = __bss_end - __bss_start;
    .ARM.exidx : 
    { 
        *(.ARM.exidx*) 
    }
}
