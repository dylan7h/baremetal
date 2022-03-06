plat_dir:=$(call getdir)
$(eval $(call add_include,$(plat_dir),arm,$(CONFIG_PLAT_ARM)))