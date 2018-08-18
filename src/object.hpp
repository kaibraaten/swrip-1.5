#ifndef _SWRIP_OBJECT_HPP_
#define _SWRIP_OBJECT_HPP_

#include <array>
#include <string>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class Object
{
public:
  Object();
  Object(ProtoObject *protoObj, int level);
  virtual ~Object();
  
  Object         *Next = nullptr;
  Object         *Previous = nullptr;
  Object         *NextContent = nullptr;
  Object         *PreviousContent = nullptr;
  Object         *FirstContent = nullptr;
  Object         *LastContent = nullptr;
  Object         *InObject = nullptr;
  Character        *CarriedBy = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  Affect      *FirstAffect = nullptr;
  Affect      *LastAffect = nullptr;
  ProtoObject   *Prototype = nullptr;
  Room  *InRoom = nullptr;
  char             *ArmedBy = nullptr;
  char             *Name = nullptr;
  char             *ShortDescr = nullptr;
  char             *Description = nullptr;
  char             *ActionDescription = nullptr;
  ItemTypes         ItemType = 0;
  int               Flags = 0;
  int               WearFlags = 0;
  int               BlasterSetting = 0;
  WearLocation      WearLoc = WEAR_NONE;
  short             Weight = 1;
  int               Cost = 0;
  short             Level = 0;
  short             Timer = 0;
  std::array<int, MAX_OVAL> Value;
  short             Count = 1;          /* support for object grouping */
  int               Serial = 0;         /* serial number               */

  MProg mprog;
};

#endif
