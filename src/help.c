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

#include <string.h>
#include <ctype.h>
#include "help.h"
#include "character.h"
#include "mud.h"

HelpFile *first_help = NULL;
HelpFile *last_help = NULL;
int top_help = 0;
char *help_greeting = NULL;

static char *MunchLeadingSpace( char *text );

HelpFile *GetHelpFile( const Character *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH];
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  HelpFile *pHelp = NULL;
  int lev = 0;

  if ( argument[0] == '\0' )
    {
      argument = "summary";
    }

  if ( isdigit(argument[0]) )
    {
      lev = NumberArgument( argument, argnew );
      argument = argnew;
    }
  else
    {
      lev = -2;
    }

  /*
   * Tricky argument handling so 'help a b' doesn't match a.
   */
  argall[0] = '\0';

  while ( argument[0] != '\0' )
    {
      argument = OneArgument( argument, argone );

      if ( argall[0] != '\0' )
	{
	  strcat( argall, " " );
	}

      strcat( argall, argone );
    }

  for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
    {
      if ( GetHelpLevel( pHelp ) > GetTrustLevel( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && GetHelpLevel( pHelp ) != lev )
	{
	  continue;
	}

      if ( IsName( argall, GetHelpFileKeyword( pHelp ) ) )
	{
	  return pHelp;
	}
    }

  return NULL;
}

/*
 * Adds a help page to the list if it is not a duplicate of an existing page.
 * Page is insert-sorted by keyword.                    -Thoric
 * (The reason for sorting is to keep do_hlist looking nice)
 */
void AddHelpFile( HelpFile *pHelp )
{
  HelpFile *tHelp = NULL;
  int match = 0;

  for ( tHelp = first_help; tHelp; tHelp = tHelp->next )
    {
      if ( pHelp->level == tHelp->level
	   &&   StrCmp(pHelp->keyword, tHelp->keyword) == 0 )
	{
	  bug( "AddHelpFile: duplicate: %s. Deleting.", pHelp->keyword );
	  DestroyHelpFile( pHelp );
	  return;
	}
      else if ( (match=StrCmp(pHelp->keyword[0]=='\'' ? pHelp->keyword+1 : pHelp->keyword,
			       tHelp->keyword[0]=='\'' ? tHelp->keyword+1 : tHelp->keyword)) < 0
		|| (match == 0 && pHelp->level > tHelp->level) )
	{
	  if ( !tHelp->prev )
	    {
	      first_help = pHelp;
	    }
	  else
	    {
	      tHelp->prev->next = pHelp;
	    }

	  pHelp->prev  = tHelp->prev;
	  pHelp->next  = tHelp;
	  tHelp->prev  = pHelp;
	  break;
	}
    }

  if ( !tHelp )
    {
      LINK( pHelp, first_help, last_help, next, prev );
    }

  top_help++;
}

void UnlinkHelpFile( HelpFile *help )
{
  UNLINK( help, first_help, last_help, next, prev );
  top_help--;
}

/*
 * Load a help section.
 */
void LoadHelpFiles( void )
{
  FILE *fp = NULL;

  if( !( fp = fopen( HELP_DATA_FILE, "r" ) ) )
    {
      log_printf( "Unable to open %s", HELP_DATA_FILE );
      return;
    }

  for ( ; ; )
    {
      short level = ReadInt( fp );
      char *keyword = ReadStringToTilde( fp );
      HelpFile *pHelp = CreateHelpFile( keyword, level );

      if ( keyword[0] == '$' )
	{
	  DestroyHelpFile( pHelp );
	  break;
	}

      pHelp->text = ReadStringToTilde( fp );

      if ( pHelp->keyword[0] == '\0' )
	{
	  DestroyHelpFile( pHelp );
          continue;
        }

      if ( !StrCmp( GetHelpFileKeyword( pHelp ), "greeting" ) )
	{
	  help_greeting = GetHelpFileText( pHelp );
	}

      AddHelpFile( pHelp );
    }
}

void SaveHelpFiles( void )
{
  FILE *filehandle = NULL;
  HelpFile *pHelp = NULL;

  rename( HELP_DATA_FILE, HELP_DATA_FILE ".bak" );

  if ( ( filehandle = fopen( HELP_DATA_FILE, "w" ) ) == NULL )
    {
      bug( "%s: fopen", __FUNCTION__ );
      perror( HELP_DATA_FILE );
      return;
    }

  fprintf( filehandle, "#HELPS\n\n" );

  for ( pHelp = first_help; pHelp; pHelp = pHelp->next )
    {
      fprintf( filehandle, "%d %s~\n%s~\n\n",
	       GetHelpLevel( pHelp ),
	       GetHelpFileKeyword( pHelp ),
	       MunchLeadingSpace( GetHelpFileText( pHelp ) ) );
    }

  fprintf( filehandle, "0 $~\n\n\n#$\n" );
  fclose( filehandle );
}

HelpFile *CreateHelpFile( char *keyword, short level )
{
  HelpFile *help = NULL;
  
  AllocateMemory( help, HelpFile, 1 );
  SetHelpFileKeyword( help, keyword );
  SetHelpFileText( help, "" );
  SetHelpLevel( help, level );

  return help;
}

void DestroyHelpFile( HelpFile *help )
{
  FreeMemory( help->keyword );
  FreeMemory( help->text );
  FreeMemory( help );
}

/*
 * Stupid leading space muncher fix                             -Thoric
 */
static char *MunchLeadingSpace( char *text )
{
  char *fixed = NULL;

  if ( !text )
    return "";

  fixed = StripCarriageReturn(text);

  if ( fixed[0] == ' ' )
    fixed[0] = '.';

  return fixed;
}

short GetHelpLevel( const HelpFile *help )
{
  return help->level;
}

void SetHelpLevel( HelpFile *help, short level )
{
  if( level >= -1 && level <= MAX_LEVEL )
    {
      help->level = level;
    }
  else
    {
      bug( "%s:%s:%d: Argument level = %d is out of range.",
	   __FUNCTION__, __FILE__, __LINE__, level );
    }
}

char *GetHelpFileKeyword( const HelpFile *help )
{
  return help->keyword;
}

void SetHelpFileKeyword( HelpFile *help, char *keyword )
{
  if( help->keyword )
    {
      FreeMemory( help->keyword );
    }

  help->keyword = CopyString( StringToUppercase( keyword ) );
}

char *GetHelpFileText( const HelpFile *help )
{
  return help->text;
}

void SetHelpFileText( HelpFile *help, char *text )
{
  if( help->text )
    {
      FreeMemory( help->text );
    }

  help->text = CopyString( text );
}

