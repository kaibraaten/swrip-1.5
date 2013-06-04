#ifndef _SWRIP_HELP_H_
#define _SWRIP_HELP_H_

#include <eris/ceris.h>
#include "types.h"
#include "constants.h"

#define HELP_FILE SYSTEM_DIR "help.dat"

extern CerisMap *HelpFiles;
extern char *help_greeting;

HelpFile *GetHelp( const CHAR_DATA *ch, char *argument );
void AddHelp( HelpFile *pHelp );
void UnlinkHelp( HelpFile *pHelp );
void LoadHelps( void );
void SaveHelps( void );
HelpFile *CreateHelp( char *keyword, short level );
void DestroyHelp( HelpFile *help );

short GetHelpLevel( const HelpFile *help );
void SetHelpLevel( HelpFile *help, short level );

char *GetHelpKeyword( const HelpFile *help );
void SetHelpKeyword( HelpFile *help, char *keyword );

char *GetHelpText( const HelpFile *help );
void SetHelpText( HelpFile *help, char *text );

#endif
