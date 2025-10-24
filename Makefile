TARGET = ge_patch
OBJS = main.o gu.o exports.o

# On indique explicitement qu’on construit un PRX
BUILD_PRX = 1
PRX_EXPORTS = exports.exp

INCDIR =
CFLAGS = -O2 -G0 -Wall
CXXFLAGS = $(CFLAGS)
ASFLAGS = $(CFLAGS)

LIBDIR =
# ⚠ Ajoute bien -lpspctrl
LIBS = -lpspgu -lpspdisplay -lpspge -lpspctrl -lpspsystemctrl_kernel
LDFLAGS =

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = GePatch

# Force le chemin PSPSDK si jamais psp-config ne marche pas
PSPSDK ?= /usr/local/pspdev/psp/sdk
include $(PSPSDK)/lib/build_prx.mak
