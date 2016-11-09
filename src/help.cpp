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
#include "help.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "script.hpp"

#define HELP_DATA_FILE DATA_DIR "help.lua"

HelpFile *FirstHelp = NULL;
HelpFile *LastHelp = NULL;
int TopHelp = 0;
char *HelpGreeting = NULL;

static int L_HelpEntry( lua_State *L );
static void PushHelps( lua_State *L, const void* );
static void PushHelpFile( lua_State *L, const HelpFile *help );
static char *MunchLeadingSpace( char *text );

HelpFile *GetHelpFile( const Character *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH] = {'\0'};
  char argone[MAX_INPUT_LENGTH];
  char argnew[MAX_INPUT_LENGTH];
  HelpFile *pHelp = NULL;
  int lev = 0;

  if ( IsNullOrEmpty( argument ) )
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
  while ( !IsNullOrEmpty( argument ) )
    {
      argument = OneArgument( argument, argone );

      if ( !IsNullOrEmpty( argall ) )
	{
	  strcat( argall, " " );
	}

      strcat( argall, argone );
    }

  for ( pHelp = FirstHelp; pHelp; pHelp = pHelp->Next )
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

  for ( tHelp = FirstHelp; tHelp; tHelp = tHelp->Next )
    {
      if ( pHelp->Level == tHelp->Level
	   && StrCmp(pHelp->Keyword, tHelp->Keyword) == 0 )
	{
	  Bug( "AddHelpFile: duplicate: %s. Deleting.", pHelp->Keyword );
	  FreeHelpFile( pHelp );
	  return;
	}
      else if ( (match=StrCmp(pHelp->Keyword[0]=='\'' ? pHelp->Keyword+1 : pHelp->Keyword,
			       tHelp->Keyword[0]=='\'' ? tHelp->Keyword+1 : tHelp->Keyword)) < 0
		|| (match == 0 && pHelp->Level > tHelp->Level) )
	{
	  if ( !tHelp->Previous )
	    {
	      FirstHelp = pHelp;
	    }
	  else
	    {
	      tHelp->Previous->Next = pHelp;
	    }

	  pHelp->Previous  = tHelp->Previous;
	  pHelp->Next  = tHelp;
	  tHelp->Previous  = pHelp;
	  break;
	}
    }

  if ( !tHelp )
    {
      LINK( pHelp, FirstHelp, LastHelp, Next, Previous );
    }

  TopHelp++;
}

void UnlinkHelpFile( HelpFile *help )
{
  UNLINK( help, FirstHelp, LastHelp, Next, Previous );
  TopHelp--;
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

  help = AllocateHelpFile( keyword, level );

  if( !lua_isnil( L, ++idx ) )
    {
      SetHelpFileText( help, lua_tostring( L, idx ) );
    }

  lua_pop( L, lua_gettop( L ) - 1 );

  if( IsNullOrEmpty( help->Keyword ) )
    {
      FreeHelpFile( help );
    }
  else
    {
      if( !StrCmp( GetHelpFileKeyword( help ), "greeting" ) )
	{
	  HelpGreeting = GetHelpFileText( help );
	}

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
  LuaSaveDataFile( HELP_DATA_FILE, PushHelps, "helps", NULL );
}

static void PushHelps( lua_State *L, const void *userData )
{
  const HelpFile *help = NULL;
  lua_newtable( L );

  for( help = FirstHelp; help; help = help->Next )
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

HelpFile *AllocateHelpFile( const char *keyword, short level )
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
  FreeMemory( help->Keyword );
  FreeMemory( help->Text );
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
  return help->Level;
}

void SetHelpFileLevel( HelpFile *help, short level )
{
  if( level >= -1 && level <= MAX_LEVEL )
    {
      help->Level = level;
    }
  else
    {
      Bug( "%s:%s:%d: Argument level = %d is out of range.",
	   __FUNCTION__, __FILE__, __LINE__, level );
    }
}

char *GetHelpFileKeyword( const HelpFile *help )
{
  return help->Keyword;
}

void SetHelpFileKeyword( HelpFile *help, const char *keyword )
{
  if( help->Keyword )
    {
      FreeMemory( help->Keyword );
    }

  help->Keyword = CopyString( StringToUppercase( keyword ) );
}

char *GetHelpFileText( const HelpFile *help )
{
  return help->Text;
}

void SetHelpFileText( HelpFile *help, const char *text )
{
  if( help->Text )
    {
      FreeMemory( help->Text );
    }

  help->Text = CopyString( text );
}

void SetHelpFileTextNoAlloc( HelpFile *help, char *text )
{
  if( help->Text )
    {
      FreeMemory( help->Text );
    }

  help->Text = text;
}
