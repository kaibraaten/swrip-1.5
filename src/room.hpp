#ifndef _SWRIP_ROOM_HPP_
#define _SWRIP_ROOM_HPP_

#include <list>
#include "types.hpp"
#include "constants.hpp"

class Room
{
public:
  Room();
  Room  *Next = nullptr;
  Room  *NextSort = nullptr;
  Character        *FirstPerson = nullptr;
  Character        *LastPerson = nullptr;
  Object         *FirstContent = nullptr;
  Object         *LastContent = nullptr;
  ExtraDescription *FirstExtraDescription = nullptr;
  ExtraDescription *LastExtraDescription = nullptr;
  struct Area        *Area = nullptr;
  Exit        *FirstExit = nullptr;
  Exit        *LastExit = nullptr;
  Ship        *FirstShip = nullptr;
  Ship        *LastShip = nullptr;
  char             *Name = nullptr;
  char             *Description = nullptr;
  vnum_t            Vnum = INVALID_VNUM;
  int               Flags = 0;
  short             Light = 0;
  SectorType Sector = 0;
  vnum_t            TeleVnum = INVALID_VNUM;
  short             TeleDelay = 0;
  short             Tunnel = 0;              /* max people that will fit */
  Shuttle     *FirstShuttle = nullptr;
  Shuttle     *LastShuttle = nullptr;

  struct
  {
    MPROG_ACT_LIST *mpact = nullptr;
    int             mpactnum = 0;
    short           mpscriptpos = 0;
    MPROG_DATA     *mudprogs = nullptr;
    int             progtypes = 0;
  } mprog;
};

#endif
