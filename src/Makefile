BINARY = swrip
#WFLAGS = -Werror -Wall -Wformat-security -Wpointer-arith -Wcast-align -Wwrite-strings -Wshadow -Wextra -Wno-unused-parameter -Wredundant-decls
WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wno-unused-but-set-variable

#Comment out the next line if your system doesn't have dlsym functionality.
USE_DLSYM = -DSWR2_USE_DLSYM

#IMC2 - Comment out to dsable IMC2 support
IMC = 1

#Change from 0 to 1 to enable telnet debug logging.
DEBUG_TELNET = -DSWR2_DEBUG_TELNET=0

CCFLAGS = -g3 -MMD -Iswr_support $(WFLAGS) $(USE_DLSYM) $(DEBUG_TELNET)
LDFLAGS = -lm -lcrypt -lz

#Uncomment the next line of you're using Solaris and you get linker errors.
#SOLARIS = 1
ifdef SOLARIS
LDFLAGS += -lsocket -lnsl
endif

#Only way I know of to detect Cygwin environment
ifeq ($(shell echo $$OSTYPE),cygwin)
LDFLAGS += -export-all-symbols
endif

#On some systems (e.g. FreeBSD) you may need to remove -ldl
ifdef USE_DLSYM
LDFLAGS += -ldl -rdynamic
endif

ODIR = obj
_OBJ =  act_comm.o act_info.o act_move.o act_obj.o act_wiz.o alias.o boards.o \
	bounty.o build.o clans.o comm.o comments.o const.o copyover.o db.o \
	fight.o grub.o handler.o hashstr.o interp.o magic.o makeobjs.o \
	mapper.o misc.o mud_comm.o mud_prog.o newarena.o player.o \
	reset.o save.o shops.o skills.o special.o space.o space2.o \
	swskills.o tables.o track.o update.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

ifdef IMC
OBJ += $(ODIR)/imc.o
CCFLAGS += -DSWR2_USE_IMC
endif

all:		libs $(BINARY)

libs:
		$(MAKE) -C swr_support

$(BINARY):	$(OBJ)
		@echo "Linking" $(BINARY)
		@$(CC) -o $@ $^ $(LDFLAGS)
		@mv $(BINARY) ../bin
		@echo "Done."

$(ODIR)/%.o:	 %.c
		@echo "Compiling" $<
		@$(CC) -c -o $@ $< $(CCFLAGS)

-include $(ODIR)/*.d

clean:
		-rm -f ../bin/$(BINARY) *~ $(ODIR)/*.o ../area/core.*
