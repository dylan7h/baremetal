include_DIR := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

realview-pb-a8_INCLUDES+=$(include_DIR)
