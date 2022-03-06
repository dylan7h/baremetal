lib_dir:=$(call getdir)

$(eval $(call add_include,$(lib_dir),armv7-a,$(CONFIG_CPU_ARMV7_A)))
$(eval $(call add_include,$(lib_dir),armv7-m,$(CONFIG_CPU_ARMV7_M)))
$(eval $(call add_include,$(lib_dir),armv8-a,$(CONFIG_CPU_ARMV8_A)))
$(eval $(call add_include,$(lib_dir),libc,$(CONFIG_LIB_C)))