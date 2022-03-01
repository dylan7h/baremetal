PLAT_PATH=$(shell find plat -name $(CONFIG_PLAT))
include app/$(CONFIG_APP_NAME)/rule.mk
include include/$(PLAT_PATH)/rule.mk
include $(PLAT_PATH)/rule.mk

TARGET=$(CONFIG_OUTPUT_DIR)/$(CONFIG_PLAT)

AUTO_CONF_PATH=$(CONFIG_BUILD_DIR)/generated/autoconf.h
AUTO_CONF_TEMP_PATH=$(CONFIG_BUILD_DIR)/generated/temp.h

CPPFLAGS	+=$(ERRORS) $(WARNINGS) $(INCLUDES) $(DEFINES) -include $(AUTO_CONF_PATH) -nostdinc
ASFLAGS		+=$(CPPFLAGS) $(arch-y) -ffreestanding -Wa,--fatal-warnings
CFLAGS		+=$(CPPFLAGS) $(arch-y) -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fno-common -Os -std=gnu99
CXXFLAGS	+=$(CPPFLAGS) $(arch-y) -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fno-common -Os -std=c++14
LDFLAGS		+=-Wl,--fatal-warnings -O1 -Wl,--gc-sections -nostdlib

lds 		:=$(addprefix $(CONFIG_BUILD_DIR)/, $(lds-y))
objs		:=$(addprefix $(CONFIG_BUILD_DIR)/, $(plat-y))
objs 		+=$(addprefix $(CONFIG_BUILD_DIR)/, $(app-y))

deps		:=$(addprefix $(CONFIG_BUILD_DIR)/, $(lds-y:.ld=.d))
deps		+=$(addprefix $(CONFIG_BUILD_DIR)/, $(objs:.o=.d))

all: $(AUTO_CONF_PATH) $(TARGET)
	
$(TARGET):  $(lds) $(objs)
	$(Q)mkdir -p $(CONFIG_OUTPUT_DIR)

	@echo [LD] $@ $(silent)
	$(Q)$(LD) -n -T $(lds) -o $@ $(objs) -Wl,-Map=$@.map $(LDFLAGS)

	@echo [OD] $@.asm $(silent)
	$(Q)$(OD) -S --disassemble $@ > $@.asm

	@echo [OD] $@.bin $(silent)
	$(Q)$(OC) -O binary -S $@ $@.bin

	@echo [OC] $@.hex $(silent)
	$(Q)$(OC) -O ihex -S $@ $@.hex

lib:
	$(MAKE) -C lib

clean:
	@echo [RM] $(CONFIG_BUILD_DIR)/$(PLAT_PATH) $(silent)
	@echo [RM] $(CONFIG_BUILD_DIR)/app/$(CONFIG_APP_NAME) $(silent)
	@echo [RM] $(CONFIG_OUTPUT_DIR)/$(CONFIG_PLAT)* $(silent)

	$(Q)rm -rf $(CONFIG_BUILD_DIR)/$(PLAT_PATH)
	$(Q)rm -rf $(CONFIG_BUILD_DIR)/app/$(CONFIG_APP_NAME)
	$(Q)rm -rf $(CONFIG_OUTPUT_DIR)/$(CONFIG_PLAT)*

distclean:
	@echo [RM] $(CONFIG_BUILD_DIR) $(silent)
	@echo [RM] $(CONFIG_OUTPUT_DIR) $(silent)
	@echo [RM] $(CONFIG_DEFCONFIG) $(silent)

	$(Q)rm -rf $(CONFIG_BUILD_DIR)
	$(Q)rm -rf $(CONFIG_OUTPUT_DIR)
	$(Q)rm -rf $(CONFIG_DEFCONFIG)

# From *.ld.S files
$(CONFIG_BUILD_DIR)/%.ld: %.ld.S
	$(Q)mkdir -p $(dir $@)

	@echo [PP] $@ $(silent)
	$(Q)$(CPP) $(CPPFLAGS) -P -x assembler-with-cpp -D__LINKER__ $< -o $@ -MMD -MP -MT $@

# From *.S files
$(CONFIG_BUILD_DIR)/%.S.o: %.S
	$(Q)mkdir -p $(dir $@)

	@echo [AS] $@ $(silent)
	$(Q)$(CC) $(ASFLAGS) -x assembler-with-cpp -D__ASM__ -c $< -o $@ -MMD -MP

# From *.c files
$(CONFIG_BUILD_DIR)/%.c.o: %.c
	$(Q)mkdir -p $(dir $@)

	@echo [CC] $@ $(silent)
	$(Q)$(CC) $(CFLAGS) -c $< -o $@ -MMD -MP

# From *.cpp files
$(CONFIG_BUILD_DIR)/%.cpp.o: %.cpp
	$(Q)mkdir -p $(dir $@)

	@echo [CXX] $@ $(silent)
	$(Q)$(CXX) $(CXXFLAGS) -c $< -o $@ -MMD -MP

$(AUTO_CONF_PATH): $(DEFCONFIG_PATH)
	$(eval CONFIG_LISTS=$(shell cat $(DEFCONFIG_PATH)))
	$(Q)mkdir -p $(CONFIG_BUILD_DIR)/generated; \
	rm -f $(AUTO_CONF_TEMP_PATH); \
	printf "#ifndef __AUTO_CONF_H__\n" > $(AUTO_CONF_TEMP_PATH); \
	printf "#define __AUTO_CONF_H__\n\n" >> $(AUTO_CONF_TEMP_PATH); \
	for ITEM in $(CONFIG_LISTS); do \
		DEFINE_SYMBOL=$${ITEM%%=*}; \
		DEFINE_VALUE=$${ITEM##*=}; \
		printf "#ifndef $${DEFINE_SYMBOL}\n" >> $(AUTO_CONF_TEMP_PATH); \
		if [ -z $${DEFINE_VALUE} ]; then \
			printf "#define $${DEFINE_SYMBOL}\n" >> $(AUTO_CONF_TEMP_PATH); \
		else \
			printf "#define $${DEFINE_SYMBOL} $${DEFINE_VALUE}\n" >> $(AUTO_CONF_TEMP_PATH); \
		fi; \
		printf "#endif /* !$${DEFINE_SYMBOL} */\n\n" >> $(AUTO_CONF_TEMP_PATH); \
	done; \
	printf "#endif /* !__AUTO_CONF_H__ */\n" >> $(AUTO_CONF_TEMP_PATH); \
	if cmp -s $(AUTO_CONF_TEMP_PATH) $@; then \
		rm -r $(AUTO_CONF_TEMP_PATH); \
	else \
		mv $(AUTO_CONF_TEMP_PATH) $@; \
	fi; \

-include $(deps)
