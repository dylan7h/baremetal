TOP_DIR				:=$(shell pwd)
MAKEFILE_SCRIPT_DIR	:=script/makefile
CONFIG_DEFCONFIG	?=config.mk
CONFIG_BUILD_DIR	?=build
DEFCONFIG_PATH		=$(shell find . -name $(CONFIG_DEFCONFIG))

%_defconfig:
ifeq ($(shell test -e configs/$@ ; echo $$?),0)
	cp configs/$@ config.mk
else
	$(error Error: configs/$@ is not exist)
endif

ifneq (,$(DEFCONFIG_PATH))
  include $(DEFCONFIG_PATH)
  include $(MAKEFILE_SCRIPT_DIR)/util.mk
  include $(MAKEFILE_SCRIPT_DIR)/toolchain.mk
  include $(MAKEFILE_SCRIPT_DIR)/architecture.mk
  include $(MAKEFILE_SCRIPT_DIR)/warning.mk
  include $(MAKEFILE_SCRIPT_DIR)/optimize.mk
  include $(MAKEFILE_SCRIPT_DIR)/target.mk
endif
