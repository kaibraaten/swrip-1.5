BINARY = swrip
#WFLAGS = -Werror -Wall -Wformat-security -Wpointer-arith -Wcast-align -Wwrite-strings -Wshadow -Wextra -Wno-unused-parameter -Wredundant-decls
WFLAGS = -Wall -Werror

CCFLAGS = -g3 -MMD $(WFLAGS) $(USE_DLSYM) $(DEBUG_TELNET)
LDFLAGS = -lm -lcrypt

#Uncomment the next line of you're using Solaris and you get linker errors.
#SOLARIS = 1
ifdef SOLARIS
LDFLAGS += -lsocket -lnsl
endif

ODIR = obj
_OBJ =  act_comm.o act_info.o act_move.o act_obj.o act_wiz.o boards.o \
	build.o clans.o comm.o comments.o const.o db.o fight.o \
	handler.o hashstr.o interp.o magic.o makeobjs.o \
	misc.o mud_comm.o mud_prog.o newarena.o player.o requests.o \
	reset.o save.o shops.o skills.o special.o tables.o track.o update.o \
	space.o space2.o bounty.o swskills.o alias.o grub.o mapper.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

all:		 $(BINARY)

$(BINARY):	$(OBJ)
		@echo "Linking" $(BINARY)
		@$(CC) -o $@ $^ $(LDFLAGS)
		@mv $(BINARY) ../
		@echo "Done."

$(ODIR)/%.o:	 %.c
		@echo "Compiling" $<
		@$(CC) -c -o $@ $< $(CCFLAGS)

-include $(ODIR)/*.d

clean :
		-rm -f $(BINARY) *~ $(ODIR)/*.o ../core* $(ODIR)/*.d
