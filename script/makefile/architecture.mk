
arch_flag	+=-m$(CONFIG_ARM_INSTERUCTION_SET)

# architecture
arch-$(CONFIG_CPU_ARMV8_A)=-march=armv8-a
arch-$(CONFIG_CPU_ARMV8_R)=-march=armv8-r
arch-$(CONFIG_CPU_ARMV8_M)=-march=armv8-m
arch-$(CONFIG_CPU_ARMV7_A)=-march=armv7-a
arch-$(CONFIG_CPU_ARMV7_R)=-march=armv7-r
arch-$(CONFIG_CPU_ARMV7_M)=-march=armv7-m

# tune

# check arch/tune
ifeq (,$(arch-y))
  $(error Error: not specified arch or tune)
endif

# instruction
ifeq ($(CONFIG_INSTRUCTION_SET),A32)
  arch-y	+=	-marm
else ifeq ($(CONFIG_INSTRUCTION_SET),T32)
  arch-y	+=	-mthumb
else
  $(error Error: Unknown arm instruction set $(CONFIG_INSTRUCTION_SET))
endif