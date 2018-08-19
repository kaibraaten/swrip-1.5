#ifndef _SWRIP_ROOM_HPP_
#define _SWRIP_ROOM_HPP_

#include <list>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class Room
{
public:
  Room();
  virtual ~Room();

  void Add(Ship *ship);
  void Remove(Ship *ship);
  const std::list<Ship*> &Ships() const;

  void Add(Shuttle *shuttle);
  void Remove(Shuttle *shuttle);
  const std::list<Shuttle*> &Shuttles() const;

  void Add(Exit *xit);
  void Remove(Exit *xit);
  const std::list<Exit*> &Exits() const;

  void Add(Character *character);
  void Remove(Character *character);
  const std::list<Character*> &Characters() const;

  void Add(Object *object);
  void Remove(Object *object);
  const std::list<Object*> &Objects() const;

  void Add(ExtraDescription *extraDescription);
  void Remove(ExtraDescription *extraDescription);
  const std::list<ExtraDescription*> &ExtraDescriptions() const;
  
  Room  *Next = nullptr;
  Room  *NextSort = nullptr;
  struct Area        *Area = nullptr;
  char             *Name = nullptr;
  char             *Description = nullptr;
  vnum_t            Vnum = INVALID_VNUM;
  int               Flags = 0;
  short             Light = 0;
  SectorType Sector = 0;
  vnum_t            TeleVnum = INVALID_VNUM;
  short             TeleDelay = 0;
  short             Tunnel = 0;              /* max people that will fit */

  MProg mprog;

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

#endif
