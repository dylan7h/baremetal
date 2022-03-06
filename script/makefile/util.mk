define getdir
$(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))
endef

define add_include
  ifeq (y,$(3))
    include $(1)/$(2)/rule.mk
  endif
endef

ifeq ($(CONFIG_VERBOSE),y)
  Q=
  silent=>/dev/null
else
  Q=@
  silent=
endif