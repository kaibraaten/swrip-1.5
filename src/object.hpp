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
  
  Object         *InObject = nullptr;
  Character        *CarriedBy = nullptr;
  ProtoObject   *Prototype = nullptr;
  Room  *InRoom = nullptr;
  std::string ArmedBy;
  std::string Name;
  std::string ShortDescr;
  std::string Description;
  std::string ActionDescription;
  ItemTypes         ItemType = 0;
  int               Flags = 0;
  int               WearFlags = 0;
  int               BlasterSetting = 0;
  WearLocation      WearLoc = WEAR_NONE;
  int             Weight = 1;
  int               Cost = 0;
  int             Level = 0;
  int             Timer = 0;
  std::array<int, MAX_OVAL> Value;
  int             Count = 1;          /* support for object grouping */
  int               Serial = 0;         /* serial number               */

  MProg mprog;

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

#endif
