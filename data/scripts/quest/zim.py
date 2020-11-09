# Quests for Zim the Failed Jedi.

from quest.framework import *

def get_zim_bottle_quest():
    quest = makequest("zim_bottle_quest", "The thirsty Jedi")
    
    stage10 = addqueststage(quest, 10)
    setlogentry(stage10, "Zim wants something strong to drink. Maybe I can buy something in Mos Eisley.")
    objective1 = addobjective(stage10, 1, "Find some alcohol.", 1)

    stage20 = addqueststage(quest, 20)
    setlogentry(stage20, "I should get back to Zim with the alcohol.")
    objective1 = addobjective(stage20, 1, "Give Zim alcohol.", 1)
    
    return quest

def get_zim_kill_vermin():
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
    addstagereward(stage30, [25])

    return quest
