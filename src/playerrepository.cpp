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
  static void PushAbilities( lua_State *L, const Character *pc );
  static void PushSaves( lua_State *L, const Character *pc );
  static void PushGuildData( lua_State *L, const Character *pc );
  static void PushAliases( lua_State *L, const Character *pc );
  static void PushAddictions( lua_State *L, const Character *pc );
  static void PushDrugLevels( lua_State *L, const Character *pc );
  static void PushBuildData( lua_State *L, const Character *pc );
  static void PushHelled( lua_State *L, const Character *pc );
  static void PushStats( lua_State *L, const Character *pc );
  static void PushConditions( lua_State *L, const Character *pc );
  static void PushSkills( lua_State *L, const Character *pc );
  static void PushKilledData( lua_State *L, const Character *pc );
  static void PushImcData( lua_State *L, const Character *pc );
  static void PushComments( lua_State *L, const Character *pc );
};

void InMemoryPlayerRepository::Load()
{

}

void InMemoryPlayerRepository::Save() const
{

}

void InMemoryPlayerRepository::PushAbilities( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "Abilities" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "MainAbility", pc->Ability.Main );
  
  for( size_t ability = 0; ability < MAX_ABILITY; ++ability )
    {
      lua_pushinteger( L, ability );
      lua_newtable( L );

      LuaSetfieldString( L, "Name", AbilityName[ability] );
      LuaSetfieldNumber( L, "Level", GetAbilityLevel( pc, ability ) );
      LuaSetfieldNumber( L, "Experience", GetAbilityXP( pc, ability ) );
      
      lua_settable( L, -3 );
    }
  
  lua_settable( L, -3 );
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

void InMemoryPlayerRepository::PushSaves( lua_State *L, const Character *pc )
{
  lua_pushstring( L, "SaveVs" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "PoisonDeath", pc->Saving.PoisonDeath );
  LuaSetfieldNumber( L, "Wand", pc->Saving.Wand );
  LuaSetfieldNumber( L, "ParaPetri", pc->Saving.ParaPetri );
  LuaSetfieldNumber( L, "Breath", pc->Saving.Breath );
  LuaSetfieldNumber( L, "SpellStaff", pc->Saving.SpellStaff );
  
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

void InMemoryPlayerRepository::PushStats( lua_State *L, const Character *pc )
{
  LuaPushStats( L, &pc->PermStats, "PermanentStats" );
  LuaPushStats( L, &pc->StatMods, "StatModifiers" );
}

void InMemoryPlayerRepository::PushConditions( lua_State *L, const Character *pc )
{

}

void InMemoryPlayerRepository::PushSkills( lua_State *L, const Character *pc )
{

}

void InMemoryPlayerRepository::PushComments( lua_State *L, const Character *pc )
{

}

void InMemoryPlayerRepository::PushKilledData( lua_State *L, const Character *pc )
{

}

void InMemoryPlayerRepository::PushImcData( lua_State *L, const Character *pc )
{

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
  
  // NOT a fan of this cast, but it can't be avoided.
  DeEquipCharacter( const_cast<Character*>( pc ) );
  
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", pc->Name );
  LuaSetfieldNumber( L, "SaveVersion", SAVE_VERSION );
  LuaSetfieldString( L, "CharacterType", "PlayerCharacter" );
  LuaSetfieldString( L, "Description", pc->Description );
  LuaSetfieldString( L, "Gender",
                     pc->Sex == SEX_MALE ? "Male" : pc->Sex == SEX_FEMALE ? "Female" : "Neutral" );
  LuaSetfieldString( L, "Race", RaceTable[pc->Race].Name );
  LuaSetfieldNumber( L, "Speaks", pc->Speaks );
  LuaSetfieldNumber( L, "Speaking", pc->Speaking );
  LuaSetfieldNumber( L, "Level", pc->TopLevel );
  LuaSetfieldNumber( L, "Trust", pc->Trust );
  LuaSetfieldNumber( L, "Played", pc->PCData->Played + (int) (current_time - pc->PCData->Logon) );
  LuaSetfieldNumber( L, "InRoom",
                     pc->InRoom == GetRoom( ROOM_VNUM_LIMBO ) && pc->WasInRoom
                     ? pc->WasInRoom->Vnum : pc->InRoom->Vnum );
  LuaSetfieldNumber( L, "PlayerHome",
                     pc->PlayerHome != nullptr ? pc->PlayerHome->Vnum : INVALID_VNUM );
  PushCurrentAndMax( L, "HitPoints", pc->HitPoints );
  PushCurrentAndMax( L, "ForcePoints", pc->Mana );
  PushCurrentAndMax( L, "Fatigue", pc->Fatigue );
  LuaSetfieldNumber( L, "Credits", pc->Gold );
  LuaSetfieldNumber( L, "Bank", pc->PCData->Bank );
  LuaSetfieldNumber( L, "Clones", pc->PCData->Clones );
  LuaSetfieldNumber( L, "JailVnum", pc->PCData->JailVnum );
  LuaSetfieldString( L, "Position",
                     PositionName[pc->Position == POS_FIGHTING ? POS_STANDING : pc->Position] );
  LuaSetfieldNumber( L, "Alignment", pc->Alignment );
  LuaSetfieldNumber( L, "HitRoll", pc->HitRoll );
  LuaSetfieldNumber( L, "DamRoll", pc->DamRoll );
  LuaSetfieldNumber( L, "ArmorClass", pc->ArmorClass );
  LuaSetfieldNumber( L, "Wimpy", pc->Wimpy );
  LuaSetfieldNumber( L, "RestoreTime", pc->PCData->RestoreTime );
  LuaSetfieldNumber( L, "MentalState", pc->MentalState );
  LuaSetfieldString( L, "Password", pc->PCData->Password );
  LuaSetfieldNumber( L, "LastPlayed", current_time );
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
  LuaSetfieldNumber( L, "PKilledTimer", GetTimer(pc, TIMER_PKILLED) );
  LuaSetfieldNumber( L, "MobKills", pc->PCData->MKills );
  LuaSetfieldNumber( L, "MobDeaths", pc->PCData->MDeaths );
  LuaSetfieldNumber( L, "IllegalPk", pc->PCData->IllegalPk );

  if ( pc->Desc != nullptr
       && !pc->Desc->Remote.Hostname.empty() )
    {
      LuaSetfieldString( L, "LastConnectedFrom", pc->Desc->Remote.Hostname );
    }
  
  LuaPushFlags( L, pc->PCData->Flags, PcFlags, "PcFlags" );
  LuaPushFlags( L, pc->Flags, PlayerFlags, "Flags" );
  LuaPushFlags( L, pc->AffectedBy, AffectFlags, "AffectedBy" );
  LuaPushFlags( L, pc->Deaf, ChannelNames, "IgnoreChannels" );
  LuaPushFlags( L, pc->Resistant, RisFlags, "Resistant" );
  LuaPushFlags( L, pc->Immune, RisFlags, "Immune" );
  LuaPushFlags( L, pc->Susceptible, RisFlags, "Susceptible" );
  LuaPushFlags( L, pc->PCData->WantedFlags, WantedFlags, "Wanted" );
  
  PushAbilities( L, pc );
  PushSaves( L, pc ); // pc->Saving.PoisonDeath etc
  PushGuildData( L, pc );
  PushAliases( L, pc );
  PushAddictions( L, pc );
  PushDrugLevels( L, pc );
  PushBuildData( L, pc );
  PushHelled( L, pc );
  PushStats( L, pc );
  PushConditions( L, pc );
  PushSkills( L, pc );
  PushKilledData( L, pc );
  PushImcData( L, pc );
  PushComments( L, pc );

  LuaPushAffects( L, pc->Affects() );
  LuaPushMobiles( L, { pc->PCData->Pet } );  
  LuaPushObjects( L, pc->Objects() );
  
  lua_setglobal( L, "character" );

  // NOT a fan of this cast, but it can't be avoided.
  ReEquipCharacter( const_cast<Character*>( pc ) );
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
