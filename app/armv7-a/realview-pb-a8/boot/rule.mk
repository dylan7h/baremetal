boot_DIR := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

realview-pb-a8_LDS=$(boot_DIR)/memory.ld
realview-pb-a8_ASM_OBJ+=$(boot_DIR)/startup.S.o
