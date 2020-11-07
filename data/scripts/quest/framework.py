# Quest framework
from python import *

###############################################################
#
# Quest builder functions.
#
###############################################################
def makequest(id, title):
    return {"id": id, "title": title, "stages": {}}

def addqueststage(quest, stageidx):
    stage = {"objectives": {}, "completion": False}
    quest["stages"][str(stageidx)] = stage
    return stage

# If a stage is set as a completion stage it means that the quest is
# considered completed if player is at this stage. This allows multiple
# endings for a quest.
def setcompletionstage(stage):
    stage["completion"] = True
    
def setlogentry(stage, txt):
    stage["logentry"] = txt

def addobjective(stage, oid, txt, times_to_complete):
    if times_to_complete < 1:
        error("addobjective(): times_to_complete must be > 0.")
        
    objective = {"display": txt, "times_to_complete": times_to_complete}
    stage["objectives"][str(oid)] = objective
    return objective

def getquestid(quest):
    return quest["id"]

###############################################################
#
# Functions to manipulate characters.
#
###############################################################
def setqueststage(actor, quest, stage):
    if quest["stages"][str(stage)] == None:
        error("Quest " + str(getquestid(quest)) + " does not have stage " + str(stage) + ".")
        
    qdata = getdata(actor, "quests")

    if qdata == None:
        qdata = {}
        setdata(actor, "quests", qdata)

    id = getquestid(quest)

    if qdata[id] == None:
        qdata[id] = {"stage": {"id": 0, "objectives": {}}}
        
    qdata[id]["stage"]["id"] = stage
    questupdate(actor, quest["stages"][str(stage)]["logentry"])
    objectives = quest["stages"][str(stage)]["objectives"]

    for o in objectives:
        current = objectives[str(o)]
        qdata[id]["stage"]["objectives"][str(o)] = {"times_completed": 0}
        otext = current["display"]

        if current["times_to_complete"] > 1:
            otext = otext + " (" + str(qdata[id]["stage"]["objectives"][str(o)]["times_completed"]) + "/" + str(current["times_to_complete"]) + ")"

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
    
    if pquests == None:
        pquests = {}
        setdata(actor, "quests", pquests)
    
    if pquests[getquestid(quest)] != None:
        error("Player already on quest.")
        
    questupdate(actor, "Quest started: " + quest["title"])
    setqueststage(actor, quest, firststage)

def updateobjective(actor, quest, stageid, objectiveid):
    qdata = getdata(actor, "quests")[getquestid(quest)]

    if qdata != None and qdata["stage"]["id"] == stageid:
        stage = qdata["stage"]
        objective = stage["objectives"][str(objectiveid)]
        times_completed = objective["times_completed"]
        times_to_complete = quest["stages"][str(stageid)]["objectives"][str(objectiveid)]["times_to_complete"]

        if times_completed < times_to_complete:
            times_completed = times_completed + 1
            objective["times_completed"] = times_completed
            otext = ""

            if times_completed == times_to_complete:
                otext = "Objective completed: "
            else:
                otext = "Objective updated: "
                
            otext = otext + quest["stages"][str(stageid)]["objectives"][str(objectiveid)]["display"]

            if times_to_complete > 1:
                otext = otext + " (" + str(times_completed) + "/" + str(times_to_complete) + ")"
                
            questupdate(actor, otext)

def stagecompleted(actor, quest, stageid):
    for o in quest["stages"][str(stageid)]["objectives"]:
        oid = str(o)
        times_completed = int(getdata(actor, "quests")[getquestid(quest)]["stage"]["objectives"][oid]["times_completed"])
        times_to_complete = quest["stages"][str(stageid)]["objectives"][oid]["times_to_complete"]

        if times_completed < times_to_complete:
            return False

    return True
