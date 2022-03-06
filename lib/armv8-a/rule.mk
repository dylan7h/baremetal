armv8_dir:=$(call getdir)
$(eval $(call add_include,$(armv8_dir),aarch32,$(CONFIG_AARCH32)))
$(eval $(call add_include,$(armv8_dir),aarch64,$(CONFIG_AARCH64)))