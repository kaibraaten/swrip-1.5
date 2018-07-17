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

OldRepository *HelpFileRepository = NULL;
char *HelpGreeting = NULL;

static int L_HelpEntry( lua_State *L );
static void PushHelps( lua_State *L, const void* );
static void PushHelpFile(void *element, void *ud);
static char *MunchLeadingSpace( char *text );

HelpFile *GetHelpFile( const Character *ch, char *argument )
{
  char argall[MAX_INPUT_LENGTH] = {'\0'};
  char argone[MAX_INPUT_LENGTH] = {'\0'};
  char argnew[MAX_INPUT_LENGTH] = {'\0'};
  ListIterator *iterator = NULL;
  HelpFile *foundHelpfile = NULL;
  const List *HelpFiles = GetEntities(HelpFileRepository);
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

  iterator = AllocateListIterator(HelpFiles);

  while(ListHasMoreElements(iterator))
    {
      HelpFile *pHelp = (HelpFile*) GetListData(iterator);
      MoveToNextListElement(iterator);

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
	  foundHelpfile = pHelp;
          break;
	}
    }

  FreeListIterator(iterator);

  return foundHelpfile;
}

/*
 * Adds a help page to the list if it is not a duplicate of an existing page.
 * Page is insert-sorted by keyword.                    -Thoric
 * (The reason for sorting is to keep do_hlist looking nice)
 */
void AddHelpFile( HelpFile *pHelp )
{
  bool inserted = false;
  const List *HelpFiles = GetEntities(HelpFileRepository);
  ListIterator *iterator = AllocateListIterator(HelpFiles);

  while(ListHasMoreElements(iterator))
    {
      int match = 0;
      HelpFile *tHelp = (HelpFile*) GetListData(iterator);

      if ( pHelp->Level == tHelp->Level
	   && StrCmp(pHelp->Keyword, tHelp->Keyword) == 0 )
	{
	  Bug( "AddHelpFile: duplicate: %s. Deleting.", pHelp->Keyword );
	  FreeHelpFile( pHelp );
          FreeListIterator(iterator);
	  return;
	}
      else if ( (match=StrCmp(pHelp->Keyword[0]=='\'' ? pHelp->Keyword+1 : pHelp->Keyword,
			       tHelp->Keyword[0]=='\'' ? tHelp->Keyword+1 : tHelp->Keyword)) < 0
		|| (match == 0 && pHelp->Level > tHelp->Level) )
	{
          InsertBefore(iterator, pHelp);
          inserted = true;
          break;
	}

      MoveToNextListElement(iterator);
    }

  FreeListIterator(iterator);

  if ( !inserted )
    {
      AddEntity(HelpFileRepository, pHelp);
    }
}

void RemoveHelpFile( HelpFile *help )
{
  RemoveEntity(HelpFileRepository, help);
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
  LoadEntities(HelpFileRepository);
}

static void _LoadHelpFiles(OldRepository *repo)
{
  LuaLoadDataFile( HELP_DATA_FILE, L_HelpEntry, "HelpEntry" );
}

void SaveHelpFiles( void )
{
  SaveEntities(HelpFileRepository);
}

static void _SaveHelpFiles(const OldRepository *repo)
{
  LuaSaveDataFile( HELP_DATA_FILE, PushHelps, "helps", NULL );
}

static void PushHelps( lua_State *L, const void *userData )
{
  const List *helpFiles = GetEntities(HelpFileRepository);
  lua_newtable( L );

  ForEachInList(helpFiles, PushHelpFile, L);
  lua_setglobal( L, "helps" );
}

static void PushHelpFile(void *element, void *ud)
{
  const HelpFile *help = (const HelpFile*)element;
  lua_State *L = (lua_State*)ud;
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

  help->Keyword = CopyString( ToUpper( keyword ) );
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

OldRepository *NewHelpFileRepository(void)
{
  OldRepository *repo = NewRepository(_LoadHelpFiles, _SaveHelpFiles);
  return repo;
}
