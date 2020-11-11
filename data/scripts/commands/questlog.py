#
def do_questlog(ch, arguments):
    qdata = getdata(ch, "quests")

    if qdata:
        for q in qdata:
            echo(ch, str(q))
    else:
        echo(ch, "No quests.")
