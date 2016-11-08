#include <ctype.h>
#include "social.h"
#include "mud.h"
#include "character.h"
#include "script.h"

#define SOCIAL_DATA_FILE     DATA_DIR "socials.lua"

Social *SocialTable[27];

static void PushSocialTable( lua_State *L, const void *userData );
static void PushSocial( lua_State *L, const Social *social );
static int L_SocialEntry( lua_State *L );

void FreeSocial( Social *social )
{
  if ( social->Name )
    FreeMemory( social->Name );

  if ( social->CharNoArg )
    FreeMemory( social->CharNoArg );

  if ( social->OthersNoArg )
    FreeMemory( social->OthersNoArg );

  if ( social->CharFound )
    FreeMemory( social->CharFound );

  if ( social->OthersFound )
    FreeMemory( social->OthersFound );

  if ( social->VictimFound )
    FreeMemory( social->VictimFound );

  if ( social->CharAuto )
    FreeMemory( social->CharAuto );

  if ( social->OthersAuto )
    FreeMemory( social->OthersAuto );

  FreeMemory( social );
}

void UnlinkSocial( Social *social )
{
  Social *tmp, *tmp_next;
  int hash;

  if ( !social )
    {
      Bug( "Unlink_social: NULL social", 0 );
      return;
    }

  if ( social->Name[0] < 'a' || social->Name[0] > 'z' )
    hash = 0;
  else
    hash = (social->Name[0] - 'a') + 1;

  if ( social == (tmp=SocialTable[hash]) )
    {
      SocialTable[hash] = tmp->Next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->Next;
      if ( social == tmp_next )
        {
          tmp->Next = tmp_next->Next;
          return;
        }
    }
}

void AddSocial( Social *social )
{
  int hash, x;
  Social *tmp, *prev;

  if ( !social )
    {
      Bug( "Add_social: NULL social" );
      return;
    }

  if ( !social->Name )
    {
      Bug( "Add_social: NULL social->Name" );
      return;
    }

  if ( !social->CharNoArg )
    {
      Bug( "Add_social: NULL social->CharNoArg" );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; social->Name[x] != '\0'; x++ )
    social->Name[x] = CharToLowercase(social->Name[x]);

  if ( social->Name[0] < 'a' || social->Name[0] > 'z' )
    hash = 0;
  else
    hash = (social->Name[0] - 'a') + 1;

  if ( (prev = tmp = SocialTable[hash]) == NULL )
    {
      social->Next = SocialTable[hash];
      SocialTable[hash] = social;
      return;
    }

  for ( ; tmp; tmp = tmp->Next )
    {
      if ( (x=StrCmp(social->Name, tmp->Name)) == 0 )
        {
          Bug( "Add_social: trying to add duplicate name to bucket %d", hash );
          FreeSocial( social );
          return;
        }
      else
        if ( x < 0 )
          {
            if ( tmp == SocialTable[hash] )
              {
                social->Next = SocialTable[hash];
                SocialTable[hash] = social;
                return;
              }
            prev->Next = social;
            social->Next = tmp;
            return;
          }
      prev = tmp;
    }

  /* add to end */
  prev->Next = social;
  social->Next = NULL;
}

Social *GetSocial( const char *command )
{
  Social *social = NULL;
  int hash = 0;

  if ( command[0] < 'a' || command[0] > 'z' )
    {
      hash = 0;
    }
  else
    {
      hash = (command[0] - 'a') + 1;
    }

  for ( social = SocialTable[hash]; social; social = social->Next )
    {
      if ( !StringPrefix( command, social->Name ) )
        {
          return social;
        }
    }

  return NULL;
}

bool CheckSocial( Character *ch, const char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Social *social = NULL;

  if ( !( social = GetSocial( command ) ) )
    {
      return false;
    }

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      SendToCharacter( "You are anti-social!\r\n", ch );
      return true;
    }

  switch ( ch->Position )
    {
    case POS_DEAD:
      SendToCharacter( "Lie still; you are DEAD.\r\n", ch );
      return true;

    case POS_INCAP:
    case POS_MORTAL:
      SendToCharacter( "You are hurt far too bad for that.\r\n", ch );
      return true;

    case POS_STUNNED:
      SendToCharacter( "You are too stunned to do that.\r\n", ch );
      return true;

    case POS_SLEEPING:
      /*
       * I just know this is the path to a 12" 'if' statement.  :(
       * But two players asked for it already!  -- Furey
       */
      if ( !StrCmp( social->Name, "snore" ) )
        {
          break;
        }

      SendToCharacter( "In your dreams, or what?\r\n", ch );
      return true;

    default:
      break;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      Act( AT_SOCIAL, social->OthersNoArg, ch, NULL, victim, TO_ROOM    );
      Act( AT_SOCIAL, social->CharNoArg,   ch, NULL, victim, TO_CHAR    );
    }
  else if ( !( victim = GetCharacterInRoom( ch, arg ) ) )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
    }
  else if ( victim == ch )
    {
      Act( AT_SOCIAL, social->OthersAuto,   ch, NULL, victim, TO_ROOM    );
      Act( AT_SOCIAL, social->CharAuto,     ch, NULL, victim, TO_CHAR    );
    }
  else
    {
      Act( AT_SOCIAL, social->OthersFound,  ch, NULL, victim, TO_NOTVICT );
      Act( AT_SOCIAL, social->CharFound,    ch, NULL, victim, TO_CHAR    );
      Act( AT_SOCIAL, social->VictimFound,    ch, NULL, victim, TO_VICT    );

      if ( !IsNpc(ch) && IsNpc(victim)
           && !IsAffectedBy(victim, AFF_CHARM)
           && IsAwake(victim)
           && !IsBitSet( victim->Prototype->mprog.progtypes, ACT_PROG ) )
        {
          switch ( NumberBits( 4 ) )
            {
            case 0:
              if ( !IsBitSet(ch->InRoom->Flags, ROOM_SAFE )
                   && IsEvil(ch) )
                {
                  if ( !StrCmp( social->Name, "slap" ) || !StrCmp( social->Name, "punch" ) )
                    {
                      HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
                    }
                }
              else if ( IsNeutral(ch) )
                {
                  Act( AT_ACTION, "$n slaps $N.", victim, NULL, ch, TO_NOTVICT );
                  Act( AT_ACTION, "You slap $N.", victim, NULL, ch, TO_CHAR );
                  Act( AT_ACTION, "$n slaps you.", victim, NULL, ch, TO_VICT );
                }
              else
                {
                  Act( AT_ACTION, "$n acts like $N doesn't even exist.", victim, NULL, ch, TO_NOTVICT );
                  Act( AT_ACTION, "You just ignore $N.",  victim, NULL, ch, TO_CHAR    );
                  Act( AT_ACTION, "$n appears to be ignoring you.", victim, NULL, ch, TO_VICT    );
                }
              break;

            case 1:
            case 2:
	    case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
              Act( AT_SOCIAL, social->OthersFound, victim, NULL, ch, TO_NOTVICT );
              Act( AT_SOCIAL, social->CharFound, victim, NULL, ch, TO_CHAR );
              Act( AT_SOCIAL, social->VictimFound, victim, NULL, ch, TO_VICT );
              break;

            case 9:
            case 10:
            case 11:
            case 12:
              Act( AT_ACTION, "$n slaps $N.", victim, NULL, ch, TO_NOTVICT );
              Act( AT_ACTION, "You slap $N.", victim, NULL, ch, TO_CHAR );
              Act( AT_ACTION, "$n slaps you.", victim, NULL, ch, TO_VICT );
              break;
            }
        }
    }

  return true;
}

static void PushSocial( lua_State *L, const Social *social )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", social->Name );
  LuaSetfieldString( L, "CharNoArg", social->CharNoArg );
  LuaSetfieldString( L, "OthersNoArg", social->OthersNoArg );
  LuaSetfieldString( L, "CharFound", social->CharFound );
  LuaSetfieldString( L, "OthersFound", social->OthersFound );
  LuaSetfieldString( L, "VictimFound", social->VictimFound );
  LuaSetfieldString( L, "CharAuto", social->CharAuto );
  LuaSetfieldString( L, "OthersAuto", social->OthersAuto );

  lua_settable( L, -3 );
}

static void PushSocialTable( lua_State *L, const void *userData )
{
  int hash = 0;
  lua_newtable( L );

  for( hash = 0; hash < 27; ++hash )
    {
      const Social *social = NULL;

      for( social = SocialTable[hash]; social; social = social->Next )
	{
	  if ( IsNullOrEmpty( social->Name ) )
            {
              Bug( "SaveSocials: blank social in hash bucket %d", hash );
              continue;
            }

	  PushSocial( L, social );
	}
    }

  lua_setglobal( L, "socials" );
}

void SaveSocials( void )
{
  LuaSaveDataFile( SOCIAL_DATA_FILE, PushSocialTable, "socials", NULL );
}

static int L_SocialEntry( lua_State *L )
{
  int idx = 0;
  Social *social = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );
  idx = lua_gettop( L );
  AllocateMemory( social, Social, 1 );

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "CharNoArg" );
  lua_getfield( L, idx, "OthersNoArg" );
  lua_getfield( L, idx, "CharFound" );
  lua_getfield( L, idx, "OthersFound" );
  lua_getfield( L, idx, "VictimFound" );
  lua_getfield( L, idx, "CharAuto" );
  lua_getfield( L, idx, "OthersAuto" );

  if( !lua_isnil( L, ++idx ) )
    {
      social->Name = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->Name = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->CharNoArg = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->CharNoArg = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->OthersNoArg = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->OthersNoArg = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->CharFound = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->CharFound = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->OthersFound = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->OthersFound = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->VictimFound = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->VictimFound = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->CharAuto = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->CharAuto = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      social->OthersAuto = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      social->OthersAuto = CopyString( "" );
    }

  lua_pop( L, 8 );

  if ( IsNullOrEmpty( social->Name ) )
    {
      Bug( "%s: Name not found", __FUNCTION__ );
      FreeSocial( social );
    }
  else if ( IsNullOrEmpty( social->CharNoArg ) )
    {
      Bug( "%s: CharNoArg not found", __FUNCTION__ );
      FreeSocial( social );
    }
  else
    {
      AddSocial( social );
    }

  return 0;
}

void LoadSocials( void )
{
  LuaLoadDataFile( SOCIAL_DATA_FILE, L_SocialEntry, "SocialEntry" );
}
