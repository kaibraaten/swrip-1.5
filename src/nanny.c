/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include <arpa/telnet.h>

#include "mud.h"
#include "character.h"

typedef void NannyFun( Descriptor *d, char *argument );

static const char echo_off_str    [] = { (const char)IAC, (const char)WILL, TELOPT_ECHO, '\0' };
static const char echo_on_str     [] = { (const char)IAC, (const char)WONT, TELOPT_ECHO, '\0' };
static const char go_ahead_str    [] = { (const char)IAC, (const char)GA, '\0' };
extern bool wizlock;

/*
 * Local functions
 */
static void NannyGetName( Descriptor *d, char *argument );
static void NannyGetOldPassword( Descriptor *d, char *argument );
static void NannyConfirmNewName( Descriptor *d, char *argument );
static void NannyGetNewPassword( Descriptor *d, char *argument );
static void NannyConfirmNewPassword( Descriptor *d, char *argument );
static void NannyGetNewSex( Descriptor *d, char *argument );
static void NannyGetNewRace( Descriptor *d, char *argument );
static void NannyGetNewClass( Descriptor *d, char *argument );
static void NannyStatsOk( Descriptor *d, char *argument );
static void NannyPressEnter( Descriptor *d, char *argument );
static void NannyReadMotd( Descriptor *d, char *argument );

/*
 * Deal with sockets that haven't logged in yet.
 */
void Nanny( Descriptor *d, char *argument )
{
  NannyFun *nannyFun = NULL;

  while ( isspace(*argument) )
    argument++;

  switch ( d->connection_state )
    {
    default:
      Bug( "Nanny: bad d->connection_state %d.", d->connection_state );
      CloseSocket( d, true );
      return;

    case CON_GET_NAME:
      nannyFun = NannyGetName;
      break;

    case CON_GET_OLD_PASSWORD:
      nannyFun = NannyGetOldPassword;
      break;

    case CON_CONFIRM_NEW_NAME:
      nannyFun = NannyConfirmNewName;
      break;

    case CON_GET_NEW_PASSWORD:
      nannyFun = NannyGetNewPassword;
      break;

    case CON_CONFIRM_NEW_PASSWORD:
      nannyFun = NannyConfirmNewPassword;
      break;

    case CON_GET_NEW_SEX:
      nannyFun = NannyGetNewSex;
      break;

    case CON_GET_NEW_RACE:
      nannyFun = NannyGetNewRace;
      break;

    case CON_GET_NEW_CLASS:
      nannyFun = NannyGetNewClass;
      break;

    case CON_STATS_OK:
      nannyFun = NannyStatsOk;
      break;

    case CON_PRESS_ENTER:
      nannyFun = NannyPressEnter;
      break;

    case CON_READ_MOTD:
      nannyFun = NannyReadMotd;
      break;
    }

  nannyFun( d, argument );
}

static void NannyGetName( Descriptor *d, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  bool fOld = false, chk = false;
  Ban *pban = NULL;
  Character *ch = d->character;

  if ( argument[0] == '\0' )
    {
      CloseSocket( d, false );
      return;
    }

  argument[0] = CharToUppercase(argument[0]);

  if ( !IsNameAcceptable( argument ) )
    {
      WriteToBuffer( d, "Illegal name, try another.\r\nName: ", 0 );
      return;
    }

  if ( !StrCmp( argument, "New" ) )
    {
      if (d->newstate == 0)
	{
	  /* New player */
	  /* Don't allow new players if DENY_NEW_PLAYERS is true */
	  if (sysdata.DENY_NEW_PLAYERS == true)
	    {
	      sprintf( buf, "The mud is currently preparing for a reboot.\r\n" );
	      WriteToBuffer( d, buf, 0 );
	      sprintf( buf, "New players are not accepted during this time.\r\n" );
	      WriteToBuffer( d, buf, 0 );
	      sprintf( buf, "Please try again in a few minutes.\r\n" );
	      WriteToBuffer( d, buf, 0 );
	      CloseSocket( d, false );
	    }

	  sprintf( buf, "\r\nChoosing a name is one of the most important parts of this game...\r\n"
                       "Make sure to pick a name appropriate to the character you are going\r\n"
                       "to role play, and be sure that it suits our Star Wars theme.\r\n"
                       "If the name you select is not acceptable, you will be asked to choose\r\n"
 "another one.\r\n\r\nPlease choose a name for your character: ");
	  WriteToBuffer( d, buf, 0 );
	  d->newstate++;
	  d->connection_state = CON_GET_NAME;
	  return;
	}
      else
	{
	  WriteToBuffer(d, "Illegal name, try another.\r\nName: ", 0);
	  return;
	}
    }

  if ( CheckPlaying( d, argument, false ) == BERR )
    {
      WriteToBuffer( d, "Name: ", 0 );
      return;
    }

  fOld = LoadCharacter( d, argument, true );

  if ( !d->character )
    {
      sprintf( log_buf, "Bad player file %s@%s.", argument, d->remote.hostname );
      LogPrintf( log_buf );
      WriteToBuffer( d, "Your playerfile is corrupt...Please notify mail@mymud.com\r\n", 0 );
      CloseSocket( d, false );
      return;
    }

  ch = d->character;

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( ( !StringPrefix( pban->name, d->remote.hostname )
	     || !StringSuffix( pban->name, d->remote.hostname ) )
	   && pban->level >= ch->top_level )
	{
	  WriteToBuffer( d,
			   "Your site has been banned from this Mud.\r\n", 0 );
	  CloseSocket( d, false );
	  return;
	}
    }

  if ( IsBitSet(ch->act, PLR_DENY) )
    {
      sprintf( log_buf, "Denying access to %s@%s.", argument, d->remote.hostname );
      LogStringPlus( log_buf, LOG_COMM, sysdata.log_level );

      if (d->newstate != 0)
	{
	  WriteToBuffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->connection_state = CON_GET_NAME;
	  return;
	}

      WriteToBuffer( d, "You are denied access.\r\n", 0 );
      CloseSocket( d, false );
      return;
    }

  chk = CheckReconnect( d, argument, false );

  if ( chk == BERR )
    {
      return;
    }

  if ( chk )
    {
      fOld = true;
    }
  else
    {
      if ( wizlock && !IsImmortal(ch) )
	{
	  WriteToBuffer( d, "The game is wizlocked. Only immortals can connect now.\r\n", 0 );
	  WriteToBuffer( d, "Please try back later.\r\n", 0 );
	  CloseSocket( d, false );
	  return;
	}
    }

  if ( fOld )
    {
      if (d->newstate != 0)
	{
	  WriteToBuffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->connection_state = CON_GET_NAME;
	  return;
	}

      /* Old player */
      WriteToBuffer( d, "Password: ", 0 );
      WriteToBuffer( d, echo_off_str, 0 );
      d->connection_state = CON_GET_OLD_PASSWORD;
      return;
    }
  else
    {
      if (IsBadName(ch->name)) {
	WriteToBuffer( d, "\r\nThat name is unacceptable, please choose a\
nother.\r\n", 0);
	WriteToBuffer( d, "Name: ",0);
	d->connection_state = CON_GET_NAME;
	return;
      }

      WriteToBuffer( d, "\r\nI don't recognize your name, you must be new\
 here.\r\n\r\n", 0 );
      sprintf( buf, "Did I get that right, %s (Y/N)? ", argument );
      WriteToBuffer( d, buf, 0 );
      d->connection_state = CON_CONFIRM_NEW_NAME;
      return;
    }
}

static void NannyGetOldPassword( Descriptor *d, char *argument )
{
  Character *ch = d->character;
  bool chk = false;
  char buf[MAX_STRING_LENGTH];

  WriteToBuffer( d, "\r\n", 2 );

  if ( StrCmp( EncodeString( argument ), ch->pcdata->pwd ) )
    {
      WriteToBuffer( d, "Wrong password.\r\n", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->character->desc = NULL;
      CloseSocket( d, false );
      return;
    }

  WriteToBuffer( d, echo_on_str, 0 );

  if ( CheckPlaying( d, ch->name, true ) )
    {
      return;
    }

  chk = CheckReconnect( d, ch->name, true );

  if ( chk == BERR )
    {
      if ( d->character && d->character->desc )
	{
	  d->character->desc = NULL;
	}

      CloseSocket( d, false );
      return;
    }

  if ( chk == true )
    {
      return;
    }

  if ( CheckMultiplaying( d , ch->name  ) )
    {
      CloseSocket( d, false );
      return;
    }

  sprintf( buf, "%s", ch->name );
  d->character->desc = NULL;
  FreeCharacter( d->character );
  LoadCharacter( d, buf, false );
  ch = d->character;
  sprintf( log_buf, "%s@%s has connected.", ch->name, d->remote.hostname );

  if ( ch->top_level < LEVEL_CREATOR )
    {
      /*ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", ch->top_level );*/
      LogStringPlus( log_buf, LOG_COMM, sysdata.log_level );
    }
  else
    {
      LogStringPlus( log_buf, LOG_COMM, ch->top_level );
    }

  WriteToBuffer( d, "Press enter...\r\n", 0 );
  d->connection_state = CON_PRESS_ENTER;

  if ( ch->pcdata->area )
    {
      do_loadarea (ch , "" );
    }
}

static void NannyConfirmNewName( Descriptor *d, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *ch = d->character;

  switch ( *argument )
    {
    case 'y': case 'Y':
      sprintf( buf, "\r\nMake sure to use a password that won't be easily guessed by someone else."
	       "\r\nPick a good password for %s: %s",
	       ch->name, echo_off_str );
      WriteToBuffer( d, buf, 0 );
      d->connection_state = CON_GET_NEW_PASSWORD;
      break;

    case 'n': case 'N':
      WriteToBuffer( d, "Ok, what IS it, then? ", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->character->desc = NULL;
      FreeCharacter( d->character );
      d->character = NULL;
      d->connection_state = CON_GET_NAME;
      break;

    default:
      WriteToBuffer( d, "Please type Yes or No. ", 0 );
      break;
    }
}

static void NannyGetNewPassword( Descriptor *d, char *argument )
{
  char *pwdnew = NULL, *p = NULL;
  Character *ch = d->character;

  WriteToBuffer( d, "\r\n", 2 );

  if ( strlen(argument) < 5 )
    {
      WriteToBuffer( d, "Password must be at least five characters long.\r\nPassword: ", 0 );
      return;
    }

  pwdnew = EncodeString( argument );

  for ( p = pwdnew; *p != '\0'; p++ )
    {
      if ( *p == '~' )
	{
	  WriteToBuffer( d, "New password not acceptable, try again.\r\nPassword: ", 0 );
	  return;
	}
    }

  FreeMemory( ch->pcdata->pwd );
  ch->pcdata->pwd   = CopyString( pwdnew );
  WriteToBuffer( d, "\r\nPlease retype the password to confirm: ", 0 );
  d->connection_state = CON_CONFIRM_NEW_PASSWORD;
}

static void NannyConfirmNewPassword( Descriptor *d, char *argument )
{
  Character *ch = d->character;

  WriteToBuffer( d, "\r\n", 2 );

  if ( StrCmp( EncodeString( argument ), ch->pcdata->pwd ) )
    {
      WriteToBuffer( d, "Passwords don't match.\r\nRetype password: ", 0 );
      d->connection_state = CON_GET_NEW_PASSWORD;
      return;
    }

  WriteToBuffer( d, echo_on_str, 0 );
  WriteToBuffer( d, "\r\nWhat is your sex (M/F/N)? ", 0 );
  d->connection_state = CON_GET_NEW_SEX;
}

static void NannyGetNewSex( Descriptor *d, char *argument )
{
  Character *ch = d->character;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf2[MAX_STRING_LENGTH] = {'\0'};
  int halfmax = 0, iRace = 0;

  switch ( argument[0] )
    {
    case 'm':
    case 'M':
      ch->sex = SEX_MALE;
    break;

    case 'f':
    case 'F':
      ch->sex = SEX_FEMALE;
    break;

    case 'n':
    case 'N':
      ch->sex = SEX_NEUTRAL;
    break;

    default:
      WriteToBuffer( d, "That's not a sex.\r\nWhat IS your sex? ", 0 );
      return;
    }

  WriteToBuffer( d, "\r\nYou may choose from the following races, or type showstat [race] to learn more:\r\n", 0 );
  halfmax = (MAX_RACE/3) + 1;

  for ( iRace = 0; iRace < halfmax; iRace++ )
    {
      if ( iRace == RACE_GOD )
	{
	  continue;
	}

      if(RaceTable[iRace].race_name && RaceTable[iRace].race_name[0] != '\0')
	{
	  sprintf( buf2, "%-20s", RaceTable[iRace].race_name );
	  strcat( buf, buf2 );
	  sprintf( buf2, "%-20s", RaceTable[iRace+halfmax].race_name );
	  strcat( buf, buf2 );

	  if( iRace + (halfmax*2) < MAX_RACE )
	    {
	      sprintf( buf2, "%s", RaceTable[iRace+(halfmax*2)].race_name );
	      strcat( buf, buf2 );
	    }

	  strcat( buf, "\r\n" );
	  WriteToBuffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  WriteToBuffer( d, buf, 0 );
  d->connection_state = CON_GET_NEW_RACE;
}

static void NannyGetNewRace( Descriptor *d, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf2[MAX_STRING_LENGTH] = {'\0'};
  Character *ch = d->character;
  int iRace = 0, iClass = 0, halfmax = 0;

  argument = OneArgument(argument, arg);

  if (!StrCmp( arg, "help") )
    {
      do_help(ch, argument);
      WriteToBuffer( d, "Please choose a race: ", 0);
      return;
    }

  if (!StrCmp( arg, "showstat") )
    {
      do_showstatistic(ch, argument);
      WriteToBuffer( d, "Please choose a race: ", 0);
      return;
    }

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    {
      if ( toupper(arg[0]) == toupper(RaceTable[iRace].race_name[0])
	   &&   !StringPrefix( arg, RaceTable[iRace].race_name ) )
	{
	  ch->race = iRace;
	  break;
	}
    }

  if ( iRace == MAX_RACE || iRace == RACE_GOD
       || !RaceTable[iRace].race_name
       || RaceTable[iRace].race_name[0] == '\0')
    {
      WriteToBuffer( d, "That's not a race.\r\nWhat IS your race? ", 0 );
      return;
    }

  WriteToBuffer( d, "\r\nPlease choose a main ability from the following classes:\r\n", 0 );
  halfmax = (MAX_ABILITY/2) + 1;

  for ( iClass = 0; iClass < halfmax; iClass++ )
    {
      if (ability_name[iClass] && ability_name[iClass][0] != '\0')
	{
	  sprintf( buf2, "%-20s", ability_name[iClass] );
	  strcat( buf, buf2 );

	  if( iClass + halfmax < MAX_ABILITY )
	    {
	      sprintf( buf2, "%s", ability_name[iClass+halfmax] );
	      strcat( buf, buf2 );
	    }

	  strcat( buf, "\r\n" );
	  WriteToBuffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  WriteToBuffer( d, buf, 0 );
  d->connection_state = CON_GET_NEW_CLASS;
}

static void NannyGetNewClass( Descriptor *d, char *argument )
{
  char arg[MAX_STRING_LENGTH], buf[MAX_STRING_LENGTH];
  Character *ch = d->character;
  int iClass = 0;

  argument = OneArgument(argument, arg);

  if (!StrCmp( arg, "help") )
    {
      do_help(ch, argument);
      WriteToBuffer( d, "Please choose an ability class: ", 0);
      return;
    }

  for ( iClass = 0; iClass < MAX_ABILITY; iClass++ )
    {
      if ( toupper(arg[0]) == toupper(ability_name[iClass][0])
	   && !StringPrefix( arg, ability_name[iClass] ) )
	{
	  ch->ability.main = iClass;
	  break;
	}
    }

  if ( iClass == MAX_ABILITY || iClass == FORCE_ABILITY
       || !ability_name[iClass] || ability_name[iClass][0] == '\0')
    {
      WriteToBuffer( d, "That's not a skill class.\r\nWhat IS it going to be? ", 0 );
      return;
    }

  WriteToBuffer( d, "\r\nRolling stats....\r\n", 0 );

  ch->stats.perm_str = GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->stats.perm_int = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->stats.perm_wis = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->stats.perm_dex = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->stats.perm_con = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->stats.perm_cha = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);

  ch->stats.perm_str       += RaceTable[ch->race].stats.mod_str;
  ch->stats.perm_int       += RaceTable[ch->race].stats.mod_int;
  ch->stats.perm_wis       += RaceTable[ch->race].stats.mod_wis;
  ch->stats.perm_dex       += RaceTable[ch->race].stats.mod_dex;
  ch->stats.perm_con       += RaceTable[ch->race].stats.mod_con;
  ch->stats.perm_cha       += RaceTable[ch->race].stats.mod_cha;

  sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n",
	   ch->stats.perm_str, ch->stats.perm_int, ch->stats.perm_wis,
	   ch->stats.perm_dex, ch->stats.perm_con, ch->stats.perm_cha) ;

  WriteToBuffer( d, buf, 0 );
  WriteToBuffer( d, "\r\nAre these stats OK, (Y/N)? ", 0 );
  d->connection_state = CON_STATS_OK;
}

static void NannyStatsOk( Descriptor *d, char *argument )
{
  Character *ch = d->character;
  char buf[MAX_STRING_LENGTH];
  int ability = ABILITY_NONE;

  switch ( argument[0] )
    {
    case 'y':
    case 'Y':
      break;

    case 'n':
    case 'N':
      ch->stats.perm_str = GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->stats.perm_int = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->stats.perm_wis = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->stats.perm_dex = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->stats.perm_con = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->stats.perm_cha = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);

      ch->stats.perm_str   += RaceTable[ch->race].stats.mod_str;
      ch->stats.perm_int   += RaceTable[ch->race].stats.mod_int;
      ch->stats.perm_wis   += RaceTable[ch->race].stats.mod_wis;
      ch->stats.perm_dex   += RaceTable[ch->race].stats.mod_dex;
      ch->stats.perm_con   += RaceTable[ch->race].stats.mod_con;
      ch->stats.perm_cha   += RaceTable[ch->race].stats.mod_cha;

      sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n" ,
	       ch->stats.perm_str, ch->stats.perm_int, ch->stats.perm_wis,
	       ch->stats.perm_dex, ch->stats.perm_con, ch->stats.perm_cha) ;

      WriteToBuffer( d, buf, 0 );
      WriteToBuffer( d, "\r\nOK?. ", 0 );
      return;
    default:
      WriteToBuffer( d, "Invalid selection.\r\nYES or NO? ", 0 );
      return;
    }

  SetBit( ch->act, PLR_ANSI );

  sprintf( log_buf, "%s@%s new %s.", ch->name, d->remote.hostname,
	   RaceTable[ch->race].race_name);
  LogStringPlus( log_buf, LOG_COMM, sysdata.log_level);
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  WriteToBuffer( d, "Press [ENTER] ", 0 );
  WriteToBuffer( d, "Press enter...\r\n", 0 );

  for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
    {
      SetAbilityLevel( ch, ability, 0 );
    }

  ch->top_level = 0;
  ch->position = POS_STANDING;
  d->connection_state = CON_PRESS_ENTER;
}

static void NannyPressEnter( Descriptor *d, char *argument )
{
  Character *ch = d->character;

  if ( IsBitSet(ch->act, PLR_ANSI) )
    {
      SendToPager( "\033[2J", ch );
    }
  else
    {
      SendToPager( "\014", ch );
    }

  if ( IsImmortal(ch) )
    {
      SendToPager( "&WImmortal Message of the Day&w\r\n", ch );
      do_help( ch, "imotd" );
    }

  if ( ch->top_level > 0 )
    {
      SendToPager( "\r\n&WMessage of the Day&w\r\n", ch );
      do_help( ch, "motd" );
    }

  if ( ch->top_level >= 100)
    {
      SendToPager( "\r\n&WAvatar Message of the Day&w\r\n", ch );
      do_help( ch, "amotd" );
    }

  if ( ch->top_level == 0 )
    {
      do_help( ch, "nmotd" );
    }

  SendToPager( "\r\n&WPress [ENTER] &Y", ch );
  d->connection_state = CON_READ_MOTD;
}

static void NannyReadMotd( Descriptor *d, char *argument )
{
  Character *ch = d->character;
  char buf[MAX_STRING_LENGTH];

  WriteToBuffer( d, "\r\nWelcome to Rise in Power...\r\n\r\n", 0 );
  AddCharacter( ch );
  d->connection_state      = CON_PLAYING;

  if ( ch->top_level == 0 )
    {
      Object *obj;
      int iLang;

      ch->pcdata->ClanInfo.ClanName = CopyString( "" );
      ch->pcdata->ClanInfo.Clan     = NULL;

      ch->stats.perm_lck = GetRandomNumberFromRange(6, 20);
      ch->stats.perm_frc = GetRandomNumberFromRange(-800, 20);
      ch->affected_by         = RaceTable[ch->race].affected;
      ch->stats.perm_lck   += RaceTable[ch->race].stats.mod_lck;
      ch->stats.perm_frc   += RaceTable[ch->race].stats.mod_frc;

      if ( ch->ability.main == FORCE_ABILITY )
	{
	  ch->stats.perm_frc = urange( 1 , ch->stats.perm_frc , 20 );
	}
      else
	{
	  ch->stats.perm_frc = urange( 0 , ch->stats.perm_frc , 20 );
	}

      /* Hunters do not recieve force */

      if ( ch->ability.main == HUNTING_ABILITY )
	{
	  ch->stats.perm_frc = 0;
	}

      /* Droids do not recieve force */

      if( IsDroid(ch) )
	{
	  ch->stats.perm_frc = 0;
	}

      /* Noghri are auto commando */
      /*
            if (ch->race == RACE_NOGHRI )
            {
            ch->pcdata->clan = GetClan( "The Death Commandos");
            ch->pcdata->clan_name = CopyString( ch->pcdata->clan->name );
            }
      */
      /* took out automaticly knowing common
if ( (iLang = LookupSkill( "common" )) < 0 )
             Bug( "Nanny: cannot find common language." );
             else
             ch->pcdata->learned[iLang] = 100;
      */

      for ( iLang = 0; lang_array[iLang] != LANG_UNKNOWN; iLang++ )
	{
	  if ( lang_array[iLang] == RaceTable[ch->race].language )
	    {
	      break;
	    }
	}

      if ( lang_array[iLang] == LANG_UNKNOWN )
	{
	  Bug( "Nanny: invalid racial language." );
	}
      else
	{
	  if ( (iLang = LookupSkill( lang_names[iLang] )) < 0 )
	    {
	      Bug( "Nanny: cannot find racial language." );
	    }
	  else
	    {
	      ch->pcdata->learned[iLang] = 100;
	      ch->speaking  =  RaceTable[ch->race].language;

	      if ( ch->race == RACE_QUARREN
		   && (iLang = LookupSkill( "quarren" )) >= 0 )
		{
		  ch->pcdata->learned[iLang] = 100;
		  SetBit( ch->speaks , LANG_QUARREN );
		}

	      if ( ch->race == RACE_MON_CALAMARI
		   && (iLang = LookupSkill( "common" )) >= 0 )
		{
		  ch->pcdata->learned[iLang] = 100;
		}
	    }
	}

      ch->resistant           += RaceTable[ch->race].resist;
      ch->susceptible     += RaceTable[ch->race].suscept;

      {
	int ability;

	for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
	  {
	    SetAbilityLevel( ch, ability, 1 );
	    SetAbilityXP( ch, ability, 0 );
	  }
      }

      ch->top_level = 1;
      ch->hit        = ch->max_hit;
      ch->hit     += RaceTable[ch->race].hit;
      ch->max_hit += RaceTable[ch->race].hit;
      ch->move       = ch->max_move;
      ch->gold     = NEW_CHARACTER_START_CREDITS;

      if ( ch->stats.perm_frc > 0 )
	{
	  ch->max_mana = 200;
	}
      else
	{
	  ch->max_mana = 0;
	}

      ch->max_mana += RaceTable[ch->race].mana;
      ch->mana      = ch->max_mana;
      sprintf( buf, "%s the %s",ch->name, RaceTable[ch->race].race_name );
      SetCharacterTitle( ch, buf );

      /* Added by Narn.  Start new characters with autoexit and autgold
	 already turned on.  Very few people don't use those. */
      SetBit( ch->act, PLR_AUTOGOLD );
      SetBit( ch->act, PLR_AUTOEXIT );

      /* New players don't have to earn some eq */

      obj = CreateObject( GetProtoObject(OBJ_VNUM_SCHOOL_GLOWROD), 0 );
      ObjectToCharacter( obj, ch );
      EquipCharacter( ch, obj, WEAR_LIGHT );

      obj = CreateObject( GetProtoObject(OBJ_VNUM_SCHOOL_BLADE), 0 );
      ObjectToCharacter( obj, ch );
      EquipCharacter( ch, obj, WEAR_WIELD );

      /* comlink */

      {
	ProtoObject *obj_ind = GetProtoObject( OBJ_VNUM_SCHOOL_COMLINK );

	if ( obj_ind != NULL )
	  {
	    obj = CreateObject( obj_ind, 0 );
	    ObjectToCharacter( obj, ch );
	  }
      }

      if (!sysdata.WAIT_FOR_AUTH)
	{
	  CharacterToRoom( ch, GetRoom( ROOM_VNUM_SCHOOL ) );
	  ch->pcdata->auth_state = 3;
	}
      else
	{
	  CharacterToRoom( ch, GetRoom( ROOM_VNUM_SCHOOL ) );
	  ch->pcdata->auth_state = 1;
	  SetBit(ch->pcdata->flags, PCFLAG_UNAUTHED);
	}
      /* Display_prompt Interprets blank as default */
      ch->pcdata->prompt = CopyString("");
    }
  else if ( !IsImmortal(ch) && ch->pcdata->release_date > current_time )
    {
      if ( ch->pcdata->jail_vnum )
	{
	  CharacterToRoom( ch, GetRoom(ch->pcdata->jail_vnum));
	}
      else
	{
	  CharacterToRoom( ch, GetRoom(6) );
	}
    }
  else if ( ch->in_room && !IsImmortal( ch )
	    && !IsBitSet( ch->in_room->room_flags, ROOM_SPACECRAFT )
	    && ch->in_room != GetRoom(6) )
    {
      CharacterToRoom( ch, ch->in_room );
    }
  else if ( ch->in_room && !IsImmortal( ch )
	    && IsBitSet( ch->in_room->room_flags, ROOM_SPACECRAFT )
	    && ch->in_room != GetRoom(6) )
    {
      Ship *ship;

      for ( ship = first_ship; ship; ship = ship->next )
	{
	  if ( ch->in_room->vnum >= ship->room.first
	       && ch->in_room->vnum <= ship->room.last )
	    {
	      if ( ship->sclass != SHIP_PLATFORM || ship->spaceobject )
		{
		  CharacterToRoom( ch, ch->in_room );
		}
	    }
	}
    }
  else
    {
      CharacterToRoom( ch, GetRoom( WhereHome(ch) ) );
    }

  if ( IsBitSet(ch->act, ACT_POLYMORPHED) )
    RemoveBit(ch->act, ACT_POLYMORPHED);

  if ( GetTimer( ch, TIMER_SHOVEDRAG ) > 0 )
    RemoveTimer( ch, TIMER_SHOVEDRAG );

  if ( GetTimer( ch, TIMER_PKILLED ) > 0 )
    RemoveTimer( ch, TIMER_PKILLED );

  if ( ch->plr_home != NULL )
    {
      char filename[256];
      FILE *fph;
      Room *storeroom = ch->plr_home;
      Object *obj;
      Object *obj_next;

      for ( obj = storeroom->first_content; obj; obj = obj_next )
	{
	  obj_next = obj->next_content;
	  ExtractObject( obj );
	}

      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->name[0]),
	       Capitalize( ch->name ) );
      if ( ( fph = fopen( filename, "r" ) ) != NULL )
	{
	  Object *tobj, *tobj_next;

	  RoomProgSetSupermob(storeroom);

	  for ( ; ; )
	    {
	      char letter;
	      char *word;

	      letter = ReadChar( fph );

	      if ( letter == '*' )
		{
		  ReadToEndOfLine( fph );
		  continue;
		}

	      if ( letter != '#' )
		{
		  Bug( "Load_plr_home: # not found.", 0 );
		  Bug( ch->name, 0 );
		  break;
		}

	      word = ReadWord( fph );

	      if ( !StrCmp( word, "OBJECT" ) )     /* Objects      */
		{
		  ReadObject  ( supermob, fph, OS_CARRY );
		}
	      else
		if ( !StrCmp( word, "END"    ) )   /* Done         */
		  {
		    break;
		  }
		else
		  {
		    Bug( "Load_plr_home: bad section.", 0 );
		    Bug( ch->name, 0 );
		    break;
		  }
	    }

	  fclose( fph );

	  for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
	    {
	      tobj_next = tobj->next_content;
	      ObjectFromCharacter( tobj );

	      if( tobj->item_type != ITEM_MONEY )
		{
		  ObjectToRoom( tobj, storeroom );
		}
	    }

	  ReleaseSupermob();
	}
    }

  if ( ch->pcdata->pet )
    {
      Act( AT_ACTION, "$n returns with $s master.",
	   ch->pcdata->pet, NULL, ch, TO_NOTVICT );
      Act( AT_ACTION, "$N returns with you.",
	   ch, NULL, ch->pcdata->pet, TO_CHAR );
    }

  ch->pcdata->logon = current_time;

  Act( AT_ACTION, "$n has entered the game.", ch, NULL, NULL, TO_ROOM );
  do_look( ch, "auto" );
  CountMailMessages( ch );
}
