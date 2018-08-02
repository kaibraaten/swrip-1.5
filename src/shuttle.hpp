/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_SHUTTLE_HPP_
#define _SWRIP_SHUTTLE_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

#define SHUTTLE_DIR     DATA_DIR "shuttles/"

struct ShuttleStop
{
  ShuttleStop *Previous; /* Previous Stop */
  ShuttleStop *Next; /* Next Stop */
  char      *Name; /* Name of the Stop, ie 'Coruscant' or 'Monument Plaza' */
  vnum_t     RoomVnum;
};

enum _ShuttleState
  {
    SHUTTLE_STATE_LANDING,
    SHUTTLE_STATE_LANDED,
    SHUTTLE_STATE_TAKINGOFF,
    SHUTTLE_STATE_INSPACE,
    SHUTTLE_STATE_HYPERSPACE_LAUNCH,
    SHUTTLE_STATE_HYPERSPACE_END
  };

/* ShuttleClass */
enum
  {
    SHUTTLE_TURBOCAR, /* Pretty much the same as shuttle EDIT:: Changes messages to be appropriate to ground - Greven*/
    SHUTTLE_SPACE, /* Has some message about taking off and landing */
    SHUTTLE_HYPERSPACE
  };

typedef int ShuttleClass;

struct Shuttle
{
  Shuttle* NextInRoom;
  Shuttle* PreviousInRoom;

  Room *InRoom;

  /* HOTBOOT info, save vnum of current, then loop through on load to find it */
  ShuttleStop *CurrentStop;
  int CurrentNumber;

  int State;

  ShuttleStop *FirstStop;
  ShuttleStop *LastStop;

  ShuttleClass Type;

  char *Name;
  
  /* Delay Between Stops */
  int Delay;
  /* Actual time for delay.. */
  int CurrentDelay;

  /* For echoing any messages */
  struct
  {
    vnum_t First;
    vnum_t Last;
    vnum_t Entrance;
  } Rooms;
};

#ifndef MSL
#define MSL MAX_STRING_LENGTH
#endif

#ifndef MIL
#define MIL MAX_INPUT_LENGTH
#endif

/* Function prototypes */

void ShuttleUpdate();
Shuttle *NewShuttle(const std::string &name);
bool ExtractShuttle( Shuttle *shuttle );
bool InsertShuttle( Shuttle *shuttle, Room *room );
void PermanentlyDestroyShuttle( Shuttle *shuttle );
void ShowShuttlesToCharacter( const Shuttle *shuttle, Character *ch );
Shuttle *GetShuttleInRoom( const Room *room, const std::string &name );
Shuttle *GetShuttleFromEntrance( vnum_t vnum );
ShuttleStop *AllocateShuttleStop( void );
const char *GetShuttleFilename( const Shuttle *shuttle );

DECLARE_CMD_FUN( do_showshuttle );
DECLARE_CMD_FUN( do_makeshuttle );
DECLARE_CMD_FUN( do_setshuttle  );

class ShuttleRepository : public Ceris::Repository<Shuttle*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Shuttle *shuttle) const = 0;

  virtual Shuttle *FindByName(const std::string &name) const = 0;
};

extern ShuttleRepository *Shuttles;
ShuttleRepository *NewShuttleRepository();

#endif
