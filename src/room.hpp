#ifndef _SWRIP_ROOM_HPP_
#define _SWRIP_ROOM_HPP_

#include <memory>
#include <list>
#include <string>
#include <bitset>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

namespace Flag
{
  namespace Room
  {
    enum : size_t
      {
       Dark,
       Reserved, /* BV01 now reserved for track  BV01  and hunt */
       NoMob,
       Indoors,
       CanLand,
       CanFly,
       NoDrive,
       NoMagic,
       Bank,
       Private,
       Safe,
       _11,
       PetShop,
       Arena,
       Donation,
       NoDropAll,
       Silence,
       LogSpeech,
       NoDrop,
       ClanStoreroom,
       PlayerHome,
       EmptyHome,
       Teleport,
       Hotel,
       NoFloor,
       Refinery,
       Factory,
       Recruit,
       PlayerShop,
       Spacecraft,
       Prototype,
       Auction
      };
  }
}

class Room
{
public:
  Room();
  virtual ~Room();

  void Add(Ship *ship);
  void Remove(Ship *ship);
  const std::list<Ship*> &Ships() const;

  void Add(std::shared_ptr<Shuttle> shuttle);
  void Remove(std::shared_ptr<Shuttle> shuttle);
  const std::list<std::shared_ptr<Shuttle>> &Shuttles() const;

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
  
  Room *Next = nullptr;
  Room *NextSort = nullptr;
  struct Area *Area = nullptr;
  std::string Name;
  std::string Description;
  vnum_t Vnum = INVALID_VNUM;
  std::bitset<Flag::MAX> Flags;
  int Light = 0;
  SectorType Sector = 0;
  vnum_t TeleVnum = INVALID_VNUM;
  int TeleDelay = 0;
  int Tunnel = 0;              /* max people that will fit */

  MProg mprog;

private:
  struct Impl;
  std::unique_ptr<Impl> pImpl;
};

#endif
