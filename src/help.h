#ifndef _SWRIP_HELP_H_
#define _SWRIP_HELP_H_

#include "types.h"
#include "constants.h"

#define HELP_DATA_FILE SYSTEM_DIR "help.dat"

struct HelpFile
{
  HelpFile *next;
  HelpFile *prev;
  short      level;
  char      *keyword;
  char      *text;
};

extern int top_help;
extern HelpFile *first_help;
extern HelpFile *last_help;
extern char *help_greeting;

HelpFile *get_help( const Character *ch, char *argument );
void add_help( HelpFile *pHelp );
void unlink_help( HelpFile *pHelp );
void load_helps( void );
void save_helps( void );
HelpFile *create_help( char *keyword, short level );
void destroy_help( HelpFile *help );

short get_help_level( const HelpFile *help );
void set_help_level( HelpFile *help, short level );

char *get_help_keyword( const HelpFile *help );
void set_help_keyword( HelpFile *help, char *keyword );

char *get_help_text( const HelpFile *help );
void set_help_text( HelpFile *help, char *text );

#endif
