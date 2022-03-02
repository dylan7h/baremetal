plat_dir:=$(call getdir)

$(eval $(call add_include,$(plat_dir),$(CONFIG_PLAT)))