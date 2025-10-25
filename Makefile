TARGET = ge_patch
OBJS = main.o gu.o exports.o

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

CFLAGS = -O2 -G0 -Wall \
  -I./ARK-4/common/include \
  -I./ARK-4/libs/SystemCtrlForKernel/include

LIBDIR = -L./ARK-4/libs/SystemCtrlForKernel
LIBS = -lpspgu -lpspdisplay -lpspge -lpspctrl -lpspsystemctrl_kernel
LDFLAGS =

PSPSDK ?= /usr/local/pspdev/psp/sdk
include $(PSPSDK)/lib/build_prx.mak
