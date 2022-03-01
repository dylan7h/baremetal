define getdir
$(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))
endef

ifeq ($(CONFIG_VERBOSE),y)
  Q=@
  silent=
else
  Q=
  silent=>/dev/null
endif