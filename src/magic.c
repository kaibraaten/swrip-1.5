/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include <strings.h>
#include "mud.h"
#include "character.h"

int pAbort = 0;

/*
 * The kludgy global is for spells who want more stuff from command line.
 */
char *spell_target_name = NULL;

ch_ret spell_null( int sn, int level, Character *ch, void *vo )
{
  SendToCharacter( "That's not a spell!\r\n", ch );
  return rNONE;
}

/* don't remove, may look redundant, but is important */
ch_ret spell_notfound( int sn, int level, Character *ch, void *vo )
{
  SendToCharacter( "That's not a spell!\r\n", ch );
  return rNONE;
}

/*
 * Is immune to a damage type
 */
bool is_immune( const Character *ch, short damtype )
{
  switch( damtype )
    {
    case SD_FIRE:
      if (IsBitSet(ch->immune, RIS_FIRE)) 
	return true;

    case SD_COLD:
      if (IsBitSet(ch->immune, RIS_COLD))
	return true;

    case SD_ELECTRICITY:
      if (IsBitSet(ch->immune, RIS_ELECTRICITY))
	return true;

    case SD_ENERGY:
      if (IsBitSet(ch->immune, RIS_ENERGY))
	return true;

    case SD_ACID:
      if (IsBitSet(ch->immune, RIS_ACID))
	return true;

    case SD_POISON:
      if (IsBitSet(ch->immune, RIS_POISON))
	return true;

      if (ch->race == RACE_DROID)
	return true;

    case SD_DRAIN:
      if (IsBitSet(ch->immune, RIS_DRAIN))
	return true;

      if (ch->race == RACE_DROID)
	return true;
    }

  return false;
}

/*
 * Lookup a skill by name, only stopping at skills the player has.
 */
int ch_slookup( const Character *ch, const char *name )
{
  int sn = 0;

  if ( IsNpc(ch) )
    {
      return skill_lookup( name );
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
int herb_lookup( const char *name )
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
int skill_lookup( const char *name )
{
  int sn;

  if ( ( sn = bsearch_skill( name, gsn_first_spell, gsn_first_skill - 1 ) ) == -1 )
    {
      if ( ( sn = bsearch_skill( name, gsn_first_skill, gsn_first_weapon - 1 ) ) == -1 )
	{
	  if ( ( sn = bsearch_skill( name, gsn_first_weapon, gsn_first_tongue - 1 ) ) == -1 )
	    {
	      if ( ( sn = bsearch_skill( name, gsn_first_tongue, gsn_top_sn - 1 ) ) == -1
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
Skill *get_skilltype( int sn )
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
int bsearch_skill( const char *name, int first, int top )
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
int bsearch_skill_exact( const char *name, int first, int top )
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
int ch_bsearch_skill( const Character *ch, const char *name, int first, int top )
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


int find_spell( const Character *ch, const char *name, bool know )
{
  if ( IsNpc(ch) || !know )
    {
      return bsearch_skill( name, gsn_first_spell, gsn_first_skill-1 );
    }
  else
    {
      return ch_bsearch_skill( ch, name, gsn_first_spell, gsn_first_skill-1 );
    }
}

int find_skill( const Character *ch, const char *name, bool know )
{
  if ( IsNpc(ch) || !know )
    {
      return bsearch_skill( name, gsn_first_skill, gsn_first_weapon-1 );
    }
  else
    {
      return ch_bsearch_skill( ch, name, gsn_first_skill, gsn_first_weapon-1 );
    }
}

int find_weapon( const Character *ch, const char *name, bool know )
{
  if ( IsNpc(ch) || !know )
    {
      return bsearch_skill( name, gsn_first_weapon, gsn_first_tongue-1 );
    }
  else
    {
      return ch_bsearch_skill( ch, name, gsn_first_weapon, gsn_first_tongue-1 );
    }
}

int find_tongue( const Character *ch, const char *name, bool know )
{
  if ( IsNpc(ch) || !know )
    {
      return bsearch_skill( name, gsn_first_tongue, gsn_top_sn-1 );
    }
  else
    {
      return ch_bsearch_skill( ch, name, gsn_first_tongue, gsn_top_sn-1 );
    }
}

/*
 * Lookup a skill by slot number.
 * Used for object loading.
 */
int slot_lookup( int slot )
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
      Bug( "Slot_lookup: bad slot %d.", slot );
      abort();
    }

  return -1;
}

/*
 * Fancy message handling for a successful casting              -Thoric
 */
void successful_casting( Skill *skill, Character *ch,
                         Character *victim, Object *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme  = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->hit_char && skill->hit_char[0] != '\0' )
	{
	  Act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->type == SKILL_SPELL )
	{
          Act( chit, "Ok.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && skill->hit_room && skill->hit_room[0] != '\0' )
    {
      Act( chitroom, skill->hit_room, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && skill->hit_vict && skill->hit_vict[0] != '\0' )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->hit_vict, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->hit_vict, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim && skill->type == SKILL_SPELL )
    {
      Act( chitme, "Ok.", ch, NULL, NULL, TO_CHAR );
    }
}

/*
 * Fancy message handling for a failed casting                  -Thoric
 */
void failed_casting( Skill *skill, Character *ch,
                     Character *victim, Object *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->miss_char && skill->miss_char[0] != '\0' )
	{
	  Act( chit, skill->miss_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->type == SKILL_SPELL )
	{
          Act( chit, "You failed.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && skill->miss_room && skill->miss_room[0] != '\0' )
    {
      Act( chitroom, skill->miss_room, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && skill->miss_vict && skill->miss_vict[0] != '\0' )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->miss_vict, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->miss_vict, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim )
    {
      if ( skill->miss_char && skill->miss_char[0] != '\0' )
	{
	  Act( chitme, skill->miss_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->type == SKILL_SPELL )
	{
	  Act( chitme, "You failed.", ch, NULL, NULL, TO_CHAR );
	}
    }
}

/*
 * Fancy message handling for being immune to something         -Thoric
 */
void immune_casting( Skill *skill, Character *ch,
                     Character *victim, Object *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->imm_char && skill->imm_char[0] != '\0' )
	{
	  Act( chit, skill->imm_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->miss_char && skill->miss_char[0] != '\0' )
	{
	  Act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->type == SKILL_SPELL || skill->type == SKILL_SKILL )
	{
	  Act( chit, "That appears to have no effect.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && skill->imm_room && skill->imm_room[0] != '\0' )
    {
      Act( chitroom, skill->imm_room, ch, obj, victim, TO_NOTVICT );
    }
  else if ( ch && skill->miss_room && skill->miss_room[0] != '\0' )
    {
      Act( chitroom, skill->miss_room, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && skill->imm_vict && skill->imm_vict[0] != '\0' )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->imm_vict, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->imm_vict, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && victim && skill->miss_vict && skill->miss_vict[0] != '\0' )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->miss_vict, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->miss_vict, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim )
    {
      if ( skill->imm_char && skill->imm_char[0] != '\0' )
	{
	  Act( chit, skill->imm_char, ch, obj, victim, TO_CHAR );
	}
      else if( skill->miss_char && skill->miss_char[0] != '\0' )
	{
	  Act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->type == SKILL_SPELL || skill->type == SKILL_SKILL )
	{
	  Act( chit, "That appears to have no affect.", ch, NULL, NULL, TO_CHAR );
	}
    }
}

/*
 * Make adjustments to saving throw based in RIS                -Thoric
 */
int ris_save( const Character *ch, int save_chance, int ris )
{
  short modifier = 10;

  if ( IsBitSet(ch->immune, ris ) )
    modifier -= 10;

  if ( ch->race == RACE_DROID && ( ris == SD_POISON || ris == SD_DRAIN ) )
    modifier -= 10;

  if ( ch->race == RACE_DROID && ris == RIS_MAGIC )
    modifier -= 5;

  if ( IsBitSet(ch->resistant, ris ) )
    modifier -= 2;

  if ( IsBitSet(ch->susceptible, ris ) )
    modifier += 2;

  if ( modifier <= 0 )
    return 1000;

  if ( modifier == 10 )
    return save_chance;

  return (save_chance * modifier) / 10;
}


/*                                                                  -Thoric
 * Fancy dice expression parsing complete with order of operations,
 * simple exponent support, dice support as well as a few extra
 * variables: L = level, H = hp, M = mana, V = move, S = str, X = dex
 *            I = int, W = wis, C = con, A = cha, U = luck, A = age
 *
 * Used for spell dice parsing, ie: 3d8+L-6
 *
 */
int rd_parse(const Character *ch, int level, char *expr)
{
  int x, lop = 0, gop = 0, eop = 0;
  char operation;
  char *sexp[2];
  int total = 0, len = 0;

  /* take care of nulls coming in */
  if (!expr || !strlen(expr))
    {
      return 0;
    }

  /* get rid of brackets if they surround the entire expresion */
  if ((*expr == '(') && !strchr(expr+1,'(') && expr[strlen(expr)-1] == ')')
    {
      expr[strlen(expr)-1] = '\0';
      expr++;
    }

  /* check if the expresion is just a number */
  len = strlen(expr);

  if ( len == 1 && isalpha(expr[0]) )
    {
      switch(expr[0])
	{
	case 'L':
	case 'l':
	  return level;

	case 'H':
	case 'h':
	  return ch->hit;

	case 'M':
	case 'm':
	  return ch->mana;

	case 'V':
	case 'v':
	  return ch->move;

	case 'S':
	case 's':
	  return GetCurrentStrength(ch);

	case 'I':
	case 'i':
	  return GetCurrentIntelligence(ch);

	case 'W':
	case 'w':
	  return GetCurrentWisdom(ch);

	case 'X':
	case 'x':
	  return GetCurrentDexterity(ch);

	case 'C':
	case 'c':
	  return GetCurrentConstitution(ch);

	case 'A':
	case 'a':
	  return GetCurrentCharisma(ch);

	case 'U':
	case 'u':
	  return GetCurrentLuck(ch);

	case 'Y':
	case 'y':
	  return GetAge(ch);
	}
    }

  for (x = 0; x < len; ++x)
    {
      if (!isdigit(expr[x]) && !isspace(expr[x]))
	{
	  break;
	}
    }

  if (x == len)
    {
      return(atoi(expr));
    }

  /* break it into 2 parts */
  for (x = 0; x < (int)strlen(expr); ++x)
    {
      switch(expr[x])
	{
	case '^':
	  if (!total)
	    {
	      eop = x;
	    }
	  break;

	case '-':
	case '+':
	  if (!total)
	    {
	      lop = x;
	    }
	  break;

	case '*':
	case '/':
	case '%':
	case 'd':
	case 'D':
	  if (!total)
	    {
	      gop =  x;
	    }
	  break;

	case '(':
	  ++total;
	  break;

	case ')':
	  --total;
	  break;
	}
    }

  if (lop)
    {
      x = lop;
    }
  else if (gop)
    {
      x = gop;
    }
  else
    {
      x = eop;
    }

  operation = expr[x];
  expr[x] = '\0';
  sexp[0] = expr;
  sexp[1] = (char *)(expr+x+1);

  /* work it out */
  total = rd_parse(ch, level, sexp[0]);

  switch(operation)
    {
    case '-':
      total -= rd_parse(ch, level, sexp[1]);
      break;

    case '+':
      total += rd_parse(ch, level, sexp[1]);
      break;

    case '*':
      total *= rd_parse(ch, level, sexp[1]);
      break;

    case '/':
      total /= rd_parse(ch, level, sexp[1]);
      break;

    case '%':
      total %= rd_parse(ch, level, sexp[1]);
      break;

    case 'd':
    case 'D':
      total = RollDice( total, rd_parse(ch, level, sexp[1]) );
    break;

    case '^':
      {
	int y = rd_parse(ch, level, sexp[1]), z = total;

	for (x = 1; x < y; ++x, z *= total)
	  ;

	total = z;
	break;
      }
    }

  return total;
}

/* wrapper function so as not to destroy expr */
int dice_parse(const Character *ch, int level, char *expr)
{
  char buf[MAX_INPUT_LENGTH];

  strcpy( buf, expr );
  return rd_parse(ch, level, buf);
}

/*
 * Compute a saving throw.
 * Negative apply's make saving throw better.
 */
bool saves_poison_death( int level, const Character *victim )
{
  int save = 50 + ( victim->top_level - level - victim->saving.poison_death ) * 2;

  if ( victim->race == RACE_DROID )
    {
      save += 50;
    }

  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool saves_wands( int level, const Character *victim )
{
  int save = 0;

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      return true;
    }

  save = 50 + ( victim->top_level - level - victim->saving.wand ) * 2;
  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool saves_para_petri( int level, const Character *victim )
{
  int save = 50 + ( victim->top_level - level - victim->saving.para_petri ) * 2;

  if ( victim->race == RACE_DROID )
    {
      save += 50;
    }

  save = urange( 5, save, 95 );
  return Chance( victim, save );
}

bool saves_breath( int level, const Character *victim )
{
  int save = 50 + ( victim->top_level - level - victim->saving.breath ) * 2;

  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool saves_spell_staff( int level, const Character *victim )
{
  int save = 0;

  if ( IsBitSet( victim->immune, RIS_MAGIC ) )
    {
      return true;
    }

  if ( IsNpc( victim ) && level > 10 )
    {
      level -= 5;
    }

  save = 50 + ( victim->top_level - level - victim->saving.spell_staff ) * 2;

  if ( victim->race == RACE_DROID )
    {
      save += 20;
    }

  save = urange( 5, save, 95 );
  return Chance( victim, save );
}

bool process_spell_components( Character *ch, int sn )
{
  return true;
}

/*
 * Locate targets.
 */
void *locate_targets( Character *ch, char *arg, int sn, Character **victim, Object **obj )
{
  Skill *skill = get_skilltype( sn );
  void *vo = NULL;

  *victim = NULL;
  *obj = NULL;

  switch ( skill->target )
    {
    default:
      Bug( "Do_cast: bad target for sn %d.", sn );
      return &pAbort;

    case TAR_IGNORE:
      break;

    case TAR_CHAR_OFFENSIVE:
      if ( arg[0] == '\0' )
        {
          if ( !( *victim = GetFightingOpponent( ch ) ) )
            {
              SendToCharacter( "Cast the spell on whom?\r\n", ch );
              return &pAbort;
            }
        }
      else
        {
          if ( !( *victim = GetCharacterInRoom( ch, arg ) ) )
            {
              SendToCharacter( "They aren't here.\r\n", ch );
              return &pAbort;
            }
        }

      if ( IsSafe( ch, *victim ) )
	{
	  return &pAbort;
	}

      if ( ch == *victim )
        {
          SendToCharacter( "Cast this on yourself? Okay...\r\n", ch );
        }

      if ( !IsNpc(ch) )
        {
          if ( !IsNpc(*victim) )
            {
              if ( GetTimer( ch, TIMER_PKILLED ) > 0 )
                {
                  SendToCharacter( "You have been killed in the last 5 minutes.\r\n", ch);
                  return &pAbort;
                }

              if ( GetTimer( *victim, TIMER_PKILLED ) > 0 )
                {
                  SendToCharacter( "This player has been killed in the last 5 minutes.\r\n", ch );
                  return &pAbort;
                }
            }

          if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == *victim )
            {
              SendToCharacter( "You can't do that on your own follower.\r\n", ch );
              return &pAbort;
            }
        }

      vo = (void *) *victim;
      break;

    case TAR_CHAR_DEFENSIVE:
      if ( arg[0] == '\0' )
	{
	  *victim = ch;
	}
      else
        {
          if ( !( *victim = GetCharacterInRoom( ch, arg ) ) )
            {
              SendToCharacter( "They aren't here.\r\n", ch );
              return &pAbort;
            }
        }

      vo = (void *) *victim;
      break;

    case TAR_CHAR_SELF:
      if ( arg[0] != '\0' && !NiftyIsName( arg, ch->name ) )
        {
          SendToCharacter( "You cannot cast this spell on another.\r\n", ch );
          return &pAbort;
        }

      vo = (void *) ch;
      break;

    case TAR_OBJ_INV:
      if ( arg[0] == '\0' )
        {
          SendToCharacter( "What should the spell be cast upon?\r\n", ch );
          return &pAbort;
        }

      if ( ( *obj = GetCarriedObject( ch, arg ) ) == NULL )
        {
          SendToCharacter( "You are not carrying that.\r\n", ch );
          return &pAbort;
        }

      vo = (void *) *obj;
      break;
    }

  return vo;
}

/*
 * Cast spells at targets using a magical object.
 */
ch_ret obj_cast_spell( int sn, int level, Character *ch, Character *victim, Object *obj )
{
  void *vo = NULL;
  ch_ret retcode = rNONE;
  int levdiff = ch->top_level - level;
  Skill *skill = get_skilltype( sn );
  struct timeval time_used;

  if ( sn == -1 )
    {
      return retcode;
    }

  if ( !skill || !skill->spell_fun )
    {
      Bug( "Obj_cast_spell: bad sn %d.", sn );
      return rERROR;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_NO_MAGIC ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "Nothing seems to happen...\r\n", ch );
      return rNONE;
    }

  /*
   * Basically this was added to cut down on level 5 players using level
   * 40 scrolls in battle too often ;)          -Thoric
   */
  if ( (skill->target == TAR_CHAR_OFFENSIVE
        || NumberBits(7) == 1)      /* 1/128 chance if non-offensive */
       && skill->type != SKILL_HERB
       && !Chance( ch, 95 + levdiff ) )
    {
      switch( NumberBits(2) )
        {
        case 0:
	  failed_casting( skill, ch, victim, NULL );
	  break;

        case 1:
          Act( AT_MAGIC, "The $t backfires!", ch, skill->name, victim, TO_CHAR );

          if ( victim )
	    {
	      Act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_VICT );
	    }

          Act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_NOTVICT );
          return InflictDamage( ch, ch, GetRandomNumberFromRange( 1, level ), TYPE_UNDEFINED );

        case 2:
	  failed_casting( skill, ch, victim, NULL );
	  break;

        case 3:
          Act( AT_MAGIC, "The $t backfires!", ch, skill->name, victim, TO_CHAR );

          if ( victim )
	    {
	      Act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_VICT );
	    }

          Act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_NOTVICT );
          return InflictDamage( ch, ch, GetRandomNumberFromRange( 1, level ), TYPE_UNDEFINED );
        }

      return rNONE;
    }

  spell_target_name = "";

  switch ( skill->target )
    {
    default:
      Bug( "Obj_cast_spell: bad target for sn %d.", sn );
      return rERROR;

    case TAR_IGNORE:
      vo = NULL;

      if ( victim )
	{
	  spell_target_name = victim->name;
	}
      else if ( obj )
	{
	  spell_target_name = obj->name;
	}
      break;

    case TAR_CHAR_OFFENSIVE:
      if ( victim != ch )
        {
          if ( !victim )
	    {
	      victim = GetFightingOpponent( ch );
	    }

          if ( !victim || !IsNpc(victim) )
            {
              SendToCharacter( "You can't do that.\r\n", ch );
              return rNONE;
            }
        }

      if ( ch != victim && IsSafe( ch, victim ) )
	{
	  return rNONE;
	}

      vo = (void *) victim;
      break;

    case TAR_CHAR_DEFENSIVE:
      if ( victim == NULL )
	{
	  victim = ch;
	}

      vo = (void *) victim;

      if ( skill->type != SKILL_HERB
           && IsBitSet(victim->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_CHAR_SELF:
      vo = (void *) ch;

      if ( skill->type != SKILL_HERB
           && IsBitSet(ch->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_OBJ_INV:
      if ( !obj )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return rNONE;
        }

      vo = (void *) obj;
      break;
    }

  StartTimer(&time_used);
  retcode = skill->spell_fun( sn, level, ch, vo );
  StopTimer(&time_used);
  update_userec(&time_used, &skill->userec);

  if ( retcode == rSPELL_FAILED )
    {
      retcode = rNONE;
    }

  if ( retcode == rCHAR_DIED || retcode == rERROR )
    {
      return retcode;
    }

  if ( CharacterDiedRecently(ch) )
    {
      return rCHAR_DIED;
    }

  if ( skill->target == TAR_CHAR_OFFENSIVE
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

  return retcode;
}

/*******************************************************
 * Everything after this point is part of SMAUG SPELLS *
 *******************************************************/

/*
 * saving throw check                                           -Thoric
 */
bool check_save( int sn, int level, const Character *ch, const Character *victim )
{
  Skill *skill = get_skilltype(sn);
  bool saved = false;

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       && !IsNpc(ch) && !IsNpc(victim) )
    {
      level /= 2;
    }

  if ( skill->saves )
    {
      switch( skill->saves )
	{
	case SS_POISON_DEATH:
	  saved = saves_poison_death(level, victim);
	  break;

	case SS_ROD_WANDS:
	  saved = saves_wands(level, victim);
	  break;

	case SS_PARA_PETRI:
	  saved = saves_para_petri(level, victim);
	  break;

	case SS_BREATH:
	  saved = saves_breath(level, victim);
	  break;

	case SS_SPELL_STAFF:
	  saved = saves_spell_staff(level, victim);
	  break;
	}
    }

  return saved;
}
