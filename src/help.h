#ifndef _SWRIP_HELP_H_
#define _SWRIP_HELP_H_

#include <eris/ceris.h>
#include "types.h"
#include "constants.h"

#define HELP_FILE SYSTEM_DIR "help.dat"

extern CerisMap *HelpFiles;
extern char *help_greeting;

HELP_DATA *GetHelp( const CHAR_DATA *ch, char *argument );
void AddHelp( HELP_DATA *pHelp );
void UnlinkHelp( HELP_DATA *pHelp );
void LoadHelps( void );
void SaveHelps( void );
HELP_DATA *CreateHelp( char *keyword, short level );
void DestroyHelp( HELP_DATA *help );

short GetHelpLevel( const HELP_DATA *help );
void SetHelpLevel( HELP_DATA *help, short level );

char *GetHelpKeyword( const HELP_DATA *help );
void SetHelpKeyword( HELP_DATA *help, char *keyword );

char *GetHelpText( const HELP_DATA *help );
void SetHelpText( HELP_DATA *help, char *text );

#endif
