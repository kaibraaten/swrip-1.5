#include <ctype.h>
#include "social.h"
#include "mud.h"
#include "character.h"
#include "script.h"

#define OLD_SOCIAL_FILE SYSTEM_DIR "socials.dat"
#define SOCIAL_DATA_FILE     SYSTEM_DIR "socials.lua"

Social *SocialTable[27];

static void PushSocialTable( lua_State *L );
static void PushSocial( lua_State *L, const Social *social );

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
      SocialTable[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( social == tmp_next )
        {
          tmp->next = tmp_next->next;
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
      social->next = SocialTable[hash];
      SocialTable[hash] = social;
      return;
    }

  for ( ; tmp; tmp = tmp->next )
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
                social->next = SocialTable[hash];
                SocialTable[hash] = social;
                return;
              }
            prev->next = social;
            social->next = tmp;
            return;
          }
      prev = tmp;
    }

  /* add to end */
  prev->next = social;
  social->next = NULL;
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

  for ( social = SocialTable[hash]; social; social = social->next )
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

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_NO_EMOTE) )
    {
      SendToCharacter( "You are anti-social!\r\n", ch );
      return true;
    }

  switch ( ch->position )
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

    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
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
              if ( !IsBitSet(ch->in_room->room_flags, ROOM_SAFE )
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

static void PushSocialTable( lua_State *L )
{
  int hash = 0;
  lua_newtable( L );

  for( hash = 0; hash < 27; ++hash )
    {
      const Social *social = NULL;

      for( social = SocialTable[hash]; social; social = social->next )
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
  LuaSaveDataFile( SOCIAL_DATA_FILE, PushSocialTable, "socials" );
}

/*
 * Save the socials to disk
 */
void OldSaveSocials( void )
{
  FILE *fpout = NULL;
  const Social *social = NULL;
  int x = 0;

  if ( (fpout=fopen( OLD_SOCIAL_FILE, "w" )) == NULL )
    {
      Bug( "Cannot open socials.dat for writting", 0 );
      perror( OLD_SOCIAL_FILE );
      return;
    }

  for ( x = 0; x < 27; x++ )
    {
      for ( social = SocialTable[x]; social; social = social->next )
        {
          if ( !social->Name || social->Name[0] == '\0' )
            {
	      Bug( "Save_socials: blank social in hash bucket %d", x );
              continue;
            }

          fprintf( fpout, "#SOCIAL\n" );
          fprintf( fpout, "Name        %s~\n", social->Name );

          if ( social->CharNoArg )
            {
              fprintf( fpout, "CharNoArg   %s~\n", social->CharNoArg );
            }
          else
            {
              Bug( "Save_socials: NULL CharNoArg in hash bucket %d", x );
            }

          if ( social->OthersNoArg )
            {
              fprintf( fpout, "OthersNoArg %s~\n", social->OthersNoArg );
            }

          if ( social->CharFound )
            {
              fprintf( fpout, "CharFound   %s~\n", social->CharFound );
            }

          if ( social->OthersFound )
            {
              fprintf( fpout, "OthersFound %s~\n", social->OthersFound );
            }

          if ( social->VictimFound )
            {
              fprintf( fpout, "VictFound   %s~\n", social->VictimFound );
            }

	  if ( social->CharAuto )
            {
              fprintf( fpout, "CharAuto    %s~\n", social->CharAuto );
            }

          if ( social->OthersAuto )
            {
              fprintf( fpout, "OthersAuto  %s~\n", social->OthersAuto );
            }

          fprintf( fpout, "End\n\n" );
        }
    }

  fprintf( fpout, "#END\n" );
  fclose( fpout );
}

static void ReadSocial( FILE *fp )
{
  Social *social = NULL;

  AllocateMemory( social, Social, 1 );

  for ( ;; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'C':
	  KEY( "CharNoArg",     social->CharNoArg,    ReadStringToTilde(fp) );
          KEY( "CharFound",     social->CharFound,     ReadStringToTilde(fp) );
          KEY( "CharAuto",      social->CharAuto,      ReadStringToTilde(fp) );
          break;

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if ( !social->Name )
                {
                  Bug( "%s: Name not found", __FUNCTION__ );
                  FreeSocial( social );
                  return;
                }

              if ( !social->CharNoArg )
                {
                  Bug( "%s: CharNoArg not found", __FUNCTION__ );
                  FreeSocial( social );
                  return;
                }

              AddSocial( social );
              return;
            }
          break;

        case 'N':
          KEY( "Name",  social->Name,           ReadStringToTilde(fp) );
          break;

        case 'O':
          KEY( "OthersNoArg",   social->OthersNoArg,  ReadStringToTilde(fp) );
          KEY( "OthersFound",   social->OthersFound,   ReadStringToTilde(fp) );
          KEY( "OthersAuto",    social->OthersAuto,    ReadStringToTilde(fp) );
	  break;

        case 'V':
          KEY( "VictFound",     social->VictimFound,     ReadStringToTilde(fp) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }
}

void LoadSocials( void )
{
  FILE *fp = NULL;

  if ( ( fp = fopen( OLD_SOCIAL_FILE, "r" ) ) != NULL )
    {
      top_sn = 0;

      for ( ;; )
        {
          const char *word = NULL;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

	  if ( letter != '#' )
            {
              Bug( "Load_socials: # not found." );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "SOCIAL" ) )
            {
              ReadSocial( fp );
              continue;
            }
          else if ( !StrCmp( word, "END" ) )
            {
              break;
            }
          else
            {
              Bug( "Load_socials: bad section." );
              continue;
            }
        }

      fclose( fp );
    }
  else
    {
      Bug( "Cannot open socials.dat", 0 );
      exit(0);
    }
}
