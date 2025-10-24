TARGET = ge_patch
OBJS = main.o gu.o exports.o

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

INCDIR = 
CFLAGS = -O2 -G0 -Wall
CXXFLAGS = $(CFLAGS)
ASFLAGS = $(CFLAGS)

LIBDIR =
LIBS = -lpspgu -lpspdisplay -lpspge -lpspctrl -lpspsystemctrl_kernel
LDFLAGS = 

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = GePatch

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak

all: $(TARGET).prx
	cp $(TARGET).prx E:/pspemu/seplugins/$(TARGET).prx
