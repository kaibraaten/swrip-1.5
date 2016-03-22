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
#include "script.h"

HelpFile *first_help = NULL;
HelpFile *last_help = NULL;
int top_help = 0;
char *help_greeting = NULL;

static int L_HelpEntry( lua_State *L );
static void PushHelps( lua_State *L );
static void PushHelpFile( lua_State *L, const HelpFile *help );
static char *MunchLeadingSpace( char *text );

HelpFile *GetHelpFile( const Character *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH] = {'\0'};
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
      if ( GetHelpFileLevel( pHelp ) > GetTrustLevel( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && GetHelpFileLevel( pHelp ) != lev )
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
	  Bug( "AddHelpFile: duplicate: %s. Deleting.", pHelp->keyword );
	  FreeHelpFile( pHelp );
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

static int L_HelpEntry( lua_State *L )
{
  int idx = 0;
  HelpFile *help = NULL;
  const char *keyword = NULL;
  short level = 0;

  luaL_checktype( L, 1, LUA_TTABLE );
  idx = lua_gettop( L );

  lua_getfield( L, idx, "Keyword" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "Text" );

  if( !lua_isnil( L, ++idx ) )
    {
      keyword = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      level = lua_tointeger( L, idx );
    }

  help = CreateHelpFile( keyword, level );

  if( !lua_isnil( L, ++idx ) )
    {
      SetHelpFileText( help, lua_tostring( L, idx ) );
    }

  lua_pop( L, 3 );

  if( IsNullOrEmpty( help->keyword ) )
    {
      FreeHelpFile( help );
    }
  else
    {
      AddHelpFile( help );
    }

  return 0;
}

void LoadHelpFiles( void )
{
  LuaLoadDataFile( HELP_DATA_FILE, L_HelpEntry, "HelpEntry" );
}

void SaveHelpFiles( void )
{
  LuaSaveDataFile( HELP_DATA_FILE, PushHelps, "helps" );
}

static void PushHelps( lua_State *L )
{
  const HelpFile *help = NULL;
  lua_newtable( L );

  for( help = first_help; help; help = help->next )
    {
      PushHelpFile( L, help );
    }

  lua_setglobal( L, "helps" );
}

static void PushHelpFile( lua_State *L, const HelpFile *help )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Keyword", GetHelpFileKeyword( help ) );
  LuaSetfieldNumber( L, "Level", GetHelpFileLevel( help ) );
  LuaSetfieldString( L, "Text", MunchLeadingSpace( GetHelpFileText( help ) ) );

  lua_settable( L, -3 );
}

HelpFile *CreateHelpFile( const char *keyword, short level )
{
  HelpFile *help = NULL;
  
  AllocateMemory( help, HelpFile, 1 );
  SetHelpFileKeyword( help, keyword );
  SetHelpFileText( help, "" );
  SetHelpFileLevel( help, level );

  return help;
}

void FreeHelpFile( HelpFile *help )
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

short GetHelpFileLevel( const HelpFile *help )
{
  return help->level;
}

void SetHelpFileLevel( HelpFile *help, short level )
{
  if( level >= -1 && level <= MAX_LEVEL )
    {
      help->level = level;
    }
  else
    {
      Bug( "%s:%s:%d: Argument level = %d is out of range.",
	   __FUNCTION__, __FILE__, __LINE__, level );
    }
}

char *GetHelpFileKeyword( const HelpFile *help )
{
  return help->keyword;
}

void SetHelpFileKeyword( HelpFile *help, const char *keyword )
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

void SetHelpFileText( HelpFile *help, const char *text )
{
  if( help->text )
    {
      FreeMemory( help->text );
    }

  help->text = CopyString( text );
}
