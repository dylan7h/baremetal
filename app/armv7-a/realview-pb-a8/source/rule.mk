source_DIR := $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

realview-pb-a8_C_OBJ+=$(source_DIR)/main.c.o
