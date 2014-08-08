/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

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
