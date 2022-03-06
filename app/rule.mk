app_dir=$(call getdir)

$(eval $(call add_include,$(app_dir),template,$(CONFIG_APP_TEMPLATE)))