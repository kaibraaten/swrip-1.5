# Quests for Zim the Failed Jedi.

from quest.framework import *

def get_zim_bottle_quest():
    quest = makequest("zim_bottle_quest", "The thirsty Jedi")
    setlogentry(quest, "Zim wants something strong to drink. Maybe I can buy something in Mos Eisley.")
    stage10 = addqueststage(quest, 10)
    objective1 = addobjective(stage10, 1, "Bring Zim some alcohol.", 1)
    return quest
