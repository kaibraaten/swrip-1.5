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

struct stop_data
{
  STOP_DATA *prev; /* Previous Stop */
  STOP_DATA *next; /* Next Stop */
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

struct shuttle_data
{
  SHUTTLE_DATA* prev;
  SHUTTLE_DATA* next;

  SHUTTLE_DATA* next_in_room;
  SHUTTLE_DATA* prev_in_room;

  Room* in_room;

  /* HOTBOOT info, save vnum of current, then loop through on load to find it */
  STOP_DATA *current;
  int current_number;

  int state;

  STOP_DATA *first_stop;
  STOP_DATA *last_stop;

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
extern SHUTTLE_DATA *first_shuttle;
extern SHUTTLE_DATA *last_shuttle;

/* Function prototypes */

void update_shuttle(void);
SHUTTLE_DATA *get_shuttle( const char *argument );
void write_shuttle_list( void );
bool save_shuttle( const SHUTTLE_DATA *shuttle );
SHUTTLE_DATA *make_shuttle( const char *filename, const char *name );
bool extract_shuttle( SHUTTLE_DATA *shuttle );
bool insert_shuttle( SHUTTLE_DATA *shuttle, Room *room );
void load_shuttles(void);
bool load_shuttle_file( const char *shuttlefile );
void fread_shuttle( SHUTTLE_DATA *shuttle, FILE *fp );
void fread_stop( STOP_DATA * stop, FILE *fp );
void destroy_shuttle( SHUTTLE_DATA *shuttle );
void show_shuttles_to_char( const SHUTTLE_DATA *shuttle, Character *ch );
SHUTTLE_DATA *shuttle_in_room( const Room *room, const char *name );
SHUTTLE_DATA *shuttle_from_entrance( vnum_t vnum );
STOP_DATA *create_stop( void );

DECLARE_DO_FUN( do_showshuttle          );
DECLARE_DO_FUN( do_makeshuttle          );
DECLARE_DO_FUN( do_setshuttle           );

#endif
