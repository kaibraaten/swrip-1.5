#ifndef _SWRIP_MPROG_HPP_
#define _SWRIP_MPROG_HPP_

#include <list>
#include "types.hpp"

class MProg
{
public:
  MProg();
  ~MProg();
  const std::list<MPROG_ACT_LIST*> &ActLists() const;
  void Add(MPROG_ACT_LIST *mal);
  void Remove(MPROG_ACT_LIST *mal);

  const std::list<MPROG_DATA*> &MudProgs() const;
  void Add(MPROG_DATA *prog);
  void InsertBefore(size_t position, MPROG_DATA *prog);
  void Remove(MPROG_DATA *prog);

  int mpactnum = 0;
  short mpscriptpos = 0;
  int progtypes = 0;

private:
  struct Impl;
  Impl *pImpl;
};

/* Mob program structures */
struct act_prog_data
{
  void                 *vo = nullptr;
};

struct MPROG_ACT_LIST
{
  char *buf = nullptr;
  Character *ch = nullptr;
  Object *obj = nullptr;
  void *vo = nullptr;
};

struct MPROG_DATA
{
  int         type = 0;
  bool        triggered = false;
  int         resetdelay = 0;
  char       *arglist = nullptr;
  char       *comlist = nullptr;
};

extern bool MOBtrigger;
extern std::list<act_prog_data*> mob_act_list;
extern Character *supermob;

void RoomActUpdate( void );
void ObjectActUpdate( void );
void ProgBug( const std::string &str, const Character *mob );
void InitializeSupermob( void );
void ReleaseSupermob( void );
void MobProgWordlistCheck( const std::string &arg, Character *mob,
                           Character* actor, Object* object,
                           void* vo, int type );
void MobProgPercentCheck( Character *mob, Character* actor,
                          Object* object, void* vo, int type );
void MobProgActTrigger( const std::string &buf, Character* mob,
                        Character* ch, Object* obj, void* vo );
void MobProgBribeTrigger( Character* mob, Character* ch, int amount );
void MobProgEntryTrigger( Character* mob );
void MobProgGiveTrigger( Character* mob, Character* ch, Object* obj );
void MobProgGreetTrigger( Character* mob );
void MobProgFightTrigger( Character* mob, Character* ch );
void MobProgHitPercentTrigger( Character* mob, Character* ch );
void MobProgDeathTrigger( Character *killer, Character* mob );
void MobProgRandomTrigger( Character* mob );
void MobProgSpeechTrigger( const std::string &txt, Character* mob );
void MobProgScriptTrigger( Character *mob );
void MobProgHourTrigger( Character *mob );
void MobProgTimeTrigger( Character *mob );
void RoomProgSetSupermob( Room *room );
void ObjProgSpeechTrigger( const std::string &txt, Character *ch );
void ObjProgRandomTrigger( Object *obj );
void ObjProgWearTrigger( Character *ch, Object *obj );
bool ObjProgUseTrigger( Character *ch, Object *obj,
                        Character *vict, Object *targ, void *vo );
void ObjProgRemoveTrigger( Character *ch, Object *obj );
void ObjProgExamineTrigger( Character *ch, Object *obj );
void ObjProgSacTrigger( Character *ch, Object *obj );
void ObjProgDamageTrigger( Character *ch, Object *obj );
void ObjProgRepairTrigger( Character *ch, Object *obj );
void ObjProgDropTrigger( Character *ch, Object *obj );
void ObjProgZapTrigger( Character *ch, Object *obj );
void ObjProgGreetTrigger( Character *ch );
void ObjProgGetTrigger( Character *ch, Object *obj );
char *ObjProgTypeToName( int type );
void ObjProgPullTrigger( Character *ch, Object *obj );
void ObjProgPushTrigger( Character *ch, Object *obj );

void RoomProgLeaveTrigger( Character *ch );
void RoomProgEnterTrigger( Character *ch );
void RoomProgSleepTrigger( Character *ch );
void RoomProgRestTrigger( Character *ch );
void RoomProgFightTrigger( Character *ch );
void RoomProgDeathTrigger( Character *killer, Character *ch );
void RoomProgSpeechTrigger( const std::string &txt, Character *ch );
void RoomProgRandomTrigger( Character *ch );
void RoomProgTimeTrigger( Character *ch );
void RoomProgHourTrigger( Character *ch );
char *RoomProgTypeToName(int type );

void ObjProgActTrigger( const std::string &buf, Object *mobj, Character *ch,
                        Object *obj, void *vo );
void RoomProgActTrigger( const std::string &buf, Room *room, Character *ch,
                         Object *obj, void *vo );


#endif
