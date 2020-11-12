#include <cstring>
#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "room.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "triggers.hpp"
#include "log.hpp"

//////////////////////////////////////////////////////
#include <imp/runtime/nonevalue.hpp>
#include <imp/runtime/stringvalue.hpp>
#include <imp/runtime/intvalue.hpp>
#include "impscript/imp.hpp"
#include "impscript/impcharacter.hpp"
#include "impscript/improom.hpp"
#include "impscript/impobject.hpp"

//////////////////////////////////////////////////////

// Functions from mud_prog.cpp
void MobileActAdd(std::shared_ptr<Character> mob);
void ObjectActAdd(std::shared_ptr<Object> obj);
void RoomActAdd(std::shared_ptr<Room> room);
void MudProgDriver(std::string com_list, std::shared_ptr<Character> mob,
                   std::shared_ptr<Character> actor, std::shared_ptr<Object> obj,
                   const Vo &vo, bool single_step);

static bool MudProgKeywordCheck(const std::string &argu, const std::string &argl);
static bool ObjProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                                std::shared_ptr<Object> obj, const Vo &vo, int type);
static void RoomProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                                 std::shared_ptr<Object> obj, const Vo &vo, int type);
static void RoomProgTimeCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                              std::shared_ptr<Object> obj,
                              const Vo &vo, int type);
static void MobProgTimeCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                             std::shared_ptr<Object> obj,
                             const Vo &vo, int type);

std::string MakeScriptName(std::shared_ptr<Character> mob, int type)
{
    return "mob " + std::to_string(mob->Prototype->Vnum) + " " + std::string(MobProgTypeToName(type)) + " trigger";
}

std::string MakeScriptName(std::shared_ptr<Object> obj, int type)
{
    return "obj " + std::to_string(obj->Prototype->Vnum) + " " + std::string(MobProgTypeToName(type)) + " trigger";
}

std::string MakeScriptName(std::shared_ptr<Room> room, int type)
{
    return "room " + std::to_string(room->Vnum) + " " + std::string(MobProgTypeToName(type)) + " trigger";
}

void MobProgActTrigger(const std::string &buf,
                       std::shared_ptr<Character> mob,
                       std::shared_ptr<Character> ch,
                       std::shared_ptr<Object> obj,
                       const Vo &vo)
{
    if(IsNpc(mob)
       && IsBitSet(mob->Prototype->mprog.progtypes, ACT_PROG))
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if(IsNpc(ch) && ch->Prototype == mob->Prototype)
            return;

        bool found = false;

        /* make sure this is a matching trigger */
        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if(mprg->type & ACT_PROG
               && MudProgKeywordCheck(buf, mprg->arglist))
            {
                found = true;
                break;
            }
        }

        if(!found)
        {
            return;
        }

        std::shared_ptr<MPROG_ACT_LIST> tmp_act = std::make_shared<MPROG_ACT_LIST>();

        mob->mprog.Add(tmp_act);

        tmp_act->buf = buf;
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;
        mob->mprog.mpactnum++;
        MobileActAdd(mob);
    }
}

void MobProgBribeTrigger(std::shared_ptr<Character> mob,
                         std::shared_ptr<Character> ch,
                         int amount)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & BRIBE_PROG)
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if(IsNpc(ch) && ch->Prototype == mob->Prototype)
            return;

        std::shared_ptr<Object> obj = CreateObject(GetProtoObject(OBJ_VNUM_MONEY_SOME), 0);
        char buf[MAX_STRING_LENGTH];
        sprintf(buf, obj->ShortDescr.c_str(), amount);
        obj->ShortDescr = buf;
        obj->Value[OVAL_MONEY_AMOUNT] = amount;
        obj = ObjectToCharacter(obj, mob);
        mob->Gold -= amount;

        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if(mprg->type & BRIBE_PROG
               && amount >= atoi(mprg->arglist.c_str()))
            {
                if(mprg->SType == ScriptType::Imp)
                {
                    std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, ch, amount, BRIBE_PROG);
                    auto funcName = data.first;
                    auto params = data.second;
                    DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                        MakeScriptName(mob, BRIBE_PROG));
                }
                else
                {
                    MudProgDriver(mprg->comlist, mob, ch, obj, nullptr, false);
                }

                break;
            }
        }
    }
}

void MobProgEntryTrigger(std::shared_ptr<Character> mob)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & ENTRY_PROG)
    {
        MobProgPercentCheck(mob, nullptr, nullptr, nullptr, ENTRY_PROG);
    }
}

void MobProgGiveTrigger(std::shared_ptr<Character> mob,
                        std::shared_ptr<Character> ch,
                        std::shared_ptr<Object> obj)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & GIVE_PROG)
    {
        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if(IsNpc(ch) && ch->Prototype == mob->Prototype)
        {
            return;
        }

        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            std::string buf;
            OneArgument(mprg->arglist, buf);

            if(mprg->type & GIVE_PROG
               && (!StrCmp(obj->Name, mprg->arglist)
                   || !StrCmp("all", buf)))
            {
                if(mprg->SType == ScriptType::Imp)
                {
                    std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, ch, obj, GIVE_PROG);
                    auto funcName = data.first;
                    auto params = data.second;
                    DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                        MakeScriptName(mob, GIVE_PROG));
                }
                else
                {
                    MudProgDriver(mprg->comlist, mob, ch, obj, Vo(), false);
                }
                break;
            }
        }
    }
}

void MobProgGreetTrigger(std::shared_ptr<Character> ch)
{
    std::list<std::shared_ptr<Character> > copyOfCharacterList(ch->InRoom->Characters());

    for(auto vmob : copyOfCharacterList)
    {
        if(!IsNpc(vmob)
           || IsFighting(vmob)
           || !IsAwake(vmob))
        {
            continue;
        }

        /* Don't let a mob trigger itself, nor one instance of a mob
           trigger another instance. */
        if(IsNpc(ch) && ch->Prototype == vmob->Prototype)
        {
            continue;
        }

        if(vmob->Prototype->mprog.progtypes & GREET_PROG)
        {
            MobProgPercentCheck(vmob, ch, nullptr, nullptr, GREET_PROG);
        }
        else if(vmob->Prototype->mprog.progtypes & ALL_GREET_PROG)
        {
            MobProgPercentCheck(vmob, ch, nullptr, nullptr, ALL_GREET_PROG);
        }
    }
}

void MobProgFightTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & FIGHT_PROG)
    {
        MobProgPercentCheck(mob, ch, nullptr, nullptr, FIGHT_PROG);
    }
}

void MobProgHitPercentTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & HITPRCNT_PROG)
    {
        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if(mprg->type & HITPRCNT_PROG
               && 100 * mob->HitPoints.Current / mob->HitPoints.Max < atoi(mprg->arglist.c_str()))
            {
                if(mprg->SType == ScriptType::Imp)
                {
                    std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, ch, nullptr, HITPRCNT_PROG);
                    auto funcName = data.first;
                    auto params = data.second;
                    DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                        MakeScriptName(mob, HITPRCNT_PROG));
                }
                else
                {
                    MudProgDriver(mprg->comlist, mob, ch, nullptr, nullptr, false);
                }
                break;
            }
        }
    }
}

void MobProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> mob)
{
    if(IsNpc(mob) && killer != mob
       && mob->Prototype->mprog.progtypes & DEATH_PROG)
    {
        MobProgPercentCheck(mob, killer, nullptr, nullptr, DEATH_PROG);
    }
}

void MobProgRandomTrigger(std::shared_ptr<Character> mob)
{
    if(mob->Prototype->mprog.progtypes & RAND_PROG)
    {
        MobProgPercentCheck(mob, nullptr, nullptr, nullptr, RAND_PROG);
    }
}

void MobProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> actor)
{
    std::list<std::shared_ptr<Character> > copyOfCharacterList(actor->InRoom->Characters());

    for(auto vmob : copyOfCharacterList)
    {
        if(IsNpc(vmob) && vmob->Prototype->mprog.progtypes & SPEECH_PROG)
        {
            if(IsNpc(actor) && actor->Prototype == vmob->Prototype)
                continue;

            MobProgWordlistCheck(txt, vmob, actor, nullptr, nullptr, SPEECH_PROG);
        }
    }
}

void MobProgScriptTrigger(std::shared_ptr<Character> mob)
{
    if(mob->Prototype->mprog.progtypes & SCRIPT_PROG)
    {
        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if(mprg->type & SCRIPT_PROG)
            {
                if(mprg->arglist.empty()
                   || mob->mprog.mpscriptpos != 0
                   || atoi(mprg->arglist.c_str()) == time_info.Hour)
                {
                    if(mprg->SType == ScriptType::Imp)
                    {
                        std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, nullptr, nullptr, SCRIPT_PROG);
                        auto funcName = data.first;
                        auto params = data.second;
                        DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                            MakeScriptName(mob, SCRIPT_PROG));
                    }
                    else
                    {
                        MudProgDriver(mprg->comlist, mob, nullptr, nullptr, nullptr, true);
                    }
                }
            }
        }
    }
}

void MobProgHourTrigger(std::shared_ptr<Character> mob)
{
    if(mob->Prototype->mprog.progtypes & HOUR_PROG)
        MobProgTimeCheck(mob, nullptr, nullptr, nullptr, HOUR_PROG);
}

void MobProgTimeTrigger(std::shared_ptr<Character> mob)
{
    if(mob->Prototype->mprog.progtypes & TIME_PROG)
    {
        MobProgTimeCheck(mob, nullptr, nullptr, nullptr, TIME_PROG);
    }
}

void ObjProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch)
{
    auto objectsWithSpeechTrigger = Filter(ch->InRoom->Objects(),
                                           [](auto vobj)
                                           {
                                               return vobj->Prototype->mprog.progtypes & SPEECH_PROG;
                                           });

    /* supermob is set and released in ObjProgWordlistCheck */
    for(auto vobj : objectsWithSpeechTrigger)
    {
        ObjProgWordlistCheck(txt, supermob, ch, vobj, nullptr, SPEECH_PROG, vobj);
    }
}

/*
 * Called at top of obj_update
 * make sure to put an if(!obj) continue
 * after it
 */
void ObjProgRandomTrigger(std::shared_ptr<Object> obj)
{
    if(!obj || !obj->Prototype)
        return;

    if(obj->Prototype->mprog.progtypes & RAND_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, nullptr, obj, nullptr, RAND_PROG);
        ReleaseSupermob();
    }
}

/*
 * in wear_obj, between each successful EquipCharacter
 * the subsequent return
 */
void ObjProgWearTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & WEAR_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, WEAR_PROG);
        ReleaseSupermob();
    }
}

bool ObjProgUseTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj,
                       const Vo &vo)
{
    bool executed = false;

    if(obj->Prototype->mprog.progtypes & USE_PROG)
    {
        MudProgSetSupermob(obj);
        executed = ObjProgPercentCheck(supermob, ch, obj, vo, USE_PROG);
        ReleaseSupermob();
    }

    return executed;
}

/*
 * call in RemoveObject, right after UnequipCharacter
 * do a if(!ch) return right after, and return true (?)
 * if !ch
 */
void ObjProgRemoveTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & REMOVE_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, REMOVE_PROG);
        ReleaseSupermob();
    }
}

/*
 * call towards end of do_examine, right before CheckObjectForTrap
 */
void ObjProgExamineTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & EXA_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, EXA_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in do_sac, right before ExtractObject
 */
void ObjProgSacTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & SAC_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, SAC_PROG);
        ReleaseSupermob();
    }
}

/*
 * called in DamageObject in act_obj.c
 */
void ObjProgDamageTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & DAMAGE_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, DAMAGE_PROG);
        ReleaseSupermob();
    }
}

/*
 * called in do_repair in shops.c
 */
void ObjProgRepairTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & REPAIR_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, REPAIR_PROG);
        ReleaseSupermob();
    }
}

/*
 * call twice in do_drop, right after the Act( AT_ACTION,...)
 * do a if(!ch) return right after
 */
void ObjProgDropTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & DROP_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, DROP_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in fight.c, group_gain, after (?) the ObjectToRoom
 */
void ObjProgZapTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & ZAP_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, ZAP_PROG);
        ReleaseSupermob();
    }
}

void ObjProgGreetTrigger(std::shared_ptr<Character> ch)
{
    auto objectsWithGreetTrigger = Filter(ch->InRoom->Objects(),
                                          [](auto vobj)
                                          {
                                              return vobj->Prototype->mprog.progtypes & GREET_PROG;
                                          });

    for(auto vobj : objectsWithGreetTrigger)
    {
        MudProgSetSupermob(vobj);  /* not very efficient to do here */
        ObjProgPercentCheck(supermob, ch, vobj, nullptr, GREET_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in do_get, right before CheckObjectForTrap
 * do a if(!ch) return right after
 */
void ObjProgGetTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & GET_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, GET_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void ObjProgPullTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & PULL_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, PULL_PROG);
        ReleaseSupermob();
    }
}

/*
 * call in levers.c, towards top of do_push_or_pull
 *  see note there
 */
void ObjProgPushTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    if(obj->Prototype->mprog.progtypes & PUSH_PROG)
    {
        MudProgSetSupermob(obj);
        ObjProgPercentCheck(supermob, ch, obj, nullptr, PUSH_PROG);
        ReleaseSupermob();
    }
}

void RoomProgLeaveTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & LEAVE_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, LEAVE_PROG);
        ReleaseSupermob();
    }
}

void RoomProgEnterTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & ENTER_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, ENTER_PROG);
        ReleaseSupermob();
    }
}

void RoomProgSleepTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & SLEEP_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, SLEEP_PROG);
        ReleaseSupermob();
    }
}

void RoomProgRestTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & REST_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, REST_PROG);
        ReleaseSupermob();
    }
}

void RoomProgFightTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & RFIGHT_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, RFIGHT_PROG);
        ReleaseSupermob();
    }
}

void RoomProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & RDEATH_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, killer, RDEATH_PROG);
        ReleaseSupermob();
    }
}

void RoomProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & SPEECH_PROG)
    {
        /* supermob is set and released in RoomProgWordlistCheck */
        RoomProgWordlistCheck(txt, supermob, ch, nullptr, nullptr, SPEECH_PROG, ch->InRoom);
    }
}

void RoomProgRandomTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & RAND_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgPercentCheck(supermob, ch, nullptr, nullptr, RAND_PROG);
        ReleaseSupermob();
    }
}

void RoomProgTimeTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & TIME_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgTimeCheck(supermob, nullptr, nullptr, ch->InRoom, TIME_PROG);
        ReleaseSupermob();
    }
}

void RoomProgHourTrigger(std::shared_ptr<Character> ch)
{
    if(ch->InRoom->mprog.progtypes & HOUR_PROG)
    {
        RoomProgSetSupermob(ch->InRoom);
        RoomProgTimeCheck(supermob, nullptr, nullptr, ch->InRoom, HOUR_PROG);
        ReleaseSupermob();
    }
}


void ObjProgActTrigger(const std::string &buf, std::shared_ptr<Object> mobj,
                       std::shared_ptr<Character> ch,
                       std::shared_ptr<Object> obj, const Vo &vo)
{
    if(mobj->Prototype->mprog.progtypes & ACT_PROG)
    {
        auto tmp_act = std::make_shared<MPROG_ACT_LIST>();

        mobj->mprog.Add(tmp_act);

        tmp_act->buf = buf;
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;
        mobj->mprog.mpactnum++;
        ObjectActAdd(mobj);
    }
}

void RoomProgActTrigger(const std::string &buf, std::shared_ptr<Room> room,
                        std::shared_ptr<Character> ch,
                        std::shared_ptr<Object> obj, const Vo &vo)
{
    if(room->mprog.progtypes & ACT_PROG)
    {
        auto tmp_act = std::make_shared<MPROG_ACT_LIST>();

        tmp_act->buf = buf;
        tmp_act->ch = ch;
        tmp_act->obj = obj;
        tmp_act->vo = vo;

        room->mprog.Add(tmp_act);

        room->mprog.mpactnum++;
        RoomActAdd(room);
    }
}

//////////////////////////////////////////////////////////////////////
// Private functions to this translation unit.
static bool MudProgKeywordCheck(const std::string &argu, const std::string &argl)
{
    std::string word;
    char arg1[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    size_t i = 0;
    char *arg = nullptr, *arglist = nullptr;
    char *start = nullptr, *end = nullptr;

    strcpy(arg1, ToLower(argu).c_str());
    arg = arg1;
    strcpy(arg2, ToLower(argl).c_str());
    arglist = arg2;

    for(i = 0; i < strlen(arglist); i++)
        arglist[i] = CharToLowercase(arglist[i]);

    for(i = 0; i < strlen(arg); i++)
        arg[i] = CharToLowercase(arg[i]);

    if(arglist[0] == 'p' && arglist[1] == ' ')
    {
        arglist += 2;

        while((start = strstr(arg, arglist)))
        {
            if((start == arg || *(start - 1) == ' ')
               && (*(end = start + strlen(arglist)) == ' '
                   || *end == '\n'
                   || *end == '\r'
                   || *end == '\0'))
            {
                return true;
            }
            else
            {
                arg = start + 1;
            }
        }
    }
    else
    {
        std::string stl_arglist = OneArgument(arglist, word);

        for(; !word.empty(); stl_arglist = OneArgument(arglist, word))
        {
            strcpy(arglist, stl_arglist.c_str());

            while((start = strstr(arg, word.c_str())))
            {
                if((start == arg || *(start - 1) == ' ')
                   && (*(end = start + word.size()) == ' '
                       || *end == '\n'
                       || *end == '\r'
                       || *end == '\0'))
                {
                    return true;
                }
                else
                {
                    arg = start + 1;
                }
            }
        }
    }

    return false;
}

std::list<std::string> SplitIntoLines(const std::string &comlist)
{
    std::istringstream inbuf(comlist);
    std::list<std::string> code;
    std::string line;

    while(std::getline(inbuf, line))
    {
        code.push_back(line);
    }

    return code;
}

std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpMobProgData(std::shared_ptr<Character> mob,
                                                                                          std::shared_ptr<Character> actor,
                                                                                          const Vo &vo, int type)
{
    if(type == ENTRY_PROG)
    {
        return { "on_entry", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpRoom>(mob->InRoom) } };
    }
    else if(type == GREET_PROG || type == ALL_GREET_PROG)
    {
        return { "on_greet", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == FIGHT_PROG)
    {
        return { "on_fight", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == DEATH_PROG)
    {
        return { "on_death", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == RAND_PROG)
    {
        return { "on_rand", { std::make_shared<ImpCharacter>(mob) } };
    }
    else if(type == BRIBE_PROG)
    {
        return { "on_bribe", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor), std::make_shared<Imp::IntValue>(vo.Integer) } };
    }
    else if(type == HITPRCNT_PROG)
    {
        return { "on_hitpercent", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == GIVE_PROG)
    {
        return { "on_give", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor), std::make_shared<ImpObject>(vo.Obj) } };
    }
    else if(type == SPEECH_PROG)
    {
        return { "on_speech", { std::make_shared<ImpCharacter>(mob), std::make_shared<ImpCharacter>(actor), std::make_shared<Imp::StringValue>(vo.Txt) } };
    }
    else if(type == SCRIPT_PROG)
    {
        return { "on_script", { std::make_shared<ImpCharacter>(mob) } };
    }
    else if(type == HOUR_PROG)
    {
        return { "on_hour", { std::make_shared<ImpCharacter>(mob) } };
    }
    else if(type == TIME_PROG)
    {
        return { "on_time", { std::make_shared<ImpCharacter>(mob) } };
    }
    else if(type == SPAWN_PROG)
    {
        return { "on_spawn", { std::make_shared<ImpCharacter>(mob) } };
    }
    else
    {
        return { "UNSUPPORTED_TRIGGER_TYPE", {} };
    }
}

std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpRoomProgData(std::shared_ptr<Room> room,
                                                                                           std::shared_ptr<Character> actor,
                                                                                           const Vo &vo, int type)
{
    if(type == LEAVE_PROG)
    {
        return { "on_leave", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == ENTER_PROG)
    {
        return { "on_enter", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == SLEEP_PROG)
    {
        return { "on_sleep", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == REST_PROG)
    {
        return { "on_rest", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == RFIGHT_PROG)
    {
        return { "on_fight", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == RDEATH_PROG)
    {
        return { "on_death", { std::make_shared<ImpRoom>(room), std::make_shared<ImpCharacter>(actor), std::make_shared<ImpCharacter>(vo.Ch) } };
    }
    else if(type == RAND_PROG)
    {
        return { "on_rand", { std::make_shared<ImpRoom>(room) } };
    }
    else if(type == HOUR_PROG)
    {
        return { "on_hour", { std::make_shared<ImpRoom>(room) } };
    }
    else if(type == TIME_PROG)
    {
        return { "on_time", { std::make_shared<ImpRoom>(room) } };
    }
    else
    {
        return { "UNSUPPORTED_TRIGGER_TYPE", {} };
    }
}

std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> GetImpObjProgData(std::shared_ptr<Object> obj,
                                                                                          std::shared_ptr<Character> actor,
                                                                                          const Vo &vo, int type)
{
    if(type == RAND_PROG)
    {
        return { "on_rand", { std::make_shared<ImpObject>(obj) } };
    }
    else if(type == WEAR_PROG)
    {
        return { "on_wear", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == REMOVE_PROG)
    {
        return { "on_remove", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == EXA_PROG)
    {
        return { "on_examine", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == SAC_PROG)
    {
        return { "on_junk", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == DAMAGE_PROG)
    {
        return { "on_damage", { std::make_shared<ImpObject>(obj) } };
    }
    else if(type == REPAIR_PROG)
    {
        return { "on_repair", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == DROP_PROG)
    {
        return { "on_drop", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == ZAP_PROG)
    {
        return { "on_zap", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == GREET_PROG)
    {
        return { "on_greet", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == GET_PROG)
    {
        return { "on_get", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == PUSH_PROG)
    {
        return { "on_push", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == PULL_PROG)
    {
        return { "on_pull", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor) } };
    }
    else if(type == SPEECH_PROG)
    {
        return { "on_speech", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor), std::make_shared<Imp::StringValue>(vo.Txt) } };
    }
    else if(type == USE_PROG)
    {
        auto victim = vo.Ch;
        auto otherobj = vo.Obj;
        std::shared_ptr<Imp::RuntimeValue> arg3 = victim ? std::dynamic_pointer_cast<Imp::RuntimeValue>(std::make_shared<ImpCharacter>(victim)) : std::dynamic_pointer_cast<Imp::RuntimeValue>(std::make_shared<Imp::NoneValue>());
        std::shared_ptr<Imp::RuntimeValue> arg4 = otherobj ? std::dynamic_pointer_cast<Imp::RuntimeValue>(std::make_shared<ImpObject>(otherobj)) : std::dynamic_pointer_cast<Imp::RuntimeValue>(std::make_shared<Imp::NoneValue>());
        return { "on_use", { std::make_shared<ImpObject>(obj), std::make_shared<ImpCharacter>(actor), arg3, arg4 } };
    }
    else
    {
        return { "UNSUPPORTED_TRIGGER_TYPE", {} };
    }
}

static bool ObjProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                                std::shared_ptr<Object> obj,
                                const Vo &vo, int type)
{
    bool executed = false;

    for(auto mprg : obj->Prototype->mprog.MudProgs())
    {
        if(mprg->type & type
           && GetRandomPercent() <= atoi(mprg->arglist.c_str()))
        {
            executed = true;

            if(mprg->SType == ScriptType::Imp)
            {
                std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpObjProgData(obj, actor, vo, type);
                auto funcName = data.first;
                auto params = data.second;
                DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                    "obj " + std::to_string(obj->Prototype->Vnum) + " " + std::string(MobProgTypeToName(type)) + " trigger");
            }
            else
            {
                MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
            }

            if(type != GREET_PROG)
            {
                break;
            }
        }
    }

    return executed;
}

static void RoomProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                                 std::shared_ptr<Object> obj,
                                 const Vo &vo, int type)
{
    if(!mob->InRoom)
        return;

    for(auto mprg : mob->InRoom->mprog.MudProgs())
    {
        if(mprg->type & type
           && GetRandomPercent() <= atoi(mprg->arglist.c_str()))
        {
            if(mprg->SType == ScriptType::Imp)
            {
                std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpRoomProgData(actor->InRoom, actor, vo, type);
                auto funcName = data.first;
                auto params = data.second;
                DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                    MakeScriptName(actor->InRoom, type));
            }
            else
            {
                MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
            }

            if(type != ENTER_PROG)
            {
                break;
            }
        }
    }
}

static void RoomProgTimeCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                              std::shared_ptr<Object> obj,
                              const Vo &vo, int type)
{
    auto room = vo.Room;

    for(auto mprg : room->mprog.MudProgs())
    {
        bool trigger_time = time_info.Hour == atoi(mprg->arglist.c_str());

        if(!trigger_time)
        {
            if(mprg->triggered)
                mprg->triggered = false;

            continue;
        }

        if(mprg->type & type
           && (!mprg->triggered || mprg->type & HOUR_PROG))
        {
            mprg->triggered = true;

            if(mprg->SType == ScriptType::Imp)
            {
                std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpRoomProgData(room, nullptr, nullptr, type);
                auto funcName = data.first;
                auto params = data.second;
                DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                    MakeScriptName(room, type));
            }
            else
            {
                MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
            }
        }
    }
}

static void MobProgTimeCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                             std::shared_ptr<Object> obj,
                             const Vo &vo, int type)
{
    for(auto mprg : mob->Prototype->mprog.MudProgs())
    {
        bool trigger_time = time_info.Hour == atoi(mprg->arglist.c_str());

        if(!trigger_time)
        {
            if(mprg->triggered)
                mprg->triggered = false;

            continue;
        }

        if(mprg->type & type
           && (!mprg->triggered || mprg->type & HOUR_PROG))
        {
            mprg->triggered = true;

            if(mprg->SType == ScriptType::Imp)
            {
                std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, nullptr, nullptr, type);
                auto funcName = data.first;
                auto params = data.second;
                DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                    MakeScriptName(mob, type));
            }
            else
            {
                MudProgDriver(mprg->comlist, mob, actor, obj, vo, false);
            }
        }
    }
}

void ImpScriptSpawnTrigger(std::shared_ptr<Character> mob)
{
    if(IsNpc(mob)
       && mob->Prototype->mprog.progtypes & SPAWN_PROG)
    {
        for(auto mprg : mob->Prototype->mprog.MudProgs())
        {
            if(mprg->type & SPAWN_PROG && mprg->SType == ScriptType::Imp)
            {
                std::pair<std::string, std::vector<std::shared_ptr<Imp::RuntimeValue>>> data = GetImpMobProgData(mob, nullptr, nullptr, SPAWN_PROG);
                auto funcName = data.first;
                auto params = data.second;
                DispatchImpFunction(funcName, params, SplitIntoLines(mprg->comlist),
                                    MakeScriptName(mob, SPAWN_PROG));
                break;
            }
        }
    }
}
