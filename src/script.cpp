#include <algorithm>
#include <cstdio>
#include "mud.hpp"
#include "script.hpp"
#include "log.hpp"
#include "stats.hpp"
#include "object.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "protoobject.hpp"
#include "room.hpp"

lua_State *LuaMasterState;

static void SetLuaPath( lua_State * );
static void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx );
static void LuaPushOneAffect( lua_State *L, const Affect *affect, int idx );

lua_State *CreateLuaState( void )
{
  lua_State *L = luaL_newstate();
  luaL_openlibs( L );
  SetLuaPath( L );

  return L;
}

lua_State *CreateChildThread( lua_State *master )
{
  lua_State *new_thread = lua_newthread( master );

  lua_pushthread( new_thread );
  lua_newtable( new_thread );
  lua_pushvalue( new_thread, -1 );
  lua_setmetatable( new_thread, -2 );
  lua_getglobal( new_thread, "_G" );
  lua_setfield( new_thread, -2, "__index" );
  lua_setupvalue( new_thread, 1, 1 );
  lua_pop( new_thread, 1 );
  return new_thread;
}

static void SetLuaPath( lua_State *L )
{
  char path[MAX_STRING_LENGTH];
  sprintf( path, "%s?.lua;;", SCRIPT_DIR );
  lua_getglobal( L, "package" );
  lua_pushstring( L, path );
  lua_setfield( L, -2, "path" );
  lua_pop( L, 1 );
}

void LuaSetfieldString( lua_State *L, const std::string &key, const std::string &value )
{
  lua_pushstring( L, value.c_str() );
  lua_setfield( L, -2, key.c_str() );
}

void LuaSetfieldNumber( lua_State *L, const std::string &key, double value )
{
  lua_pushnumber( L, value );
  lua_setfield( L, -2, key.c_str() );
}

void LuaSetfieldBoolean( lua_State *L, const std::string &key, bool value )
{
  lua_pushboolean( L, value );
  lua_setfield( L, -2, key.c_str() );
}

void LuaLoadDataFile( const std::string &filename,
                      int (*callback)( lua_State *L ),
                      const std::string &callbackFunctionName )
{
  lua_State *L = CreateLuaState();

  lua_pushcfunction( L, callback );
  lua_setglobal( L, callbackFunctionName.c_str() );

  int error = luaL_loadfile( L, filename.c_str() ) || lua_pcall( L, 0, 0, 0 );

  if( error )
    {
      Log->Bug( "Cannot run file: %s", lua_tostring(L, -1) );
      return;
    }

  lua_close( L );
}

void LuaSaveDataFile( const std::string &filename,
                      void (*pushData)( lua_State *L, const void* ),
                      const std::string &data, const void *userData )
{
  lua_State *L = CreateLuaState();
  char buffer[MAX_STRING_LENGTH];

  pushData( L, userData );

  sprintf( buffer, "%ssavers.lua", SCRIPT_DIR );
  int error = luaL_dofile( L, buffer );

  if( error )
    {
      Log->Bug( "%s:%s():%d: Cannot run file: %s\n",
                __FILE__, __FUNCTION__, __LINE__, lua_tostring( L, -1 ) );
    }
  else
    {
      sprintf( buffer, "save%s", data.c_str() );
      lua_getfield( L, -1, buffer );
      lua_getglobal( L, data.c_str() );
      lua_pushstring( L, filename.c_str() );

      error = lua_pcall( L, 2, 0, 0 );

      if( error )
	{
	  Log->Bug( "%s:%s():%d: Cannot run file: %s\n",
                    __FILE__, __FUNCTION__, __LINE__, lua_tostring(L, -1) );
	}
    }

  lua_close(L);
}

void LuaPushFlags(lua_State *L, unsigned long flags,
                  const std::array<const char * const, MAX_BIT> &nameArray,
                  const std::string &key)
{
  LuaPushFlags(L, flags, nameArray.data(), key);
}

void LuaPushFlags( lua_State *L, unsigned long flags,
		   const char * const nameArray[], const std::string &key )
{
  if( flags )
    {
      lua_pushstring( L, key.c_str() );
      lua_newtable( L );

      for(size_t bit = 0; bit < MAX_BIT; ++bit)
        {
          unsigned int mask = 1 << bit;

          if( IsBitSet( flags, mask ) )
            {
              lua_pushinteger( L, bit );
              lua_pushstring( L, nameArray[bit] );
              lua_settable( L, -3 );
            }
        }

      lua_settable( L, -3 );
    }
}

unsigned int LuaLoadFlags( lua_State *L, const std::string &key )
{
  unsigned int flags = 0;
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
	{
	  size_t bit = lua_tointeger( L, -2 );

	  if( bit < MAX_BIT )
	    {
	      SetBit( flags, 1 << bit );
	    }

	  lua_pop( L, 1 );
	}
    }

  lua_pop( L, 1 );

  return flags;
}

static SmaugAffect *LuaLoadOneSmaugAffect( lua_State *L )
{
  int idx = lua_gettop( L );
  luaL_checktype( L, 1, LUA_TTABLE );

  SmaugAffect *affect = new SmaugAffect();

  lua_getfield( L, idx, "Duration" );
  lua_getfield( L, idx, "Modifier" );
  lua_getfield( L, idx, "Location" );
  lua_getfield( L, idx, "AffectedBy" );

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Duration = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Modifier = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->Location = lua_tointeger( L, idx );;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      affect->AffectedBy = GetAffectFlag( lua_tostring( L, idx ) );
    }

  lua_pop( L, 4 );

  return affect;
}

SmaugAffect *LuaLoadSmaugAffects( lua_State *L )
{
  SmaugAffect *firstInList = NULL;
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Affects" );

  if( !lua_isnil( L, ++idx ) )
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
	  SmaugAffect *affect = LuaLoadOneSmaugAffect( L );
	  affect->Next = firstInList;
	  firstInList = affect;
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );

  return firstInList;
}

static void LuaPushOneSmaugAffect( lua_State *L, const SmaugAffect *affect, int idx )
{
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  if( !affect->Duration.empty() )
    {
      LuaSetfieldString( L, "Duration", affect->Duration );
    }

  if( affect->Location )
    {
      LuaSetfieldNumber( L, "Location", affect->Location );
    }

  if( !affect->Modifier.empty() )
    {
      LuaSetfieldString( L, "Modifier", affect->Modifier );
    }

  if( affect->AffectedBy )
    {
      for(size_t x = 0; x < MAX_BIT; ++x )
	{
	  if( IsBitSet( affect->AffectedBy, 1 << x ) )
	    {
	      LuaSetfieldString( L, "AffectedBy", AffectFlags[x] );
	      break;
	    }
	}
    }

  lua_settable( L, -3 );
}

void LuaPushSmaugAffects( lua_State *L, const SmaugAffect *affectList )
{
  if( affectList )
    {
      const SmaugAffect *affect = NULL;
      int idx = 0;
      lua_pushstring( L, "Affects" );
      lua_newtable( L );

      for ( affect = affectList; affect; affect = affect->Next )
	{
	  LuaPushOneSmaugAffect( L, affect, ++idx );
	}

      lua_settable( L, -3 );
    }
}

void LuaPushVector3( lua_State *L, const Vector3 *v, const std::string &key )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "X", v->x );
  LuaSetfieldNumber( L, "Y", v->y );
  LuaSetfieldNumber( L, "Z", v->z );

  lua_settable( L, -3 );
}

void LuaLoadVector3( lua_State *L, Vector3 *vec, const std::string &key )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

  if( !lua_isnil( L, ++idx ) )
    {
      int subidx = lua_gettop( L );
      lua_getfield( L, subidx, "X" );
      lua_getfield( L, subidx, "Y" );
      lua_getfield( L, subidx, "Z" );

      if( !lua_isnil( L, ++subidx ) )
	{
	  vec->x = lua_tonumber( L, subidx );
	}

      if( !lua_isnil( L, ++subidx ) )
        {
          vec->y = lua_tonumber( L, subidx );
        }

      if( !lua_isnil( L, ++subidx ) )
        {
          vec->z = lua_tonumber( L, subidx );
        }

      lua_pop( L, 3 );
    }

  lua_pop( L, 1 );
}

void LuaPushCurrentAndMax( lua_State *L, const std::string &key, int current, int mx )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Current", current );
  LuaSetfieldNumber( L, "Max", mx );

  lua_settable( L, -3 );
}

void LuaLoadCurrentAndMax( lua_State *L, const std::string &key, int *current, int *mx )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, key.c_str() );

  if( !lua_isnil( L, ++idx ) )
    {
      int subidx = lua_gettop( L );
      lua_getfield( L, subidx, "Current" );
      lua_getfield( L, subidx, "Max" );

      if( !lua_isnil( L, ++subidx ) )
        {
          *current = lua_tonumber( L, subidx );
        }

      if( !lua_isnil( L, ++subidx ) )
        {
          *mx = lua_tonumber( L, subidx );
        }

      lua_pop( L, 2 );
    }

  lua_pop( L, 1 );
}

static void LuaPushOneAffect( lua_State *L, const Affect *affect, int idx )
{
  const Skill *skill = GetSkill( affect->Type );
  
  if( affect->Type >= 0 && skill == nullptr )
    {
      return;
    }
  
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Duration", affect->Duration );
  LuaSetfieldNumber( L, "Location", affect->Location );

  if( affect->Location >= 0 && affect->Location < static_cast<int>( AffectTypes.size() ) )
    {
      LuaSetfieldString( L, "AffectType", AffectTypes[affect->Location] );
    }
  
  LuaSetfieldNumber( L, "Modifier",
                     (affect->Location == APPLY_WEAPONSPELL
                      || affect->Location == APPLY_WEARSPELL
                      || affect->Location == APPLY_REMOVESPELL
                      || affect->Location == APPLY_STRIPSN)
                     && IS_VALID_SN(affect->Modifier)
                     ? SkillTable[affect->Modifier]->Slot : affect->Modifier );
  
  if( affect->Type >= 0 && affect->Type < TYPE_PERSONAL )
    {
      LuaSetfieldString( L, "Skill", skill->Name );
    }
  else
    {
      LuaSetfieldNumber( L, "Type", affect->Type );
    }
  
  if( affect->AffectedBy )
    {
      for(size_t x = 0; x < MAX_BIT; ++x )
        {
          if( IsBitSet( affect->AffectedBy, 1 << x ) )
            {
              LuaSetfieldString( L, "AffectedBy", AffectFlags[x] );
              break;
            }
        }
    }

  lua_settable( L, -3 );
}

void LuaPushAffects( lua_State *L, const std::list<Affect*> &affects,
                     const std::string &key )
{
  if( !affects.empty() )
    {
      int idx = 0;
      lua_pushstring( L, "Affects" );
      lua_newtable( L );

      for ( const Affect *affect : affects )
        {
          LuaPushOneAffect( L, affect, ++idx );
        }

      lua_settable( L, -3 );
    }
}

void LuaPushExtraDescriptions( lua_State *L, const std::list<ExtraDescription*> &extras )
{
  lua_pushstring( L, "ExtraDescriptions" );
  lua_newtable( L );
  size_t idx = 0;
  
  for( const ExtraDescription *ed : extras )
    {
      lua_pushinteger( L, ++idx );
      lua_newtable( L );

      LuaSetfieldString( L, "Keyword", ed->Keyword );
      LuaSetfieldString( L, "Description", ed->Description );

      lua_settable( L, -3 );
    }

  lua_settable( L, -3 );
}

void LuaPushOvalues( lua_State *L, const std::array<int, MAX_OVAL> values )
{
  lua_pushstring( L, "ObjectValues" );
  lua_newtable( L );

  for( size_t i = 0; i < values.size(); ++i )
    {
      lua_pushinteger( L, i );
      lua_pushinteger( L, values[i] );
      lua_settable( L, -3 );
    }

  lua_settable( L, -3 );
}

static void LuaPushObject( lua_State *L, const Object *obj, size_t idx )
{
  /*
   * Castrate storage characters.
   */
  if ( obj->ItemType == ITEM_KEY && !IS_OBJ_STAT(obj, ITEM_CLANOBJECT ))
    {
      return;
    }

  /*
   * Catch deleted objects                                      -Thoric
   */
  if ( IsObjectExtracted(obj) )
    {
      return;
    }

  /*
   * Do NOT save prototype items!                               -Thoric
   */
  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      return;
    }
  
  lua_pushinteger( L, idx );
  lua_newtable( L );
  const ProtoObject *proto = obj->Prototype;

  LuaSetfieldNumber( L, "Vnum", proto->Vnum );
  
  if( obj->Count > 1 )
    {
      LuaSetfieldNumber( L, "Count", obj->Count );
    }

  if( StrCmp( obj->Name, proto->Name ) != 0 )
    {
      LuaSetfieldString( L, "Name", obj->Name );
    }

  if( StrCmp( obj->ShortDescr, proto->ShortDescr ) != 0 )
    {
      LuaSetfieldString( L, "ShortDescription", obj->ShortDescr );
    }

  if( StrCmp( obj->Description, proto->Description ) != 0 )
    {
      LuaSetfieldString( L, "Description", obj->Description );
    }

  if( StrCmp( obj->ActionDescription, proto->ActionDescription ) != 0 )
    {
      LuaSetfieldString( L, "ActionDescription", obj->ActionDescription );
    }

  if( obj->InRoom != nullptr )
    {
      LuaSetfieldNumber( L, "InRoom", obj->InRoom->Vnum );
    }

  if( obj->Flags != proto->Flags )
    {
      LuaPushFlags( L, obj->Flags, ObjectFlags, "Flags" );
    }

  if( obj->WearFlags != proto->WearFlags )
    {
      LuaPushFlags( L, obj->WearFlags, WearFlags, "WearFlags" );
    }

  if( obj->ItemType != proto->ItemType )
    {
      LuaSetfieldString( L, "ItemType", ObjectTypes[obj->ItemType] );
    }

  if( obj->Weight != proto->Weight )
    {
      LuaSetfieldNumber( L, "Weight", obj->Weight );
    }

  if( obj->Cost != proto->Cost )
    {
      LuaSetfieldNumber( L, "Cost", obj->Cost );
    }

  if( std::any_of( std::cbegin( obj->Value ), std::cend( obj->Value ),
                   [](const auto v) { return v != 0; } ) )
    {
      LuaPushOvalues( L, obj->Value );
    }
  
  if( obj->Level != 0 )
    {
      LuaSetfieldNumber( L, "Level", obj->Level );
    }

  if( obj->Timer != 0 )
    {
      LuaSetfieldNumber( L, "Timer", obj->Timer );
    }

  int wear_loc = -1;

  for( size_t wear = 0; wear < MAX_WEAR; wear++ )
    {
      for ( size_t x = 0; x < MAX_LAYERS; x++ )
        {
          if ( obj == save_equipment[wear][x] )
            {
              wear_loc = wear;
              break;
            }
          else if ( !save_equipment[wear][x] )
            {
              break;
            }
        }
    }

  if( wear_loc != -1 )
    {
      LuaSetfieldNumber( L, "WearLocation", wear_loc );
    }

  switch ( obj->ItemType )
    {
    case ITEM_PILL: /* was down there with staff and wand, wrongly - Scryn */
    case ITEM_POTION:
      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL1]) )
        {
          LuaSetfieldString( L, "Spell1",
                             SkillTable[obj->Value[OVAL_PILL_SPELL1]]->Name );
        }

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL2]) )
        {
          LuaSetfieldString( L, "Spell2",
                             SkillTable[obj->Value[OVAL_PILL_SPELL2]]->Name );
        }

      if ( IS_VALID_SN(obj->Value[OVAL_PILL_SPELL3]) )
        {
          LuaSetfieldString( L, "Spell3",
                             SkillTable[obj->Value[OVAL_PILL_SPELL3]]->Name );
        }
      break;

    case ITEM_DEVICE:
      if ( IS_VALID_SN(obj->Value[OVAL_DEVICE_SPELL]) )
        {
          LuaSetfieldString( L, "Spell3",
                             SkillTable[obj->Value[OVAL_DEVICE_SPELL]]->Name );
        }
      break;

    case ITEM_SALVE:
      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL1]) )
        {
          LuaSetfieldString( L, "Spell4",
                             SkillTable[obj->Value[OVAL_SALVE_SPELL1]]->Name );
        }

      if ( IS_VALID_SN(obj->Value[OVAL_SALVE_SPELL2]) )
        {
          LuaSetfieldString( L, "Spell5",
                             SkillTable[obj->Value[OVAL_SALVE_SPELL2]]->Name );
        }

      break;

    default:
      break;
    }

  LuaPushAffects( L, obj->Affects(), "Affects" );
  LuaPushExtraDescriptions( L, obj->ExtraDescriptions() );
  LuaPushObjects( L, obj->Objects(), "Contents" );  
  lua_settable( L, -3 );
}

void LuaPushObjects( lua_State *L, const std::list<Object*> &objects,
                     const std::string &key )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );
  size_t idx = 0;

  for( const Object *obj : objects )
    {
      LuaPushObject( L, obj, ++idx );
    }
  
  lua_settable( L, -3 );
}

void LuaPushMobiles( lua_State *L, const std::list<Character*> &mobiles,
                     const std::string &key )
{

}

void LuaPushStats( lua_State *L, const Stats *stats, const std::string &key )
{
  lua_pushstring( L, key.c_str() );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Strength", stats->Str );
  LuaSetfieldNumber( L, "Intelligence", stats->Int );
  LuaSetfieldNumber( L, "Wisdom", stats->Wis );
  LuaSetfieldNumber( L, "Dexterity", stats->Dex );
  LuaSetfieldNumber( L, "Constitution", stats->Con );
  LuaSetfieldNumber( L, "Charisma", stats->Cha );
  LuaSetfieldNumber( L, "Luck", stats->Lck );
  LuaSetfieldNumber( L, "Force", stats->Frc );
  
  lua_settable( L, -3 );
}

void LuaLoadStats( lua_State *L, Stats *stats, const std::string &key )
{
  
}
