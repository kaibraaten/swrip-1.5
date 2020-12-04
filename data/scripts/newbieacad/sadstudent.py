def on_spawn(mob):
    messages = ["My brother is dead.", "Killed by a stray blaster shot.", "If only he had made a clone."]
    idx = 0

    while True:
        say(mob, messages[idx % len(messages)])
        idx = idx + 1
        wait(4.0)
        
def on_greet(mob, actor):
    say(mob, "Don't let it happen to you " + str(actor) + ".")
