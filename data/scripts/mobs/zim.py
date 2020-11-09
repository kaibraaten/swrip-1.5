# Scripts for Zim the Failed Jedi
from quest.zim import *

def on_greet(zim, actor):
    def checkquest(quest):
        if questinprogress(actor, quest):
            updateobjective(actor, quest, 20, 1)
            setqueststage(actor, quest, 30)

            if questcompleted(actor, quest):
                #issuereward(actor, quest)
                echo(actor, "Seems Zim forgot your reward.")

    if not isnpc(actor) and isjedi(actor):
        quest = get_zim_kill_vermin()
        checkquest(quest)

        if not queststarted(actor, quest):
            wait(1.0)
            say(actor, "Hey " + str(actor) + ", could you do me a big favor?")
            echo(actor, "[HINT] Say YES to begin quest.")
        else:
            if level(actor) >= 25:
                wait(1.0)
                say(zim, "There isn't much more I can teach you, " + str(actor) + ". Find Obi-Wan Kenobi.")
                say(zim, "I hear he's hiding somewhere out in the desert. I never managed to find him myself, though.")
            elif random(range(1, 5)) == 1:
                wait(1.0)
                say(zim, "Did you know I sell practice lightsabers? I make them myself, you know.")
                wait(1.0)
                echoaround(zim, str(zim) + " beams proudly.")
            else:
                wait(1.0)
                say(zim, "Why did you come here? To learn?")
                wait(2.0)
                say(zim, "Maybe I can teach you some basics, even if I never completed my own training.")
    else:
        echo(actor, str(zim) + " looks you over disapprovingly.")

def on_rand(zim):
    num = random(range(1, 4))
    if num == 1:
        echoaround(zim, str(zim) + " hiccups loudly.")
    elif num == 2:
        say(zim, "Where did I put that bottle?")
    else:
        echoaround(zim, str(zim) + " mutters something.")

def on_speech(zim, actor, txt):
    quest = get_zim_kill_vermin()

    if not queststarted(actor, quest):
        startquest(actor, quest)
