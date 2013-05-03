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
	$(CMDDIR)/advance.o \
	$(CMDDIR)/afk.o \
	$(CMDDIR)/alias.o \
	$(CMDDIR)/allow.o \
	$(CMDDIR)/at.o \
	$(CMDDIR)/allclantalk.o \
	$(CMDDIR)/auction.o \
	$(CMDDIR)/authorize.o \
	$(CMDDIR)/ansi.o \
	$(CMDDIR)/answer.o \
	$(CMDDIR)/areas.o \
	$(CMDDIR)/ask.o \
	$(CMDDIR)/avtalk.o \
	$(CMDDIR)/balzhur.o \
	$(CMDDIR)/bamfin.o \
	$(CMDDIR)/bamfout.o \
	$(CMDDIR)/ban.o \
	$(CMDDIR)/bashdoor.o \
	$(CMDDIR)/badname.o \
	$(CMDDIR)/beep.o \
	$(CMDDIR)/bestow.o \
	$(CMDDIR)/bestowarea.o \
	$(CMDDIR)/boards.o \
	$(CMDDIR)/bodybag.o \
	$(CMDDIR)/brandish.o \
	$(CMDDIR)/bset.o \
	$(CMDDIR)/bstat.o \
	$(CMDDIR)/bug.o \
	$(CMDDIR)/bury.o \
	$(CMDDIR)/cedit.o \
	$(CMDDIR)/channels.o \
	$(CMDDIR)/chat.o \
	$(CMDDIR)/clantalk.o \
	$(CMDDIR)/climb.o \
	$(CMDDIR)/close.o \
	$(CMDDIR)/cmdtable.o \
	$(CMDDIR)/commands.o \
	$(CMDDIR)/compare.o \
	$(CMDDIR)/config.o \
	$(CMDDIR)/consider.o \
	$(CMDDIR)/credits.o \
	$(CMDDIR)/cset.o \
	$(CMDDIR)/delay.o \
	$(CMDDIR)/deny.o \
	$(CMDDIR)/destroy.o \
	$(CMDDIR)/disconnect.o \
	$(CMDDIR)/dismiss.o \
	$(CMDDIR)/dnd.o \
	$(CMDDIR)/down.o \
	$(CMDDIR)/drag.o \
	$(CMDDIR)/drop.o \
	$(CMDDIR)/east.o \
	$(CMDDIR)/echo.o \
	$(CMDDIR)/emote.o \
	$(CMDDIR)/enter.o \
	$(CMDDIR)/examine.o \
	$(CMDDIR)/exits.o \
	$(CMDDIR)/fixchar.o \
	$(CMDDIR)/forceclose.o \
	$(CMDDIR)/follow.o \
	$(CMDDIR)/for.o \
	$(CMDDIR)/force.o \
	$(CMDDIR)/form_password.o \
	$(CMDDIR)/fquit.o \
	$(CMDDIR)/freeze.o \
	$(CMDDIR)/get.o \
	$(CMDDIR)/give.o \
	$(CMDDIR)/glance.o \
	$(CMDDIR)/group.o \
	$(CMDDIR)/gtell.o \
	$(CMDDIR)/help.o \
	$(CMDDIR)/hedit.o \
	$(CMDDIR)/hell.o \
	$(CMDDIR)/hlist.o \
	$(CMDDIR)/holylight.o \
	$(CMDDIR)/hset.o \
	$(CMDDIR)/i103.o \
	$(CMDDIR)/i104.o \
	$(CMDDIR)/i105.o \
	$(CMDDIR)/idea.o \
	$(CMDDIR)/immortalize.o \
	$(CMDDIR)/immtalk.o \
	$(CMDDIR)/invis.o \
	$(CMDDIR)/junk.o \
	$(CMDDIR)/languages.o \
	$(CMDDIR)/leave.o \
	$(CMDDIR)/litterbug.o \
	$(CMDDIR)/loadup.o \
	$(CMDDIR)/lock.o \
	$(CMDDIR)/log.o \
	$(CMDDIR)/look.o \
	$(CMDDIR)/low_purge.o \
	$(CMDDIR)/mailroom.o \
	$(CMDDIR)/makeboard.o \
	$(CMDDIR)/massign.o \
	$(CMDDIR)/mfind.o \
	$(CMDDIR)/minvoke.o \
	$(CMDDIR)/mpfind.o \
	$(CMDDIR)/mstat.o \
	$(CMDDIR)/music.o \
	$(CMDDIR)/mwhere.o \
	$(CMDDIR)/newbiechat.o \
	$(CMDDIR)/newbieset.o \
	$(CMDDIR)/noemote.o \
	$(CMDDIR)/nohelps.o \
	$(CMDDIR)/noresolve.o \
	$(CMDDIR)/north.o \
	$(CMDDIR)/northeast.o \
	$(CMDDIR)/northwest.o \
	$(CMDDIR)/notell.o \
	$(CMDDIR)/noteroom.o \
	$(CMDDIR)/notitle.o \
	$(CMDDIR)/oassign.o \
	$(CMDDIR)/ofind.o \
	$(CMDDIR)/oinvoke.o \
	$(CMDDIR)/ooc.o \
	$(CMDDIR)/open.o \
	$(CMDDIR)/opfind.o \
	$(CMDDIR)/order.o \
	$(CMDDIR)/ostat.o \
	$(CMDDIR)/owhere.o \
	$(CMDDIR)/pager.o \
	$(CMDDIR)/pardon.o \
	$(CMDDIR)/password.o \
	$(CMDDIR)/peace.o \
	$(CMDDIR)/practice.o \
	$(CMDDIR)/purge.o \
	$(CMDDIR)/put.o \
	$(CMDDIR)/quest.o \
	$(CMDDIR)/quit.o \
	$(CMDDIR)/rank.o \
	$(CMDDIR)/rassign.o \
	$(CMDDIR)/rat.o \
	$(CMDDIR)/reboot.o \
	$(CMDDIR)/recho.o \
	$(CMDDIR)/regoto.o \
	$(CMDDIR)/remove.o \
	$(CMDDIR)/reply.o \
	$(CMDDIR)/rest.o \
	$(CMDDIR)/restore.o \
	$(CMDDIR)/restoretime.o \
	$(CMDDIR)/restrict.o \
	$(CMDDIR)/retire.o \
	$(CMDDIR)/return.o \
	$(CMDDIR)/retran.o \
	$(CMDDIR)/rpfind.o \
	$(CMDDIR)/rstat.o \
	$(CMDDIR)/save.o \
	$(CMDDIR)/say.o \
	$(CMDDIR)/scatter.o \
	$(CMDDIR)/sedit.o \
	$(CMDDIR)/set_boot_time.o \
	$(CMDDIR)/shiptalk.o \
	$(CMDDIR)/shout.o \
	$(CMDDIR)/shove.o \
	$(CMDDIR)/showstatistic.o \
	$(CMDDIR)/showstatistic_web.o \
	$(CMDDIR)/shutdown.o \
	$(CMDDIR)/silence.o \
	$(CMDDIR)/sit.o \
	$(CMDDIR)/sleep.o \
	$(CMDDIR)/slist.o \
	$(CMDDIR)/snoop.o \
	$(CMDDIR)/sober.o \
	$(CMDDIR)/socials.o \
	$(CMDDIR)/sound.o \
	$(CMDDIR)/south.o \
	$(CMDDIR)/southeast.o \
	$(CMDDIR)/southwest.o \
	$(CMDDIR)/spacetalk.o \
	$(CMDDIR)/speak.o \
	$(CMDDIR)/split.o \
	$(CMDDIR)/stand.o \
	$(CMDDIR)/switch.o \
	$(CMDDIR)/systemtalk.o \
	$(CMDDIR)/teach.o \
	$(CMDDIR)/tell.o \
	$(CMDDIR)/time.o \
	$(CMDDIR)/toplevel.o \
	$(CMDDIR)/transfer.o \
	$(CMDDIR)/trust.o \
	$(CMDDIR)/typo.o \
	$(CMDDIR)/unhell.o \
	$(CMDDIR)/unlock.o \
	$(CMDDIR)/unsilence.o \
	$(CMDDIR)/up.o \
	$(CMDDIR)/users.o \
	$(CMDDIR)/vassign.o \
	$(CMDDIR)/viewskills.o \
	$(CMDDIR)/vsearch.o \
	$(CMDDIR)/wake.o \
	$(CMDDIR)/wartalk.o \
	$(CMDDIR)/wear.o \
	$(CMDDIR)/weather.o \
	$(CMDDIR)/west.o \
	$(CMDDIR)/where.o \
	$(CMDDIR)/who.o \
	$(CMDDIR)/whois.o \
	$(CMDDIR)/wimpy.o \
	$(CMDDIR)/wizhelp.o \
	$(CMDDIR)/wizlist.o \
	$(CMDDIR)/wizlock.o \
	$(CMDDIR)/yell.o \
	$(CMDDIR)/zap.o \

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
