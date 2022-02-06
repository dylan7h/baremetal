ifeq ($(shell test -e config.mk ; echo $$?),0)
include config.mk

include app/armv7-a/rule.mk
include app/armv7-m/rule.mk
include app/armv8-a/rule.mk

# Toolchain
CPP				:=	$(CONFIG_CROSS_COMPILE)cpp
AS				:=	$(CONFIG_CROSS_COMPILE)gcc
CC				:=	$(CONFIG_CROSS_COMPILE)gcc
CXX				:=	$(CONFIG_CROSS_COMPILE)g++
LD				:=	$(CONFIG_CROSS_COMPILE)gcc
OD				:=	$(CONFIG_CROSS_COMPILE)objdump
OC				:=	$(CONFIG_CROSS_COMPILE)objcopy

# General warnings
WARNINGS 		:= -Wall 
WARNINGS 		+= -Wmissing-include-dirs 
WARNINGS 		+= -Wunused
WARNINGS 		+= -Wdisabled-optimization
WARNINGS 		+= -Wvla
WARNINGS 		+= -Wshadow
WARNINGS 		+= -Wno-unused-parameter
WARNINGS 		+= -Wredundant-decls

# Additional warnings
# Level 1
WARNING1 		:= -Wextra
WARNING1 		+= -Wmissing-format-attribute
WARNING1 		+= -Wmissing-prototypes
WARNING1 		+= -Wold-style-definition

# Level 2
WARNING2 		:= -Waggregate-return
WARNING2 		+= -Wcast-align
WARNING2 		+= -Wnested-externs

# Level 3
WARNING3 		:= -Wbad-function-cast
WARNING3 		+= -Wcast-qual
WARNING3 		+= -Wconversion
WARNING3 		+= -Wpacked
WARNING3 		+= -Wpointer-arith
WARNING3 		+= -Wswitch-default

# For gcc
GCC_WARING 		:= -Wunused-but-set-variable 
GCC_WARING 		+= -Wmaybe-uninitialized
GCC_WARING 		+= -Wpacked-bitfield-compat
GCC_WARING 		+= -Wshift-overflow=2
GCC_WARING 		+= -Wlogical-op

# For clang
CLANG_WARNING	:=-Wshift-overflow
CLANG_WARNING	+=-Wshift-sign-overflow
CLANG_WARNING	+=-Wlogical-op-parentheses

# Check ARM Architecture Version
ifeq (${CONFIG_ARM_ARCH_MINOR},0)
CFLAGS_aarch32	+=	-march=armv${CONFIG_ARM_ARCH_MAJOR}-a
CFLAGS_aarch64	+=	-march=armv${CONFIG_ARM_ARCH_MAJOR}-a
else
CFLAGS_aarch32	+=	-march=armv${CONFIG_ARM_ARCH_MAJOR}.${CONFIG_ARM_ARCH_MINOR}-a
CFLAGS_aarch64	+=	-march=armv${CONFIG_ARM_ARCH_MAJOR}.${CONFIG_ARM_ARCH_MINOR}-a
endif

# Check ARM Instruction
ifeq (${CONFIG_AARCH32_INSTRUCTION_SET},A32)
CFLAGS_aarch32	+=	-marm
else ifeq (${CONFIG_AARCH32_INSTRUCTION_SET},T32)
CFLAGS_aarch32	+=	-mthumb
else
$(error Error: Unknown AArch32 instruction set ${CONFIG_AARCH32_INSTRUCTION_SET})
endif

# Check Build Type
ifeq (${CONFIG_DEBUG},y)
BUILD_DIR		:=	build/debug

CFLAGS_aarch32	+=	-g
ASFLAGS_aarch32	+=	-g -Wa,--gdwarf-2

CFLAGS_aarch64	+=	-g
ASFLAGS_aarch64	+=	-g -Wa,--gdwarf-2
else
BUILD_DIR		:=	build/release
endif

# Check Warning Level
ifeq (${CONFIG_WARNING_LEVEL},1)
WARNINGS += $(GCC_WARING) $(WARNING1)
else ifeq (${CONFIG_WARNING_LEVEL},2)
WARNINGS += $(GCC_WARING) $(WARNING1) $(WARNING2)
else ifeq (${CONFIG_WARNING_LEVEL},3)
WARNINGS += $(GCC_WARING) $(WARNING1) $(WARNING2) $(WARNING3)
endif

# Check Error
ifneq (${CONFIG_ERROR},y)
ERRORS := -Werror
endif

CPPFLAGS	=	$(ERRORS) $(WARNINGS) $(INCLUDES) $(DEFINES) -nostdinc
ASFLAGS		=	$(CPPFLAGS) $(ASFLAGS_$(CONFIG_ARCH)) -ffreestanding -Wa,--fatal-warnings
CFLAGS		=	$(CPPFLAGS) $(CFLAGS_$(CONFIG_ARCH)) -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fno-common -Os -std=gnu99
CXXFLAGS	=	$(CPPFLAGS) $(CFLAGS_$(CONFIG_ARCH)) -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fno-common -Os -std=c++14
LDFLAGS		=	-Wl,--fatal-warnings -O1 -Wl,--gc-sections -nostdlib


$(elf): $($(elf)_C_OBJ)


# From *.ld.S files
%.ld:	%.ld.S
	@mkdir -p $(BUILD_DIR)/$(dir $@)
	$(CPP) $(CPPFLAGS) -P -x assembler-with-cpp -D__LINKER__ -c $< -o $(BUILD_DIR)/$@ -MMD -MP

# From *.S files
%.S.o:	%.S
	@mkdir -p $(BUILD_DIR)/$(dir $@)
	$(CC) $(ASFLAGS) -x assembler-with-cpp -D__ASM__ -c $< -o $(BUILD_DIR)/$@ -MMD -MP

# From *.c files
%.c.o: %.c
	@mkdir -p $(BUILD_DIR)/$(dir $@)
	$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@ -MMD -MP

# From *.cpp files
%.cpp.o: %.cpp
	@mkdir -p $(BUILD_DIR)/$(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $(BUILD_DIR)/$@ -MMD -MP

# Include dependency file to have gcc recompile necessary sources  
-include $(DEPS)

endif



# Make .config
%_defconfig:
ifeq ($(shell test -e configs/$@ ; echo $$?),0)
	cp configs/$@ config.mk
else
	$(error Error: configs/$@ is not exist)
endif


