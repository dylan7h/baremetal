CURRENT_FILE_DIR = $(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))