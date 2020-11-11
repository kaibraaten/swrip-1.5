# Quests for Zim the Failed Jedi vnum 31900.
#
# We write as much of the quest code as possible in this file
# to keep everything in one place. These functions are then
# called from various mob scripts (or object/room scripts).
from quest.framework import *

# Zim wants players to kill vermin in the Mos Eisley sewers.
#
# Stage 10: Kill three tatoo-rats. When done, move to stage 2.
#
# Stage 20: Go back to Zim.
#
# Stage 30: Quest complete.
def zim_kill_vermin():
    quest = makequest("zim_kill_vermin", "Pest control!")

    stage10 = addqueststage(quest, 10)
    setlogentry(stage10, "Zim wants me to kill pests in the sewers.")
    objective1 = addobjective(stage10, 1, "Kill pests", 3)

    stage20 = addqueststage(quest, 20)
    setlogentry(stage20, "I should inform Zim of my success.")
    objective1 = addobjective(stage20, 1, "Return to Zim.", 1)

    stage30 = addqueststage(quest, 30)
    setlogentry(stage30, "I cleared out some pests in the Mos Eisley sewers.")
    setcompletionstage(stage30)
    addstagereward(stage30, 1000)
    addstagereward(stage30, [10323]) # Add practice lightsaber

    return quest

# Used in "speech 10" trigger on Zim.
def zim_kill_vermin_quest_accepted(actor):
    # We could have called queststarted() here, but startquest()
    # actually checks that already. Generally speaking I'm against
    # having code that silently fails, but when it comes to witing
    # in-game scripts I think it's valuable to keep things simple.
    startquest(actor, zim_kill_vermin())

# Used in "death 100" trigger on tatoo-rat.
def zim_kill_vermin_on_death(killer):
    quest = zim_kill_vermin()
    updateobjective(killer, quest, 10, 1)

    # Why do we call stagecompleted() when setqueststage() does that
    # internally? It's because the latter exits with an error, and
    # then we couldn't be able to have more code below this check.
    if stagecompleted(killer, quest, 10):
        setqueststage(killer, quest, 20)

    # Because we checked stagecompleted() it's possible to
    # have more code here even if stage 10 isn't completed.

# Used in "greet 100" trigger in Zim.
def zim_kill_vermin_check_for_completion(actor):
    quest = zim_kill_vermin()
    if stageinprogress(actor, quest, 20):
        updateobjective(actor, quest, 20, 1)
        setqueststage(actor, quest, 30)

# Used in "greet 100" trigger in Zim.
def zim_kill_vermin_offer_quest(zim, actor):
    say(zim, "Hey " + str(actor) + ", could you do me a big favor?")
    echo(actor, "[HINT] Say YES to begin quest.")
