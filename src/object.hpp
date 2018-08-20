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

  const std::list<ExtraDescription*> &ExtraDescriptions() const;
  void Add(ExtraDescription *extraDescription);
  void Remove(ExtraDescription *extraDescription);

  const std::list<Affect*> &Affects() const;
  void Add(Affect *affect);
  void Remove(Affect *affect);

  void Add(Object *object);
  void Remove(Object *object);
  const std::list<Object*> &Objects() const;
  
  Object         *Next = nullptr;
  Object         *Previous = nullptr;
  Object         *InObject = nullptr;
  Character        *CarriedBy = nullptr;
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

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

#endif
