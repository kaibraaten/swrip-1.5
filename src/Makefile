BINARY = swrip

LIB_EXT = so
LIBNAME = libswrip.$(LIB_EXT)

WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls -Wshadow -Wno-unused-parameter -Wno-char-subscripts -Wno-write-strings -Wno-long-long -Wextra -Wno-implicit-fallthrough

#Comment out the next line if your system doesn't have dlsym functionality.
USE_DLSYM = -DSWRIP_USE_DLSYM

LUA_CFLAGS =
LUA_LIBS = -llua -lm -ldl

#Change from 0 to 1 to enable telnet debug logging.
DEBUG_TELNET = -DSWRIP_DEBUG_TELNET=0

LIBDIR = libs
TESTDIR = test
CMDDIR = commands
MPDIR = mpcommands
SPELLDIR = spells
SPECDIR = special
REPOSDIR = repos

WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls -Wshadow -Wno-unused-parameter -Wno-char-subscripts -Wno-write-strings -Wno-long-long -Wextra -Wno-implicit-fallthrough
CXXFLAGS = -std=c++14 -fPIC -g3 -MMD -I. -I$(LIBDIR) $(WFLAGS) $(USE_DLSYM) $(DEBUG_TELNET) $(LUA_CFLAGS)
LDFLAGS = -lm -lz -L$(LIBDIR)/utility -lutility -Wl,-rpath,./src/$(LIBDIR)/utility -L$(LIBDIR)/colorparser -lcolorparser -Wl,-rpath,./src/$(LIBDIR)/colorparser $(LUA_LIBS) -L. -lswrip -Wl,-rpath,./src

#Uncomment the next line of you're using Solaris and you get linker errors.
#SOLARIS = 1
ifdef SOLARIS
LDFLAGS += -lsocket -lnsl
endif

#Only way I know of to detect Cygwin environment
ifeq ($(shell echo $$OSTYPE),cygwin)
LDFLAGS += -export-all-symbols
else
#CXXFLAGS += -ansi
endif

#On some systems (e.g. FreeBSD) you may need to remove -ldl
ifdef USE_DLSYM
LDFLAGS += -ldl
LDFLAGS += -rdynamic
endif

ODIR = obj
_BINOBJ = main.o

_OBJ =  act_comm.o \
	act_info.o \
	act_move.o \
	act_obj.o \
	act_wiz.o \
	alias.o \
	area.o \
	arena.o \
	badname.o \
	ban.o \
	board.o \
	bounty.o \
	build.o \
	character.o \
	clan.o \
	comm.o \
	command.o \
	comments.o \
	const.o \
	copyover.o \
	craft.o \
	db.o \
	descriptor.o \
	editor.o \
	fight.o \
	fslogger.o \
	grub.o \
	handler.o \
	help.o \
	imc.o \
	interp.o \
	magic.o \
	makeobjs.o \
	mapper.o \
	misc.o \
	missile.o \
	mprog.o \
	mud_prog.o \
	nanny.o \
	object.o \
	pcdata.o \
	planet.o \
	protomob.o \
	protoobject.o \
	reset.o \
	room.o \
	save.o \
	script.o \
	ship.o \
	shop.o \
	shuttle.o \
	skill.o \
	skills.o \
	social.o \
	special.o \
	spaceobject.o \
	systemdata.o \
	tables.o \
	track.o \
	turret.o \
	update.o \
	vector3_aux.o \
	$(CMDDIR)/aassign.o \
	$(CMDDIR)/accelerate.o \
	$(CMDDIR)/accept.o \
	$(CMDDIR)/addbounty.o \
	$(CMDDIR)/addpatrol.o \
	$(CMDDIR)/addpilot.o \
	$(CMDDIR)/addresident.o \
	$(CMDDIR)/addsalary.o \
	$(CMDDIR)/adjusttractorbeam.o \
	$(CMDDIR)/advance.o \
	$(CMDDIR)/affected.o \
	$(CMDDIR)/afk.o \
	$(CMDDIR)/ahall.o \
	$(CMDDIR)/aid.o \
	$(CMDDIR)/alias.o \
	$(CMDDIR)/allow.o \
	$(CMDDIR)/allclantalk.o \
	$(CMDDIR)/allships.o \
	$(CMDDIR)/allspeeders.o \
	$(CMDDIR)/ammo.o \
	$(CMDDIR)/ansi.o \
	$(CMDDIR)/answer.o \
	$(CMDDIR)/apply.o \
	$(CMDDIR)/appoint.o \
	$(CMDDIR)/appraise.o \
	$(CMDDIR)/areas.o \
	$(CMDDIR)/arena.o \
	$(CMDDIR)/arm.o \
	$(CMDDIR)/aset.o \
	$(CMDDIR)/ask.o \
	$(CMDDIR)/astat.o \
	$(CMDDIR)/at.o \
	$(CMDDIR)/auction.o \
	$(CMDDIR)/authorize.o \
	$(CMDDIR)/autopilot.o \
	$(CMDDIR)/autotrack.o \
	$(CMDDIR)/autorecharge.o \
	$(CMDDIR)/avtalk.o \
	$(CMDDIR)/awho.o \
	$(CMDDIR)/balzhur.o \
	$(CMDDIR)/bamfin.o \
	$(CMDDIR)/bamfout.o \
	$(CMDDIR)/backstab.o \
	$(CMDDIR)/ban.o \
	$(CMDDIR)/bank.o \
	$(CMDDIR)/bash.o \
	$(CMDDIR)/bashdoor.o \
	$(CMDDIR)/badname.o \
	$(CMDDIR)/beep.o \
	$(CMDDIR)/beg.o \
	$(CMDDIR)/berserk.o \
	$(CMDDIR)/bestow.o \
	$(CMDDIR)/bestowarea.o \
	$(CMDDIR)/bet.o \
	$(CMDDIR)/bind.o \
	$(CMDDIR)/bio.o \
	$(CMDDIR)/board.o \
	$(CMDDIR)/boards.o \
	$(CMDDIR)/bodybag.o \
	$(CMDDIR)/bounties.o \
	$(CMDDIR)/brandish.o \
	$(CMDDIR)/bribe.o \
	$(CMDDIR)/bset.o \
	$(CMDDIR)/bstat.o \
	$(CMDDIR)/bug.o \
	$(CMDDIR)/bury.o \
	$(CMDDIR)/buy.o \
	$(CMDDIR)/buyhome.o \
	$(CMDDIR)/buyship.o \
	$(CMDDIR)/buyvendor.o \
	$(CMDDIR)/buzz.o \
	$(CMDDIR)/calculate.o \
	$(CMDDIR)/calculatediff.o \
	$(CMDDIR)/capture.o \
	$(CMDDIR)/cast.o \
	$(CMDDIR)/cedit.o \
	$(CMDDIR)/chaff.o \
	$(CMDDIR)/challenge.o \
	$(CMDDIR)/channels.o \
	$(CMDDIR)/chaos.o \
	$(CMDDIR)/chat.o \
	$(CMDDIR)/check_vnums.o \
	$(CMDDIR)/circle.o \
	$(CMDDIR)/clan_donate.o \
	$(CMDDIR)/clan_withdraw.o \
	$(CMDDIR)/clanbuyship.o \
	$(CMDDIR)/clanfunds.o \
	$(CMDDIR)/clans.o \
	$(CMDDIR)/clansellship.o \
	$(CMDDIR)/clantalk.o \
	$(CMDDIR)/climb.o \
	$(CMDDIR)/clone.o \
	$(CMDDIR)/close.o \
	$(CMDDIR)/closebay.o \
	$(CMDDIR)/closehatch.o \
	$(CMDDIR)/cmdtable.o \
	$(CMDDIR)/collectgold.o \
	$(CMDDIR)/commands.o \
	$(CMDDIR)/compare.o \
	$(CMDDIR)/config.o \
	$(CMDDIR)/consider.o \
	$(CMDDIR)/copyship.o \
	$(CMDDIR)/credits.o \
	$(CMDDIR)/cset.o \
	$(CMDDIR)/cutdoor.o \
	$(CMDDIR)/decline.o \
	$(CMDDIR)/delay.o \
	$(CMDDIR)/demote.o \
	$(CMDDIR)/deny.o \
	$(CMDDIR)/description.o \
	$(CMDDIR)/destroy.o \
	$(CMDDIR)/detrap.o \
	$(CMDDIR)/diagnose.o \
	$(CMDDIR)/dig.o \
	$(CMDDIR)/disarm.o \
	$(CMDDIR)/disconnect.o \
	$(CMDDIR)/disguise.o \
	$(CMDDIR)/dismiss.o \
	$(CMDDIR)/dismount.o \
	$(CMDDIR)/dmsg.o \
	$(CMDDIR)/dnd.o \
	$(CMDDIR)/dock.o \
	$(CMDDIR)/down.o \
	$(CMDDIR)/drag.o \
	$(CMDDIR)/draw.o \
	$(CMDDIR)/drink.o \
	$(CMDDIR)/drive.o \
	$(CMDDIR)/drop.o \
	$(CMDDIR)/east.o \
	$(CMDDIR)/eat.o \
	$(CMDDIR)/echo.o \
	$(CMDDIR)/eliteguard.o \
	$(CMDDIR)/emote.o \
	$(CMDDIR)/empower.o \
	$(CMDDIR)/empty.o \
	$(CMDDIR)/enter.o \
	$(CMDDIR)/equipment.o \
	$(CMDDIR)/examine.o \
	$(CMDDIR)/exits.o \
	$(CMDDIR)/fill.o \
	$(CMDDIR)/fire.o \
	$(CMDDIR)/firstaid.o \
	$(CMDDIR)/fixchar.o \
	$(CMDDIR)/flee.o \
	$(CMDDIR)/focusalias.o \
	$(CMDDIR)/foldarea.o \
	$(CMDDIR)/follow.o \
	$(CMDDIR)/for.o \
	$(CMDDIR)/force.o \
	$(CMDDIR)/forceclose.o \
	$(CMDDIR)/form_password.o \
	$(CMDDIR)/fquit.o \
	$(CMDDIR)/freeze.o \
	$(CMDDIR)/fuel.o \
	$(CMDDIR)/gatherintelligence.o \
	$(CMDDIR)/get.o \
	$(CMDDIR)/give.o \
	$(CMDDIR)/glance.o \
	$(CMDDIR)/gold.o \
	$(CMDDIR)/goto.o \
	$(CMDDIR)/gouge.o \
	$(CMDDIR)/group.o \
	$(CMDDIR)/grub.o \
	$(CMDDIR)/gtell.o \
	$(CMDDIR)/guard.o \
	$(CMDDIR)/hail.o \
	$(CMDDIR)/help.o \
	$(CMDDIR)/hedit.o \
	$(CMDDIR)/hell.o \
	$(CMDDIR)/hide.o \
	$(CMDDIR)/hijack.o \
	$(CMDDIR)/hitall.o \
	$(CMDDIR)/hlist.o \
	$(CMDDIR)/holylight.o \
	$(CMDDIR)/homepage.o \
	$(CMDDIR)/hset.o \
	$(CMDDIR)/hyperspace.o \
	$(CMDDIR)/i103.o \
	$(CMDDIR)/i104.o \
	$(CMDDIR)/i105.o \
	$(CMDDIR)/idea.o \
	$(CMDDIR)/immortalize.o \
	$(CMDDIR)/immtalk.o \
	$(CMDDIR)/induct.o \
	$(CMDDIR)/info.o \
	$(CMDDIR)/installarea.o \
	$(CMDDIR)/instaroom.o \
	$(CMDDIR)/instazone.o \
	$(CMDDIR)/inventory.o \
	$(CMDDIR)/invis.o \
	$(CMDDIR)/invite.o \
	$(CMDDIR)/jail.o \
	$(CMDDIR)/jumpvector.o \
	$(CMDDIR)/junk.o \
	$(CMDDIR)/kick.o \
	$(CMDDIR)/kill.o \
	$(CMDDIR)/land.o \
	$(CMDDIR)/languages.o \
	$(CMDDIR)/last.o \
	$(CMDDIR)/launch.o \
	$(CMDDIR)/leave.o \
	$(CMDDIR)/leaveship.o \
	$(CMDDIR)/level.o \
	$(CMDDIR)/light.o \
	$(CMDDIR)/list.o \
	$(CMDDIR)/litterbug.o \
	$(CMDDIR)/loadarea.o \
	$(CMDDIR)/loadup.o \
	$(CMDDIR)/lock.o \
	$(CMDDIR)/log.o \
	$(CMDDIR)/look.o \
	$(CMDDIR)/low_purge.o \
	$(CMDDIR)/mailroom.o \
	$(CMDDIR)/makearmor.o \
	$(CMDDIR)/makeblade.o \
	$(CMDDIR)/makeblaster.o \
	$(CMDDIR)/makeboard.o \
	$(CMDDIR)/makebowcaster.o \
	$(CMDDIR)/makeclan.o \
	$(CMDDIR)/makecomlink.o \
	$(CMDDIR)/makecontainer.o \
	$(CMDDIR)/makedisguise.o \
	$(CMDDIR)/makeglowrod.o \
	$(CMDDIR)/makegrenade.o \
	$(CMDDIR)/makeguild.o \
	$(CMDDIR)/makejewelry.o \
	$(CMDDIR)/makelandmine.o \
	$(CMDDIR)/makelightsaber.o \
	$(CMDDIR)/makeplanet.o \
	$(CMDDIR)/makerepair.o \
	$(CMDDIR)/makeshield.o \
	$(CMDDIR)/makeship.o \
	$(CMDDIR)/makeshuttle.o \
	$(CMDDIR)/makeshop.o \
	$(CMDDIR)/makespaceobject.o \
	$(CMDDIR)/makespice.o \
	$(CMDDIR)/makewizlist.o \
	$(CMDDIR)/massign.o \
	$(CMDDIR)/masspropaganda.o \
	$(CMDDIR)/mcreate.o \
	$(CMDDIR)/members.o \
	$(CMDDIR)/memory.o \
	$(CMDDIR)/mine.o \
	$(CMDDIR)/mfind.o \
	$(CMDDIR)/minvoke.o \
	$(CMDDIR)/mlist.o \
	$(CMDDIR)/mount.o \
	$(CMDDIR)/mpedit.o \
	$(CMDDIR)/mpfind.o \
	$(CMDDIR)/mpstat.o \
	$(CMDDIR)/mset.o \
	$(CMDDIR)/mstat.o \
	$(CMDDIR)/murder.o \
	$(CMDDIR)/music.o \
	$(CMDDIR)/mwhere.o \
	$(CMDDIR)/name.o \
	$(CMDDIR)/newbiechat.o \
	$(CMDDIR)/newbieset.o \
	$(CMDDIR)/newzones.o \
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
	$(CMDDIR)/ocreate.o \
	$(CMDDIR)/ofind.o \
	$(CMDDIR)/ogrub.o \
	$(CMDDIR)/oinvoke.o \
	$(CMDDIR)/oldscore.o \
	$(CMDDIR)/olist.o \
	$(CMDDIR)/ooc.o \
	$(CMDDIR)/opedit.o \
	$(CMDDIR)/open.o \
	$(CMDDIR)/openbay.o \
	$(CMDDIR)/openhatch.o \
	$(CMDDIR)/opfind.o \
	$(CMDDIR)/opstat.o \
	$(CMDDIR)/order.o \
	$(CMDDIR)/oset.o \
	$(CMDDIR)/ostat.o \
	$(CMDDIR)/outcast.o \
	$(CMDDIR)/override.o \
	$(CMDDIR)/owhere.o \
	$(CMDDIR)/pardon.o \
	$(CMDDIR)/password.o \
	$(CMDDIR)/peace.o \
	$(CMDDIR)/pick.o \
	$(CMDDIR)/pickshiplock.o \
	$(CMDDIR)/placevendor.o \
	$(CMDDIR)/planets.o \
	$(CMDDIR)/pluogus.o \
	$(CMDDIR)/poisonweapon.o \
	$(CMDDIR)/postguard.o \
	$(CMDDIR)/practice.o \
	$(CMDDIR)/pricevendor.o \
	$(CMDDIR)/prompt.o \
	$(CMDDIR)/propaganda.o \
	$(CMDDIR)/pull.o \
	$(CMDDIR)/punch.o \
	$(CMDDIR)/purge.o \
	$(CMDDIR)/push.o \
	$(CMDDIR)/put.o \
	$(CMDDIR)/quaff.o \
	$(CMDDIR)/quit.o \
	$(CMDDIR)/radar.o \
	$(CMDDIR)/rank.o \
	$(CMDDIR)/rassign.o \
	$(CMDDIR)/rat.o \
	$(CMDDIR)/rdelete.o \
	$(CMDDIR)/reboot.o \
	$(CMDDIR)/recall.o \
	$(CMDDIR)/recharge.o \
	$(CMDDIR)/recho.o \
	$(CMDDIR)/redit.o \
	$(CMDDIR)/regoto.o \
	$(CMDDIR)/reinforcements.o \
	$(CMDDIR)/reload.o \
	$(CMDDIR)/rembounty.o \
	$(CMDDIR)/remove.o \
	$(CMDDIR)/rempilot.o \
	$(CMDDIR)/remresident.o \
	$(CMDDIR)/renameship.o \
	$(CMDDIR)/repair.o \
	$(CMDDIR)/repairset.o \
	$(CMDDIR)/repairship.o \
	$(CMDDIR)/repairshops.o \
	$(CMDDIR)/repairstat.o \
	$(CMDDIR)/reply.o \
	$(CMDDIR)/report.o \
	$(CMDDIR)/request.o \
	$(CMDDIR)/rescue.o \
	$(CMDDIR)/reset.o \
	$(CMDDIR)/resetship.o \
	$(CMDDIR)/resign.o \
	$(CMDDIR)/rest.o \
	$(CMDDIR)/restore.o \
	$(CMDDIR)/restoretime.o \
	$(CMDDIR)/restrict.o \
	$(CMDDIR)/retire.o \
	$(CMDDIR)/return.o \
	$(CMDDIR)/retran.o \
	$(CMDDIR)/revert.o \
	$(CMDDIR)/rgrub.o \
	$(CMDDIR)/rlist.o \
	$(CMDDIR)/roster.o \
	$(CMDDIR)/rpedit.o \
	$(CMDDIR)/rpfind.o \
	$(CMDDIR)/rpstat.o \
	$(CMDDIR)/rreset.o \
	$(CMDDIR)/rstat.o \
	$(CMDDIR)/sabotage.o \
	$(CMDDIR)/save.o \
	$(CMDDIR)/savearea.o \
	$(CMDDIR)/say.o \
	$(CMDDIR)/scan.o \
	$(CMDDIR)/scatter.o \
	$(CMDDIR)/score.o \
	$(CMDDIR)/search.o \
	$(CMDDIR)/sedit.o \
	$(CMDDIR)/seduce.o \
	$(CMDDIR)/sell.o \
	$(CMDDIR)/sellhome.o \
	$(CMDDIR)/sellship.o \
	$(CMDDIR)/set_boot_time.o \
	$(CMDDIR)/setblaster.o \
	$(CMDDIR)/setclan.o \
	$(CMDDIR)/setplanet.o \
	$(CMDDIR)/setship.o \
	$(CMDDIR)/setshuttle.o \
	$(CMDDIR)/setspaceobject.o \
	$(CMDDIR)/ships.o \
	$(CMDDIR)/shiptalk.o \
	$(CMDDIR)/shiptrack.o \
	$(CMDDIR)/shops.o \
	$(CMDDIR)/shopset.o \
	$(CMDDIR)/shopstat.o \
	$(CMDDIR)/shout.o \
	$(CMDDIR)/shove.o \
	$(CMDDIR)/showclan.o \
	$(CMDDIR)/showlayers.o \
	$(CMDDIR)/showplanet.o \
	$(CMDDIR)/showship.o \
	$(CMDDIR)/showshuttle.o \
	$(CMDDIR)/showspaceobject.o \
	$(CMDDIR)/showstatistic.o \
	$(CMDDIR)/shutdown.o \
	$(CMDDIR)/silence.o \
	$(CMDDIR)/sit.o \
	$(CMDDIR)/skin.o \
	$(CMDDIR)/sla.o \
	$(CMDDIR)/slay.o \
	$(CMDDIR)/sleep.o \
	$(CMDDIR)/slist.o \
	$(CMDDIR)/slookup.o \
	$(CMDDIR)/smalltalk.o \
	$(CMDDIR)/smoke.o \
	$(CMDDIR)/sneak.o \
	$(CMDDIR)/snipe.o \
	$(CMDDIR)/snoop.o \
	$(CMDDIR)/sober.o \
	$(CMDDIR)/socials.o \
	$(CMDDIR)/south.o \
	$(CMDDIR)/southeast.o \
	$(CMDDIR)/southwest.o \
	$(CMDDIR)/spaceobjects.o \
	$(CMDDIR)/spacetalk.o \
	$(CMDDIR)/speak.o \
	$(CMDDIR)/specialforces.o \
	$(CMDDIR)/speeders.o \
	$(CMDDIR)/split.o \
	$(CMDDIR)/sset.o \
	$(CMDDIR)/stand.o \
	$(CMDDIR)/status.o \
	$(CMDDIR)/steal.o \
	$(CMDDIR)/study.o \
	$(CMDDIR)/stun.o \
	$(CMDDIR)/suicide.o \
	$(CMDDIR)/switch.o \
	$(CMDDIR)/systemtalk.o \
	$(CMDDIR)/takedrug.o \
	$(CMDDIR)/tamp.o \
	$(CMDDIR)/target.o \
	$(CMDDIR)/teach.o \
	$(CMDDIR)/tell.o \
	$(CMDDIR)/test.o \
	$(CMDDIR)/throw.o \
	$(CMDDIR)/time.o \
	$(CMDDIR)/timecmd.o \
	$(CMDDIR)/title.o \
	$(CMDDIR)/toplevel.o \
	$(CMDDIR)/torture.o \
	$(CMDDIR)/track.o \
	$(CMDDIR)/tractorbeam.o \
	$(CMDDIR)/train.o \
	$(CMDDIR)/trajectory.o \
	$(CMDDIR)/trajectoryactual.o \
	$(CMDDIR)/transfer.o \
	$(CMDDIR)/transship.o \
	$(CMDDIR)/trust.o \
	$(CMDDIR)/typo.o \
	$(CMDDIR)/undock.o \
	$(CMDDIR)/unfoldarea.o \
	$(CMDDIR)/unfocusalias.o \
	$(CMDDIR)/unhell.o \
	$(CMDDIR)/unjail.o \
	$(CMDDIR)/unlock.o \
	$(CMDDIR)/unsilence.o \
	$(CMDDIR)/up.o \
	$(CMDDIR)/use.o \
	$(CMDDIR)/users.o \
	$(CMDDIR)/value.o \
	$(CMDDIR)/vassign.o \
	$(CMDDIR)/viewskills.o \
	$(CMDDIR)/visible.o \
	$(CMDDIR)/vnums.o \
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
	$(CMDDIR)/zones.o \
	$(MPDIR)/mpapply.o \
	$(MPDIR)/mpapplyb.o \
	$(MPDIR)/mpasound.o \
	$(MPDIR)/mpat.o \
	$(MPDIR)/mpclosepassage.o \
	$(MPDIR)/mpdamage.o \
	$(MPDIR)/mpdeposit.o \
	$(MPDIR)/mpdream.o \
	$(MPDIR)/mpecho.o \
	$(MPDIR)/mpechoaround.o \
	$(MPDIR)/mpechoat.o \
	$(MPDIR)/mpforce.o \
	$(MPDIR)/mpgain.o \
	$(MPDIR)/mpgoto.o \
	$(MPDIR)/mpinvis.o \
	$(MPDIR)/mpjunk.o \
	$(MPDIR)/mpkill.o \
	$(MPDIR)/mpmload.o \
	$(MPDIR)/mpnothing.o \
	$(MPDIR)/mpoload.o \
	$(MPDIR)/mpopenpassage.o \
	$(MPDIR)/mppurge.o \
	$(MPDIR)/mprestore.o \
	$(MPDIR)/mpslay.o \
	$(MPDIR)/mptransfer.o \
	$(MPDIR)/mpwithdraw.o \
	$(REPOSDIR)/badnamerepository.o \
	$(REPOSDIR)/banrepository.o \
	$(REPOSDIR)/boardrepository.o \
	$(REPOSDIR)/helprepository.o \
	$(REPOSDIR)/playerrepository.o \
	$(REPOSDIR)/shiprepository.o \
	$(SPECDIR)/auth.o \
	$(SPECDIR)/clanguard.o \
	$(SPECDIR)/customsalcohol.o \
	$(SPECDIR)/customssmut.o \
	$(SPECDIR)/customsspice.o \
	$(SPECDIR)/customsweapons.o \
	$(SPECDIR)/darkjedi.o \
	$(SPECDIR)/jedi.o\
	$(SPECDIR)/jedihealer.o \
	$(SPECDIR)/fido.o \
	$(SPECDIR)/guardian.o \
	$(SPECDIR)/janitor.o \
	$(SPECDIR)/newbiepilot.o \
	$(SPECDIR)/poison.o \
	$(SPECDIR)/police.o \
	$(SPECDIR)/policeattack.o \
	$(SPECDIR)/policefine.o \
	$(SPECDIR)/policejail.o \
	$(SPECDIR)/policeundercover.o \
	$(SPECDIR)/rebeltrooper.o \
	$(SPECDIR)/stormtrooper.o \
	$(SPECDIR)/thief.o \
	$(SPELLDIR)/affect.o \
	$(SPELLDIR)/affectchar.o \
	$(SPELLDIR)/areaattack.o \
	$(SPELLDIR)/attack.o \
	$(SPELLDIR)/blacklightning.o \
	$(SPELLDIR)/blindness.o \
	$(SPELLDIR)/causecritical.o \
	$(SPELLDIR)/causelight.o \
	$(SPELLDIR)/causeserious.o \
	$(SPELLDIR)/charmperson.o \
	$(SPELLDIR)/createmob.o \
	$(SPELLDIR)/createobj.o \
	$(SPELLDIR)/cureblindness.o \
	$(SPELLDIR)/curepoison.o \
	$(SPELLDIR)/detectpoison.o \
	$(SPELLDIR)/dispelevil.o \
	$(SPELLDIR)/dispelmagic.o \
	$(SPELLDIR)/dream.o \
	$(SPELLDIR)/earthquake.o \
	$(SPELLDIR)/energydrain.o \
	$(SPELLDIR)/farsight.o \
	$(SPELLDIR)/fireball.o \
	$(SPELLDIR)/flamestrike.o \
	$(SPELLDIR)/handofchaos.o \
	$(SPELLDIR)/harm.o \
	$(SPELLDIR)/identify.o \
	$(SPELLDIR)/invis.o \
	$(SPELLDIR)/knowalignment.o \
	$(SPELLDIR)/lightningbolt.o \
	$(SPELLDIR)/objinv.o \
	$(SPELLDIR)/poison.o \
	$(SPELLDIR)/possess.o \
	$(SPELLDIR)/removeinvis.o \
	$(SPELLDIR)/removetrap.o \
	$(SPELLDIR)/scorchingsurge.o \
	$(SPELLDIR)/shockinggrasp.o \
	$(SPELLDIR)/sleep.o \
	$(SPELLDIR)/smaug.o \
	$(SPELLDIR)/ventriloquate.o \
	$(SPELLDIR)/weaken.o \

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))
BINOBJ = $(patsubst %,$(ODIR)/%,$(_BINOBJ))

all:		libraries $(LIBNAME) $(BINARY) tests

libraries:
		$(MAKE) -C $(LIBDIR)/utility libutility.so
		$(MAKE) -C $(LIBDIR)/colorparser libcolorparser.so

tests:		$(BINARY)
		$(MAKE) -C $(TESTDIR)

$(LIBNAME):	$(OBJ)
		@echo "Linking" $(LIBNAME)
		@$(CXX) -shared -Wl,-soname,$(LIBNAME) -o $(LIBNAME) $^

$(BINARY):	$(LIBNAME) $(BINOBJ)
		@echo "Linking" $(BINARY)
		@$(CXX) -o $@ $^ $(LDFLAGS)
		@mv $(BINARY) ..
		@echo "Done."

$(ODIR)/%.o:	%.cpp
		@echo "Compiling" $<
		@$(CXX) -c -o $@ $< $(CXXFLAGS)

-include $(ODIR)/*.d
-include $(ODIR)/$(CMDDIR)/*.d
-include $(ODIR)/$(MPDIR)/*.d
-include $(ODIR)/$(SPELLDIR)/*.d
-include $(ODIR)/$(SPECDIR)/*.d
-include $(ODIR)/$(REPOSDIR)/*.d

clean:
		-rm -f ../$(BINARY) *~ $(ODIR)/*.o $(ODIR)/*.d $(ODIR)/$(CMDDIR)/*.o $(ODIR)/$(CMDDIR)/*.d $(ODIR)/$(MPDIR)/*.o $(ODIR)/$(MPDIR)/*.d $(ODIR)/$(SPELLDIR)/*.o $(ODIR)/$(SPELLDIR)/*.d ../core.* $(ODIR)/$(SPECDIR)/*.o $(ODIR)/$(SPECDIR)/*.d $(ODIR)/$(REPOSDIR)/*.o $(ODIR)/$(REPOSDIR)/*.d  *.so *.a
