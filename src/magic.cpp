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

#include <cctype>
#include <cstring>
#include <strings.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"

int pAbort = 0;

/*
 * The kludgy global is for spells who want more stuff from command line.
 */
char *spell_target_name = NULL;

static int ParseDiceExpression(const Character *ch, int level, const std::string &expr);

ch_ret spell_null( int sn, int level, Character *ch, void *vo )
{
  return spell_notfound(sn, level, ch, vo);
}

/* don't remove, may look redundant, but is important */
ch_ret spell_notfound( int sn, int level, Character *ch, void *vo )
{
  ch->Echo( "That's not a Force power!\r\n" );
  return rNONE;
}

/*
 * Is immune to a damage type
 */
bool IsImmuneToDamageType( const Character *ch, short damtype )
{
  switch( damtype )
    {
    case SD_FIRE:
      if (IsBitSet(ch->Immune, RIS_FIRE)) 
	return true;
      break;

    case SD_COLD:
      if (IsBitSet(ch->Immune, RIS_COLD))
	return true;
      break;

    case SD_ELECTRICITY:
      if (IsBitSet(ch->Immune, RIS_ELECTRICITY))
	return true;
      break;

    case SD_ENERGY:
      if (IsBitSet(ch->Immune, RIS_ENERGY))
	return true;
      break;

    case SD_ACID:
      if (IsBitSet(ch->Immune, RIS_ACID))
	return true;
      break;

    case SD_POISON:
      if (IsBitSet(ch->Immune, RIS_POISON))
	return true;

      if (ch->Race == RACE_DROID)
	return true;

      break;

    case SD_DRAIN:
      if (IsBitSet(ch->Immune, RIS_DRAIN))
	return true;

      if (ch->Race == RACE_DROID)
	return true;

      break;

    case SD_NONE:
      /* Do nothing */
      break;

    default:
      Log->Bug("magic.cpp:IsImmuneToDamageType(): Reached default case, which is invalid.");
      abort();
      break;
    }

  return false;
}

/*
 * Fancy message handling for a successful casting              -Thoric
 */
void SuccessfulCasting( Skill *skill, Character *ch,
			Character *victim, Object *obj )
{
  short chitroom = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme  = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->Target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
	{
	  Act( chit, skill->Messages.Success.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->Type == SKILL_SPELL )
	{
          Act( chit, "Ok.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
    {
      Act( chitroom, skill->Messages.Success.ToRoom, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && !IsNullOrEmpty( skill->Messages.Success.ToVictim ) )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->Messages.Success.ToVictim, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->Messages.Success.ToVictim, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim && skill->Type == SKILL_SPELL )
    {
      Act( chitme, "Ok.", ch, NULL, NULL, TO_CHAR );
    }
}

/*
 * Fancy message handling for a failed casting                  -Thoric
 */
void FailedCasting( Skill *skill, Character *ch,
                     Character *victim, Object *obj )
{
  short chitroom = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->Target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ))
	{
	  Act( chit, skill->Messages.Failure.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->Type == SKILL_SPELL )
	{
          Act( chit, "You failed.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && !IsNullOrEmpty( skill->Messages.Failure.ToRoom ) )
    {
      Act( chitroom, skill->Messages.Failure.ToRoom, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && !IsNullOrEmpty( skill->Messages.Failure.ToVictim ) )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->Messages.Failure.ToVictim, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->Messages.Failure.ToVictim, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim )
    {
      if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
	{
	  Act( chitme, skill->Messages.Failure.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->Type == SKILL_SPELL )
	{
	  Act( chitme, "You failed.", ch, NULL, NULL, TO_CHAR );
	}
    }
}

/*
 * Fancy message handling for being immune to something         -Thoric
 */
void ImmuneCasting( Skill *skill, Character *ch,
                     Character *victim, Object *obj )
{
  short chitroom = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme = (skill->Type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->Target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ) )
	{
	  Act( chit, skill->Messages.VictimImmune.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
	{
	  Act( chit, skill->Messages.Success.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->Type == SKILL_SPELL || skill->Type == SKILL_SKILL )
	{
	  Act( chit, "That appears to have no effect.", ch, NULL, NULL, TO_CHAR );
	}
    }

  if ( ch && !IsNullOrEmpty( skill->Messages.VictimImmune.ToRoom ) )
    {
      Act( chitroom, skill->Messages.VictimImmune.ToRoom, ch, obj, victim, TO_NOTVICT );
    }
  else if ( ch && !IsNullOrEmpty( skill->Messages.Failure.ToRoom ) )
    {
      Act( chitroom, skill->Messages.Failure.ToRoom, ch, obj, victim, TO_NOTVICT );
    }

  if ( ch && victim && !IsNullOrEmpty( skill->Messages.VictimImmune.ToVictim ) )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->Messages.VictimImmune.ToVictim, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->Messages.VictimImmune.ToVictim, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && victim && !IsNullOrEmpty( skill->Messages.Failure.ToVictim ) )
    {
      if ( ch != victim )
	{
	  Act( chitme, skill->Messages.Failure.ToVictim, ch, obj, victim, TO_VICT );
	}
      else
	{
	  Act( chitme, skill->Messages.Failure.ToVictim, ch, obj, victim, TO_CHAR );
	}
    }
  else if ( ch && ch == victim )
    {
      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ) )
	{
	  Act( chit, skill->Messages.VictimImmune.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
	{
	  Act( chit, skill->Messages.Success.ToCaster, ch, obj, victim, TO_CHAR );
	}
      else if ( skill->Type == SKILL_SPELL || skill->Type == SKILL_SKILL )
	{
	  Act( chit, "That appears to have no affect.", ch, NULL, NULL, TO_CHAR );
	}
    }
}

/*
 * Make adjustments to saving throw based in RIS                -Thoric
 */
int ModifySavingThrowBasedOnResistance( const Character *ch, int save_chance, int ris )
{
  short modifier = 10;

  if ( IsBitSet(ch->Immune, ris ) )
    modifier -= 10;

  if ( ch->Race == RACE_DROID && ( ris == SD_POISON || ris == SD_DRAIN ) )
    modifier -= 10;

  if ( ch->Race == RACE_DROID && ris == RIS_MAGIC )
    modifier -= 5;

  if ( IsBitSet(ch->Resistant, ris ) )
    modifier -= 2;

  if ( IsBitSet(ch->Susceptible, ris ) )
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
static int ParseDiceExpression(const Character *ch, int level, const std::string &argument)
{
  int x, lop = 0, gop = 0, eop = 0;
  char operation = '\0';
  char *sexp[2];
  int total = 0, len = 0;
  char expr_buf[MAX_STRING_LENGTH];
  char *expr = expr_buf;

  /* take care of nulls coming in */
  if (argument.empty())
    {
      return 0;
    }

  strcpy( expr, argument.c_str() );

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
	  return ch->Hit;

	case 'M':
	case 'm':
	  return ch->Mana;

	case 'V':
	case 'v':
	  return ch->Move;

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
  total = ParseDiceExpression(ch, level, sexp[0]);

  switch(operation)
    {
    case '-':
      total -= ParseDiceExpression(ch, level, sexp[1]);
      break;

    case '+':
      total += ParseDiceExpression(ch, level, sexp[1]);
      break;

    case '*':
      total *= ParseDiceExpression(ch, level, sexp[1]);
      break;

    case '/':
      total /= ParseDiceExpression(ch, level, sexp[1]);
      break;

    case '%':
      total %= ParseDiceExpression(ch, level, sexp[1]);
      break;

    case 'd':
    case 'D':
      total = RollDice( total, ParseDiceExpression(ch, level, sexp[1]) );
    break;

    case '^':
      {
	int y = ParseDiceExpression(ch, level, sexp[1]), z = total;

	for (x = 1; x < y; ++x, z *= total)
	  ;

	total = z;
	break;
      }
    }

  return total;
}

/* wrapper function so as not to destroy expr */
int ParseDice(const Character *ch, int level, const std::string &expr)
{
  return ParseDiceExpression(ch, level, expr);
}

/*
 * Compute a saving throw.
 * Negative apply's make saving throw better.
 */
bool SaveVsPoisonDeath( int level, const Character *victim )
{
  int save = 50 + ( victim->TopLevel - level - victim->Saving.PoisonDeath ) * 2;

  if ( victim->Race == RACE_DROID )
    {
      save += 50;
    }

  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool SaveVsWands( int level, const Character *victim )
{
  int save = 0;

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      return true;
    }

  save = 50 + ( victim->TopLevel - level - victim->Saving.Wand ) * 2;
  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool SaveVsParalyze( int level, const Character *victim )
{
  int save = 50 + ( victim->TopLevel - level - victim->Saving.ParaPetri ) * 2;

  if ( victim->Race == RACE_DROID )
    {
      save += 50;
    }

  save = urange( 5, save, 95 );
  return Chance( victim, save );
}

bool SaveVsBreath( int level, const Character *victim )
{
  int save = 50 + ( victim->TopLevel - level - victim->Saving.Breath ) * 2;

  save = urange( 5, save, 95 );

  return Chance( victim, save );
}

bool SaveVsSpellStaff( int level, const Character *victim )
{
  int save = 0;

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      return true;
    }

  if ( IsNpc( victim ) && level > 10 )
    {
      level -= 5;
    }

  save = 50 + ( victim->TopLevel - level - victim->Saving.SpellStaff ) * 2;

  if ( victim->Race == RACE_DROID )
    {
      save += 20;
    }

  save = urange( 5, save, 95 );
  return Chance( victim, save );
}

/*
 * Locate targets.
 */
void *LocateSpellTargets( Character *ch, char *arg, int sn, Character **victim, Object **obj )
{
  Skill *skill = GetSkill( sn );
  void *vo = NULL;

  *victim = NULL;
  *obj = NULL;

  switch ( skill->Target )
    {
    default:
      Log->Bug( "%s: bad target for sn %d.", __FUNCTION__, sn );
      return &pAbort;

    case TAR_IGNORE:
      break;

    case TAR_CHAR_OFFENSIVE:
      if ( IsNullOrEmpty( arg ) )
        {
          if ( !( *victim = GetFightingOpponent( ch ) ) )
            {
              ch->Echo( "Cast the spell on whom?\r\n" );
              return &pAbort;
            }
        }
      else
        {
          if ( !( *victim = GetCharacterInRoom( ch, arg ) ) )
            {
              ch->Echo( "They aren't here.\r\n" );
              return &pAbort;
            }
        }

      if ( IsSafe( ch, *victim ) )
	{
	  return &pAbort;
	}

      if ( ch == *victim )
        {
          ch->Echo( "Cast this on yourself? Okay...\r\n" );
        }

      if ( !IsNpc(ch) )
        {
          if ( !IsNpc(*victim) )
            {
              if ( GetTimer( ch, TIMER_PKILLED ) > 0 )
                {
                  ch->Echo( "You have been killed in the last 5 minutes.\r\n" );
                  return &pAbort;
                }

              if ( GetTimer( *victim, TIMER_PKILLED ) > 0 )
                {
                  ch->Echo( "This player has been killed in the last 5 minutes.\r\n" );
                  return &pAbort;
                }
            }

          if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == *victim )
            {
              ch->Echo( "You can't do that on your own follower.\r\n" );
              return &pAbort;
            }
        }

      vo = (void *) *victim;
      break;

    case TAR_CHAR_DEFENSIVE:
      if ( IsNullOrEmpty( arg ) )
	{
	  *victim = ch;
	}
      else
        {
          if ( !( *victim = GetCharacterInRoom( ch, arg ) ) )
            {
              ch->Echo( "They aren't here.\r\n" );
              return &pAbort;
            }
        }

      vo = (void *) *victim;
      break;

    case TAR_CHAR_SELF:
      if ( !IsNullOrEmpty( arg ) && !NiftyIsName( arg, ch->Name ) )
        {
          ch->Echo( "You cannot cast this spell on another.\r\n" );
          return &pAbort;
        }

      vo = (void *) ch;
      break;

    case TAR_OBJ_INV:
      if ( IsNullOrEmpty( arg ) )
        {
          ch->Echo( "What should the spell be cast upon?\r\n" );
          return &pAbort;
        }

      if ( ( *obj = GetCarriedObject( ch, arg ) ) == NULL )
        {
          ch->Echo( "You are not carrying that.\r\n" );
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
ch_ret CastSpellWithObject( int sn, int level, Character *ch, Character *victim, Object *obj )
{
  void *vo = NULL;
  ch_ret retcode = rNONE;
  int levdiff = ch->TopLevel - level;
  Skill *skill = GetSkill( sn );
  struct timeval time_used;

  if ( sn == -1 )
    {
      return retcode;
    }

  if ( !skill || !skill->SpellFunction )
    {
      Log->Bug( "%s: bad sn %d.", __FUNCTION__, sn );
      return rERROR;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_NO_MAGIC ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo( "Nothing seems to happen...\r\n" );
      return rNONE;
    }

  /*
   * Basically this was added to cut down on level 5 players using level
   * 40 scrolls in battle too often ;)          -Thoric
   */
  if ( (skill->Target == TAR_CHAR_OFFENSIVE
        || NumberBits(7) == 1)      /* 1/128 chance if non-offensive */
       && skill->Type != SKILL_HERB
       && !Chance( ch, 95 + levdiff ) )
    {
      switch( NumberBits(2) )
        {
        case 0:
	  FailedCasting( skill, ch, victim, NULL );
	  break;

        case 1:
          Act( AT_MAGIC, "The $t backfires!", ch, skill->Name, victim, TO_CHAR );

          if ( victim )
	    {
	      Act( AT_MAGIC, "$n's $t backfires!", ch, skill->Name, victim, TO_VICT );
	    }

          Act( AT_MAGIC, "$n's $t backfires!", ch, skill->Name, victim, TO_NOTVICT );
          return InflictDamage( ch, ch, GetRandomNumberFromRange( 1, level ), TYPE_UNDEFINED );

        case 2:
	  FailedCasting( skill, ch, victim, NULL );
	  break;

        case 3:
          Act( AT_MAGIC, "The $t backfires!", ch, skill->Name, victim, TO_CHAR );

          if ( victim )
	    {
	      Act( AT_MAGIC, "$n's $t backfires!", ch, skill->Name, victim, TO_VICT );
	    }

          Act( AT_MAGIC, "$n's $t backfires!", ch, skill->Name, victim, TO_NOTVICT );
          return InflictDamage( ch, ch, GetRandomNumberFromRange( 1, level ), TYPE_UNDEFINED );
        }

      return rNONE;
    }

  spell_target_name = "";

  switch ( skill->Target )
    {
    default:
      Log->Bug( "%s: bad target for sn %d.", __FUNCTION__, sn );
      return rERROR;

    case TAR_IGNORE:
      vo = NULL;

      if ( victim )
	{
	  spell_target_name = victim->Name;
	}
      else if ( obj )
	{
	  spell_target_name = obj->Name;
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
              ch->Echo( "You can't do that.\r\n" );
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

      if ( skill->Type != SKILL_HERB
           && IsBitSet(victim->Immune, RIS_MAGIC ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_CHAR_SELF:
      vo = (void *) ch;

      if ( skill->Type != SKILL_HERB
           && IsBitSet(ch->Immune, RIS_MAGIC ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_OBJ_INV:
      if ( !obj )
        {
          ch->Echo( "You can't do that.\r\n" );
          return rNONE;
        }

      vo = (void *) obj;
      break;
    }

  StartTimer(&time_used);
  retcode = skill->SpellFunction( sn, level, ch, vo );
  StopTimer(&time_used);
  UpdateNumberOfTimesUsed(&time_used, skill->UseRec);

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

  if ( skill->Target == TAR_CHAR_OFFENSIVE
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

  return retcode;
}

/*******************************************************
 * Everything after this point is part of SMAUG SPELLS *
 *******************************************************/

/*
 * saving throw check                                           -Thoric
 */
bool CheckSavingThrow( int sn, int level, const Character *ch, const Character *victim )
{
  Skill *skill = GetSkill(sn);
  bool saved = false;

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       && !IsNpc(ch) && !IsNpc(victim) )
    {
      level /= 2;
    }

  if ( skill->Saves )
    {
      switch( skill->Saves )
	{
	case SS_POISON_DEATH:
	  saved = SaveVsPoisonDeath(level, victim);
	  break;

	case SS_ROD_WANDS:
	  saved = SaveVsWands(level, victim);
	  break;

	case SS_PARA_PETRI:
	  saved = SaveVsParalyze(level, victim);
	  break;

	case SS_BREATH:
	  saved = SaveVsBreath(level, victim);
	  break;

	case SS_SPELL_STAFF:
	  saved = SaveVsSpellStaff(level, victim);
	  break;
	}
    }

  return saved;
}

int FindSpell( const Character *ch, const std::string &name, bool know )
{
  if ( IsNpc(ch) || !know )
    {
      return BSearchSkill( name, gsn_first_spell, gsn_first_skill-1 );
    }
  else
    {
      return ChBSearchSkill( ch, name, gsn_first_spell, gsn_first_skill-1 );
    }
}

