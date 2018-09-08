#include <cassert>
#include "playerrepository.hpp"
#include "character.hpp"
#include "script.hpp"
#include "race.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

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
};

void InMemoryPlayerRepository::Load()
{

}

void InMemoryPlayerRepository::Save() const
{

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
  LuaSetfieldString( L, "MainAbility", AbilityName[pc->Ability.Main] );
  LuaSetfieldNumber( L, "Speaks", pc->Speaks );
  LuaSetfieldNumber( L, "Speaking", pc->Speaking );
  LuaSetfieldNumber( L, "Level", pc->TopLevel );
  LuaSetfieldNumber( L, "Trust", pc->Trust );
  LuaSetfieldNumber( L, "Played", pc->PCData->Played + (int) (current_time - pc->PCData->Logon) );
  LuaSetfieldNumber( L, "InRoom",
                     pc->InRoom == GetRoom( ROOM_VNUM_LIMBO ) && pc->WasInRoom
                     ? pc->WasInRoom->Vnum : pc->InRoom->Vnum );
  LuaSetfieldNumber( L, "PlayerHome", pc->PlayerHome->Vnum );
  
  lua_setglobal( L, "character" );

  // NOT a fan of this cast, but it can't be avoided.
  ReEquipCharacter( const_cast<Character*>( pc ) );
}

void InMemoryPlayerRepository::Save(const Character *pc) const
{
  assert( !IsNpc(pc) );

  LuaSaveDataFile( GetPlayerFilename(pc),
                   &InMemoryPlayerRepository::PushPlayer,
                   "character", pc );
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
