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

#include <cstring>
#include <cctype>
#include "help.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "script.hpp"
#include "log.hpp"

#define HELP_DATA_FILE DATA_DIR "help.lua"

HelpFileRepository *HelpFiles = nullptr;
std::string HelpGreeting;

static int L_HelpEntry( lua_State *L );
static void PushHelps( lua_State *L, const void* );
static void PushHelpFile(lua_State *L, const HelpFile*);
static std::string MunchLeadingSpace( const std::string &text );

HelpFile *GetHelpFile( const Character *ch, std::string argument )
{
  std::string argall;
  std::string argone;
  std::string argnew;
  HelpFile *foundHelpfile = NULL;
  int lev = 0;

  if ( argument.empty() )
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
  while ( !argument.empty() )
    {
      argument = OneArgument( argument, argone );

      if ( !argall.empty() )
	{
          argall += " ";
	}

      argall += argone;
    }

  for(HelpFile *pHelp : HelpFiles->Entities())
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
	  foundHelpfile = pHelp;
          break;
	}
    }

  return foundHelpfile;
}

/*
 * Adds a help page to the list if it is not a duplicate of an existing page.
 * Page is insert-sorted by keyword.                    -Thoric
 * (The reason for sorting is to keep do_hlist looking nice)
 */
void AddHelpFile( HelpFile *pHelp )
{
  HelpFiles->Add(pHelp);
}

void RemoveHelpFile( HelpFile *help )
{
  HelpFiles->Remove(help);
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

  if( help->Keyword.empty() )
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

static void PushHelps( lua_State *L, const void *userData )
{
  lua_newtable( L );

  for(const HelpFile *help : HelpFiles->Entities())
    {
      PushHelpFile(L, help);
    }

  lua_setglobal( L, "helps" );
}

static void PushHelpFile(lua_State *L, const HelpFile *help)
{
  static int idx = 0;

  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Keyword", GetHelpFileKeyword( help ) );
  LuaSetfieldNumber( L, "Level", GetHelpFileLevel( help ) );
  LuaSetfieldString( L, "Text", MunchLeadingSpace( GetHelpFileText( help ) ) );

  lua_settable( L, -3 );
}

HelpFile *AllocateHelpFile( const std::string &keyword, short level )
{
  HelpFile *help = new HelpFile();
  
  SetHelpFileKeyword( help, keyword );
  SetHelpFileText( help, "" );
  SetHelpFileLevel( help, level );

  return help;
}

void FreeHelpFile( HelpFile *help )
{
  delete help;
}

/*
 * Stupid leading space muncher fix                             -Thoric
 */
static std::string MunchLeadingSpace( const std::string &text )
{
  if(text.empty())
    {
      return "";
    }
  
  std::string fixed = StripCarriageReturn(text);

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
      Log->Bug( "%s:%s:%d: Argument level = %d is out of range.",
                __FUNCTION__, __FILE__, __LINE__, level );
    }
}

std::string GetHelpFileKeyword( const HelpFile *help )
{
  return help->Keyword;
}

void SetHelpFileKeyword( HelpFile *help, const std::string &keyword )
{
  help->Keyword = keyword;
}

std::string GetHelpFileText( const HelpFile *help )
{
  return help->Text;
}

void SetHelpFileText( HelpFile *help, const std::string &text )
{
  help->Text = text;
}

/////////////////////////////////////////////////////////
class LuaHelpFileRepository : public HelpFileRepository
{
public:
  void Load() override;
  void Save() const override;
};

void LuaHelpFileRepository::Load()
{
  LuaLoadDataFile( HELP_DATA_FILE, L_HelpEntry, "HelpEntry" );
}

void LuaHelpFileRepository::Save() const
{
  LuaSaveDataFile( HELP_DATA_FILE, PushHelps, "helps", NULL );
}

HelpFileRepository *NewHelpFileRepository()
{
  return new LuaHelpFileRepository();
}
