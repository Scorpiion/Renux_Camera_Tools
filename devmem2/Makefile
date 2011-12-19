CROSS_COMPILE ?= arm-linux-gnueabi-

CC	:= $(CROSS_COMPILE)gcc
CFLAGS	?= -O2 -W -Wall
LDFLAGS	?=
LIBS	:= -lrt

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: devmem2

devmem2: devmem2.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f *.o
	-rm -f devmem2
	-rm -rf usr/local/bin/

