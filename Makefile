V = 1

VER = $(shell uname -r)
KDIR ?= /lib/modules/$(VER)/build

obj-m += hello.o

hello-objs += nimcache/nimhello.nim.o
hello-objs += nimcache/stdlib_allocators.nim.o
hello-objs += nimcache/stdlib_system.nim.o
hello-objs += nimcache/stdlib_io.nim.o
hello-objs += nimcache/stdlib_strutils.nim.o
hello-objs += nimcache/stdlib_parseutils.nim.o
hello-objs += nimcache/stdlib_dollars.nim.o
hello-objs += stubs/stubs.o
hello-objs += ../../../../../../opt/toolchains/i686-buildroot-linux-uclibc-gcc/usr/lib/gcc/i686-buildroot-linux-uclibc/4.6.4/libgcc.a

hello-lobs := lgcc

ccflags-y := -I$(src) -I$(src)/stubs


all: info nimcache/nimhello.nim.c modules

info:
	echo $(PWD)
	echo $(hello-src)
	echo $(hello-objs)

nimcache/nimhello.nim.c: nimhello.nim
	nim c -c \
		--nimcache:./nimcache \
		--os:kernel \
		--newruntime \
		--cpu:i386 \
		--noMain:on \
		-d:noSignalHandler \
		-d:release \
		-d:nimquirky \
		nimhello.nim


modules:
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) modules

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(shell pwd) clean
	$(RM) nimcache/* *.json

