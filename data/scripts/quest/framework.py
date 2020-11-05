# Quest framework
from python import *

# Quest builder function.
def makequest(id, title):
    return {"id": id, "title": title, "stages": {}}

# Quest builder function.
def addqueststage(quest, stageidx):
    stage = {"objectives": {}, "completion": False}
    quest["stages"][str(stageidx)] = stage
    return stage

# If a stage is set as a completion stage it means that the quest is
# considered completed if player is at this stage.
def setcompletionstage(stage):
    stage["completion"] = True
    
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
        error("Quest " + str(getquestid(quest)) + " does not have stage " + str(stage) + ".")
        
    qdata = getdata(actor, "quests")

    if qdata == None:
        qdata = {}
        setdata(actor, "quests", qdata)

    id = getquestid(quest)

    if qdata[id] == None:
        qdata[id] = {"stage": 0}
        
    qdata[id]["stage"] = stage
    questupdate(actor, quest["stages"][str(stage)]["logentry"])
    objectives = quest["stages"][str(stage)]["objectives"]
    for o in objectives:
        current = objectives[str(o)]
        otext = current["display"]
        if current["times_to_complete"] > 1:
            otext = otext + " (0/" + str(current["times_to_complete"]) + ")"
        questupdate(actor, "New objective: " + otext)

def getqueststage(actor, quest):
    qdata = getdata(actor, "quests")
    if qdata == None:
        return None

    return qdata[getquestid(quest)]["stage"]

def questupdate(actor, message):
    echo(actor, "&B[QUEST] " + message + "&d")
    
def startquest(actor, quest):
    firststage = min(map(lambda x: int(x), list(quest["stages"])))
    pquests = getdata(actor, "quests")
    
    if pquests != None and pquests[getquestid(quest)] != None:
        error("Player already on quest.")
        
    questupdate(actor, "Quest started: " + quest["title"])
    setqueststage(actor, quest, firststage)
