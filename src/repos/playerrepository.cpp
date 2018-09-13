#include <cassert>
#include "playerrepository.hpp"
#include "character.hpp"
#include "script.hpp"
#include "race.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "clan.hpp"
#include "alias.hpp"
#include "log.hpp"
#include "board.hpp"
#include "skill.hpp"

PlayerRepository *PlayerCharacters = nullptr;

class InMemoryPlayerRepository : public PlayerRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Character *pc) const override;

protected:
  void OnAdded(Character* &entity) override;
  void OnRemoved(Character* &entity) override;

private:
  static constexpr int SAVE_VERSION = 1;
  static void PushPlayer( lua_State *L, const void *userData );
  static void PushGuildData( lua_State *L, const Character *pc );
  static void PushAliases( lua_State *L, const Character *pc );
  static void PushAddictions( lua_State *L, const Character *pc );
  static void PushDrugLevels( lua_State *L, const Character *pc );
  static void PushBuildData( lua_State *L, const Character *pc );
  static void PushHelled( lua_State *L, const Character *pc );
  static void PushConditions( lua_State *L, const Character *pc );
  static void PushSkills( lua_State *L, const Character *pc );
  static void PushKilledData( lua_State *L, const Character *pc );
  static void PushImcData( lua_State *L, const Character *pc );
  static void PushComments( lua_State *L, const Character *pc );
  static void PushPlayerData( lua_State *L, const Character *pc );
};

void InMemoryPlayerRepository::Load()
{

}

void InMemoryPlayerRepository::Save() const
{

}

void InMemoryPlayerRepository::PushPlayerData( lua_State *L, const Character *pc )
{
  assert( !IsNpc( pc ) );
  
  LuaSetfieldNumber( L, "SaveVersion", SAVE_VERSION );
  LuaSetfieldString( L, "CharacterType", "PlayerCharacter" );
  LuaSetfieldNumber( L, "Played", pc->PCData->Played + (int) (current_time - pc->PCData->Logon) );
  LuaSetfieldNumber( L, "LastPlayed", current_time );
  LuaSetfieldNumber( L, "Bank", pc->PCData->Bank );
  LuaSetfieldNumber( L, "Clones", pc->PCData->Clones );
  LuaSetfieldNumber( L, "JailVnum", pc->PCData->JailVnum );
  LuaSetfieldNumber( L, "RestoreTime", pc->PCData->RestoreTime );
  LuaSetfieldString( L, "Password", pc->PCData->Password );
  LuaSetfieldString( L, "BamfIn", pc->PCData->BamfIn );
  LuaSetfieldString( L, "BamfOut", pc->PCData->BamfOut );
  LuaSetfieldString( L, "Email", pc->PCData->Email );
  LuaSetfieldString( L, "HomePage", pc->PCData->HomePage );
  LuaSetfieldString( L, "Rank", pc->PCData->Rank );
  LuaSetfieldString( L, "Bestowments", pc->PCData->Bestowments );
  LuaSetfieldString( L, "Title", pc->PCData->Title );
  LuaSetfieldString( L, "Biography", pc->PCData->Bio );
  LuaSetfieldString( L, "AuthedBy", pc->PCData->AuthedBy );
  LuaSetfieldNumber( L, "MinSnoop", pc->PCData->MinSnoop );
  LuaSetfieldString( L, "Prompt", pc->PCData->Prompt );
  LuaSetfieldNumber( L, "PKills", pc->PCData->PKills );
  LuaSetfieldNumber( L, "PDeaths", pc->PCData->PDeaths );
  LuaSetfieldString( L, "AliasFocus", pc->PCData->Target );
  LuaSetfieldNumber( L, "MobKills", pc->PCData->MKills );
  LuaSetfieldNumber( L, "MobDeaths", pc->PCData->MDeaths );
  LuaSetfieldNumber( L, "IllegalPk", pc->PCData->IllegalPk );
  LuaSetfieldNumber( L, "PKilledTimer", GetTimer(pc, TIMER_PKILLED) );
  LuaSetfieldNumber( L, "Alignment", pc->Alignment );
  LuaSetfieldNumber( L, "ArmorClass", pc->ArmorClass );
  LuaSetfieldNumber( L, "PlayerHome",
                     pc->PlayerHome != nullptr ? pc->PlayerHome->Vnum : INVALID_VNUM );
  
  if ( pc->Desc != nullptr
       && !pc->Desc->Remote.Hostname.empty() )
    {
      LuaSetfieldString( L, "LastConnectedFrom", pc->Desc->Remote.Hostname );
    }

  LuaPushFlags( L, pc->Flags, PlayerFlags, "Flags" );
  LuaPushFlags( L, pc->PCData->Flags, PcFlags, "PcFlags" );
  LuaPushFlags( L, pc->PCData->WantedFlags, WantedFlags, "Wanted" );

  if( pc->PCData->Pet != nullptr )
    {
      LuaPushMobiles( L, { pc->PCData->Pet }, "Pets" );
    }
  
  PushGuildData( L, pc );
  PushImcData( L, pc );
  PushKilledData( L, pc );
  PushComments( L, pc );
  PushSkills( L, pc );
  PushConditions( L, pc );
  PushHelled( L, pc );
  PushDrugLevels( L, pc );
  PushAddictions( L, pc );
  PushAliases( L, pc );
  PushBuildData( L, pc );
}

void InMemoryPlayerRepository::PushAliases( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Aliases" );
  lua_newtable( L );

  for( const Alias *alias : pc->PCData->Aliases() )
    {
      LuaSetfieldString( L, "Name", alias->Name );
      LuaSetfieldString( L, "Value", alias->Command );
    }
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushAddictions( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Addictions" );
  lua_newtable( L );

  for( size_t drug = 0; drug < GetSpiceTableSize(); ++drug )
    {
      lua_pushnumber( L, drug );
      lua_newtable( L );

      LuaSetfieldString( L, "Name", GetSpiceTypeName(drug) );
      LuaSetfieldNumber( L, "Level", pc->PCData->Addiction[drug] );
      
      lua_settable( L, -3 );
    }
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushDrugLevels( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "SpiceLevels" );
  lua_newtable( L );

  for( size_t drug = 0; drug < GetSpiceTableSize(); ++drug )
    {
      lua_pushnumber( L, drug );
      lua_newtable( L );

      LuaSetfieldString( L, "Name", GetSpiceTypeName( drug ) );
      LuaSetfieldNumber( L, "Level", pc->PCData->DrugLevel[drug] );

      lua_settable( L, -3 );
    }

  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushBuildData( lua_State *L, const Character *pc )
{

}

void InMemoryPlayerRepository::PushHelled( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Helled" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "ReleaseDate", pc->PCData->ReleaseDate );
  LuaSetfieldString( L, "HelledBy", pc->PCData->HelledBy );
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushConditions( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Conditions" );
  lua_newtable( L );

  for( size_t idx = 0; idx < pc->PCData->Condition.size(); ++idx )
    {
      lua_pushinteger( L, idx );
      lua_newtable( L );
      static const std::array<const char * const, MAX_CONDS> ConditionNames = { "drunk", "full", "thirst", "bloodthirst" };

      LuaSetfieldString( L, "Type", ConditionNames[idx] );
      LuaSetfieldNumber( L, "Level", pc->PCData->Condition[idx] );
      
      lua_settable( L, -3 );
    }
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushSkills( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Skills" );
  lua_newtable( L );

  for( int sn = 1; sn < TopSN; ++sn )
    {
      const Skill *skill = SkillTable[sn];

      if( !skill->Name.empty() && pc->PCData->Learned[sn] > 0)
        {
          lua_pushnumber( L, sn );
          lua_newtable( L );

          LuaSetfieldString( L, "Type", SkillTypeName[skill->Type] );
          LuaSetfieldString( L, "Name", skill->Name );
          LuaSetfieldNumber( L, "Level", pc->PCData->Learned[sn] );
          
          lua_settable( L, -3 );
        }
    }
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushComments( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Comments" );
  lua_newtable( L );
  size_t idx = 0;
  
  for( const Note *note : pc->PCData->Comments() )
    {
      lua_pushnumber( L, ++idx );
      lua_newtable( L );

      LuaSetfieldString( L, "Sender", note->Sender );
      LuaSetfieldString( L, "Date", note->Date );
      LuaSetfieldString( L, "To", note->ToList );
      LuaSetfieldString( L, "Subject", note->Subject );
      LuaSetfieldString( L, "Text", note->Text );

      lua_settable( L, -3 );
    }

  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushKilledData( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Killed" );
  lua_newtable( L );
  size_t idx = 0;
  
  for( const KilledData &killed : pc->PCData->Killed )
    {
      lua_pushnumber( L, ++idx );
      lua_newtable( L );

      LuaSetfieldNumber( L, "Vnum", killed.Vnum );
      LuaSetfieldNumber( L, "Count", killed.Count );
      
      lua_settable( L, -3 );
    }
  
  lua_settable( L, -3 );
}

void InMemoryPlayerRepository::PushImcData( lua_State *L, const Character *pc )
{
  ImcSaveCharacter( L, pc );
}

void InMemoryPlayerRepository::PushGuildData( lua_State *L, const Character *pc )
{
  if( pc->PCData->ClanInfo.Clan != nullptr )
    {
      lua_pushstring( L, "Guild" );
      lua_newtable( L );

      LuaSetfieldString( L, "Guild", pc->PCData->ClanInfo.ClanName );
      LuaSetfieldNumber( L, "SalaryTime", pc->PCData->ClanInfo.SalaryDate );
      LuaSetfieldNumber( L, "Salary", pc->PCData->ClanInfo.Salary );

      lua_settable( L, -3 );
    }
}

void InMemoryPlayerRepository::PushPlayer( lua_State *L, const void *userData )
{
  const Character *pc = static_cast<const Character*>( userData );
  
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaPushCharacter( L, pc, PushPlayerData );
  
  lua_setglobal( L, "character" );
}

void InMemoryPlayerRepository::Save(const Character *pc) const
{
  if( IsNpc( pc ) || !IsAuthed( pc ) )
    {
      return;
    }

  if ( pc->Desc != nullptr && pc->Desc->Original != nullptr )
    {
      pc = pc->Desc->Original;
    }
  
  saving_char = const_cast<Character*>( pc );

  if( IsClanned( pc ) )
    {
      UpdateClanMember( pc );
    }

  pc->PCData->SaveTime = current_time;
  
  LuaSaveDataFile( GetPlayerFilename(pc),
                   &InMemoryPlayerRepository::PushPlayer,
                   "character", pc );

  WriteCorpses( pc, "" );

  quitting_char = nullptr;
  saving_char = nullptr;
}

void InMemoryPlayerRepository::OnAdded(Character* &entity)
{
  assert(!IsNpc(entity));
}

void InMemoryPlayerRepository::OnRemoved(Character* &entity)
{

}

////////////////////////
PlayerRepository *NewPlayerRepository()
{
  return new InMemoryPlayerRepository();
}

std::string GetPlayerFilename( const Character *pc )
{
  return FormatString( "%s%c/%s.lua", PLAYER_DIR, tolower( pc->Name[0] ),
                       ToLower( pc->Name ).c_str() );
}
