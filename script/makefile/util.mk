define getdir
$(patsubst %/,%,$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST)))))
endef

define add_include
  ifndef (,$(2))
    include $(1)/$(2)/rule.mk
  endif
endef

ifeq ($(CONFIG_VERBOSE),y)
  Q=@
  silent=
else
  Q=
  silent=>/dev/null
endif