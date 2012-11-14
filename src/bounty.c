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

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
/* #include <stdlib.h> */
#include <time.h>
#include "mud.h"


BOUNTY_DATA * first_bounty;
BOUNTY_DATA * last_bounty;
BOUNTY_DATA * first_disintigration;
BOUNTY_DATA * last_disintigration;


void disintigration( CHAR_DATA *ch , CHAR_DATA *victim , long amount );
void nodisintigration( CHAR_DATA *ch , CHAR_DATA *victim , long amount );
int xp_compute( CHAR_DATA *ch , CHAR_DATA *victim);

void save_disintigrations()
{
  BOUNTY_DATA *tbounty;
  FILE *fpout;
  char filename[256];

  sprintf( filename, "%s%s", SYSTEM_DIR, DISINTIGRATION_LIST );
  fpout = fopen( filename, "w" );
  if ( !fpout )
    {
      bug( "FATAL: cannot open disintigration.lst for writing!\r\n", 0 );
      return;
    }
  for ( tbounty = first_disintigration; tbounty; tbounty = tbounty->next )
    {
      fprintf( fpout, "%s\n", tbounty->target );
      fprintf( fpout, "%ld\n", tbounty->amount );

      fprintf( fpout, "%s\n", tbounty->poster );
    }
  fprintf( fpout, "$\n" );
  fclose( fpout );

}


bool is_disintigration( CHAR_DATA *victim )
{
  BOUNTY_DATA *bounty;

  for ( bounty = first_disintigration; bounty; bounty = bounty->next )
    if ( !str_cmp( victim->name , bounty->target ) )
      return TRUE;
  return FALSE;
}

BOUNTY_DATA *get_disintigration( char *target )
{
  BOUNTY_DATA *bounty;

  for ( bounty = first_disintigration; bounty; bounty = bounty->next )
    if ( !str_cmp( target, bounty->target ) )
      return bounty;
  return NULL;
}

void load_bounties( )
{
  FILE *fpList;
  char *target, *poster;
  char bountylist[256];
  BOUNTY_DATA *bounty;
  long int  amount;

  first_disintigration = NULL;
  last_disintigration   = NULL;

  log_string( "Loading disintigrations..." );

  sprintf( bountylist, "%s%s", SYSTEM_DIR, DISINTIGRATION_LIST );

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
      LINK( bounty, first_disintigration, last_disintigration, next, prev );
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

void do_bounties( CHAR_DATA *ch, char *argument )
{
  BOUNTY_DATA *bounty;

  int count = 0;
  if ( ( get_trust(ch) < LEVEL_IMMORTAL) && (!ch->pcdata || !ch->pcdata->clan || ( str_cmp(ch->pcdata->clan->name, "the hunters guild") && str_cmp(ch->pcdata->clan->name, "the assassins guild") ) ))
    {    send_to_char( "\r\nOnly hunters can access that information!\r\n", ch );
      return;
    }
  set_char_color( AT_WHITE, ch );
  send_to_char( "\r\nBounty                      Amount          Poster\r\n", ch );
  for ( bounty = first_disintigration; bounty; bounty = bounty->next )
    {
      set_char_color( AT_RED, ch );
      ch_printf( ch, "%-26s %-14ld %-20s\r\n", bounty->target, bounty->amount, bounty->poster );
      count++;
    }

  if ( !count )
    {
      set_char_color( AT_GREY, ch );
      send_to_char( "There are no bounties set at this time.\r\n", ch );
      return;
    }
}

void disintigration ( CHAR_DATA *ch , CHAR_DATA *victim , long amount )
{
  BOUNTY_DATA *bounty;
  bool found;
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *p, *p_prev;
  found = FALSE;

  for ( bounty = first_disintigration; bounty; bounty = bounty->next )
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
      LINK( bounty, first_disintigration, last_disintigration, next, prev );

      bounty->target      = STRALLOC( victim->name );
      bounty->amount      = 0;

      bounty->poster      = STRALLOC( ch->name );
    }

  bounty->amount      = bounty->amount + amount;
  save_disintigrations();

  sprintf( buf, "&R%s has added %ld credits to the bounty on %s.\r\n", ch->name, amount , victim->name );
  send_to_char(buf, ch);

  for (p = last_char; p ; p = p_prev )
    {
      p_prev = p->prev;

      if ( ch->pcdata && ch->pcdata->clan && ( !str_cmp(ch->pcdata->clan->name, "the hunters guild") || !str_cmp(ch->pcdata->clan->name, "the assassins guild") ) )
        ch_printf(p, buf);
      else if (!IS_NPC(p) && get_trust(p) >= LEVEL_IMMORTAL)
        ch_printf(p, buf);
      if (victim == p)
        ch_printf(p, "&RSomeone has added %ld credits to the bounty on you!\r\n", amount );
    }
}

void do_addbounty( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  long int amount;
  CHAR_DATA *victim;

  if ( !argument || argument[0] == '\0' )
    {
      do_bounties( ch , argument );
      return;
    }

  argument = one_argument(argument, arg);

  if (argument[0] == '\0' )
    {
      send_to_char( "Usage: Addbounty <target> <amount>\r\n", ch );
      return;
    }

  if ( ch->pcdata && ch->pcdata->clan && ( !str_cmp(ch->pcdata->clan->name, "the hunters guild") || !str_cmp(ch->pcdata->clan->name, "the assassins guild") ) )
    {
      send_to_char( "Your job is to collect bounties not post them.", ch );
      return;
    }

  if ( !ch->in_room || ch->in_room->vnum != 6604 )
    {
      send_to_char( "You will have to go to the Guild on Tatooine to add a new bounty.", ch );
      return;
    }

  if (argument[0] == '\0' )
    amount = 0;
  else
    amount = atoi (argument);

  if ( amount < 5000 )
    {
      send_to_char( "A bounty should be at least 5000 credits.\r\n", ch );
      return;
    }

  if ( !(victim = get_char_world( ch, arg )) )
    {
      send_to_char( "They don't appear to be here .. wait til they log in.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "You can only set bounties on other players .. not mobs!\r\n", ch );
      return;
    }
  if ( victim->pcdata && victim->pcdata->clan && !str_cmp(victim->pcdata->clan->name, "the hunters guild"))
    {
      send_to_char( "&RYou can not post bounties on bounty hunters!\r\n", ch);
      return;
    }

  if (amount <= 0)
    {
      send_to_char( "Nice try! How about 1 or more credits instead...\r\n", ch );
      return;
    }

  if (ch->gold < amount)
    {
      send_to_char( "You don't have that many credits!\r\n", ch );
      return;
    }
  ch->gold = ch->gold - amount;

  disintigration( ch, victim, amount);
}

void remove_disintigration( BOUNTY_DATA *bounty )
{
  UNLINK( bounty, first_disintigration, last_disintigration, next, prev );
  STRFREE( bounty->target );
  STRFREE( bounty->poster );
  DISPOSE( bounty );

  save_disintigrations();
}

void claim_disintigration( CHAR_DATA *ch , CHAR_DATA *victim )
{
  BOUNTY_DATA *bounty;
  long int     exp;
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC(victim) )
    return;

  bounty = get_disintigration( victim->name );

  if ( ch == victim )
    {
      if ( bounty != NULL )
        remove_disintigration(bounty);
      return;
    }

  if (bounty &&
      (!ch->pcdata || !ch->pcdata->clan || ( str_cmp(ch->pcdata->clan->name, "the hunters guild") || str_cmp(ch->pcdata->clan->name, "the assassins guild") ) ) )
    {
      remove_disintigration(bounty);
      bounty = NULL;
    }

  if (bounty == NULL)
    {
      if ( IS_SET(victim->act , PLR_KILLER ) && !IS_NPC(ch) )
        {
          exp = URANGE(1, xp_compute(ch, victim) , ( exp_level(ch->skill_level[HUNTING_ABILITY]+1) - exp_level(ch->skill_level[HUNTING_ABILITY]) ));
          gain_exp( ch , exp , HUNTING_ABILITY );
          set_char_color( AT_BLOOD, ch );
          ch_printf( ch, "You receive %ld hunting experience for executing a wanted killer.\r\n", exp );
        }
      else if ( !IS_NPC(ch) )
        {
          SET_BIT(ch->act, PLR_KILLER );
          ch_printf( ch, "You are now wanted for the murder of %s.\r\n", victim->name );
        }
      /*             sprintf( buf, "%s is Dead!", victim->name );
                     echo_to_all ( AT_RED , buf, 0 );
      */
      return;

    }

  ch->gold += bounty->amount;

  exp = URANGE(1, bounty->amount + xp_compute(ch, victim) , ( exp_level(ch->skill_level[HUNTING_ABILITY]+1) - exp_level(ch->skill_level[HUNTING_ABILITY]) ));
  gain_exp( ch , exp , HUNTING_ABILITY );

  set_char_color( AT_BLOOD, ch );
  ch_printf( ch, "You receive %ld experience and %ld credits,\r\n from the bounty on %s\r\n", exp, bounty->amount, bounty->target );

  sprintf( buf, "The disintigration bounty on %s has been claimed!",victim->name );
  echo_to_all ( AT_RED , buf, 0 );
  /*    sprintf( buf, "%s is Dead!", victim->name );
        echo_to_all ( AT_RED , buf, 0 );
  */

  if ( !IS_SET(victim->act , PLR_KILLER ) )
    SET_BIT(ch->act, PLR_KILLER );
  remove_disintigration(bounty);
}

void do_rembounty(  CHAR_DATA *ch, char *argument )
{
  BOUNTY_DATA *bounty = get_disintigration( argument );

  if ( bounty != NULL )
    remove_disintigration(bounty);
  return;

}
