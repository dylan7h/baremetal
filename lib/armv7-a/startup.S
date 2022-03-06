#include "psr.h"
#include "cp15.h"
#include "memory_map.h"

.global _start
    .section ".vectors", "ax"

_start:
    .globl  _reset
	.globl	_undefined_instruction
	.globl	_software_interrupt
	.globl	_prefetch_abort
	.globl	_data_abort
	.globl	_not_used
	.globl	_irq
	.globl	_fiq

_reset:			        .word reset
_undefined_instruction:	.word undefined_instruction
_software_interrupt:	.word software_interrupt
_prefetch_abort:	    .word prefetch_abort
_data_abort:		    .word data_abort
_not_used:		        .word not_used
_irq:			        .word irq
_fiq:			        .word fiq

reset:
undefined_instruction:
software_interrupt:
prefetch_abort:
data_abort:
not_used:
irq:
fiq:
1:
    b	1b			/* hang and never return */