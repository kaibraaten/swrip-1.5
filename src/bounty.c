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

#include "character.h"
#include "mud.h"

Bounty *first_bounty = NULL;
Bounty *last_bounty = NULL;
Bounty *first_disintegration = NULL;
Bounty *last_disintegration = NULL;

void nodisintegration( Character *ch , Character *victim , long amount );

void save_disintegrations()
{
  Bounty *tbounty = NULL;
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
  Bounty *bounty = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    if ( !StrCmp( victim->name , bounty->target ) )
      return true;

  return false;
}

Bounty *get_disintegration( const char *target )
{
  Bounty *bounty = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    if ( !StrCmp( target, bounty->target ) )
      return bounty;

  return NULL;
}

void load_bounties( void )
{
  FILE *fpList = NULL;
  const char *target = NULL;
  const char *poster = NULL;
  char bountylist[256];
  Bounty *bounty = NULL;
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
      target = feof( fpList ) ? "$" : ReadWord( fpList );
      if ( target[0] == '$' )
        break;
      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, first_disintegration, last_disintegration, next, prev );
      bounty->target = CopyString(target);

      amount = ReadInt( fpList );
      bounty->amount = amount;
      poster = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( poster[0] == '$' )
        break;

      bounty->poster = CopyString(poster);

    }

  fclose( fpList );
  log_string(" Done bounties " );
}

void disintegration ( const Character *ch , const Character *victim , long amount )
{
  Bounty *bounty = NULL;
  bool found = false;
  char buf[MAX_STRING_LENGTH];
  Character *p = NULL;
  Character *p_prev = NULL;

  for ( bounty = first_disintegration; bounty; bounty = bounty->next )
    {
      if ( !StrCmp( bounty->target , victim->name ))
        {
          found = true;
          break;
        }
    }

  if (! found)
    {
      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, first_disintegration, last_disintegration, next, prev );

      bounty->target = CopyString( victim->name );
      bounty->amount = 0;
      bounty->poster = CopyString( ch->name );
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
	   && ( !StrCmp(ch->pcdata->clan->name, "the hunters guild")
		|| !StrCmp(ch->pcdata->clan->name, "the assassins guild") ) )
        ch_printf(p, buf);
      else if (!IsNpc(p) && GetTrustLevel(p) >= LEVEL_IMMORTAL)
        ch_printf(p, buf);

      if (victim == p)
        ch_printf(p, "&RSomeone has added %ld credits to the bounty on you!\r\n", amount );
    }
}

void remove_disintegration( Bounty *bounty )
{
  UNLINK( bounty, first_disintegration, last_disintegration, next, prev );
  FreeMemory( bounty->target );
  FreeMemory( bounty->poster );
  FreeMemory( bounty );

  save_disintegrations();
}

void claim_disintegration( Character *ch, const Character *victim )
{
  Bounty *bounty = NULL;
  long xp = 0;
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(victim) )
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
       || ( StrCmp(ch->pcdata->clan->name, "the hunters guild")
	    || StrCmp(ch->pcdata->clan->name, "the assassins guild") ) ) )
    {
      remove_disintegration(bounty);
      bounty = NULL;
    }

  if (bounty == NULL)
    {
      if ( IsBitSet(victim->act , PLR_KILLER ) && !IsNpc(ch) )
        {
          xp = urange(1, xp_compute(ch, victim) , ( exp_level(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - exp_level(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
          gain_exp( ch, HUNTING_ABILITY, xp );
          set_char_color( AT_BLOOD, ch );
          ch_printf( ch, "You receive %ld hunting experience for executing a wanted killer.\r\n", xp );
        }
      else if ( !IsNpc(ch) )
        {
          SetBit(ch->act, PLR_KILLER );
          ch_printf( ch, "You are now wanted for the murder of %s.\r\n", victim->name );
        }

      return;
    }

  ch->gold += bounty->amount;

  xp = urange(1, bounty->amount + xp_compute(ch, victim) , ( exp_level(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - exp_level(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
  gain_exp( ch, HUNTING_ABILITY, xp );

  set_char_color( AT_BLOOD, ch );
  ch_printf( ch, "You receive %ld experience and %ld credits,\r\n from the bounty on %s\r\n", exp, bounty->amount, bounty->target );

  sprintf( buf, "The disintegration bounty on %s has been claimed!",victim->name );
  EchoToAll ( AT_RED , buf, 0 );

  if ( !IsBitSet(victim->act , PLR_KILLER ) )
    SetBit(ch->act, PLR_KILLER );

  remove_disintegration(bounty);
}
