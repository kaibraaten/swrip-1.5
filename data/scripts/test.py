def on_test(room, actor):
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
