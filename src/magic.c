/***************************************************************************
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
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                           Spell handling module                         *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "character.h"

int pAbort;

/*
 * The kludgy global is for spells who want more stuff from command line.
 */
char *spell_target_name;

ch_ret spell_null( int sn, int level, CHAR_DATA *ch, void *vo )
{
  send_to_char( "That's not a spell!\r\n", ch );
  return rNONE;
}

/* don't remove, may look redundant, but is important */
ch_ret spell_notfound( int sn, int level, CHAR_DATA *ch, void *vo )
{
  send_to_char( "That's not a spell!\r\n", ch );
  return rNONE;
}

/*
 * Is immune to a damage type
 */
bool is_immune( const CHAR_DATA *ch, short damtype )
{
  switch( damtype )
    {
    case SD_FIRE:
      if (IS_SET(ch->immune, RIS_FIRE)) 
	return TRUE;

    case SD_COLD:
      if (IS_SET(ch->immune, RIS_COLD))
	return TRUE;

    case SD_ELECTRICITY:
      if (IS_SET(ch->immune, RIS_ELECTRICITY))
	return TRUE;

    case SD_ENERGY:
      if (IS_SET(ch->immune, RIS_ENERGY))
	return TRUE;

    case SD_ACID:
      if (IS_SET(ch->immune, RIS_ACID))
	return TRUE;

    case SD_POISON:
      if (IS_SET(ch->immune, RIS_POISON))
	return TRUE;

      if (ch->race == RACE_DROID)
	return TRUE;

    case SD_DRAIN:
      if (IS_SET(ch->immune, RIS_DRAIN))
	return TRUE;

      if (ch->race == RACE_DROID)
	return TRUE;
    }

  return FALSE;
}

/*
 * Lookup a skill by name, only stopping at skills the player has.
 */
int ch_slookup( const CHAR_DATA *ch, const char *name )
{
  int sn;

  if ( IS_NPC(ch) )
    return skill_lookup( name );

  for ( sn = 0; sn < top_sn; sn++ )
    {
      if ( !skill_table[sn]->name )
        break;
      if (  ch->pcdata->learned[sn] > 0
            &&    LOWER(name[0]) == LOWER(skill_table[sn]->name[0])
            &&   !str_prefix( name, skill_table[sn]->name ) )
        return sn;
    }

  return -1;
}

/*
 * Lookup an herb by name.
 */
int herb_lookup( const char *name )
{
  int sn;

  for ( sn = 0; sn < top_herb; sn++ )
    {
      if ( !herb_table[sn] || !herb_table[sn]->name )
        return -1;
      if ( LOWER(name[0]) == LOWER(herb_table[sn]->name[0])
           &&  !str_prefix( name, herb_table[sn]->name ) )
        return sn;
    }
  return -1;
}

/*
 * Lookup a skill by name.
 */
int skill_lookup( const char *name )
{
  int sn;

  if ( (sn=bsearch_skill(name, gsn_first_spell, gsn_first_skill-1)) == -1 )
    if ( (sn=bsearch_skill(name, gsn_first_skill, gsn_first_weapon-1)) == -1 )
      if ( (sn=bsearch_skill(name, gsn_first_weapon, gsn_first_tongue-1)) == -1 )
        if ( (sn=bsearch_skill(name, gsn_first_tongue, gsn_top_sn-1)) == -1
             &&    gsn_top_sn < top_sn )
          {
            for ( sn = gsn_top_sn; sn < top_sn; sn++ )
              {
                if ( !skill_table[sn] || !skill_table[sn]->name )
                  return -1;
                if ( LOWER(name[0]) == LOWER(skill_table[sn]->name[0])
                     &&  !str_prefix( name, skill_table[sn]->name ) )
                  return sn;
              }
            return -1;
          }
  return sn;
}

/*
 * Return a skilltype pointer based on sn                       -Thoric
 * Returns NULL if bad, unused or personal sn.
 */
SKILLTYPE *get_skilltype( int sn )
{
  if ( sn >= TYPE_PERSONAL )
    return NULL;
  if ( sn >= TYPE_HERB )
    return IS_VALID_HERB(sn-TYPE_HERB) ? herb_table[sn-TYPE_HERB] : NULL;
  if ( sn >= TYPE_HIT )
    return NULL;
  return IS_VALID_SN(sn) ? skill_table[sn] : NULL;
}

/*
 * Perform a binary search on a section of the skill table      -Thoric
 * Each different section of the skill table is sorted alphabetically
 */
int bsearch_skill( const char *name, int first, int top )
{
  int sn;

  for (;;)
    {
      sn = (first + top) >> 1;

      if ( LOWER(name[0]) == LOWER(skill_table[sn]->name[0])
           &&  !str_prefix(name, skill_table[sn]->name) )
        return sn;
      if (first >= top)
        return -1;
      if (str_cmp(name, skill_table[sn]->name) < 1)
        top = sn - 1;
      else
        first = sn + 1;
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
  int sn;

  for (;;)
    {
      sn = (first + top) >> 1;
      if ( !str_prefix(name, skill_table[sn]->name) )
        return sn;
      if (first >= top)
        return -1;
      if (str_cmp(name, skill_table[sn]->name) < 1)
        top = sn - 1;
      else
        first = sn + 1;
    }
  return -1;
}

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows                               -Thoric
 */
int ch_bsearch_skill( const CHAR_DATA *ch, const char *name, int first, int top )
{
  int sn;

  for (;;)
    {
      sn = (first + top) >> 1;

      if ( LOWER(name[0]) == LOWER(skill_table[sn]->name[0])
           &&  !str_prefix(name, skill_table[sn]->name)
           &&   ch->pcdata->learned[sn] > 0 )
        return sn;
      if (first >= top)
        return -1;
      if (str_cmp( name, skill_table[sn]->name) < 1)
        top = sn - 1;
      else
        first = sn + 1;
    }
  return -1;
}


int find_spell( const CHAR_DATA *ch, const char *name, bool know )
{
  if ( IS_NPC(ch) || !know )
    return bsearch_skill( name, gsn_first_spell, gsn_first_skill-1 );
  else
    return ch_bsearch_skill( ch, name, gsn_first_spell, gsn_first_skill-1 );
}

int find_skill( const CHAR_DATA *ch, const char *name, bool know )
{
  if ( IS_NPC(ch) || !know )
    return bsearch_skill( name, gsn_first_skill, gsn_first_weapon-1 );
  else
    return ch_bsearch_skill( ch, name, gsn_first_skill, gsn_first_weapon-1 );
}

int find_weapon( const CHAR_DATA *ch, const char *name, bool know )
{
  if ( IS_NPC(ch) || !know )
    return bsearch_skill( name, gsn_first_weapon, gsn_first_tongue-1 );
  else
    return ch_bsearch_skill( ch, name, gsn_first_weapon, gsn_first_tongue-1 );
}

int find_tongue( const CHAR_DATA *ch, const char *name, bool know )
{
  if ( IS_NPC(ch) || !know )
    return bsearch_skill( name, gsn_first_tongue, gsn_top_sn-1 );
  else
    return ch_bsearch_skill( ch, name, gsn_first_tongue, gsn_top_sn-1 );
}

/*
 * Lookup a skill by slot number.
 * Used for object loading.
 */
int slot_lookup( int slot )
{
  extern bool fBootDb;
  int sn;

  if ( slot <= 0 )
    return -1;

  for ( sn = 0; sn < top_sn; sn++ )
    if ( slot == skill_table[sn]->slot )
      return sn;

  if ( fBootDb )
    {
      bug( "Slot_lookup: bad slot %d.", slot );
      abort( );
    }

  return -1;
}

/*
 * Fancy message handling for a successful casting              -Thoric
 */
void successful_casting( SKILLTYPE *skill, CHAR_DATA *ch,
                         CHAR_DATA *victim, OBJ_DATA *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit        = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme   = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->hit_char && skill->hit_char[0] != '\0' )
        act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
      else
        if ( skill->type == SKILL_SPELL )
          act( chit, "Ok.", ch, NULL, NULL, TO_CHAR );
    }
  if ( ch && skill->hit_room && skill->hit_room[0] != '\0' )
    act( chitroom, skill->hit_room, ch, obj, victim, TO_NOTVICT );
  if ( ch && victim && skill->hit_vict && skill->hit_vict[0] != '\0' )
    {
      if ( ch != victim )
        act( chitme, skill->hit_vict, ch, obj, victim, TO_VICT );
      else
        act( chitme, skill->hit_vict, ch, obj, victim, TO_CHAR );
    }
  else
    if ( ch && ch == victim && skill->type == SKILL_SPELL )
      act( chitme, "Ok.", ch, NULL, NULL, TO_CHAR );
}

/*
 * Fancy message handling for a failed casting                  -Thoric
 */
void failed_casting( SKILLTYPE *skill, CHAR_DATA *ch,
                     CHAR_DATA *victim, OBJ_DATA *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit        = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme   = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->miss_char && skill->miss_char[0] != '\0' )
        act( chit, skill->miss_char, ch, obj, victim, TO_CHAR );
      else
        if ( skill->type == SKILL_SPELL )
          act( chit, "You failed.", ch, NULL, NULL, TO_CHAR );
    }
  if ( ch && skill->miss_room && skill->miss_room[0] != '\0' )
    act( chitroom, skill->miss_room, ch, obj, victim, TO_NOTVICT );
  if ( ch && victim && skill->miss_vict && skill->miss_vict[0] != '\0' )
    {
      if ( ch != victim )
        act( chitme, skill->miss_vict, ch, obj, victim, TO_VICT );
      else
        act( chitme, skill->miss_vict, ch, obj, victim, TO_CHAR );
    }
  else
    if ( ch && ch == victim )
      {
        if ( skill->miss_char && skill->miss_char[0] != '\0' )
          act( chitme, skill->miss_char, ch, obj, victim, TO_CHAR );
        else
          if ( skill->type == SKILL_SPELL )
            act( chitme, "You failed.", ch, NULL, NULL, TO_CHAR );
      }
}

/*
 * Fancy message handling for being immune to something         -Thoric
 */
void immune_casting( SKILLTYPE *skill, CHAR_DATA *ch,
                     CHAR_DATA *victim, OBJ_DATA *obj )
{
  short chitroom = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_ACTION);
  short chit        = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HIT);
  short chitme   = (skill->type == SKILL_SPELL ? AT_MAGIC : AT_HITME);

  if ( skill->target != TAR_CHAR_OFFENSIVE )
    {
      chit = chitroom;
      chitme = chitroom;
    }

  if ( ch && ch != victim )
    {
      if ( skill->imm_char && skill->imm_char[0] != '\0' )
        act( chit, skill->imm_char, ch, obj, victim, TO_CHAR );
      else
        if ( skill->miss_char && skill->miss_char[0] != '\0' )
          act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
        else
          if ( skill->type == SKILL_SPELL || skill->type == SKILL_SKILL )
            act( chit, "That appears to have no effect.", ch, NULL, NULL, TO_CHAR );
    }
  if ( ch && skill->imm_room && skill->imm_room[0] != '\0' )
    act( chitroom, skill->imm_room, ch, obj, victim, TO_NOTVICT );
  else
    if ( ch && skill->miss_room && skill->miss_room[0] != '\0' )
      act( chitroom, skill->miss_room, ch, obj, victim, TO_NOTVICT );
  if ( ch && victim && skill->imm_vict && skill->imm_vict[0] != '\0' )
    {
      if ( ch != victim )
        act( chitme, skill->imm_vict, ch, obj, victim, TO_VICT );
      else
        act( chitme, skill->imm_vict, ch, obj, victim, TO_CHAR );
    }
  else
    if ( ch && victim && skill->miss_vict && skill->miss_vict[0] != '\0' )
      {
        if ( ch != victim )
          act( chitme, skill->miss_vict, ch, obj, victim, TO_VICT );
        else
          act( chitme, skill->miss_vict, ch, obj, victim, TO_CHAR );
      }
    else
      if ( ch && ch == victim )
        {
          if ( skill->imm_char && skill->imm_char[0] != '\0' )
            act( chit, skill->imm_char, ch, obj, victim, TO_CHAR );
          else
            if ( skill->miss_char && skill->miss_char[0] != '\0' )
              act( chit, skill->hit_char, ch, obj, victim, TO_CHAR );
            else
              if ( skill->type == SKILL_SPELL || skill->type == SKILL_SKILL )
                act( chit, "That appears to have no affect.", ch, NULL, NULL, TO_CHAR );
        }
}

/*
 * Make adjustments to saving throw based in RIS                -Thoric
 */
int ris_save( const CHAR_DATA *ch, int save_chance, int ris )
{
  short modifier = 10;

  if ( IS_SET(ch->immune, ris ) )
    modifier -= 10;

  if ( ch->race == RACE_DROID && ( ris == SD_POISON || ris == SD_DRAIN ) )
    modifier -= 10;

  if ( ch->race == RACE_DROID && ris == RIS_MAGIC )
    modifier -= 5;

  if ( IS_SET(ch->resistant, ris ) )
    modifier -= 2;

  if ( IS_SET(ch->susceptible, ris ) )
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
int rd_parse(const CHAR_DATA *ch, int level, char *expr)
{
  int x, lop = 0, gop = 0, eop = 0;
  char operation;
  char *sexp[2];
  int total = 0, len = 0;

  /* take care of nulls coming in */
  if (!expr || !strlen(expr))
    return 0;

  /* get rid of brackets if they surround the entire expresion */
  if ((*expr == '(') && !strchr(expr+1,'(') && expr[strlen(expr)-1] == ')')
    {
      expr[strlen(expr)-1] = '\0';
      expr++;
    }

  /* check if the expresion is just a number */
  len = strlen(expr);
  if ( len == 1 && isalpha(expr[0]) )
    switch(expr[0]) {
    case 'L': case 'l': return level;
    case 'H': case 'h': return ch->hit;
    case 'M': case 'm': return ch->mana;
    case 'V': case 'v': return ch->move;
    case 'S': case 's': return get_curr_str(ch);
    case 'I': case 'i': return get_curr_int(ch);
    case 'W': case 'w': return get_curr_wis(ch);
    case 'X': case 'x': return get_curr_dex(ch);
    case 'C': case 'c': return get_curr_con(ch);
    case 'A': case 'a': return get_curr_cha(ch);
    case 'U': case 'u': return get_curr_lck(ch);
    case 'Y': case 'y': return get_age(ch);
    }

  for (x = 0; x < len; ++x)
    if (!isdigit(expr[x]) && !isspace(expr[x]))
      break;

  if (x == len)
    return(atoi(expr));

  /* break it into 2 parts */
  for (x = 0; x < (int)strlen(expr); ++x)
    switch(expr[x]) {
    case '^':
      if (!total)
        eop = x;
      break;
    case '-': case '+':
      if (!total)
        lop = x;
      break;
    case '*': case '/': case '%': case 'd': case 'D':
      if (!total)
        gop =  x;
      break;
    case '(':
      ++total;
      break;
    case ')':
      --total;
      break;
    }
  if (lop) x = lop;
  else
    if (gop) x = gop;
    else
      x = eop;
  operation = expr[x];
  expr[x] = '\0';
  sexp[0] = expr;
  sexp[1] = (char *)(expr+x+1);

  /* work it out */
  total = rd_parse(ch, level, sexp[0]);
  switch(operation) {
  case '-':             total -= rd_parse(ch, level, sexp[1]);  break;
  case '+':             total += rd_parse(ch, level, sexp[1]);  break;
  case '*':             total *= rd_parse(ch, level, sexp[1]);  break;
  case '/':             total /= rd_parse(ch, level, sexp[1]);  break;
  case '%':             total %= rd_parse(ch, level, sexp[1]);  break;
  case 'd': case 'D':   total = dice( total, rd_parse(ch, level, sexp[1]) );    break;
  case '^':
    {
      int y = rd_parse(ch, level, sexp[1]), z = total;

      for (x = 1; x < y; ++x, z *= total);
      total = z;
      break;
    }
  }
  return total;
}

/* wrapper function so as not to destroy expr */
int dice_parse(const CHAR_DATA *ch, int level, char *expr)
{
  char buf[MAX_INPUT_LENGTH];

  strcpy( buf, expr );
  return rd_parse(ch, level, buf);
}

/*
 * Compute a saving throw.
 * Negative apply's make saving throw better.
 */
bool saves_poison_death( int level, const CHAR_DATA *victim )
{
  int save;

  save = 50 + ( victim->top_level - level - victim->saving_poison_death ) * 2;
  if ( victim->race == RACE_DROID )
    save += 50;
  save = URANGE( 5, save, 95 );
  return chance( victim, save );
}
bool saves_wands( int level, const CHAR_DATA *victim )
{
  int save;

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    return TRUE;

  save = 50 + ( victim->top_level - level - victim->saving_wand ) * 2;
  save = URANGE( 5, save, 95 );
  return chance( victim, save );
}
bool saves_para_petri( int level, const CHAR_DATA *victim )
{
  int save;

  save = 50 + ( victim->top_level - level - victim->saving_para_petri ) * 2;
  if ( victim->race == RACE_DROID )
    save += 50;
  save = URANGE( 5, save, 95 );
  return chance( victim, save );
}
bool saves_breath( int level, const CHAR_DATA *victim )
{
  int save;

  save = 50 + ( victim->top_level - level - victim->saving_breath ) * 2;
  save = URANGE( 5, save, 95 );
  return chance( victim, save );
}
bool saves_spell_staff( int level, const CHAR_DATA *victim )
{
  int save;

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    return TRUE;

  if ( IS_NPC( victim ) && level > 10 )
    level -= 5;
  save = 50 + ( victim->top_level - level - victim->saving_spell_staff ) * 2;
  if ( victim->race == RACE_DROID )
    save += 20;
  save = URANGE( 5, save, 95 );
  return chance( victim, save );
}


/*
 * Process the spell's required components, if any              -Thoric
 * -----------------------------------------------
 * T###         check for item of type ###
 * V#####       check for item of vnum #####
 * Kword        check for item with keyword 'word'
 * G#####       check if player has ##### amount of gold
 * H####        check if player has #### amount of hitpoints
 *
 * Special operators:
 * ! spell fails if player has this
 * + don't consume this component
 * @ decrease component's value[0], and extract if it reaches 0
 * # decrease component's value[1], and extract if it reaches 0
 * $ decrease component's value[2], and extract if it reaches 0
 * % decrease component's value[3], and extract if it reaches 0
 * ^ decrease component's value[4], and extract if it reaches 0
 * & decrease component's value[5], and extract if it reaches 0
 */
bool process_spell_components( CHAR_DATA *ch, int sn )
{
  SKILLTYPE *skill      = get_skilltype(sn);
  char *comp            = skill->components;
  char *check;
  char arg[MAX_INPUT_LENGTH];
  bool consume, fail, found;
  int  val, value;
  OBJ_DATA *obj;

  /* if no components necessary, then everything is cool */
  if ( !comp || comp[0] == '\0' )
    return TRUE;

  /* disable the whole damn shabang */

  return TRUE;

  while ( comp[0] != '\0' )
    {
      comp = one_argument( comp, arg );
      consume = TRUE;
      fail = found = FALSE;
      val = -1;
      switch( arg[1] )
        {
        default:        check = arg+1;                          break;
        case '!':       check = arg+2;  fail = TRUE;            break;
        case '+':       check = arg+2;  consume = FALSE;        break;
        case '@':       check = arg+2;  val = 0;                break;
        case '#':       check = arg+2;  val = 1;                break;
        case '$':       check = arg+2;  val = 2;                break;
        case '%':       check = arg+2;  val = 3;                break;
        case '^':       check = arg+2;  val = 4;                break;
        case '&':       check = arg+2;  val = 5;                break;
        }
      value = atoi(check);
      obj = NULL;
      switch( UPPER(arg[0]) )
        {
        case 'T':
          for ( obj = ch->first_carrying; obj; obj = obj->next_content )
            if ( obj->item_type == value )
              {
                if ( fail )
                  {
                    send_to_char( "Something disrupts the use of this power...\r\n", ch );
                    return FALSE;
                  }
                found = TRUE;
                break;
              }
          break;
        case 'V':
          for ( obj = ch->first_carrying; obj; obj = obj->next_content )
            if ( obj->pIndexData->vnum == value )
              {
                if ( fail )
                  {
                    send_to_char( "Something disrupts the use of this power...\r\n", ch );
                    return FALSE;
                  }
                found = TRUE;
                break;
              }
          break;
        case 'K':
          for ( obj = ch->first_carrying; obj; obj = obj->next_content )
            if ( nifty_is_name( check, obj->name ) )
              {
                if ( fail )
                  {
                    send_to_char( "Something disrupts the use of this power...\r\n", ch );
                    return FALSE;
                  }
                found = TRUE;
                break;
              }
          break;
        case 'G':
          if ( ch->gold >= value )
            {
              if ( fail )
                {
                  send_to_char( "Something disrupts the use of this power...\r\n", ch );
                  return FALSE;
                }
              else
                {
                  if ( consume )
                    {
                      set_char_color( AT_GOLD, ch );
                      send_to_char( "You feel a little lighter...\r\n", ch );
                      ch->gold -= value;
                    }
                  continue;
                }
            }
          break;
        case 'H':
          if ( ch->hit >= value )
            {
              if ( fail )
                {
                  send_to_char( "Something disrupts the use of this power...\r\n", ch );
                  return FALSE;
                }
              else
                {
                  if ( consume )
                    {
                      set_char_color( AT_BLOOD, ch );
                      send_to_char( "You feel a little weaker...\r\n", ch );
                      ch->hit -= value;
                      update_pos( ch );
                    }
                  continue;
                }
            }
          break;
        }
      /* having this component would make the spell fail... if we get
         here, then the caster didn't have that component */
      if ( fail )
        continue;
      if ( !found )
        {
          send_to_char( "Something is missing...\r\n", ch );
          return FALSE;
        }
      if ( obj )
        {
          if ( val >=0 && val < 6 )
            {
              separate_obj(obj);
              if ( obj->value[val] <= 0 )
                return FALSE;
              else
                if ( --obj->value[val] == 0 )
                  {
                    act( AT_MAGIC, "$p glows briefly, then disappears in a puff of smoke!", ch, obj, NULL, TO_CHAR );
                    act( AT_MAGIC, "$p glows briefly, then disappears in a puff of smoke!", ch, obj, NULL, TO_ROOM );
                    extract_obj( obj );
                  }
                else
                  act( AT_MAGIC, "$p glows briefly and a whisp of smoke rises from it.", ch, obj, NULL, TO_CHAR );
            }
          else
            if ( consume )
              {
                separate_obj(obj);
                act( AT_MAGIC, "$p glows brightly, then disappears in a puff of smoke!", ch, obj, NULL, TO_CHAR );
                act( AT_MAGIC, "$p glows brightly, then disappears in a puff of smoke!", ch, obj, NULL, TO_ROOM );
                extract_obj( obj );
              }
            else
              {
                int count = obj->count;

                obj->count = 1;
                act( AT_MAGIC, "$p glows briefly.", ch, obj, NULL, TO_CHAR );
                obj->count = count;
              }
        }
    }
  return TRUE;
}

/*
 * Locate targets.
 */
void *locate_targets( CHAR_DATA *ch, char *arg, int sn, CHAR_DATA **victim, OBJ_DATA **obj )
{
  SKILLTYPE *skill = get_skilltype( sn );
  void *vo      = NULL;

  *victim       = NULL;
  *obj  = NULL;

  switch ( skill->target )
    {
    default:
      bug( "Do_cast: bad target for sn %d.", sn );
      return &pAbort;

    case TAR_IGNORE:
      break;

    case TAR_CHAR_OFFENSIVE:
      if ( arg[0] == '\0' )
        {
          if ( ( *victim = who_fighting( ch ) ) == NULL )
            {
              send_to_char( "Cast the spell on whom?\r\n", ch );
              return &pAbort;
            }
        }
      else
        {
          if ( ( *victim = get_char_room( ch, arg ) ) == NULL )
            {
              send_to_char( "They aren't here.\r\n", ch );
              return &pAbort;
            }
        }

      if ( is_safe( ch, *victim ) )
        return &pAbort;

      if ( ch == *victim )
        {
          send_to_char( "Cast this on yourself?  Okay...\r\n", ch );
          /*
            send_to_char( "You can't do that to yourself.\r\n", ch );
            return &pAbort;
          */
        }

      if ( !IS_NPC(ch) )
        {
          if ( !IS_NPC(*victim) )
            {
              /*  Sheesh! can't do anything
                  send_to_char( "You can't do that on a player.\r\n", ch );
                  return &pAbort;
              */

              if ( get_timer( ch, TIMER_PKILLED ) > 0 )
                {
                  send_to_char( "You have been killed in the last 5 minutes.\r\n", ch);
                  return &pAbort;
                }

              if ( get_timer( *victim, TIMER_PKILLED ) > 0 )
                {
                  send_to_char( "This player has been killed in the last 5 minutes.\r\n", ch );
                  return &pAbort;
                }

            }

          if ( is_affected_by(ch, AFF_CHARM) && ch->master == *victim )
            {
              send_to_char( "You can't do that on your own follower.\r\n", ch );
              return &pAbort;
            }
        }

      vo = (void *) *victim;
      break;

    case TAR_CHAR_DEFENSIVE:
      if ( arg[0] == '\0' )
        *victim = ch;
      else
        {
          if ( ( *victim = get_char_room( ch, arg ) ) == NULL )
            {
              send_to_char( "They aren't here.\r\n", ch );
              return &pAbort;
            }
        }
      vo = (void *) *victim;
      break;

    case TAR_CHAR_SELF:
      if ( arg[0] != '\0' && !nifty_is_name( arg, ch->name ) )
        {
          send_to_char( "You cannot cast this spell on another.\r\n", ch );
          return &pAbort;
        }

      vo = (void *) ch;
      break;

    case TAR_OBJ_INV:
      if ( arg[0] == '\0' )
        {
          send_to_char( "What should the spell be cast upon?\r\n", ch );
          return &pAbort;
        }

      if ( ( *obj = get_obj_carry( ch, arg ) ) == NULL )
        {
          send_to_char( "You are not carrying that.\r\n", ch );
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
ch_ret obj_cast_spell( int sn, int level, CHAR_DATA *ch, CHAR_DATA *victim, OBJ_DATA *obj )
{
  void *vo;
  ch_ret retcode = rNONE;
  int levdiff = ch->top_level - level;
  SKILLTYPE *skill = get_skilltype( sn );
  struct timeval time_used;

  if ( sn == -1 )
    return retcode;
  if ( !skill || !skill->spell_fun )
    {
      bug( "Obj_cast_spell: bad sn %d.", sn );
      return rERROR;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_NO_MAGIC ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "Nothing seems to happen...\r\n", ch );
      return rNONE;
    }

  /*
   * Basically this was added to cut down on level 5 players using level
   * 40 scrolls in battle too often ;)          -Thoric
   */
  if ( (skill->target == TAR_CHAR_OFFENSIVE
        ||    number_bits(7) == 1)      /* 1/128 chance if non-offensive */
       &&    skill->type != SKILL_HERB
       &&   !chance( ch, 95 + levdiff ) )
    {
      switch( number_bits(2) )
        {
        case 0: failed_casting( skill, ch, victim, NULL );      break;
        case 1:
          act( AT_MAGIC, "The $t backfires!", ch, skill->name, victim, TO_CHAR );
          if ( victim )
            act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_VICT );
          act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_NOTVICT );
          return damage( ch, ch, number_range( 1, level ), TYPE_UNDEFINED );
        case 2: failed_casting( skill, ch, victim, NULL );      break;
        case 3:
          act( AT_MAGIC, "The $t backfires!", ch, skill->name, victim, TO_CHAR );
          if ( victim )
            act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_VICT );
          act( AT_MAGIC, "$n's $t backfires!", ch, skill->name, victim, TO_NOTVICT );
          return damage( ch, ch, number_range( 1, level ), TYPE_UNDEFINED );
        }
      return rNONE;
    }

  spell_target_name = "";

  switch ( skill->target )
    {
    default:
      bug( "Obj_cast_spell: bad target for sn %d.", sn );
      return rERROR;

    case TAR_IGNORE:
      vo = NULL;
      if ( victim )
        spell_target_name = victim->name;
      else
        if ( obj )
          spell_target_name = obj->name;
      break;

    case TAR_CHAR_OFFENSIVE:
      if ( victim != ch )
        {
          if ( !victim )
            victim = who_fighting( ch );
          if ( !victim || !IS_NPC(victim) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return rNONE;
            }
        }
      if ( ch != victim && is_safe( ch, victim ) )
        return rNONE;
      vo = (void *) victim;
      break;

    case TAR_CHAR_DEFENSIVE:
      if ( victim == NULL )
        victim = ch;
      vo = (void *) victim;
      if ( skill->type != SKILL_HERB
           &&   IS_SET(victim->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_CHAR_SELF:
      vo = (void *) ch;
      if ( skill->type != SKILL_HERB
           &&   IS_SET(ch->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rNONE;
        }
      break;

    case TAR_OBJ_INV:
      if ( obj == NULL )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return rNONE;
        }
      vo = (void *) obj;
      break;
    }

  start_timer(&time_used);
  retcode = (*skill->spell_fun) ( sn, level, ch, vo );
  end_timer(&time_used);
  update_userec(&time_used, &skill->userec);

  if ( retcode == rSPELL_FAILED )
    retcode = rNONE;

  if ( retcode == rCHAR_DIED || retcode == rERROR )
    return retcode;

  if ( char_died(ch) )
    return rCHAR_DIED;

  if ( skill->target == TAR_CHAR_OFFENSIVE
       &&   victim != ch
       &&  !char_died(victim) )
    {
      CHAR_DATA *vch;
      CHAR_DATA *vch_next;

      for ( vch = ch->in_room->first_person; vch; vch = vch_next )
        {
          vch_next = vch->next_in_room;
          if ( victim == vch && !victim->fighting && victim->master != ch )
            {
              retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
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
bool check_save( int sn, int level, const CHAR_DATA *ch, const CHAR_DATA *victim )
{
  SKILLTYPE *skill = get_skilltype(sn);
  bool saved = FALSE;

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       &&  !IS_NPC(ch) && !IS_NPC(victim) )
    level /= 2;

  if ( skill->saves )
    switch( skill->saves )
      {
      case SS_POISON_DEATH:
        saved = saves_poison_death(level, victim);      break;
      case SS_ROD_WANDS:
        saved = saves_wands(level, victim);             break;
      case SS_PARA_PETRI:
        saved = saves_para_petri(level, victim);        break;
      case SS_BREATH:
        saved = saves_breath(level, victim);    break;
      case SS_SPELL_STAFF:
        saved = saves_spell_staff(level, victim);       break;
      }
  return saved;
}
