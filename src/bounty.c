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
#include "clan.h"
#include "bounty.h"

Bounty *first_bounty = NULL;
Bounty *last_bounty = NULL;

static void SaveBounties( void )
{
  Bounty *tbounty = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", SYSTEM_DIR, BOUNTY_LIST );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open bounty.lst for writing!\r\n", 0 );
      return;
    }

  for ( tbounty = first_bounty; tbounty; tbounty = tbounty->next )
    {
      fprintf( fpout, "%s\n", tbounty->Target );
      fprintf( fpout, "%ld\n", tbounty->Reward );
      fprintf( fpout, "%s\n", tbounty->Poster );
    }

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

bool IsBountyOn( const Character *victim )
{
  const Bounty *bounty = NULL;

  for ( bounty = first_bounty; bounty; bounty = bounty->next )
    {
      if ( !StrCmp( victim->name , bounty->Target ) )
	{
	  return true;
	}
    }

  return false;
}

Bounty *GetBounty( const char *target )
{
  Bounty *bounty = NULL;

  for ( bounty = first_bounty; bounty; bounty = bounty->next )
    {
      if ( !StrCmp( target, bounty->Target ) )
	{
	  return bounty;
	}
    }

  return NULL;
}

void LoadBounties( void )
{
  FILE *fpList = NULL;
  char bountylist[256];

  LogPrintf( "Loading bounties..." );

  sprintf( bountylist, "%s%s", SYSTEM_DIR, BOUNTY_LIST );

  if ( ( fpList = fopen( bountylist, "r" ) ) == NULL )
    {
      perror( bountylist );
      exit( 1 );
    }

  for ( ; ; )
    {
      const char *target = feof( fpList ) ? "$" : ReadWord( fpList );
      const char *poster = NULL;
      Bounty *bounty = NULL;
      long reward = 0;

      if ( target[0] == '$' )
	{
	  break;
	}

      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, first_bounty, last_bounty, next, prev );
      bounty->Target = CopyString(target);

      reward = ReadInt( fpList );
      bounty->Reward = reward;
      poster = feof( fpList ) ? "$" : ReadWord( fpList );

      if ( poster[0] == '$' )
	{
	  break;
	}

      bounty->Poster = CopyString(poster);
    }

  fclose( fpList );
  LogPrintf(" Done bounties " );
}

void AddBounty( const Character *ch , const Character *victim , long amount )
{
  Bounty *bounty = NULL;
  bool found = false;
  char buf[MAX_STRING_LENGTH];
  Character *p = NULL;
  Character *p_prev = NULL;

  for ( bounty = first_bounty; bounty; bounty = bounty->next )
    {
      if ( !StrCmp( bounty->Target , victim->name ))
        {
          found = true;
          break;
        }
    }

  if (!found)
    {
      AllocateMemory( bounty, Bounty, 1 );
      LINK( bounty, first_bounty, last_bounty, next, prev );

      bounty->Target = CopyString( victim->name );
      bounty->Poster = CopyString( ch->name );
      bounty->Reward = 0;
    }

  bounty->Reward = bounty->Reward + amount;
  SaveBounties();

  sprintf( buf, "&R%s has added %ld credits to the bounty on %s.\r\n",
	   ch->name, amount, victim->name );
  SendToCharacter(buf, ch);

  for (p = last_char; p ; p = p_prev )
    {
      p_prev = p->prev;

      if ( ( ( ch->pcdata
	       && ch->pcdata->ClanInfo.Clan
	       && ( !StrCmp(ch->pcdata->ClanInfo.Clan->Name, "the hunters guild")
		    || !StrCmp(ch->pcdata->ClanInfo.Clan->Name, "the assassins guild") ) )
	     || IsImmortal(p) ) && p != ch )
	{
	  Echo(p, buf);
	}

      if (victim == p)
	{
	  Echo(p, "&RSomeone has added %ld credits to the bounty on you!\r\n", amount );
	}
    }
}

void RemoveBounty( Bounty *bounty )
{
  UNLINK( bounty, first_bounty, last_bounty, next, prev );
  FreeMemory( bounty->Target );
  FreeMemory( bounty->Poster );
  FreeMemory( bounty );

  SaveBounties();
}

void ClaimBounty( Character *ch, const Character *victim )
{
  Bounty *bounty = NULL;
  long xp = 0;
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(victim) )
    {
      return;
    }

  bounty = GetBounty( victim->name );

  if ( ch == victim )
    {
      if ( bounty != NULL )
        RemoveBounty(bounty);

      return;
    }

  if (bounty
      && ( !ch->pcdata || !ch->pcdata->ClanInfo.Clan
	   || ( StrCmp(ch->pcdata->ClanInfo.Clan->Name, "the hunters guild")
		|| StrCmp(ch->pcdata->ClanInfo.Clan->Name, "the assassins guild") ) ) )
    {
      RemoveBounty(bounty);
      bounty = NULL;
    }

  if (bounty == NULL)
    {
      if ( IsBitSet(victim->act , PLR_KILLER ) && !IsNpc(ch) )
        {
          xp = urange(1, ComputeXP(ch, victim) , ( GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
          GainXP( ch, HUNTING_ABILITY, xp );
          SetCharacterColor( AT_BLOOD, ch );
          Echo( ch, "You receive %ld hunting experience for executing a wanted killer.\r\n", xp );
        }
      else if ( !IsNpc(ch) )
        {
          SetBit(ch->act, PLR_KILLER );
          Echo( ch, "You are now wanted for the murder of %s.\r\n", victim->name );
        }

      return;
    }

  ch->gold += bounty->Reward;

  xp = urange(1, bounty->Reward + ComputeXP(ch, victim) , ( GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, HUNTING_ABILITY ) ) ) );
  GainXP( ch, HUNTING_ABILITY, xp );

  SetCharacterColor( AT_BLOOD, ch );
  Echo( ch, "You receive %ld experience and %ld credits,\r\n from the bounty on %s.\r\n", exp, bounty->Reward, bounty->Target );

  sprintf( buf, "The disintegration bounty on %s has been claimed!",victim->name );
  EchoToAll ( AT_RED , buf, 0 );

  if ( !IsBitSet(victim->act , PLR_KILLER ) )
    {
      SetBit(ch->act, PLR_KILLER );
    }

  RemoveBounty(bounty);
}
