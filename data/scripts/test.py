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

def on_test(room, actor):
    for n in range(0, 10):
        echo(actor, "T minus " + str(10 - n) + " and counting.")
        wait(1.5)
        
    echo(actor, "Ignition!")

def test_greet(mob, actor):
    emotes = ["seems happy.", "farts so loud that the room shakes.", "is thirsty."]
    room = inroom(mob)
    
    for i in range(0, 5):
        e = random(emotes)
        echo(room, str(mob) + " " + e)
        wait(float(random(range(1, 11))))

def test_fight(mob, actor):
    whines = ["Help! " + str(actor) + " is trying to kill me!", "I'm too young to die!"]
    say(mob, random(whines))

def test_death(mob, killer):
    if not inroom(mob):
        echo(killer, "Your victim is gone...")
    else:
        say(mob, "Alas! " + str(killer) + " got the better of me...")

def test_rand(mob):
    say(mob, "Rand!")

def test_obj_rand(obj):
    if inroom(obj):
        echo(inroom(obj), str(obj) + " sheds a leaf.")

def test_wear(obj, actor):
    wait(1.0)
    echo(actor, str(obj) + " feels great against your skin.")
