realview-pb-a8_DIR := $(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))

include $(realview-pb-a8_DIR)/boot/rule.mk
include $(realview-pb-a8_DIR)/include/rule.mk
include $(realview-pb-a8_DIR)/source/rule.mk
