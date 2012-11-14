BINARY = swrip
#WFLAGS = -Werror -Wall -Wformat-security -Wpointer-arith -Wcast-align -Wwrite-strings -Wshadow -Wextra -Wno-unused-parameter -Wredundant-decls
WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wno-unused-but-set-variable

CCFLAGS = -g3 -MMD $(WFLAGS) $(USE_DLSYM) $(DEBUG_TELNET)
LDFLAGS = -lm -lcrypt

#Uncomment the next line of you're using Solaris and you get linker errors.
#SOLARIS = 1
ifdef SOLARIS
LDFLAGS += -lsocket -lnsl
endif

ODIR = obj
_OBJ =  act_comm.o act_info.o act_move.o act_obj.o act_wiz.o alias.o boards.o \
	bounty.o build.o clans.o comm.o comments.o const.o copyover.o db.o \
	fight.o grub.o handler.o hashstr.o interp.o magic.o makeobjs.o \
	mapper.o misc.o mud_comm.o mud_prog.o newarena.o player.o \
	reset.o save.o shops.o skills.o special.o space.o space2.o \
	swskills.o tables.o track.o update.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

all:		$(BINARY)

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
