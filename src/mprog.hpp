#ifndef _SWRIP_MPROG_HPP_
#define _SWRIP_MPROG_HPP_

#include <memory>
#include <list>
#include "types.hpp"
#include "vo.hpp"

class MProg
{
public:
    MProg();
    ~MProg();
    const std::list<std::shared_ptr<MPROG_ACT_LIST>> &ActLists() const;
    void Add(std::shared_ptr<MPROG_ACT_LIST> mal);
    void Remove(std::shared_ptr<MPROG_ACT_LIST> mal);

    const std::list<std::shared_ptr<MPROG_DATA>> &MudProgs() const;
    void Add(std::shared_ptr<MPROG_DATA> prog);
    void InsertBefore(size_t position, std::shared_ptr<MPROG_DATA> prog);
    void Remove(std::shared_ptr<MPROG_DATA> prog);

    int mpactnum = 0;
    short mpscriptpos = 0;
    int progtypes = 0;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

class MPROG_ACT_LIST
{
public:
    std::string buf;
    Character *ch = nullptr;
    std::shared_ptr<Object> obj;
    Vo vo;
    std::shared_ptr<Room> room;
};

class MPROG_DATA
{
public:
    int         type = 0;
    bool        triggered = false;
    int         resetdelay = 0;
    std::string arglist;
    std::string comlist;
};

extern bool MOBtrigger;
extern Character *supermob;

void MobActUpdate();
void RoomActUpdate();
void ObjectActUpdate();
void ProgBug(const std::string &str, const Character *mob);
void InitializeSupermob();
void ReleaseSupermob();
void MobProgWordlistCheck(const std::string &arg, Character *mob,
                          Character *actor, std::shared_ptr<Object> object,
                          const Vo &vo, int type);
void MobProgPercentCheck(Character *mob, Character *actor,
                         std::shared_ptr<Object> object, const Vo &vo, int type);
void MobProgActTrigger(const std::string &buf, Character *mob,
                       Character *ch, std::shared_ptr<Object> obj, const Vo &vo);
void MobProgBribeTrigger(Character *mob, Character *ch, int amount);
void MobProgEntryTrigger(Character *mob);
void MobProgGiveTrigger(Character *mob, Character *ch, std::shared_ptr<Object> obj);
void MobProgGreetTrigger(Character *mob);
void MobProgFightTrigger(Character *mob, Character *ch);
void MobProgHitPercentTrigger(Character *mob, Character *ch);
void MobProgDeathTrigger(Character *killer, Character *mob);
void MobProgRandomTrigger(Character *mob);
void MobProgSpeechTrigger(const std::string &txt, Character *mob);
void MobProgScriptTrigger(Character *mob);
void MobProgHourTrigger(Character *mob);
void MobProgTimeTrigger(Character *mob);
void RoomProgSetSupermob(std::shared_ptr<Room> room);
void ObjProgSpeechTrigger(const std::string &txt, Character *ch);
void ObjProgRandomTrigger(std::shared_ptr<Object> obj);
void ObjProgWearTrigger(Character *ch, std::shared_ptr<Object> obj);
bool ObjProgUseTrigger(Character *ch, std::shared_ptr<Object> obj,
                       Character *vict, std::shared_ptr<Object> targ, const Vo &vo);
void ObjProgRemoveTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgExamineTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgSacTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgDamageTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgRepairTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgDropTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgZapTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgGreetTrigger(Character *ch);
void ObjProgGetTrigger(Character *ch, std::shared_ptr<Object> obj);
char *ObjProgTypeToName(int type);
void ObjProgPullTrigger(Character *ch, std::shared_ptr<Object> obj);
void ObjProgPushTrigger(Character *ch, std::shared_ptr<Object> obj);

void RoomProgLeaveTrigger(Character *ch);
void RoomProgEnterTrigger(Character *ch);
void RoomProgSleepTrigger(Character *ch);
void RoomProgRestTrigger(Character *ch);
void RoomProgFightTrigger(Character *ch);
void RoomProgDeathTrigger(Character *killer, Character *ch);
void RoomProgSpeechTrigger(const std::string &txt, Character *ch);
void RoomProgRandomTrigger(Character *ch);
void RoomProgTimeTrigger(Character *ch);
void RoomProgHourTrigger(Character *ch);
char *RoomProgTypeToName(int type);

void ObjProgActTrigger(const std::string &buf, std::shared_ptr<Object> mobj, Character *ch,
                       std::shared_ptr<Object> obj, const Vo &vo);
void RoomProgActTrigger(const std::string &buf, std::shared_ptr<Room> room, Character *ch,
                        std::shared_ptr<Object> obj, const Vo &vo);


#endif
