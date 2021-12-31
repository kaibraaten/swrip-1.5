from quest.zim import *

def on_test(room, actor):
    quest = get_zim_kill_vermin()
    startquest(actor, quest)
    for _ in range(0, 3):
        updateobjective(actor, quest, 10, 1)
    setqueststage(actor, quest, 20)
    updateobjective(actor, quest, 20, 1)
    setqueststage(actor, quest, 30)

    if questcompleted(actor, quest):
        log("Quest completed.")
    else:
        log("Quest NOT completed.")

def on_test2(room, actor):
    echo(actor, "Characters in " + str(room) + " (vnum " + str(vnum(room)) + "):")

    for ch in characters(room):
        line = "  -> " + str(ch)

        if isnpc(ch):
            line = line + " (vnum " + str(vnum(ch)) + ")"

        echo(actor, line)
        
        for obj in objects(ch):
            echo(actor, "     - " + str(obj) + " (vnum " + str(vnum(obj)) + ")")

    echo(actor, "Objects in " + str(room) + " (vnum " + str(vnum(room)) + "):")

    if objects(room):
        for obj in objects(room):
            echo(actor, "     - " + str(obj) + " (vnum " + str(vnum(obj)) + ")")
    else:
        echo(actor, "  No objects.")
        
def test_greet(mob, actor):
    emotes = ["seems happy.", "farts so loud that the room shakes.", "is thirsty."]
    room = getroom(mob)
    
    for i in range(0, 5):
        e = random(emotes)
        echo(room, str(mob) + " " + e)
        wait(float(random(range(1, 11))))

def test_fight(mob, actor):
    whines = ["Help! " + str(actor) + " is trying to kill me!", "I'm too young to die!"]
    say(mob, random(whines))

def test_death(mob, killer):
    if not getroom(mob):
        echo(killer, "Your victim is gone...")
    else:
        say(mob, "Alas! " + str(killer) + " got the better of me...")

def test_rand(mob):
    say(mob, "Rand!")

def test_obj_rand(obj):
    if getroom(obj):
        echo(getroom(obj), str(obj) + " sheds a leaf.")

def test_wear(obj, actor):
    wait(1.0)
    echo(actor, str(obj) + " feels great against your skin.")
