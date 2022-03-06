armv7_dir:=$(call getdir)

INCLUDES+=-I include/$(armv7_dir)
lds-y+=$(armv7_dir)/memory.ld
lib-y+=$(armv7_dir)/startup.S.o