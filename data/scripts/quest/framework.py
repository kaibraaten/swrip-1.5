# Quest framework

# Quest builder function.
def makequest(id, title):
    return {"id": id, "title": title, "logentry": None, "stages": {}}

# Quest builder function.
def addqueststage(quest, stageidx):
    stage = {"objectives": {}}
    quest["stages"][str(stageidx)] = stage
    return stage

# Quest builder function.
def setlogentry(quest, txt):
    quest["logentry"] = txt

# Quest builder function.
def addobjective(stage, oid, txt, times_to_complete):
    if times_to_complete < 1:
        error("addobjective(): times_to_complete must be > 0.")
        
    objective = {"display": txt, "times_to_complete": times_to_complete}
    stage["objectives"][str(oid)] = objective
    return objective

def getquestid(quest):
    return quest["id"]

def setqueststage(actor, quest, stage):
    if quest["stages"][str(stage)] == None:
        error("Stage does not exist.")
        
    q = getdata(actor, "quests")

    if q == None:
        q = { }
        setdata(actor, "quests", q)

    id = getquestid(quest)

    if q[id] == None:
        q[id] = {"stage": 0}
        
    q[id]["stage"] = str(stage)
