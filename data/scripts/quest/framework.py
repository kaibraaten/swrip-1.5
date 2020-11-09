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
    stage = {"objectives": {}, "completion": False, "rewards": {"credits": None, "items": None}}
    quest["stages"][str(stageidx)] = stage
    return stage

# If a stage is set as a completion stage it means that the quest is
# considered completed if player is at this stage. This allows multiple
# endings for a quest.
def setcompletionstage(stage):
    stage["completion"] = True
    
def setlogentry(stage, txt):
    stage["logentry"] = txt

def addstagereward(stage, reward):
    if type(reward) == "int":
        stage["rewards"]["credits"] = reward
    elif type(reward) == "list":
        stage["rewards"]["items"] = reward
    else:
        error("Type error for addstagereward() param 2: " + type(reward))

def addobjective(stage, oid, txt, times_to_complete):
    if times_to_complete < 1:
        error("addobjective(): times_to_complete must be > 0.")
        
    objective = {"display": txt, "times_to_complete": times_to_complete}
    stage["objectives"][str(oid)] = objective
    return objective

def getquestid(quest):
    return quest["id"]

def getquesttitle(quest):
    return quest["title"]

###############################################################
#
# Functions to manipulate characters.
#
###############################################################
def setqueststage(actor, quest, stage):
    def issuerewards(rewards):
        if rewards["credits"]:
            amount = rewards["credits"]
            questupdate(actor, "Reward: You receive " + str(amount) + " credits.")
            addcredits(actor, amount)

        if rewards["items"]:
            for ovnum in rewards["items"]:
                obj = spawnobj(ovnum)
                if obj != None:
                    questupdate(actor, "Reward: You receive " + str(obj) + ".")
                    transfer(obj, actor)

    if isnpc(actor):
        return

    if quest["stages"][str(stage)] == None:
        error("Quest " + str(getquestid(quest)) + " does not have stage " + str(stage) + ".")
        
    qdata = getdata(actor, "quests")

    if qdata == None:
        qdata = {}
        setdata(actor, "quests", qdata)

    id = getquestid(quest)

    if qdata[id] == None:
        error("setqueststage: Actor has not started quest.")

    currentstage = qdata[id]["stage"]["id"]

    if currentstage == stage:
        return

    if currentstage and not stagecompleted(actor, quest, currentstage):
        log("setquestage: Attempt to change stage for " + str(actor) + " but current stage not completed.")
        return

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

    issuerewards(quest["stages"][str(stage)]["rewards"])

def getqueststage(actor, quest):
    if isnpc(actor):
        return

    qdata = getdata(actor, "quests")
    if qdata == None or qdata[getquestid(quest)] == None:
        return None

    return qdata[getquestid(quest)]["stage"]

def questupdate(actor, message):
    if isnpc(actor):
        return

    echo(actor, "&B[QUEST] " + message + "&d")
    
def startquest(actor, quest):
    if isnpc(actor):
        return

    firststage = min(map(lambda x: int(x), list(quest["stages"])))
    pquests = getdata(actor, "quests")
    
    if pquests == None:
        pquests = {}
        setdata(actor, "quests", pquests)
    
    if pquests[getquestid(quest)] != None:
        error("Player already on quest.")
    else:
        pquests[getquestid(quest)] = {"stage": {"id": None, "objectives": {}}}
        
    questupdate(actor, "Quest started: " + quest["title"])
    setqueststage(actor, quest, firststage)

def queststarted(actor, quest):
    if isnpc(actor):
        return False

    pquests = getdata(actor, "quests")

    if pquests != None and pquests[getquestid(quest)] != None:
        return True
    else:
        return False

def questcompleted(actor, quest):
    if isnpc(actor):
        return

    pquests = getdata(actor, "quests")

    if pquests == None or pquests[getquestid(quest)] == None:
        return False

    stageid = pquests[getquestid(quest)]["stage"]["id"]
    return quest["stages"][str(stageid)]["completion"]

def updateobjective(actor, quest, stageid, objectiveid):
    if isnpc(actor):
        return

    if getdata(actor, "quests") == None:
        return
    
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
    if isnpc(actor):
        return False

    if getdata(actor, "quests") == None or getdata(actor, "quests")[getquestid(quest)] == None:
        return False
    
    for o in quest["stages"][str(stageid)]["objectives"]:
        oid = str(o)
        times_completed = getdata(actor, "quests")[getquestid(quest)]["stage"]["objectives"][oid]["times_completed"]
        times_to_complete = quest["stages"][str(stageid)]["objectives"][oid]["times_to_complete"]

        if times_completed < times_to_complete:
            return False

    return True

def questinprogress(actor, quest):
    return queststarted(actor, quest) and not questcompleted(actor, quest)
