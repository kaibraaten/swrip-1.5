#
from utils import *

def do_questlog(ch, arguments):
    qdata = getdata(ch, "quests")
    echo(ch, "=" * 80)
    echo(ch, centerstring("QUESTS", 80, " "))
    echo(ch, "=" * 80)

    if qdata:
        for q in qdata:
            pq = qdata[q]
            echo(ch, centerstring(pq["title"], 80, " "))
            echo(ch, "-" * 80)
    else:
        echo(ch, "No quests.")
