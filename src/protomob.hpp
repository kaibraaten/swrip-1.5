#ifndef _SWRIP_PROTOMOB_HPP_
#define _SWRIP_PROTOMOB_HPP_

#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class ProtoMobile
{
public:
  ProtoMobile() = delete;
  ProtoMobile(vnum_t vnum);
  virtual ~ProtoMobile();
  
  ProtoMobile *Next = nullptr;
  ProtoMobile *NextSort = nullptr;
  SpecFun *spec_fun = nullptr;
  SpecFun *spec_2 = nullptr;
  struct Shop *Shop = nullptr;
  struct RepairShop *RepairShop = nullptr;
  std::string Name;
  std::string ShortDescr;
  std::string LongDescr;
  std::string Description;
  vnum_t          Vnum = INVALID_VNUM;
  short           Count = 0;
  short           Killed = 0;
  SexType         Sex = 0;
  short           Level = 0;
  int             Flags = 0;
  int             AffectedBy = 0;
  short           Alignment = 0;
  short           MobThac0 = 0;               /* Unused */
  short           ArmorClass = 0;
  short           HitNoDice = 0;
  short           HitSizeDice = 0;
  short           HitPlus = 0;
  short           DamNoDice = 0;
  short           DamSizeDice = 0;
  short           DamPlus = 0;
  short           NumberOfAttacks = 0;
  int             Gold = 0;
  int             exp = 0;
  int             BodyParts = 0;
  int             Resistant = 0;
  int             Immune = 0;
  int             Susceptible = 0;
  int             AttackFlags = 0;
  int             DefenseFlags = 0;
  int             Speaks = 0;
  int             Speaking = 0;
  PositionType    Position = 0;
  PositionType    DefaultPosition = 0;
  short           Height = 0;
  short           Weight = 0;
  short           Race = 0;
  short           HitRoll = 0;
  short           DamRoll = 0;
  int             VipFlags = 0;

  MProg mprog;
  
  struct
  {
    short PermStr = 0;
    short PermInt = 0;
    short PermWis = 0;
    short PermDex = 0;
    short PermCon = 0;
    short PermCha = 0;
    short PermLck = 0;
    short PermFrc = 0;
  } Stats;

  struct
  {
    short PoisonDeath = 0;
    short Wand = 0;
    short ParaPetri = 0;
    short Breath = 0;
    short SpellStaff = 0;
  } Saving;
};

#endif
