
VER = $(shell uname -r)
KDIR = /lib/modules/$(VER)/build

obj-m += nimhello.o

all: nimhello.c modules

nimhello.c: nimhello.nim
	nim c -c --nimcache:. --os:standalone -d:release --gc:none $?

modules:
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) modules

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) clean
	$(RM) nimhello.c nimhello.json stdlib_system.c

