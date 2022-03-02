template_dir:=$(call getdir)

$(eval $(call add_include,$(template_dir),include))
$(eval $(call add_include,$(template_dir),source))