#ifndef _SWRIP_PROTOOBJECT_HPP_
#define _SWRIP_PROTOOBJECT_HPP_

#include <list>
#include <array>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class ProtoObject
{
public:
  ProtoObject();
  virtual ~ProtoObject();
  
  ProtoObject   *Next = nullptr;
  ProtoObject   *NextSort = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  Affect      *FirstAffect = nullptr;
  Affect      *LastAffect = nullptr;
  char             *Name = nullptr;
  char             *ShortDescr = nullptr;
  char             *Description = nullptr;
  char             *ActionDescription = nullptr;
  vnum_t            Vnum = INVALID_VNUM;
  short             Level = 0;
  ItemTypes         ItemType = 0;
  int               Flags = 0;
  int               WearFlags = 0;
  short             Count = 0;
  short             Weight = 0;
  int               Cost = 0;
  std::array<int, MAX_OVAL> Value;
  int               Serial = 0;
  short             Layers = 0;
  int               Rent = 0;                   /* Unused */

  MProg mprog;
};

#endif
