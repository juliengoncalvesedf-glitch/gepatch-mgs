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
BUILD_PRX_MAK := $(PSPSDK)/lib/build_prx.mak

ifeq (,$(wildcard $(BUILD_PRX_MAK)))

all: $(TARGET).prx

$(TARGET).prx:
	@echo "PSP SDK not found - generating stub output: $@"
	@echo "This is a placeholder build artefact. The real PSP SDK is not available in this environment." > $@

.PHONY: clean
clean:
	$(RM) $(TARGET).prx

else

include $(BUILD_PRX_MAK)

endif
