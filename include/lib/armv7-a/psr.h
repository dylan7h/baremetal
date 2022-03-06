#ifndef __PSR__H__
#define __PSR__H__

/* 
    R0      |           |           |           |           |           |           |           |
    R1      |           |           |           |           |           |           |           |
    R2      |           |           |           |           |           |           |           |
    R3      |           |           |           |           |           |           |           |
    R4      |           |           |           |           |           |           |           |
    R5      |           |           |           |           |           |           |           |
    R6      |           |           |           |           |           |           |           |
    R7      |           |           |           |           |           |           |           |
    R8      |   R8_FIQ  |           |           |           |           |           |           |
    R9      |   R9_FIQ  |           |           |           |           |           |           |
    R10     |   R10_FIQ |           |           |           |           |           |           |
    R11     |   R11_FIQ |           |           |           |           |           |           |
    R12     |   R12_FIQ |           |           |           |           |           |           |
    R13(SP) |   SP_FIQ  |   SP_IRQ  |   SP_ABT  |   SP_SVC  |   SP_UND  |   SP_MON  |   SP_HYP  |
    R14(LR) |   LR_FIQ  |   LR_IRQ  |   LR_ABT  |   LR_SVC  |   LR_UND  |   LR_MON  |           |
    R15(PC) |           |           |           |           |           |           |           |
    CPSR    |           |           |           |           |           |           |           |
            |   SPSR    |   SPSR    |   SPSR    |   SPSR    |   SPSR    |   SPSR    |   SPSR    |
            |           |           |           |           |           |           |   ELR     |
            
    SYS/USR     FIQ         IRQ         ABT         SVC         UND         MON         HYP
 */


/*
    M   [4:0]   - specifies the processor mode.
    T   [5]     - indicates whether the core is in Thumb state.
    F   [6]     - disables FIQ.
    I   [7]     - disables IRQ.
    A   [8]     - disables asynchronous aborts.
    E   [9]     - controls load/store endianness.
    IT  [15:10] - If-Then conditional execution of Thumb-2 instruction groups. [7:2]
    GE  [19:16] - used by some SIMD instructions. [3:0]
    RES [23:20]
    J   [24]    - indicates whether the core is in Jazelle state.
    IT  [26:25] - If-Then conditional execution of Thumb-2 instruction groups. [1:0]
    Q   [27]    - cumulative saturation (also described as sticky).
    V   [28]    - ALU operation oVerflowed.
    C   [29]    - ALU operation Carry out.
    Z   [30]    - Zero result from ALU.
    N   [31]    - Negative result from ALU.
 */
#define PSR_MODE_USR  /* 0b10000 */
#define PSR_MODE_FIQ  /* 0b10001 */
#define PSR_MODE_IRQ  /* 0b10010 */
#define PSR_MODE_SVC  /* 0b10011 */
#define PSR_MODE_MON  /* 0b10110 */
#define PSR_MODE_ABT  /* 0b10111 */
#define PSR_MODE_HYP  /* 0b11010 */
#define PSR_MODE_UND  /* 0b11011 */
#define PSR_MODE_SYS  /* 0b11111 */

#endif  //!__PSR__H_