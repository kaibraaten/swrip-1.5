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
 *                          Bounty Hunter Module                           *
 *                    (  and area capturing as well  )                      *
 ****************************************************************************/

#include "character.h"
#include "mud.h"

BOUNTY_DATA *first_bounty = NULL;
BOUNTY_DATA *last_bounty = NULL;
BOUNTY_DATA *first_disintegration = NULL;
BOUNTY_DATA *last_disintegration = NULL;

void nodisintegration( Character *ch , Character *victim , long amount );

void save_disintegrations()
{
  BOUNTY_DATA *tbounty = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SYSTEM_DIR, DISINTEGRATION_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      bug( "FATAL: cannot open disintegration.lst for writing!\r\n", 0 );
      return;
    }

  for ( tbounty = first_disintegration; tbounty; tbounty = tbounty->next )
    {
      fprintf( fpout, "%s\n", tbounty->target );
      fprintf( fpout, "%ld\n", tbounty->amount );

      fprintf( fpout, "%s\n", tbounty->poster );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

bool is_disintegration( const Character *victim )
{
  BOUNTY_DATA *bounty = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    if ( !str_cmp( victim->name , bounty->target ) )
      return TRUE;

  return FALSE;
}

BOUNTY_DATA *get_disintegration( const char *target )
{
  BOUNTY_DATA *bounty = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    if ( !str_cmp( target, bounty->target ) )
      return bounty;

  return NULL;
}

void load_bounties( void )
{
  FILE *fpList = NULL;
  const char *target = NULL;
  const char *poster = NULL;
  char bountylist[256];
  BOUNTY_DATA *bounty = NULL;
  long amount = 0;

  log_string( "Loading disintegrations..." );

  sprintf( bountylist, "%s%s", SYSTEM_DIR, DISINTEGRATION_LIST );

  if ( ( fpList = fopen( bountylist, "r" ) ) == NULL )
    {
      perror( bountylist );
      exit( 1 );
    }

  for ( ; ; )
    {
      target = feof( fpList ) ? "$" : fread_word( fpList );
      if ( target[0] == '$' )
        break;
      CREATE( bounty, BOUNTY_DATA, 1 );
      LINK( bounty, first_disintegration, last_disintegration, next, prev );
      bounty->target = STRALLOC(target);

      amount = fread_number( fpList );
      bounty->amount = amount;
      poster = feof( fpList ) ? "$" : fread_word( fpList );

      if ( poster[0] == '$' )
        break;

      bounty->poster = STRALLOC(poster);

    }

  fclose( fpList );
  log_string(" Done bounties " );
}

void disintegration ( const Character *ch , const Character *victim , long amount )
{
  BOUNTY_DATA *bounty = NULL;
  bool found = FALSE;
  char buf[MAX_STRING_LENGTH];
  Character *p = NULL;
  Character *p_prev = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    {
      if ( !str_cmp( bounty->target , victim->name ))
        {
          found = TRUE;
          break;
        }
    }

  if (! found)
    {
      CREATE( bounty, BOUNTY_DATA, 1 );
      LINK( bounty, first_disintegration, last_disintegration, next, prev );

      bounty->target = STRALLOC( victim->name );
      bounty->amount = 0;
      bounty->poster = STRALLOC( ch->name );
    }

  bounty->amount = bounty->amount + amount;
  save_disintegrations();

  sprintf( buf, "&R%s has added %ld credits to the bounty on %s.\r\n",
	   ch->name, amount, victim->name );
  send_to_char(buf, ch);

  for (p = last_char; p ; p = p_prev )
    {
      p_prev = p->prev;

      if ( ch->pcdata && ch->pcdata->clan
	   && ( !str_cmp(ch->pcdata->clan->name, "the hunters guild")
		|| !str_cmp(ch->pcdata->clan->name, "the assassins guild") ) )
        ch_printf(p, buf);
      else if (!is_npc(p) && get_trust(p) >= LEVEL_IMMORTAL)
        ch_printf(p, buf);

      if (victim == p)
        ch_printf(p, "&RSomeone has added %ld credits to the bounty on you!\r\n", amount );
    }
}

void remove_disintegration( BOUNTY_DATA *bounty )
{
  UNLINK( bounty, first_disintegration, last_disintegration, next, prev );
  STRFREE( bounty->target );
  STRFREE( bounty->poster );
  DISPOSE( bounty );

  save_disintegrations();
}

void claim_disintegration( Character *ch, const Character *victim )
{
  BOUNTY_DATA *bounty = NULL;
  long xp = 0;
  char buf[MAX_STRING_LENGTH];

  if ( is_npc(victim) )
    return;

  bounty = get_disintegration( victim->name );

  if ( ch == victim )
    {
      if ( bounty != NULL )
        remove_disintegration(bounty);
      return;
    }

  if (bounty &&
      (!ch->pcdata || !ch->pcdata->clan
       || ( str_cmp(ch->pcdata->clan->name, "the hunters guild")
	    || str_cmp(ch->pcdata->clan->name, "the assassins guild") ) ) )
    {
      remove_disintegration(bounty);
      bounty = NULL;
    }

  if (bounty == NULL)
    {
      if ( IS_SET(victim->act , PLR_KILLER ) && !is_npc(ch) )
        {
          xp = URANGE(1, xp_compute(ch, victim) , ( exp_level(get_level( ch, HUNTING_ABILITY ) + 1) - exp_level(get_level( ch, HUNTING_ABILITY ) ) ) );
          gain_exp( ch, HUNTING_ABILITY, xp );
          set_char_color( AT_BLOOD, ch );
          ch_printf( ch, "You receive %ld hunting experience for executing a wanted killer.\r\n", xp );
        }
      else if ( !is_npc(ch) )
        {
          SET_BIT(ch->act, PLR_KILLER );
          ch_printf( ch, "You are now wanted for the murder of %s.\r\n", victim->name );
        }

      return;
    }

  ch->gold += bounty->amount;

  xp = URANGE(1, bounty->amount + xp_compute(ch, victim) , ( exp_level(get_level( ch, HUNTING_ABILITY ) + 1) - exp_level(get_level( ch, HUNTING_ABILITY ) ) ) );
  gain_exp( ch, HUNTING_ABILITY, xp );

  set_char_color( AT_BLOOD, ch );
  ch_printf( ch, "You receive %ld experience and %ld credits,\r\n from the bounty on %s\r\n", exp, bounty->amount, bounty->target );

  sprintf( buf, "The disintegration bounty on %s has been claimed!",victim->name );
  echo_to_all ( AT_RED , buf, 0 );

  if ( !IS_SET(victim->act , PLR_KILLER ) )
    SET_BIT(ch->act, PLR_KILLER );

  remove_disintegration(bounty);
}
