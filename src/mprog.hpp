#ifndef _SWRIP_MPROG_HPP_
#define _SWRIP_MPROG_HPP_

#include <memory>
#include <list>
#include <sstream>
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
    std::shared_ptr<Character> ch;
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
extern std::shared_ptr<Character> supermob;

void MobActUpdate();
void RoomActUpdate();
void ObjectActUpdate();
void ProgBug(const std::string &str, std::shared_ptr<Character> mob);
void InitializeSupermob();
void ReleaseSupermob();
void MobProgWordlistCheck(const std::string &arg, std::shared_ptr<Character> mob,
                          std::shared_ptr<Character> actor, std::shared_ptr<Object> object,
                          const Vo &vo, int type);
void MobProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                         std::shared_ptr<Object> object, const Vo &vo, int type);
void MobProgActTrigger(const std::string &buf, std::shared_ptr<Character> mob,
                       std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, const Vo &vo);
void MobProgBribeTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch, int amount);
void MobProgEntryTrigger(std::shared_ptr<Character> mob);
void MobProgGiveTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void MobProgGreetTrigger(std::shared_ptr<Character> mob);
void MobProgFightTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch);
void MobProgHitPercentTrigger(std::shared_ptr<Character> mob, std::shared_ptr<Character> ch);
void MobProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> mob);
void MobProgRandomTrigger(std::shared_ptr<Character> mob);
void MobProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> mob);
void MobProgScriptTrigger(std::shared_ptr<Character> mob);
void MobProgHourTrigger(std::shared_ptr<Character> mob);
void MobProgTimeTrigger(std::shared_ptr<Character> mob);
void RoomProgSetSupermob(std::shared_ptr<Room> room);
void ObjProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch);
void ObjProgRandomTrigger(std::shared_ptr<Object> obj);
void ObjProgWearTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
bool ObjProgUseTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj,
                       std::shared_ptr<Character> vict, std::shared_ptr<Object> targ, const Vo &vo);
void ObjProgRemoveTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgExamineTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgSacTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgDamageTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgRepairTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgDropTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgZapTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgGreetTrigger(std::shared_ptr<Character> ch);
void ObjProgGetTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
char *ObjProgTypeToName(int type);
void ObjProgPullTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);
void ObjProgPushTrigger(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

void RoomProgLeaveTrigger(std::shared_ptr<Character> ch);
void RoomProgEnterTrigger(std::shared_ptr<Character> ch);
void RoomProgSleepTrigger(std::shared_ptr<Character> ch);
void RoomProgRestTrigger(std::shared_ptr<Character> ch);
void RoomProgFightTrigger(std::shared_ptr<Character> ch);
void RoomProgDeathTrigger(std::shared_ptr<Character> killer, std::shared_ptr<Character> ch);
void RoomProgSpeechTrigger(const std::string &txt, std::shared_ptr<Character> ch);
void RoomProgRandomTrigger(std::shared_ptr<Character> ch);
void RoomProgTimeTrigger(std::shared_ptr<Character> ch);
void RoomProgHourTrigger(std::shared_ptr<Character> ch);
char *RoomProgTypeToName(int type);

void ObjProgActTrigger(const std::string &buf, std::shared_ptr<Object> mobj, std::shared_ptr<Character> ch,
                       std::shared_ptr<Object> obj, const Vo &vo);
void RoomProgActTrigger(const std::string &buf, std::shared_ptr<Room> room, std::shared_ptr<Character> ch,
                        std::shared_ptr<Object> obj, const Vo &vo);


std::list<std::string> SplitIntoLines(std::string input);
void DiscardComments(std::list<std::string> &document);
void RewriteElIfs(std::list<std::string> &document);
void RewriteIfAnd(std::list<std::string> &document);
std::shared_ptr<Object> GetObjectFromSupermob(const std::shared_ptr<Character> supermob);

template<typename ContainerT>
std::string JoinAsString(const ContainerT &container, const std::string &separator = "\r\n")
{
    return JoinAsString(std::cbegin(container), std::cend(container), separator);
}

template<typename Iter1, typename Iter2>
std::string JoinAsString(Iter1 begin, Iter2 end, const std::string &separator = "\r\n")
{
    std::ostringstream buf;

    std::for_each(begin, end, [&buf, separator](const auto &i)
                  {
                      buf << i << separator;
                  });

    return buf.str();
}

#endif
