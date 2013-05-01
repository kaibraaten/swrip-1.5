BINARY = swrip
WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls -Wshadow -Wextra -Wno-unused-parameter -Wno-char-subscripts -Wno-write-strings -Wno-long-long

#Comment out the next line if your system doesn't have dlsym functionality.
USE_DLSYM = -DSWRIP_USE_DLSYM

#IMC2 - Comment out to dsable IMC2 support
IMC = 1

#Change from 0 to 1 to enable telnet debug logging.
DEBUG_TELNET = -DSWRIP_DEBUG_TELNET=0

CCFLAGS = -g3 -MMD -I. -Iutility $(WFLAGS) $(USE_DLSYM) $(DEBUG_TELNET) -ansi -pedantic
LDFLAGS = -lm -lz -Lutility -lutility -Wl,-rpath,../src/utility

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

CMDDIR = commands

ODIR = obj
_OBJ =  act_comm.o act_info.o act_move.o act_obj.o act_wiz.o alias.o \
	boards.o bounty.o build.o clans.o comm.o comments.o const.o \
	copyover.o db.o fight.o grub.o handler.o interp.o magic.o \
	makeobjs.o mapper.o misc.o mud_comm.o mud_prog.o nanny.o newarena.o \
	planets.o player.o reset.o save.o ships.o shops.o shuttle.o \
	skills.o special.o space.o spaceobjects.o swskills.o \
	tables.o track.o update.o vector3_aux.o \
	$(CMDDIR)/afk.o \
	$(CMDDIR)/allclantalk.o \
	$(CMDDIR)/ansi.o \
	$(CMDDIR)/answer.o \
	$(CMDDIR)/areas.o \
	$(CMDDIR)/ask.o \
	$(CMDDIR)/avtalk.o \
	$(CMDDIR)/beep.o \
	$(CMDDIR)/bug.o \
	$(CMDDIR)/channels.o \
	$(CMDDIR)/chat.o \
	$(CMDDIR)/clantalk.o \
	$(CMDDIR)/commands.o \
	$(CMDDIR)/compare.o \
	$(CMDDIR)/config.o \
	$(CMDDIR)/consider.o \
	$(CMDDIR)/credits.o \
	$(CMDDIR)/dismiss.o \
	$(CMDDIR)/emote.o \
	$(CMDDIR)/examine.o \
	$(CMDDIR)/exits.o \
	$(CMDDIR)/follow.o \
	$(CMDDIR)/glance.o \
	$(CMDDIR)/group.o \
	$(CMDDIR)/gtell.o \
	$(CMDDIR)/help.o \
	$(CMDDIR)/hedit.o \
	$(CMDDIR)/hlist.o \
	$(CMDDIR)/hset.o \
	$(CMDDIR)/i103.o \
	$(CMDDIR)/i104.o \
	$(CMDDIR)/i105.o \
	$(CMDDIR)/idea.o \
	$(CMDDIR)/immtalk.o \
	$(CMDDIR)/languages.o \
	$(CMDDIR)/look.o \
	$(CMDDIR)/music.o \
	$(CMDDIR)/newbiechat.o \
	$(CMDDIR)/nohelps.o \
	$(CMDDIR)/ooc.o \
	$(CMDDIR)/order.o \
	$(CMDDIR)/pager.o \
	$(CMDDIR)/password.o \
	$(CMDDIR)/practice.o \
	$(CMDDIR)/quest.o \
	$(CMDDIR)/quit.o \
	$(CMDDIR)/reply.o \
	$(CMDDIR)/save.o \
	$(CMDDIR)/say.o \
	$(CMDDIR)/shiptalk.o \
	$(CMDDIR)/shout.o \
	$(CMDDIR)/showstatistic.o \
	$(CMDDIR)/showstatistic_web.o \
	$(CMDDIR)/slist.o \
	$(CMDDIR)/socials.o \
	$(CMDDIR)/sound.o \
	$(CMDDIR)/spacetalk.o \
	$(CMDDIR)/speak.o \
	$(CMDDIR)/split.o \
	$(CMDDIR)/systemtalk.o \
	$(CMDDIR)/teach.o \
	$(CMDDIR)/tell.o \
	$(CMDDIR)/time.o \
	$(CMDDIR)/typo.o \
	$(CMDDIR)/yell.o \
	$(CMDDIR)/wartalk.o \
	$(CMDDIR)/weather.o \
	$(CMDDIR)/where.o \
	$(CMDDIR)/who.o \
	$(CMDDIR)/whois.o \
	$(CMDDIR)/wimpy.o \
	$(CMDDIR)/wizlist.o \

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

ifdef IMC
OBJ += $(ODIR)/imc.o
CCFLAGS += -DSWRIP_USE_IMC
endif

all:		libs $(BINARY)

libs:
		$(MAKE) -C utility

$(BINARY):	$(OBJ)
		@echo "Linking" $(BINARY)
		@$(CC) -o $@ $^ $(LDFLAGS)
		@mv $(BINARY) ../bin
		@echo "Done."

$(ODIR)/%.o:	%.c
		@echo "Compiling" $<
		@$(CC) -c -o $@ $< $(CCFLAGS)

-include $(ODIR)/*.d
-include $(ODIR)/$(CMDDIR)/*.d

clean:
		-rm -f ../bin/$(BINARY) *~ $(ODIR)/*.o $(ODIR)/*.d $(ODIR)/$(CMDDIR)/*.o $(ODIR)/$(CMDDIR)/*.d ../area/core.*
