#include <string.h>
#include <strings.h>
#include <ctype.h>
#include "constants.h"
#include "skill.h"
#include "mud.h"
#include "character.h"
#include "script.h"

int TopSN = 0;
int TopHerb = 0;

Skill *SkillTable[MAX_SKILL];
Skill *HerbTable[MAX_HERB];

extern char *spell_target_name;       /* from magic.c */

static int CompareSkills( Skill **sk1, Skill **sk2 );
static void PushSkillTable( lua_State *L );
static void PushSkill( lua_State *L, const Skill *skill );
static void PushSkillTeachers( lua_State *L, const Skill *skill );

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
bool CheckSkill( Character *ch, const char *command, char *argument )
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
           && (IsNpc(ch) || ( ch->pcdata->learned[sn] > 0 )) )
        {
          break;
        }

      if (first >= top)
        {
          return false;
        }

      if (strcasecmp( command, SkillTable[sn]->Name) < 1)
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
      SendToCharacter( "For some reason, you seem unable to perform that...\r\n", ch );
      Act( AT_GREY,"$n looks around.", ch, NULL, NULL, TO_ROOM );
      return true;
    }

  /* check if mana is required */
  if ( SkillTable[sn]->MinimumMana )
    {
      mana = IsNpc(ch) ? 0 : SkillTable[sn]->MinimumMana;

      if ( !IsNpc(ch) && ch->mana < mana )
	{
          SendToCharacter( "You need to rest before using the Force any more.\r\n", ch );
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
          Bug( "Check_skill: bad target for sn %d.", sn );
          SendToCharacter( "Something went wrong...\r\n", ch );
          return true;

        case TAR_IGNORE:
          vo = NULL;

          if ( argument[0] == '\0' )
            {
              if ( (victim = GetFightingOpponent(ch)) != NULL )
                {
		  spell_target_name = victim->name;
                }
            }
          else
            {
              spell_target_name = argument;
            }
          break;

        case TAR_CHAR_OFFENSIVE:
          if ( argument[0] == '\0'
               && (victim=GetFightingOpponent(ch)) == NULL )
            {
              Echo( ch, "%s who?\r\n", Capitalize( SkillTable[sn]->Name ) );
              return true;
            }
          else  if ( argument[0] != '\0'
                     && (victim=GetCharacterInRoom(ch, argument)) == NULL )
            {
              SendToCharacter( "They aren't here.\r\n", ch );
              return true;
            }

          if ( IsSafe( ch, victim ) )
            {
              return true;
            }

          vo = (void *) victim;
          break;

        case TAR_CHAR_DEFENSIVE:
          if ( argument[0] != '\0'
               &&  (victim=GetCharacterInRoom(ch, argument)) == NULL )
            {
	      SendToCharacter( "They aren't here.\r\n", ch );
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
              SendToCharacter( "You can't find that.\r\n", ch );
              return true;
            }

          vo = (void *) obj;
          break;
        }

      /* waitstate */
      SetWaitState( ch, SkillTable[sn]->Beats );

      /* check for failure */
      if ( (GetRandomPercent() + SkillTable[sn]->Difficulty * 5)
           > (IsNpc(ch) ? 75 : ch->pcdata->learned[sn]) )
        {
          FailedCasting( SkillTable[sn], ch, vo, obj );
	  LearnFromFailure( ch, sn );

          if ( mana )
            {
              ch->mana -= mana/2;
            }

          return true;
        }

      if ( mana )
        {
          ch->mana -= mana;
        }

      StartTimer(&time_used);
      retcode = SkillTable[sn]->SpellFunction( sn, ch->top_level, ch, vo );
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

          for ( vch = ch->in_room->first_person; vch; vch = vch_next )
            {
              vch_next = vch->next_in_room;

              if ( victim == vch && !victim->fighting && victim->master != ch )
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
      ch->mana -= mana;
    }

  ch->prev_cmd = ch->last_cmd;    /* haus, for automapping */
  ch->last_cmd = SkillTable[sn]->SkillFunction;
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

  if ( IsNpc(ch) || ch->pcdata->learned[sn] <= 0 )
    {
      return;
    }

  if ( sn == LookupSkill( "meditate" ) && !IsJedi( ch ) )
    {
      if ( ch->pcdata->learned[sn] < 50 )
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

  if ( ch->pcdata->learned[sn] >= adept )
    {
      return;
    }

  if ( sklvl == 0 || sklvl > GetAbilityLevel( ch, SkillTable[sn]->Guild ) )
    {
      sklvl = GetAbilityLevel( ch, SkillTable[sn]->Guild );
    }

  if ( ch->pcdata->learned[sn] < 100 )
    {
      learn_chance = ch->pcdata->learned[sn] + (5 * SkillTable[sn]->Difficulty);
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

      ch->pcdata->learned[sn] = umin( adept, ch->pcdata->learned[sn] + learn );

      if ( ch->pcdata->learned[sn] == 100 )      /* fully learned! */
	{
          gain = 50 * sklvl;
          SetCharacterColor( AT_WHITE, ch );
          Echo( ch, "You are now an adept of %s! You gain %d bonus experience!\r\n",
		SkillTable[sn]->Name, gain );
        }
      else
        {
          gain = 10 * sklvl;

          if ( !ch->fighting && sn != gsn_hide && sn != gsn_sneak )
            {
              SetCharacterColor( AT_WHITE, ch );
              Echo( ch, "You gain %d experience points from your success!\r\n", gain );
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
int ChLookupSkill( const Character *ch, const char *name )
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

      if ( ch->pcdata->learned[sn] > 0
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
int LookupHerb( const char *name )
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
int LookupSkill( const char *name )
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
int BSearchSkill( const char *name, int first, int top )
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

      if (strcasecmp(name, SkillTable[sn]->Name) < 1)
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
int BSearchSkillExact( const char *name, int first, int top )
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

      if (strcasecmp(name, SkillTable[sn]->Name) < 1)
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
int ChBSearchSkill( const Character *ch, const char *name, int first, int top )
{
  for (;;)
    {
      int sn = (first + top) >> 1;

      if ( CharToLowercase(name[0]) == CharToLowercase(SkillTable[sn]->Name[0])
           && !StringPrefix(name, SkillTable[sn]->Name)
           && ch->pcdata->learned[sn] > 0 )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp( name, SkillTable[sn]->Name) < 1)
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
  extern bool fBootDb;
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
      Bug( "%s: bad slot %d.", __FUNCTION__, slot );
      abort();
    }

  return -1;
}

skill_types GetSkillType( const char *skilltype )
{
  if ( !StrCmp( skilltype, "Spell" ) )
    {
      return SKILL_SPELL;
    }

  if ( !StrCmp( skilltype, "Skill" ) )
    {
      return SKILL_SKILL;
    }

  if ( !StrCmp( skilltype, "Weapon" ) )
    {
      return SKILL_WEAPON;
    }

  if ( !StrCmp( skilltype, "Tongue" ) )
    {
      return SKILL_TONGUE;
    }

  if ( !StrCmp( skilltype, "Herb" ) )
    {
      return SKILL_HERB;
    }

  return SKILL_UNKNOWN;
}

/*
 * Sort the skill table with qsort
 */
void SortSkillTable( void )
{
  LogPrintf( "Sorting skill table..." );
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
	      lua_pushstring( L, mobile->name );
	      lua_settable( L, -3 );
	    }
	}

      lua_settable( L, -3 );
    }
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

  if( skill->SpellFunction )
    {
      LuaSetfieldString( L, "SpellFunction", skill->FunctionName );
    }

  LuaSetfieldString( L, "Target", SpellTargetName[skill->Target] );

  if( skill->Slot )
    {
      LuaSetfieldNumber( L, "Slot", skill->Slot );
    }

  if( skill->MinimumMana )
    {
      LuaSetfieldNumber( L, "Mana", skill->MinimumMana );
    }

  if( skill->Beats )
    {
      LuaSetfieldNumber( L, "Beats", skill->Beats );
    }

  if( skill->Level )
    {
      LuaSetfieldNumber( L, "Level", skill->Level );
    }

  if( skill->Dice )
    {
      LuaSetfieldString( L, "Dice", skill->Dice );
    }

  if( skill->MiscValue )
    {
      LuaSetfieldNumber( L, "Value", skill->MiscValue );
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
  lua_settable( L, -3 );
}

static void PushSkillTable( lua_State *L )
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
  LuaSaveDataFile( SKILL_DATA_FILE, PushSkillTable, "skills" );
}

void SaveHerbs( void )
{

}
