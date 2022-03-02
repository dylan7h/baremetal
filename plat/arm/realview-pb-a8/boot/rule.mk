boot_dir:=$(call getdir)

lds-y+=$(boot_dir)/memory.ld
plat-y+=$(boot_dir)/startup.S.o
plat-y+=$(boot_dir)/main.c.o
