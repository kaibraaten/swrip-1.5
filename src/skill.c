#include <strings.h>
#include <ctype.h>
#include "constants.h"
#include "skill.h"
#include "mud.h"
#include "character.h"

int top_sn = 0;
int top_herb = 0;

Skill *skill_table[MAX_SKILL];
Skill *herb_table[MAX_HERB];

extern char *spell_target_name;       /* from magic.c */

static int CompareSkills( Skill **sk1, Skill **sk2 );

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

      if ( CharToLowercase(command[0]) == CharToLowercase(skill_table[sn]->name[0])
           &&  !StringPrefix(command, skill_table[sn]->name)
           &&  (skill_table[sn]->skill_fun || skill_table[sn]->spell_fun != spell_null)
           &&  (IsNpc(ch)
                ||  ( ch->pcdata->learned[sn] > 0 )) )
        {
          break;
        }

      if (first >= top)
        {
          return false;
        }

      if (strcasecmp( command, skill_table[sn]->name) < 1)
        {
          top = sn - 1;
        }
      else
        {
          first = sn + 1;
        }
    }

  if ( !CheckPosition( ch, skill_table[sn]->minimum_position ) )
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
  if ( skill_table[sn]->min_mana )
    {
      mana = IsNpc(ch) ? 0 : skill_table[sn]->min_mana;

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
  if ( !skill_table[sn]->skill_fun )
    {
      ch_ret retcode = rNONE;
      void *vo = NULL;
      Character *victim = NULL;
      Object *obj = NULL;

      spell_target_name = "";

      switch ( skill_table[sn]->target )
        {
        default:
          Bug( "Check_skill: bad target for sn %d.", sn );
          SendToCharacter( "Something went wrong...\r\n", ch );
          return true;

        case TAR_IGNORE:
          vo = NULL;
          if ( argument[0] == '\0' )
            {
              if ( (victim=GetFightingOpponent(ch)) != NULL )
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
              Echo( ch, "%s who?\r\n", Capitalize( skill_table[sn]->name ) );
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
      SetWaitState( ch, skill_table[sn]->beats );

      /* check for failure */
      if ( (GetRandomPercent() + skill_table[sn]->difficulty * 5)
           > (IsNpc(ch) ? 75 : ch->pcdata->learned[sn]) )
        {
          FailedCasting( skill_table[sn], ch, vo, obj );
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
      retcode = skill_table[sn]->spell_fun( sn, ch->top_level, ch, vo );
      StopTimer(&time_used);
      UpdateNumberOfTimesUsed(&time_used, skill_table[sn]->userec);

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

      if ( skill_table[sn]->target == TAR_CHAR_OFFENSIVE
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
  ch->last_cmd = skill_table[sn]->skill_fun;
  StartTimer(&time_used);
  skill_table[sn]->skill_fun( ch, argument );
  StopTimer(&time_used);
  UpdateNumberOfTimesUsed(&time_used, skill_table[sn]->userec);

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

  sklvl = skill_table[sn]->min_level;

  if (skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
    {
      return;
    }

  adept = ( GetAbilityLevel(ch, skill_table[sn]->guild ) - skill_table[sn]->min_level )* 5 + 50;
  adept = umin(adept, 100);

  if ( ch->pcdata->learned[sn] >= adept )
    {
      return;
    }

  if ( sklvl == 0 || sklvl > GetAbilityLevel( ch, skill_table[sn]->guild ) )
    {
      sklvl = GetAbilityLevel( ch, skill_table[sn]->guild );
    }

  if ( ch->pcdata->learned[sn] < 100 )
    {
      learn_chance = ch->pcdata->learned[sn] + (5 * skill_table[sn]->difficulty);
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
		skill_table[sn]->name, gain );
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

      GainXP( ch, skill_table[sn]->guild, gain );
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

  for ( sn = 0; sn < top_sn; sn++ )
    {
      if ( !skill_table[sn]->name )
        {
          break;
        }

      if ( ch->pcdata->learned[sn] > 0
           && CharToLowercase(name[0]) == CharToLowercase(skill_table[sn]->name[0])
           &&!StringPrefix( name, skill_table[sn]->name ) )
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

  for ( sn = 0; sn < top_herb; sn++ )
    {
      if ( !herb_table[sn] || !herb_table[sn]->name )
        {
          return -1;
        }

      if ( CharToLowercase( name[0] ) == CharToLowercase( herb_table[sn]->name[0] )
           && !StringPrefix( name, herb_table[sn]->name ) )
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
              if ( ( sn = BSearchSkill( name, gsn_first_tongue, gsn_top_sn - 1 ) ) == -1
                   && gsn_top_sn < top_sn )
                {
                  for ( sn = gsn_top_sn; sn < top_sn; sn++ )
                    {
                      if ( !skill_table[sn] || !skill_table[sn]->name )
                        {
                          return -1;
                        }

                      if ( CharToLowercase( name[0] ) == CharToLowercase( skill_table[sn]->name[0] )
                           &&!StringPrefix( name, skill_table[sn]->name ) )
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
      return IS_VALID_HERB(sn-TYPE_HERB) ? herb_table[sn-TYPE_HERB] : NULL;
    }

  if ( sn >= TYPE_HIT )
    {
      return NULL;
    }

  return IS_VALID_SN(sn) ? skill_table[sn] : NULL;
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

      if ( CharToLowercase( name[0] ) == CharToLowercase( skill_table[sn]->name[0] )
           && !StringPrefix( name, skill_table[sn]->name ) )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp(name, skill_table[sn]->name) < 1)
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

      if ( !StringPrefix(name, skill_table[sn]->name) )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp(name, skill_table[sn]->name) < 1)
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

      if ( CharToLowercase(name[0]) == CharToLowercase(skill_table[sn]->name[0])
           && !StringPrefix(name, skill_table[sn]->name)
           && ch->pcdata->learned[sn] > 0 )
        {
          return sn;
        }

      if (first >= top)
        {
          return -1;
        }

      if (strcasecmp( name, skill_table[sn]->name) < 1)
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

  for ( sn = 0; sn < top_sn; sn++ )
    {
      if ( slot == skill_table[sn]->slot )
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
  qsort( &skill_table[1], top_sn-1, sizeof( Skill * ),
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

  if ( skill1->type < skill2->type )
    {
      return -1;
    }

  if ( skill1->type > skill2->type )
    {
      return 1;
    }

  return strcasecmp( skill1->name, skill2->name );
}
