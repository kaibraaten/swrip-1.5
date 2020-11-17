#ifndef _SWRIP_MPROG_HPP_
#define _SWRIP_MPROG_HPP_

#include <memory>
#include <list>
#include <sstream>
#include <vector>
#include <initializer_list>
#include <string>
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

enum class ScriptType
{
    Imp,
    MProg
};

class MPROG_DATA
{
public:
    ScriptType SType = ScriptType::Imp;
    int type = 0;
    bool triggered = false;
    int resetdelay = 0;
    std::string arglist;
    std::string comlist;
};

inline bool MOBtrigger;
inline std::shared_ptr<Character> supermob;

void MobActUpdate();
void RoomActUpdate();
void ObjectActUpdate();
void ProgBug(const std::string &str, std::shared_ptr<Character> mob);
void InitializeSupermob();
void ReleaseSupermob();
void MobProgWordlistCheck(const std::string &arg, std::shared_ptr<Character> mob,
                          std::shared_ptr<Character> actor, std::shared_ptr<Object> object,
                          const Vo &vo, int type);
void ObjProgWordlistCheck(const std::string &arg, std::shared_ptr<Character> mob,
                          std::shared_ptr<Character> actor,
                          std::shared_ptr<Object> obj, const Vo &vo,
                          int type, std::shared_ptr<Object> iobj);
void RoomProgWordlistCheck(const std::string &arg, std::shared_ptr<Character> mob,
                           std::shared_ptr<Character> actor,
                           std::shared_ptr<Object> obj, const Vo &vo,
                           int type, std::shared_ptr<Room> room);
void MobProgPercentCheck(std::shared_ptr<Character> mob, std::shared_ptr<Character> actor,
                         std::shared_ptr<Object> object, const Vo &vo, int type);
void RoomProgSetSupermob(std::shared_ptr<Room> room);
void MudProgSetSupermob(std::shared_ptr<Object> obj);

std::shared_ptr<Object> GetObjectFromSupermob(const std::shared_ptr<Character> supermob);

#endif
