def _give_item(mob, actor, objvnum):
    obj = spawnobj(objvnum)
    echo(actor, str(mob) + " gives you " + str(obj) + ".")
    transfer(obj, actor)
    
def on_speech_ration(mob, actor, txt):
    rationvnum = 10313
    _give_item(mob, actor, rationvnum)

def on_speech_canteen(mob, actor, txt):
    canteenvnum = 10314
    _give_item(mob, actor, canteenvnum)
