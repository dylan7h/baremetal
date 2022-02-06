armv7-a_DIR := $(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))

include $(armv7-a_DIR)/realview-pb-a8/rule.mk
