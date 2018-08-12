#include <cstring>
#include <strings.h>
#include <cctype>
#include "constants.hpp"
#include "skill.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "script.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

int TopSN = 0;
int TopHerb = 0;

std::array<Skill*, MAX_SKILL> SkillTable;
std::array<Skill*, MAX_SKILL> HerbTable;

extern char *spell_target_name;       /* from magic.c */

static int CompareSkills( Skill **sk1, Skill **sk2 );
static void PushSkillTable( lua_State *L, const void* );
static void PushSkill( lua_State *L, const Skill *skill );
static void PushSkillTeachers( lua_State *L, const Skill *skill );
static int L_SkillEntry( lua_State *L );
static Skill *LoadSkillOrHerb( lua_State *L );
static void PushHerbTable( lua_State *L, const void *userData );

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
bool CheckSkill( Character *ch, const std::string &command, char *argument )
{
  int sn = 0;
  int first = gsn_first_skill;
  int top   = gsn_first_weapon-1;
  struct timeval time_used;
  int mana = 0;

  /* bsearch for the skill */
  for (;;)
    {
      sn = (first + top) >> 1;

      if ( CharToLowercase(command[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(command, SkillTable[sn]->Name)
           && (SkillTable[sn]->SkillFunction || SkillTable[sn]->SpellFunction != spell_null)
           && (IsNpc(ch) || ( ch->PCData->Learned[sn] > 0 )) )
        {
          break;
        }

      if (first >= top)
        {
          return false;
        }

      if (strcasecmp( command.c_str(), SkillTable[sn]->Name) < 1)
        {
          top = sn - 1;
        }
      else
        {
          first = sn + 1;
        }
    }

  if ( !CheckPosition( ch, SkillTable[sn]->Position ) )
    {
      return true;
    }

  if ( IsNpc(ch)
       && (IsAffectedBy( ch, AFF_CHARM ) || IsAffectedBy( ch, AFF_POSSESS )) )
    {
      ch->Echo( "For some reason, you seem unable to perform that...\r\n" );
      Act( AT_GREY,"$n looks around.", ch, NULL, NULL, TO_ROOM );
      return true;
    }

  /* check if mana is required */
  if ( SkillTable[sn]->Mana )
    {
      mana = IsNpc(ch) ? 0 : SkillTable[sn]->Mana;

      if ( !IsNpc(ch) && ch->Mana < mana )
	{
          ch->Echo( "You need to rest before using the Force any more.\r\n" );
          return true;
        }
    }
  else
    {
      mana = 0;
    }

  /*
   * Is this a real do-fun, or a really a spell?
   */
  if ( !SkillTable[sn]->SkillFunction )
    {
      ch_ret retcode = rNONE;
      void *vo = NULL;
      Character *victim = NULL;
      Object *obj = NULL;

      spell_target_name = "";

      switch ( SkillTable[sn]->Target )
        {
        default:
          Log->Bug( "Check_skill: bad target for sn %d.", sn );
          ch->Echo( "Something went wrong...\r\n" );
          return true;

        case TAR_IGNORE:
          vo = NULL;

          if ( IsNullOrEmpty( argument) )
            {
              if ( (victim = GetFightingOpponent(ch)) != NULL )
                {
		  spell_target_name = victim->Name;
                }
            }
          else
            {
              spell_target_name = argument;
            }
          break;

        case TAR_CHAR_OFFENSIVE:
          if ( IsNullOrEmpty( argument )
               && (victim=GetFightingOpponent(ch)) == NULL )
            {
              ch->Echo( "%s who?\r\n", Capitalize( SkillTable[sn]->Name ) );
              return true;
            }
          else if ( !IsNullOrEmpty( argument )
		    && (victim=GetCharacterInRoom(ch, argument)) == NULL )
            {
              ch->Echo( "They aren't here.\r\n" );
              return true;
            }

          if ( IsSafe( ch, victim ) )
            {
              return true;
            }

          vo = (void *) victim;
          break;

        case TAR_CHAR_DEFENSIVE:
          if ( !IsNullOrEmpty( argument )
               &&  (victim=GetCharacterInRoom(ch, argument)) == NULL )
            {
	      ch->Echo( "They aren't here.\r\n" );
              return true;
            }

          if ( !victim )
            {
              victim = ch;
            }

          vo = (void *) victim;
          break;

        case TAR_CHAR_SELF:
          vo = (void *) ch;
          break;

        case TAR_OBJ_INV:
          if ( (obj=GetCarriedObject(ch, argument)) == NULL )
            {
              ch->Echo( "You can't find that.\r\n" );
              return true;
            }

          vo = (void *) obj;
          break;
        }

      /* waitstate */
      SetWaitState( ch, SkillTable[sn]->Beats );

      /* check for failure */
      if ( (GetRandomPercent() + SkillTable[sn]->Difficulty * 5)
           > (IsNpc(ch) ? 75 : ch->PCData->Learned[sn]) )
        {
          FailedCasting( SkillTable[sn], ch, (Character*)vo, obj );
	  LearnFromFailure( ch, sn );

          if ( mana )
            {
              ch->Mana -= mana/2;
            }

          return true;
        }

      if ( mana )
        {
          ch->Mana -= mana;
        }

      StartTimer(&time_used);
      retcode = SkillTable[sn]->SpellFunction( sn, ch->TopLevel, ch, vo );
      StopTimer(&time_used);
      UpdateNumberOfTimesUsed(&time_used, SkillTable[sn]->UseRec);

      if ( retcode == rCHAR_DIED || retcode == rERROR )
        {
          return true;
        }

      if ( CharacterDiedRecently(ch) )
        {
          return true;
        }

      if ( retcode == rSPELL_FAILED )
        {
          LearnFromFailure( ch, sn );
          retcode = rNONE;
        }
      else
        {
          LearnFromSuccess( ch, sn );
        }

      if ( SkillTable[sn]->Target == TAR_CHAR_OFFENSIVE
           && victim != ch
           && !CharacterDiedRecently(victim) )
        {
          Character *vch = NULL;
          Character *vch_next = NULL;

          for ( vch = ch->InRoom->FirstPerson; vch; vch = vch_next )
            {
              vch_next = vch->NextInRoom;

              if ( victim == vch && !victim->Fighting && victim->Master != ch )
                {
                  retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
                  break;
                }
            }
        }

      return true;
    }

  if ( mana )
    {
      ch->Mana -= mana;
    }

  ch->PreviousCommand = ch->LastCommand;    /* haus, for automapping */
  ch->LastCommand = SkillTable[sn]->SkillFunction;
  StartTimer(&time_used);
  SkillTable[sn]->SkillFunction( ch, argument );
  StopTimer(&time_used);
  UpdateNumberOfTimesUsed(&time_used, SkillTable[sn]->UseRec);

  return true;
}

void LearnFromSuccess( Character *ch, int sn )
{
  int adept = 0;
  int gain = 0;
  int sklvl = 0;
  int learn = 0;
  int percent = 0;
  int learn_chance = 0;

  if ( IsNpc(ch) || ch->PCData->Learned[sn] <= 0 )
    {
      return;
    }

  if ( sn == LookupSkill( "meditate" ) && !IsJedi( ch ) )
    {
      if ( ch->PCData->Learned[sn] < 50
	   || ( GetAbilityLevel(ch, FORCE_ABILITY) == 1
		&& ch->Stats.PermFrc > 0 ) )
        {
          GainXP( ch, FORCE_ABILITY, 25 );
        }
    }

  sklvl = SkillTable[sn]->Level;

  if (SkillTable[sn]->Guild < 0 || SkillTable[sn]->Guild >= MAX_ABILITY )
    {
      return;
    }

  adept = ( GetAbilityLevel(ch, SkillTable[sn]->Guild ) - SkillTable[sn]->Level )* 5 + 50;
  adept = umin(adept, 100);

  if ( ch->PCData->Learned[sn] >= adept )
    {
      return;
    }

  if ( sklvl == 0 || sklvl > GetAbilityLevel( ch, SkillTable[sn]->Guild ) )
    {
      sklvl = GetAbilityLevel( ch, SkillTable[sn]->Guild );
    }

  if ( ch->PCData->Learned[sn] < 100 )
    {
      learn_chance = ch->PCData->Learned[sn] + (5 * SkillTable[sn]->Difficulty);
      percent = GetRandomPercent();

      if ( percent >= learn_chance )
        {
          learn = 2;
        }
      else if ( learn_chance - percent > 25 )
        {
          return;
        }
      else
        {
          learn = 1;
        }

      ch->PCData->Learned[sn] = umin( adept, ch->PCData->Learned[sn] + learn );

      if ( ch->PCData->Learned[sn] == 100 )      /* fully learned! */
	{
          gain = 50 * sklvl;
          SetCharacterColor( AT_WHITE, ch );
          ch->Echo( "You are now an adept of %s! You gain %d bonus experience!\r\n",
                    SkillTable[sn]->Name, gain );
        }
      else
        {
          gain = 10 * sklvl;

          if ( !ch->Fighting && sn != gsn_hide && sn != gsn_sneak )
            {
              SetCharacterColor( AT_WHITE, ch );
              ch->Echo( "You gain %d experience points from your success!\r\n", gain );
            }
        }

      GainXP( ch, SkillTable[sn]->Guild, gain );
    }
}

void LearnFromFailure( Character *ch, int sn )
{

}

/*
 * Lookup a skill by name, only stopping at skills the player has.
 */
int ChLookupSkill( const Character *ch, const std::string &name )
{
  int sn = 0;

  if ( IsNpc(ch) )
    {
      return LookupSkill( name );
    }

  for ( sn = 0; sn < TopSN; sn++ )
    {
      if ( !SkillTable[sn]->Name )
        {
          break;
        }

      if ( ch->PCData->Learned[sn] > 0
           && CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           &&!StringPrefix( name, SkillTable[sn]->Name ) )
        {
          return sn;
        }
    }

  return -1;
}

/*
 * Lookup an herb by name.
 */
int LookupHerb( const std::string &name )
{
  int sn = 0;

  for ( sn = 0; sn < TopHerb; sn++ )
    {
      if ( !HerbTable[sn] || !HerbTable[sn]->Name )
        {
          return -1;
        }

      if ( CharToLowercase( name[0] ) == CharToLowercase( HerbTable[sn]->Name[0] )
           && !StringPrefix( name, HerbTable[sn]->Name ) )
        {
          return sn;
        }
    }

  return -1;
}

/*
 * Lookup a skill by name.
 */
int LookupSkill( const std::string &name )
{
  int sn;

  if ( ( sn = BSearchSkill( name, gsn_first_spell, gsn_first_skill - 1 ) ) == -1 )
    {
      if ( ( sn = BSearchSkill( name, gsn_first_skill, gsn_first_weapon - 1 ) ) == -1 )
        {
          if ( ( sn = BSearchSkill( name, gsn_first_weapon, gsn_first_tongue - 1 ) ) == -1 )
            {
              if ( ( sn = BSearchSkill( name, gsn_first_tongue, gsn_TopSN - 1 ) ) == -1
                   && gsn_TopSN < TopSN )
                {
                  for ( sn = gsn_TopSN; sn < TopSN; sn++ )
                    {
                      if ( !SkillTable[sn] || !SkillTable[sn]->Name )
                        {
                          return -1;
                        }

                      if ( CharToLowercase( name[0] ) == CharToLowercase( SkillTable[sn]->Name[0] )
                           &&!StringPrefix( name, SkillTable[sn]->Name ) )
                        {
                          return sn;
                        }
                    }

                  return -1;
		}
            }
        }
    }

  return sn;
}

/*
 * Return a skilltype pointer based on sn                       -Thoric
 * Returns NULL if bad, unused or personal sn.
 */
Skill *GetSkill( int sn )
{
  if ( sn >= TYPE_PERSONAL )
    {
      return NULL;
    }

  if ( sn >= TYPE_HERB )
    {
      return IS_VALID_HERB(sn-TYPE_HERB) ? HerbTable[sn-TYPE_HERB] : NULL;
    }

  if ( sn >= TYPE_HIT )
    {
      return NULL;
    }

  return IS_VALID_SN(sn) ? SkillTable[sn] : NULL;
}

/*
 * Perform a binary search on a section of the skill table      -Thoric
 * Each different section of the skill table is sorted alphabetically
 */
int BSearchSkill( const std::string &name, int first, int top )
{
  for (;;)
    {
      int sn = (first + top) >> 1;

      if ( CharToLowercase( name[0] ) == CharToLowercase( SkillTable[sn]->Name[0] )
           && !StringPrefix( name, SkillTable[sn]->Name ) )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp(name.c_str(), SkillTable[sn]->Name) < 1)
        {
          top = sn - 1;
        }
      else
        {
          first = sn + 1;
	}
    }

  return -1;
}

/*
 * Perform a binary search on a section of the skill table      -Thoric
 * Each different section of the skill table is sorted alphabetically
 * Check for exact matches only
 */
int BSearchSkillExact( const std::string &name, int first, int top )
{
  for (;;)
    {
      int sn = (first + top) >> 1;

      if ( !StringPrefix(name, SkillTable[sn]->Name) )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp(name.c_str(), SkillTable[sn]->Name) < 1)
        {
          top = sn - 1;
        }
      else
        {
          first = sn + 1;
        }
    }

  return -1;
}

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
int ChBSearchSkill( const Character *ch, const std::string &name, int first, int top )
{
  for (;;)
    {
      int sn = (first + top) >> 1;

      if ( CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(name, SkillTable[sn]->Name)
           && ch->PCData->Learned[sn] > 0 )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp( name.c_str(), SkillTable[sn]->Name) < 1)
        {
          top = sn - 1;
        }
      else
        {
          first = sn + 1;
	}
    }

  return -1;
}

/*
 * Lookup a skill by slot number.
 * Used for object loading.
 */
int SkillNumberFromSlot( int slot )
{
  int sn = 0;

  if ( slot <= 0 )
    {
      return -1;
    }

  for ( sn = 0; sn < TopSN; sn++ )
    {
      if ( slot == SkillTable[sn]->Slot )
        {
          return sn;
        }
    }

  if ( fBootDb )
    {
      Log->Bug( "%s: bad slot %d.", __FUNCTION__, slot );
      abort();
    }

  return -1;
}

/*
 * Sort the skill table with qsort
 */
void SortSkillTable( void )
{
  Log->Info( "Sorting skill table..." );
  qsort( &SkillTable[1], TopSN-1, sizeof( Skill * ),
         (int(*)(const void *, const void *)) CompareSkills );
}

/*
 * Function used by qsort to sort skills
 */
static int CompareSkills( Skill **sk1, Skill **sk2 )
{
  Skill *skill1 = (*sk1);
  Skill *skill2 = (*sk2);

  if ( !skill1 && skill2 )
    {
      return 1;
    }

  if ( skill1 && !skill2 )
    {
      return -1;
    }

  if ( !skill1 && !skill2 )
    {
      return 0;
    }

  if ( skill1->Type < skill2->Type )
    {
      return -1;
    }

  if ( skill1->Type > skill2->Type )
    {
      return 1;
    }

  return strcasecmp( skill1->Name, skill2->Name );
}

static void PushSkillTeachers( lua_State *L, const Skill *skill )
{
  if( !IsNullOrEmpty( skill->Teachers ) )
    {
      char buf[MAX_STRING_LENGTH];
      char *teacherList = buf;
      strcpy( teacherList, skill->Teachers );

      lua_pushstring( L, "Teachers" );
      lua_newtable( L );

      while( !IsNullOrEmpty( teacherList ) )
	{
	  const ProtoMobile *mobile = NULL;
	  char teacher[MAX_STRING_LENGTH];
	  vnum_t vnum = INVALID_VNUM;

	  teacherList = OneArgument( teacherList, teacher );
	  vnum = atoi( teacher );
	  mobile = GetProtoMobile( vnum );

	  if( mobile )
	    {
	      lua_pushinteger( L, vnum );
	      lua_pushstring( L, mobile->Name );
	      lua_settable( L, -3 );
	    }
	}

      lua_settable( L, -3 );
    }
}

void PushSkillMessages( lua_State *L, const Skill *skill )
{
  lua_pushstring( L, "Messages" );
  lua_newtable( L );
  {
    if( !IsNullOrEmpty( skill->Messages.NounDamage ))
      {
	LuaSetfieldString( L, "NounDamage", skill->Messages.NounDamage );
      }

    if( !IsNullOrEmpty( skill->Messages.WearOff ))
      {
	LuaSetfieldString( L, "WearOff", skill->Messages.WearOff );
      }

    lua_pushstring( L, "Success" );
    lua_newtable( L );
    {
      if( !IsNullOrEmpty( skill->Messages.Success.ToCaster ))
	{
	  LuaSetfieldString( L, "ToCaster", skill->Messages.Success.ToCaster );
	}

      if( !IsNullOrEmpty( skill->Messages.Success.ToVictim ))
	{
	  LuaSetfieldString( L, "ToVictim", skill->Messages.Success.ToVictim );
	}

      if( !IsNullOrEmpty( skill->Messages.Success.ToRoom) )
	{
	  LuaSetfieldString( L, "ToRoom", skill->Messages.Success.ToRoom );
	}
    }
    lua_settable( L, -3 );

    lua_pushstring( L, "Failure" );
    lua_newtable( L );
    {
      if( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ))
        {
          LuaSetfieldString( L, "ToCaster", skill->Messages.Failure.ToCaster );
        }

      if( !IsNullOrEmpty( skill->Messages.Failure.ToVictim ))
        {
          LuaSetfieldString( L, "ToVictim", skill->Messages.Failure.ToVictim );
        }

      if( !IsNullOrEmpty( skill->Messages.Failure.ToRoom) )
        {
          LuaSetfieldString( L, "ToRoom", skill->Messages.Failure.ToRoom );
        }
    }
    lua_settable( L, -3 );

    lua_pushstring( L, "VictimDeath" );
    lua_newtable( L );
    {
      if( !IsNullOrEmpty( skill->Messages.VictimDeath.ToCaster ))
        {
          LuaSetfieldString( L, "ToCaster", skill->Messages.VictimDeath.ToCaster );
        }

      if( !IsNullOrEmpty( skill->Messages.VictimDeath.ToVictim ))
        {
          LuaSetfieldString( L, "ToVictim", skill->Messages.VictimDeath.ToVictim );
        }

      if( !IsNullOrEmpty( skill->Messages.VictimDeath.ToRoom) )
        {
          LuaSetfieldString( L, "ToRoom", skill->Messages.VictimDeath.ToRoom );
        }
    }
    lua_settable( L, -3 );

    lua_pushstring( L, "VictimImmune" );
    lua_newtable( L );
    {
      if( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ))
        {
          LuaSetfieldString( L, "ToCaster", skill->Messages.VictimImmune.ToCaster );
        }

      if( !IsNullOrEmpty( skill->Messages.VictimImmune.ToVictim ))
        {
          LuaSetfieldString( L, "ToVictim", skill->Messages.VictimImmune.ToVictim );
        }

      if( !IsNullOrEmpty( skill->Messages.VictimImmune.ToRoom) )
        {
          LuaSetfieldString( L, "ToRoom", skill->Messages.VictimImmune.ToRoom );
        }
    }
    lua_settable( L, -3 );
  }

  lua_settable( L, -3 );
}

static void PushSkill( lua_State *L, const Skill *skill )
{
  static int idx = 0;
  lua_pushinteger( L, ++idx );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", skill->Name );
  LuaSetfieldString( L, "Ability",
		     skill->Guild > ABILITY_NONE && skill->Guild < MAX_ABILITY
		     ? AbilityName[skill->Guild] : "none" );
  LuaSetfieldString( L, "Position", PositionName[skill->Position] );
  LuaSetfieldString( L, "Type", SkillTypeName[skill->Type] );

  if( skill->SpellFunction || skill->SkillFunction )
    {
      LuaSetfieldString( L, "Function", skill->FunctionName );
    }

  LuaSetfieldString( L, "Target", SpellTargetName[skill->Target] );

  if( skill->Slot )
    {
      LuaSetfieldNumber( L, "Slot", skill->Slot );
    }

  if( skill->Mana )
    {
      LuaSetfieldNumber( L, "Mana", skill->Mana );
    }

  if( skill->Beats )
    {
      LuaSetfieldNumber( L, "Beats", skill->Beats );
    }

  if( skill->Level && skill->Type != SKILL_HERB )
    {
      LuaSetfieldNumber( L, "Level", skill->Level );
    }

  if( skill->Dice )
    {
      LuaSetfieldString( L, "Dice", skill->Dice );
    }

  if( skill->Value )
    {
      LuaSetfieldNumber( L, "Value", skill->Value );
    }

  if( skill->Saves )
    {
      LuaSetfieldString( L, "Saves", SpellSaveName[skill->Saves] );
    }

  if( skill->Difficulty )
    {
      LuaSetfieldNumber( L, "Difficulty", skill->Difficulty );
    }

  if( skill->Participants )
    {
      LuaSetfieldNumber( L, "Participants", skill->Participants );
    }

  if( skill->Alignment )
    {
      LuaSetfieldNumber( L, "Alignment", skill->Alignment );
    }

  LuaPushFlags( L, skill->Flags, SpellFlag, "Flags" );
  PushSkillTeachers( L, skill );
  LuaPushSmaugAffects( L, skill->Affects );
  PushSkillMessages( L, skill );
  lua_settable( L, -3 );
}

static void PushSkillTable( lua_State *L, const void *userData )
{
  int sn = 0;
  lua_newtable( L );

  for( sn = 0; sn < TopSN; ++sn )
    {
      const Skill *skill = SkillTable[sn];

      if( !IsNullOrEmpty( skill->Name ) )
	{
	  PushSkill( L, skill );
	}
    }

  lua_setglobal( L, "skills" );
}

void SaveSkills( void )
{
  LuaSaveDataFile( SKILL_DATA_FILE, PushSkillTable, "skills", NULL );
}

static void LoadSkillTeachers( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Teachers" );

  if( !lua_isnil( L, ++idx ) )
    {
      bool first = true;
      char buf[MAX_STRING_LENGTH] = { '\0' };

      lua_pushnil( L );

      while( lua_next( L, -2 ) )
        {
          vnum_t vnum = lua_tointeger( L, -2 );

	  if( !first )
	    {
	      strcat( buf, " " );
	    }
	  else
	    {
	      first = false;
	    }

	  strcat( buf, std::to_string( vnum ).c_str() );

	  lua_pop( L, 1 );
        }

      if( skill->Teachers )
	{
	  FreeMemory( skill->Teachers );
	}

      skill->Teachers = CopyString( buf );
    }

  lua_pop( L, 1 );
}

static void LoadBasicMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "NounDamage" );
  lua_getfield( L, idx, "WearOff" );

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Messages.NounDamage = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      skill->Messages.NounDamage = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Messages.WearOff = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      skill->Messages.WearOff = CopyString( "" );
    }

  lua_pop( L, 2 );
}

static void LoadSuccessMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Success" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );

      lua_getfield( L, sub_idx, "ToCaster" );
      lua_getfield( L, sub_idx, "ToVictim" );
      lua_getfield( L, sub_idx, "ToRoom" );

      if( !lua_isnil( L, ++sub_idx ) )
	{
	  skill->Messages.Success.ToCaster = CopyString( lua_tostring( L, sub_idx ) );
	}
      else
	{
	  skill->Messages.Success.ToCaster = CopyString( "" );
	}

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.Success.ToVictim = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.Success.ToVictim = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.Success.ToRoom = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.Success.ToRoom = CopyString( "" );
        }

      lua_pop( L, 3 );
    }
  else
    {
      Log->Bug( "%s: Couldn't get Success messages", __FUNCTION__ );
    }

  lua_pop( L, 1 );
}

static void LoadFailureMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Failure" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );

      lua_getfield( L, sub_idx, "ToCaster" );
      lua_getfield( L, sub_idx, "ToVictim" );
      lua_getfield( L, sub_idx, "ToRoom" );

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.Failure.ToCaster = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.Failure.ToCaster = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.Failure.ToVictim = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.Failure.ToVictim = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.Failure.ToRoom = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
	  skill->Messages.Failure.ToRoom = CopyString( "" );
        }

      lua_pop( L, 3 );
    }

  lua_pop( L, 1 );
}

static void LoadVictimDeathMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "VictimDeath" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );

      lua_getfield( L, sub_idx, "ToCaster" );
      lua_getfield( L, sub_idx, "ToVictim" );
      lua_getfield( L, sub_idx, "ToRoom" );

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimDeath.ToCaster = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.VictimDeath.ToCaster = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimDeath.ToVictim = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.VictimDeath.ToVictim = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimDeath.ToRoom = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
	  skill->Messages.VictimDeath.ToRoom = CopyString( "" );
        }

      lua_pop( L, 3 );
    }

  lua_pop( L, 1 );
}

static void LoadVictimImmuneMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "VictimImmune" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );

      lua_getfield( L, sub_idx, "ToCaster" );
      lua_getfield( L, sub_idx, "ToVictim" );
      lua_getfield( L, sub_idx, "ToRoom" );

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimImmune.ToCaster = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.VictimImmune.ToCaster = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimImmune.ToVictim = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
          skill->Messages.VictimImmune.ToVictim = CopyString( "" );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          skill->Messages.VictimImmune.ToRoom = CopyString( lua_tostring( L, sub_idx ) );
        }
      else
        {
	  skill->Messages.VictimImmune.ToRoom = CopyString( "" );
        }

      lua_pop( L, 3 );
    }

  lua_pop( L, 1 );
}

static void LoadSkillMessages( lua_State *L, Skill *skill )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Messages" );

  if( !lua_isnil( L, ++idx ) )
    {
      LoadBasicMessages( L, skill );
      LoadSuccessMessages( L, skill );
      LoadFailureMessages( L, skill );
      LoadVictimDeathMessages( L, skill );
      LoadVictimImmuneMessages( L, skill );
    }

  lua_pop( L, 1 );
}

static int L_SkillEntry( lua_State *L )
{
  Skill *skill = LoadSkillOrHerb( L );

  if( skill )
    {
      if ( TopSN >= MAX_SKILL )
	{
	  Log->Bug( "%s: more skills than MAX_SKILL %d", __FUNCTION__, MAX_SKILL );
	  abort();
	}

      SkillTable[TopSN++] = skill;
    }

  return 0;
}

static Skill *LoadSkillOrHerb( lua_State *L )
{
  int idx = lua_gettop( L );
  Skill *skill = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "Ability" );
  lua_getfield( L, idx, "Position" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "Function" );
  lua_getfield( L, idx, "Target" );
  lua_getfield( L, idx, "Slot" );
  lua_getfield( L, idx, "Mana" );
  lua_getfield( L, idx, "Beats" );
  lua_getfield( L, idx, "Level" );
  lua_getfield( L, idx, "Dice" );
  lua_getfield( L, idx, "Value" );
  lua_getfield( L, idx, "Saves" );
  lua_getfield( L, idx, "Difficulty" );
  lua_getfield( L, idx, "Participants" );
  lua_getfield( L, idx, "Alignment" );

  if( !lua_isnil( L, ++idx ) )
    {
      AllocateMemory( skill, Skill, 1 );
      AllocateMemory( skill->UseRec, struct timerset, 1 );
      skill->Name = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      Log->Bug( "%s: Found skill without name", __FUNCTION__ );
      return NULL;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Guild = GetAbility( lua_tostring( L, idx ) );

      if( skill->Guild >= MAX_ABILITY )
	{
	  skill->Guild = ABILITY_NONE;
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Position = GetPosition( lua_tostring( L, idx ) );

      if( skill->Position < POS_DEAD || skill->Position >= MAX_POSITION )
	{
	  skill->Position = DEFAULT_POSITION;
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Type = GetSkillType( lua_tostring( L, idx ) );

      if( skill->Type < SKILL_UNKNOWN || skill->Type > SKILL_HERB )
	{
	  Log->Bug( "%s: Invalid skill type: %d", __FUNCTION__, skill->Type );
	  skill->Type = SKILL_UNKNOWN;
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *funName = lua_tostring( L, idx );
      SpellFun *spellfun = NULL;
      CmdFun *dofun = NULL;

      if( ( spellfun = GetSpellFunction( funName ) ) != spell_notfound
	  && !StringPrefix( "spell_", funName ) )
	{
	  skill->SpellFunction = spellfun;
	  skill->FunctionName = CopyString( funName );
	}
      else if( ( dofun = GetSkillFunction( funName ) ) != skill_notfound
	       && !StringPrefix( "do_", funName ) )
	{
	  skill->SkillFunction = dofun;
	  skill->FunctionName = CopyString( funName );
	}
      else
	{
	  Log->Bug( "%s: unknown skill/spell code %s", __FUNCTION__, funName );
	  skill->FunctionName = CopyString( "" );
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Target = (SkillTargetType)GetSpellTarget( lua_tostring( L, idx ) );

      if( skill->Target < TAR_IGNORE || skill->Target > TAR_OBJ_INV )
	{
	  skill->Target = TAR_IGNORE;
	}
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Slot = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Mana = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Beats = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Level = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Dice = CopyString( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Value = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Saves = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Difficulty = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Participants = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      skill->Alignment = lua_tointeger( L, idx );
    }

  lua_pop( L, lua_gettop( L ) - 1 );

  skill->Flags = LuaLoadFlags( L, "Flags" ); 
  LoadSkillTeachers( L, skill );
  skill->Affects = LuaLoadSmaugAffects( L );
  LoadSkillMessages( L, skill );

  return skill;
}

static int L_HerbEntry( lua_State *L )
{
  Skill *herb = LoadSkillOrHerb( L );

  if( herb )
    {
      if ( TopHerb >= MAX_HERB )
        {
          Log->Bug( "%s: more herbs than MAX_HERB %d", __FUNCTION__, MAX_HERB );
          abort();
        }

      HerbTable[TopHerb++] = herb;
    }

  return 0;
}

void LoadSkills( void )
{
  LuaLoadDataFile( SKILL_DATA_FILE, L_SkillEntry, "SkillEntry" );
}

static void PushHerbTable( lua_State *L, const void *userData )
{
  int sn = 0;
  lua_newtable( L );

  for( sn = 0; sn < TopHerb; ++sn )
    {
      const Skill *herb = HerbTable[sn];

      if( !IsNullOrEmpty( herb->Name ) )
	{
	  PushSkill( L, herb );
	}
    }

  lua_setglobal( L, "herbs" );
}

void SaveHerbs( void )
{
  LuaSaveDataFile( HERB_DATA_FILE, PushHerbTable, "herbs", NULL );
}

void LoadHerbs( void )
{
  LuaLoadDataFile( HERB_DATA_FILE, L_HerbEntry, "HerbEntry" );
}

