#ifndef __CP15__H__
#define __CP15__H__

#define ACCESS_CP15(Rn, CRn, Op1, CRm, Op2) p15, Op1, Rn, CRn, CRm, Op2

#define MIDR(Rn)            ACCESS_CP15(Rn, c0, 0, c0, 0)   /* Main ID Register */
#define CTR(Rn)             ACCESS_CP15(Rn, c0, 0, c0, 1)   /* Cache Type Register */
#define TCMTR(Rn)           ACCESS_CP15(Rn, c0, 0, c0, 2)   /* TCM Type Register */
#define TLBTR(Rn)           ACCESS_CP15(Rn, c0, 0, c0, 3)   /* TLB Type Register */
#define MPIDR(Rn)           ACCESS_CP15(Rn, c0, 0, c0, 5)   /* Multiprocessor Affinity Register */
#define REVIDR(Rn)          ACCESS_CP15(Rn, c0, 0, c0, 6)   /* Revision ID Register */

#define ID_PFR0(Rn)         ACCESS_CP15(Rn, c0, 0, c1, 0)   /* Processor Feature Register 0 */
#define ID_PFR1(Rn)         ACCESS_CP15(Rn, c0, 0, c1, 1)   /* Processor Feature Register 1 */
#define ID_DFR0(Rn)         ACCESS_CP15(Rn, c0, 0, c1, 2)   /* Debug Feature Register 0 */
#define ID_AFR0(Rn)         ACCESS_CP15(Rn, c0, 0, c1, 3)   /* Auxiliary Feature Register 0 */
#define ID_MMFR0(Rn)        ACCESS_CP15(Rn, c0, 0, c1, 4)   /* Memory Model Feature Register 0 */
#define ID_MMFR1(Rn)        ACCESS_CP15(Rn, c0, 0, c1, 5)   /* Memory Model Feature Register 1 */
#define ID_MMFR2(Rn)        ACCESS_CP15(Rn, c0, 0, c1, 6)   /* Memory Model Feature Register 2 */
#define ID_MMFR3(Rn)        ACCESS_CP15(Rn, c0, 0, c1, 7)   /* Memory Model Feature Register 3 */

#define ID_ISAR0(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 0)   /* Instruction Set Attribute Register 0 */
#define ID_ISAR1(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 1)   /* Instruction Set Attribute Register 1 */
#define ID_ISAR2(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 2)   /* Instruction Set Attribute Register 2 */
#define ID_ISAR3(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 3)   /* Instruction Set Attribute Register 3 */
#define ID_ISAR4(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 4)   /* Instruction Set Attribute Register 4 */
#define ID_ISAR5(Rn)        ACCESS_CP15(Rn, c0, 0, c2, 5)   /* Instruction Set Attribute Register 5 */

#define CCSIDR(Rn)          ACCESS_CP15(Rn, c0, 1, c0, 0)   /* Cache Size ID Registers */
#define CLIDR(Rn)           ACCESS_CP15(Rn, c0, 1, c0, 1)   /* Cache Level ID Register */
#define AIDR(Rn)            ACCESS_CP15(Rn, c0, 1, c0, 7)   /* IMPLEMENTATION DEFINED Auxiliary ID Register */

#define CSSELR(Rn)          ACCESS_CP15(Rn, c0, 2, c0, 0)   /* Cache Size Selection Register */
#define VPIDR(Rn)           ACCESS_CP15(Rn, c0, 4, c0, 0)   /* Virtualization Processor ID Register */
#define VMPIDR(Rn)          ACCESS_CP15(Rn, c0, 4, c0, 5)   /* Virtualization Multiprocessor ID Register */

#define SCTLR(Rn)           ACCESS_CP15(Rn, c1, 0, c0, 0)   /* System Control Register */
#define ACTLR(Rn)           ACCESS_CP15(Rn, c1, 0, c0, 1)   /* IMPLEMENTATION DEFINED Auxiliary Control Register */
#define CPACR(Rn)           ACCESS_CP15(Rn, c1, 0, c0, 2)   /* Coprocessor Access Control Register */

#define SCR(Rn)             ACCESS_CP15(Rn, c1, 0, c1, 0)   /* Secure Configuration Register */
#define SDER(Rn)            ACCESS_CP15(Rn, c1, 0, c1, 1)   /* Secure Debug Enable Register */
#define NSACR(Rn)           ACCESS_CP15(Rn, c1, 0, c1, 2)   /* Non-Secure Access Control Register */

#define HSCTLR(Rn)          ACCESS_CP15(Rn, c1, 4, c0, 0)   /* Hyp System Control Register */
#define HACTLR(Rn)          ACCESS_CP15(Rn, c1, 4, c0, 1)   /* Hyp Auxiliary Control Register */

#define HCR(Rn)             ACCESS_CP15(Rn, c1, 4, c1, 0)   /* Hyp Configuration Register */
#define HDCR(Rn)            ACCESS_CP15(Rn, c1, 4, c1, 1)   /* Hyp Debug Configuration Register */
#define HCPTR(Rn)           ACCESS_CP15(Rn, c1, 4, c1, 2)   /* Hyp Coprocessor Trap Register */
#define HSTR(Rn)            ACCESS_CP15(Rn, c1, 4, c1, 3)   /* Hyp System Trap Register */
#define HACR(Rn)            ACCESS_CP15(Rn, c1, 4, c1, 7)   /* Hyp Auxiliary Configuration Register */

#define TTBR0_32(Rn)        ACCESS_CP15(Rn, c2, 0, c0, 0)   /* Translation Table Base Register 0 */
#define TTBR0_64(Rn)        ACCESS_CP15(Rn, c2, 0, c2, 0)   /* Translation Table Base Register 0 */

#define TTBR1_32(Rn)        ACCESS_CP15(Rn, c2, 0, c0, 1)   /* Translation Table Base Register 1 */
#define TTBR1_64(Rn)        ACCESS_CP15(Rn, c2, 1, c2, 1)   /* Translation Table Base Register 1 */

#define TTBCR(Rn)           ACCESS_CP15(Rn, c2, 0, c0, 2)   /* Translation Table Base Control Register */
#define HTCR(Rn)            ACCESS_CP15(Rn, c2, 4, c0, 2)   /* Hyp Translation Control Register */
#define VTCR(Rn)            ACCESS_CP15(Rn, c2, 4, c1, 2)   /* Virtualization Translation Control Register */

#define HTTBR(Rn)           ACCESS_CP15(Rn, c2, 4, c2, 2)   /* Hyp Translation Table Base Register */
#define VTTBR(Rn)           ACCESS_CP15(Rn, c2, 6, c2, 2)   /* Hyp Translation Table Base Register */

#define DACR(Rn)            ACCESS_CP15(Rn, c3, 0, c0, 0)   /* Domain Access Control Register */

#define DFSR(Rn)            ACCESS_CP15(Rn, c5, 0, c0, 0)   /* Data Fault Status Register */
#define IFSR(Rn)            ACCESS_CP15(Rn, c5, 0, c0, 1)   /* Instruction Fault Status Register */

#define ADFSR(Rn)           ACCESS_CP15(Rn, c5, 0, c1, 0)   /* ADFSR, Auxiliary Data Fault Status Register */
#define AIFSR(Rn)           ACCESS_CP15(Rn, c5, 0, c1, 1)   /* AIFSR, Auxiliary Instruction Fault Status Register */

#define HADFSR(Rn)          ACCESS_CP15(Rn, c5, 4, c1, 0)   /* HADFSR, Hyp Auxiliary Data Fault Syndrome Register */
#define HAIFSR(Rn)          ACCESS_CP15(Rn, c5, 4, c1, 1)   /* HAIFSR, Hyp Auxiliary Instruction Fault Syndrome Register */
#define HSR(Rn)             ACCESS_CP15(Rn, c5, 4, c2, 10)  /* Hyp Syndrome Register */

#define DFAR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Data Fault Address Register */
#define IFAR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Instruction Fault Address Register */
#define HDFAR(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Hyp Data Fault Address Register */
#define HIFAR(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Hyp Instruction Fault Address Register */
#define HPFAR(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Hyp IPA Fault Address Register */
#define ICIALLUIS(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define BPIALLIS(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define PAR_32(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Physical Address Register */
#define PAR_64(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Physical Address Register */

#define ICIALLU(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ICIMVAU(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define CP15ISB(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define BPIALL(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define BPIMVA(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCIMVAC(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCISW(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1CPR(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1CPW(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1CUR(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1CUW(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS12NSOPR(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS12NSOPW(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS12NSOUR(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS12NSOUW(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCCMVAC(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCCSW(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define CP15DSB(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define CP15DMB(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCCMVAU(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCCIMVAC(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DCCISW(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1HR(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ATS1HW(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALLIS(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVAIS(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIASIDIS(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVAAIS(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ITLBIALL(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ITLBIMVA(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define ITLBIASID(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DTLBIALL(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DTLBIMVA(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define DTLBIASID(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALL(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVA(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIASID(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVAA(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALLHIS(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVAHIS(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALLNSNHIS(Rn)   ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALLH(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIMVAH(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define TLBIALLNSNH(Rn)     ACCESS_CP15(Rn, cn, 0, cn, 0)   /*  */
#define PMCR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Control Register */
#define PMCNTENSET(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Count Enable Set register */
#define PMCNTENCLR(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Count Enable Clear register */
#define PMOVSR(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Overflow Flag Status Register */
#define PMSWINC(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Software Increment register */
#define PMSELR(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Event Counter Selection Register */
#define PMCEID0(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Common Event Identification register 0 */
#define PMCEID1(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Common Event Identification register 1 */
#define PMCCNTR(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Cycle Count Register */
#define PMXEVTYPER(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Event Type Select Register */
#define PMXEVCNTR(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Event Count Register */
#define PMUSERENR(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors User Enable Register */
#define PMINTENSET(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Interrupt Enable Set register */
#define PMINTENCLR(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Interrupt Enable Clear register */
#define PMOVSSET(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Performance Monitors Overflow Flag Status Set register */

#define PRRR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Primary Region Remap Register */
#define MAIR0(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* MAIR0, Memory Attribute Indirection Register 0 */
#define NMRR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Normal Memory Remap Register */
#define MAIR1(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* MAIR1, Memory Attribute Indirection Register 1 */
#define AMAIR0(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* AMAIR0, Auxiliary Memory Attribute Indirection Register 0 */
#define AMAIR1(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* AMAIR1, Auxiliary Memory Attribute Indirection Register 1 */
#define HMAIR0(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* HMAIR0, Hyp Memory Attribute Indirection Register 0 */
#define HMAIR1(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* HMAIR1, Hyp Memory Attribute Indirection Register 1 */
#define HAMAIR0(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* HAMAIR0, Hyp Auxiliary Memory Attribute Indirection Register 0 */
#define HAMAIR1(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* HAMAIR1, Hyp Auxiliary Memory Attribute Indirection Register 1 */

#define VBAR(Rn)            ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Vector Base Address Register */
#define MVBAR(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Monitor Vector Base Address Register */
#define ISR(Rn)             ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Interrupt Status Register */
#define HVBAR(Rn)           ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Hyp Vector Base Address Register */
#define FCSEIDR(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* FCSE Process ID Register */
#define CONTEXTIDR(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Context ID Register */
#define TPIDRURW(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* User Read/Write Thread ID Register */
#define TPIDRURO(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* User Read-Only Thread ID Register */
#define TPIDRPRW(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL1 only Thread ID Register */
#define HTPIDR(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Hyp Software Thread ID Register */
#define CNTFRQ(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Counter Frequency register */
#define CNTPCT(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Physical Count register */
#define CNTKCTL(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Timer PL1 Control register */
#define CNTP_TVAL(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL1 Physical TimerValue register */
#define CNTP_CTL(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL1 Physical Timer Control register */
#define CNTV_TVAL(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Virtual TimerValue register */
#define CNTV_CTL(Rn)        ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Virtual Timer Control register */
#define CNTVCT(Rn)          ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Virtual Count register */
#define CNTP_CVAL(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL1 Physical Timer CompareValue register1 */
#define CNTV_CVAL(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Virtual Timer CompareValue register */
#define CNTVOFF(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Virtual Offset register */
#define CNTHCTL(Rn)         ACCESS_CP15(Rn, cn, 0, cn, 0)   /* Timer PL2 Control register */
#define CNTHP_TVAL(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL2 Physical TimerValue register */
#define CNTHP_CTL(Rn)       ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL2 Physical Timer Control register */
#define CNTHP_CVAL(Rn)      ACCESS_CP15(Rn, cn, 0, cn, 0)   /* PL2 Physical Timer CompareValue register */

#endif  //!__CP15__H__
