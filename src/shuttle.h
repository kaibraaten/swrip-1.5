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

#ifndef _SWRIP_SHUTTLE_H_
#define _SWRIP_SHUTTLE_H_

#include "types.h"

#define SHUTTLE_DIR     "./shuttle/"
#define SHUTTLE_LIST    "shuttle.lst"

struct ShuttleStop
{
  ShuttleStop *prev; /* Previous Stop */
  ShuttleStop *next; /* Next Stop */
  char      *stop_name; /* Name of the Stop, ie 'Coruscant' or 'Monument Plaza' */
  vnum_t     room;
};

enum _shuttle_state {
  SHUTTLE_STATE_LANDING,
  SHUTTLE_STATE_LANDED,
  SHUTTLE_STATE_TAKINGOFF,
  SHUTTLE_STATE_INSPACE,
  SHUTTLE_STATE_HYPERSPACE_LAUNCH,
  SHUTTLE_STATE_HYPERSPACE_END
};

typedef enum {
  SHUTTLE_TURBOCAR, /* Pretty much the same as shuttle EDIT:: Changes messages to be appropriate to ground - Greven*/
  SHUTTLE_SPACE, /* Has some message about taking off and landing */
  SHUTTLE_HYPERSPACE
} SHUTTLE_CLASS;

struct Shuttle
{
  Shuttle* prev;
  Shuttle* next;

  Shuttle* next_in_room;
  Shuttle* prev_in_room;

  Room* in_room;

  /* HOTBOOT info, save vnum of current, then loop through on load to find it */
  ShuttleStop *current;
  int current_number;

  int state;

  ShuttleStop *first_stop;
  ShuttleStop *last_stop;

  SHUTTLE_CLASS type;

  char *filename;
  char *name;

  /* Delay Between Stops */
  int delay;
  /* Actual time for delay.. */
  int current_delay;

  /* For echoing any messages */
  struct
  {
    vnum_t first;
    vnum_t last;
    vnum_t entrance;
  } room;
};

#ifndef MSL
#define MSL MAX_STRING_LENGTH
#endif

#ifndef MIL
#define MIL MAX_INPUT_LENGTH
#endif

/* Used for double linked list */
extern Shuttle *first_shuttle;
extern Shuttle *last_shuttle;

/* Function prototypes */

void ShuttleUpdate(void);
Shuttle *GetShuttle( const char *argument );
void WriteShuttleList( void );
bool SaveShuttle( const Shuttle *shuttle );
Shuttle *MakeShuttle( const char *filename, const char *name );
bool ExtractShuttle( Shuttle *shuttle );
bool InsertShuttle( Shuttle *shuttle, Room *room );
void LoadShuttles(void);
bool LoadShuttleFile( const char *shuttlefile );
void ReadShuttle( Shuttle *shuttle, FILE *fp );
void ReadShuttleStop( ShuttleStop * stop, FILE *fp );
void DestroyShuttle( Shuttle *shuttle );
void ShowShuttlesToCharacter( const Shuttle *shuttle, Character *ch );
Shuttle *GetShuttleInRoom( const Room *room, const char *name );
Shuttle *GetShuttleFromEntrance( vnum_t vnum );
ShuttleStop *AllocateShuttleStop( void );

DECLARE_DO_FUN( do_showshuttle );
DECLARE_DO_FUN( do_makeshuttle );
DECLARE_DO_FUN( do_setshuttle  );

#endif
