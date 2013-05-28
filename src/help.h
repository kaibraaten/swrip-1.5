#ifndef _SWRIP_HELP_H_
#define _SWRIP_HELP_H_

#include "types.h"
#include "constants.h"

#define HELP_FILE SYSTEM_DIR "help.dat"

/*
 * Help table types.
 */
struct help_data
{
  HELP_DATA *next;
  HELP_DATA *prev;
  short      level;
  char      *keyword;
  char      *text;
};

extern int top_help;
extern HELP_DATA *first_help;
extern HELP_DATA *last_help;
extern char *help_greeting;

HELP_DATA *get_help( const CHAR_DATA *ch, char *argument );
void add_help( HELP_DATA *pHelp );
void unlink_help( HELP_DATA *pHelp );
void load_helps( void );
void save_helps( void );
HELP_DATA *create_help( char *keyword, short level );
void destroy_help( HELP_DATA *help );

#endif
