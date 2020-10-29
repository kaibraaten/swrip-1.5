from python import *
from mudprog import *

def jsp_on_rand(mob):
    # Load up and replace lightsaber battery every now and then.
    def replace_battery():
        batteryvnum = 10324
        
        if ovnuminv(mob, batteryvnum) < 1:
            battery = spawnobj(batteryvnum)
            transfer(battery, mob)

        interpret(mob, "battery")
        
    # This script will make sure the mob always has a working lightsaber.
    # This way the mob can be used to grind the disarm skill.
    def wield_lightsaber():
        sabervnum = 10323

        def getlightsaber():
            sabers = filter(lambda obj: vnum(obj) == sabervnum, objects(mob))
            if sabers:
                return sabers[0]

        saber = getlightsaber()
        
        if not saber:
            saber = spawnobj(sabervnum)
            transfer(saber, mob)

        if not equipped(saber):
            equip(mob, saber)

    wield_lightsaber()

    if random(range(1, 21)) == 1:
        replace_battery()
    
def jsp_on_speech(mob, actor, txt):
    if skill(actor, "grip"):
        if isfighting(mob, actor):
            say(mob, "En guarde!")
            interpret(mob, "disarm")
        else:
            say(mob, "We need to be fighting first.")
    else:
        say(mob, "You'd better learn the GRIP skill first.")

def jsp_on_greet(mob, actor):
    if not isnpc(actor):
        wait(2.0)
        say(mob, "Welcome, I'm your sparring partner today.")

        if skill(actor, "disarm"):
            wait(2.0)
            say(mob, "You can practice your disarm skill on me. I'll fetch a new 'saber when needed.")

        if skill(actor, "grip"):
            wait(2.0)
            say(mob, "If your want to practice your grip skill, I can try disarming you when you say DISARM ME.")
