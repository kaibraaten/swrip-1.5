def on_death(victim, killer):
    if level(killer) >= 6:
        if random(range(0, 2)) == 0:
            echo(killer, "You feel an overwhelming desire for greater challenge.")
        else:
            echo(killer, "The chadoyn is far too easy for you to kill.")
