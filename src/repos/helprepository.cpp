#include "helprepository.hpp"
#include "help.hpp"
#include "script.hpp"

#define HELP_DATA_FILE DATA_DIR "help.lua"

HelpFileRepository *HelpFiles = nullptr;

static int L_HelpEntry( lua_State *L );
static void PushHelps( lua_State *L, const void* );
static void PushHelpFile(lua_State *L, const HelpFile*);
static std::string MunchLeadingSpace( const std::string &text );

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

bool CompareHelpFile::operator()(const HelpFile *pHelp, const HelpFile *tHelp) const
{
  const char *lhs = pHelp->Keyword[0]=='\'' ? pHelp->Keyword.c_str() + 1 : pHelp->Keyword.c_str();
  const char *rhs = tHelp->Keyword[0]=='\'' ? tHelp->Keyword.c_str() + 1 : tHelp->Keyword.c_str();
  int match = StrCmp(lhs, rhs);

  if(match < 0 || (match == 0 && pHelp->Level > tHelp->Level))
    {
      return true;
    }
  else
    {
      return false;
    }
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

      HelpFiles->Add( help );
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
