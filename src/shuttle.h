#ifndef _SWRIP_SHUTTLE_H_
#define _SWRIP_SHUTTLE_H_

#include "types.h"

#define SHUTTLE_DIR     "../shuttle/"
#define SHUTTLE_LIST    "shuttle.lst"

struct stop_data
{
  STOP_DATA     *prev; /* Previous Stop */
  STOP_DATA     *next; /* Next Stop */
  char*         stop_name; /* Name of the Stop, ie 'Coruscant' or 'Monument Plaza' */
  int           room;
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
  SHUTTLE_TURBOCAR, /* Pretty much the same as shuttle EDIT:: Changes messages to be appropriate to groudn - Greven*/
  SHUTTLE_SPACE, /* Has some message about taking off and landing */
  SHUTTLE_HYPERSPACE
} SHUTTLE_CLASS;

struct shuttle_data
{
  /* Linked List Stuff */
  SHUTTLE_DATA* prev;
  SHUTTLE_DATA* next;

  /* For wherever we are */
  SHUTTLE_DATA* next_in_room;
  SHUTTLE_DATA* prev_in_room;

  /* Where are We */
  ROOM_INDEX_DATA* in_room;

  /* HOTBOOT info, save vnum of current, then loop through on load to find it */
  STOP_DATA*    current;
  int           current_number;
  /* Current State */
  int           state;

  /* Stops */
  STOP_DATA*    first_stop;
  STOP_DATA*    last_stop;

  /* Shuttle Class */
  SHUTTLE_CLASS         type;

  /* Shuttle Filename */
  char *                filename;
  /* Shuttle Name */
  char *                name;
  /* Delay Between Stops */
  int           delay;
  /* Actual time for delay.. */
  int           current_delay;
  /* For echoing any messages */
  int           start_room;
  int           end_room;
  int           entrance;
};

#ifndef MSL
#define MSL MAX_STRING_LENGTH
#endif

#ifndef MIL
#define MIL MAX_INPUT_LENGTH
#endif

/* Used for double linked list */
extern SHUTTLE_DATA     *first_shuttle;
extern SHUTTLE_DATA     *last_shuttle;

/* Function prototypes */

void update_shuttle(void);
SHUTTLE_DATA *get_shuttle( const char *argument );
void write_shuttle_list( void );
bool save_shuttle( const SHUTTLE_DATA *shuttle );
SHUTTLE_DATA *make_shuttle( const char *filename, const char *name );
bool extract_shuttle( SHUTTLE_DATA *shuttle );
bool insert_shuttle( SHUTTLE_DATA *shuttle, ROOM_INDEX_DATA *room );
void load_shuttles(void);
bool load_shuttle_file( const char *shuttlefile );
void fread_shuttle( SHUTTLE_DATA *shuttle, FILE *fp );
void fread_stop( STOP_DATA * stop, FILE *fp );
void destroy_shuttle( SHUTTLE_DATA *shuttle );
void show_shuttles_to_char( const SHUTTLE_DATA *shuttle, CHAR_DATA *ch );
SHUTTLE_DATA *shuttle_in_room( const ROOM_INDEX_DATA *room, const char *name );
SHUTTLE_DATA *shuttle_from_entrance( int vnum );
STOP_DATA *create_stop( void );

DECLARE_DO_FUN( do_showshuttle          );
DECLARE_DO_FUN( do_makeshuttle          );
DECLARE_DO_FUN( do_setshuttle           );

#endif
