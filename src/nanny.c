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
#include "skill.h"
#include "badname.h"

typedef void NannyFun( Descriptor *d, char *argument );

static const char echo_off_str    [] = { (const char)IAC, (const char)WILL, TELOPT_ECHO, '\0' };
static const char echo_on_str     [] = { (const char)IAC, (const char)WONT, TELOPT_ECHO, '\0' };
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

  switch ( d->ConnectionState )
    {
    default:
      Bug( "Nanny: bad d->ConnectionState %d.", d->ConnectionState );
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
  Character *ch = d->Character;

  if ( IsNullOrEmpty(argument))
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
      if (d->NewState == 0)
	{
	  /* New player */
	  /* Don't allow new players if DENY_NEW_PLAYERS is true */
	  if (SysData.DenyNewPlayers == true)
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
	  d->NewState++;
	  d->ConnectionState = CON_GET_NAME;
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

  if ( !d->Character )
    {
      sprintf( log_buf, "Bad player file %s@%s.", argument, d->Remote.Hostname );
      LogPrintf( log_buf );
      WriteToBuffer( d, "Your playerfile is corrupt...Please notify mail@mymud.com\r\n", 0 );
      CloseSocket( d, false );
      return;
    }

  ch = d->Character;

  for ( pban = FirstBan; pban; pban = pban->Next )
    {
      if ( ( !StringPrefix( pban->Name, d->Remote.Hostname )
	     || !StringSuffix( pban->Name, d->Remote.Hostname ) )
	   && pban->Level >= ch->TopLevel )
	{
	  WriteToBuffer( d,
			   "Your site has been banned from this Mud.\r\n", 0 );
	  CloseSocket( d, false );
	  return;
	}
    }

  if ( IsBitSet(ch->Flags, PLR_DENY) )
    {
      sprintf( log_buf, "Denying access to %s@%s.", argument, d->Remote.Hostname );
      LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );

      if (d->NewState != 0)
	{
	  WriteToBuffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->ConnectionState = CON_GET_NAME;
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
      if (d->NewState != 0)
	{
	  WriteToBuffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->ConnectionState = CON_GET_NAME;
	  return;
	}

      /* Old player */
      WriteToBuffer( d, "Password: ", 0 );
      WriteToBuffer( d, echo_off_str, 0 );
      d->ConnectionState = CON_GET_OLD_PASSWORD;
      return;
    }
  else
    {
      if (IsBadName(ch->Name)) {
	WriteToBuffer( d, "\r\nThat name is unacceptable, please choose a\
nother.\r\n", 0);
	WriteToBuffer( d, "Name: ",0);
	d->ConnectionState = CON_GET_NAME;
	return;
      }

      WriteToBuffer( d, "\r\nI don't recognize your name, you must be new\
 here.\r\n\r\n", 0 );
      sprintf( buf, "Did I get that right, %s (Y/N)? ", argument );
      WriteToBuffer( d, buf, 0 );
      d->ConnectionState = CON_CONFIRM_NEW_NAME;
      return;
    }
}

static void NannyGetOldPassword( Descriptor *d, char *argument )
{
  Character *ch = d->Character;
  bool chk = false;
  char buf[MAX_STRING_LENGTH];

  WriteToBuffer( d, "\r\n", 2 );

  if ( StrCmp( EncodeString( argument ), ch->PCData->Password ) )
    {
      WriteToBuffer( d, "Wrong password.\r\n", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->Character->Desc = NULL;
      CloseSocket( d, false );
      return;
    }

  WriteToBuffer( d, echo_on_str, 0 );

  if ( CheckPlaying( d, ch->Name, true ) )
    {
      return;
    }

  chk = CheckReconnect( d, ch->Name, true );

  if ( chk == BERR )
    {
      if ( d->Character && d->Character->Desc )
	{
	  d->Character->Desc = NULL;
	}

      CloseSocket( d, false );
      return;
    }

  if ( chk == true )
    {
      return;
    }

  if ( CheckMultiplaying( d , ch->Name  ) )
    {
      CloseSocket( d, false );
      return;
    }

  sprintf( buf, "%s", ch->Name );
  d->Character->Desc = NULL;
  FreeCharacter( d->Character );
  LoadCharacter( d, buf, false );
  ch = d->Character;
  sprintf( log_buf, "%s@%s has connected.", ch->Name, d->Remote.Hostname );

  if ( ch->TopLevel < LEVEL_CREATOR )
    {
      /*ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );*/
      LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
    }
  else
    {
      LogStringPlus( log_buf, LOG_COMM, ch->TopLevel );
    }

  WriteToBuffer( d, "Press enter...\r\n", 0 );
  d->ConnectionState = CON_PRESS_ENTER;

  if ( ch->PCData->Build.Area )
    {
      do_loadarea (ch , "" );
    }
}

static void NannyConfirmNewName( Descriptor *d, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *ch = d->Character;

  switch ( *argument )
    {
    case 'y': case 'Y':
      sprintf( buf, "\r\nMake sure to use a password that won't be easily guessed by someone else."
	       "\r\nPick a good password for %s: %s",
	       ch->Name, echo_off_str );
      WriteToBuffer( d, buf, 0 );
      d->ConnectionState = CON_GET_NEW_PASSWORD;
      break;

    case 'n': case 'N':
      WriteToBuffer( d, "Ok, what IS it, then? ", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->Character->Desc = NULL;
      FreeCharacter( d->Character );
      d->Character = NULL;
      d->ConnectionState = CON_GET_NAME;
      break;

    default:
      WriteToBuffer( d, "Please type Yes or No. ", 0 );
      break;
    }
}

static void NannyGetNewPassword( Descriptor *d, char *argument )
{
  char *pwdnew = NULL, *p = NULL;
  Character *ch = d->Character;

  WriteToBuffer( d, "\r\n", 2 );

  if ( strlen(argument) < 5 )
    {
      WriteToBuffer( d, "Password must be at least five characters long.\r\nPassword: ", 0 );
      return;
    }

  pwdnew = EncodeString( argument );

  for ( p = pwdnew; !IsNullOrEmpty( p ); p++ )
    {
      if ( *p == '~' )
	{
	  WriteToBuffer( d, "New password not acceptable, try again.\r\nPassword: ", 0 );
	  return;
	}
    }

  FreeMemory( ch->PCData->Password );
  ch->PCData->Password   = CopyString( pwdnew );
  WriteToBuffer( d, "\r\nPlease retype the password to confirm: ", 0 );
  d->ConnectionState = CON_CONFIRM_NEW_PASSWORD;
}

static void NannyConfirmNewPassword( Descriptor *d, char *argument )
{
  Character *ch = d->Character;

  WriteToBuffer( d, "\r\n", 2 );

  if ( StrCmp( EncodeString( argument ), ch->PCData->Password ) )
    {
      WriteToBuffer( d, "Passwords don't match.\r\nRetype password: ", 0 );
      d->ConnectionState = CON_GET_NEW_PASSWORD;
      return;
    }

  WriteToBuffer( d, echo_on_str, 0 );
  WriteToBuffer( d, "\r\nWhat is your sex (M/F/N)? ", 0 );
  d->ConnectionState = CON_GET_NEW_SEX;
}

static void NannyGetNewSex( Descriptor *d, char *argument )
{
  Character *ch = d->Character;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf2[MAX_STRING_LENGTH] = {'\0'};
  int halfmax = 0, iRace = 0;

  switch ( argument[0] )
    {
    case 'm':
    case 'M':
      ch->Sex = SEX_MALE;
    break;

    case 'f':
    case 'F':
      ch->Sex = SEX_FEMALE;
    break;

    case 'n':
    case 'N':
      ch->Sex = SEX_NEUTRAL;
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

      if( !IsNullOrEmpty(RaceTable[iRace].Name ) )
	{
	  sprintf( buf2, "%-20s", RaceTable[iRace].Name );
	  strcat( buf, buf2 );
	  sprintf( buf2, "%-20s", RaceTable[iRace+halfmax].Name );
	  strcat( buf, buf2 );

	  if( iRace + (halfmax*2) < MAX_RACE )
	    {
	      sprintf( buf2, "%s", RaceTable[iRace+(halfmax*2)].Name );
	      strcat( buf, buf2 );
	    }

	  strcat( buf, "\r\n" );
	  WriteToBuffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  WriteToBuffer( d, buf, 0 );
  d->ConnectionState = CON_GET_NEW_RACE;
}

static void NannyGetNewRace( Descriptor *d, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  char buf[MAX_STRING_LENGTH] = {'\0'};
  char buf2[MAX_STRING_LENGTH] = {'\0'};
  Character *ch = d->Character;
  int iRace = 0, iClass = 0;
  int columns = 0;
  
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
      if ( toupper(arg[0]) == toupper(RaceTable[iRace].Name[0])
	   && !StringPrefix( arg, RaceTable[iRace].Name ) )
	{
	  ch->Race = iRace;
	  break;
	}
    }

  if ( iRace == MAX_RACE || iRace == RACE_GOD
       || IsNullOrEmpty( RaceTable[iRace].Name ) )
    {
      WriteToBuffer( d, "That's not a race.\r\nWhat IS your race? ", 0 );
      return;
    }

  WriteToBuffer( d, "\r\nPlease choose a main ability from the following classes:\r\n", 0 );

  for ( iClass = 0; iClass < MAX_ABILITY; iClass++ )
    {
      if( iClass == FORCE_ABILITY && !SysData.CanChooseJedi )
	{
	  continue;
	}
      
      if ( !IsNullOrEmpty( AbilityName[iClass] ) )
	{
	  sprintf( buf2, "%-20s", AbilityName[iClass] );
	  strcat( buf, buf2 );

	  if( ++columns % 2 == 0 )
	    {
	      strcat( buf, "\r\n" );
	    }
	  
	  WriteToBuffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  WriteToBuffer( d, buf, 0 );
  d->ConnectionState = CON_GET_NEW_CLASS;
}

static void NannyGetNewClass( Descriptor *d, char *argument )
{
  char arg[MAX_STRING_LENGTH], buf[MAX_STRING_LENGTH];
  Character *ch = d->Character;
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
      if ( toupper(arg[0]) == toupper(AbilityName[iClass][0])
	   && !StringPrefix( arg, AbilityName[iClass] ) )
	{
	  ch->Ability.Main = iClass;
	  break;
	}
    }

  if ( iClass == MAX_ABILITY
       || ( iClass == FORCE_ABILITY && !SysData.CanChooseJedi )
       || AbilityName[iClass] )
    {
      WriteToBuffer( d, "That's not a skill class.\r\nWhat IS it going to be? ", 0 );
      return;
    }

  WriteToBuffer( d, "\r\nRolling stats....\r\n", 0 );

  ch->Stats.PermStr = GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->Stats.PermInt = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->Stats.PermWis = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->Stats.PermDex = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->Stats.PermCon = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
  ch->Stats.PermCha = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);

  ch->Stats.PermStr       += RaceTable[ch->Race].Stats.ModStr;
  ch->Stats.PermInt       += RaceTable[ch->Race].Stats.ModInt;
  ch->Stats.PermWis       += RaceTable[ch->Race].Stats.ModWis;
  ch->Stats.PermDex       += RaceTable[ch->Race].Stats.ModDex;
  ch->Stats.PermCon       += RaceTable[ch->Race].Stats.ModCon;
  ch->Stats.PermCha       += RaceTable[ch->Race].Stats.ModCha;

  sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n",
	   ch->Stats.PermStr, ch->Stats.PermInt, ch->Stats.PermWis,
	   ch->Stats.PermDex, ch->Stats.PermCon, ch->Stats.PermCha) ;

  WriteToBuffer( d, buf, 0 );
  WriteToBuffer( d, "\r\nAre these stats OK, (Y/N)? ", 0 );
  d->ConnectionState = CON_STATS_OK;
}

static void NannyStatsOk( Descriptor *d, char *argument )
{
  Character *ch = d->Character;
  char buf[MAX_STRING_LENGTH];
  int ability = ABILITY_NONE;

  switch ( argument[0] )
    {
    case 'y':
    case 'Y':
      break;

    case 'n':
    case 'N':
      ch->Stats.PermStr = GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->Stats.PermInt = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->Stats.PermWis = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->Stats.PermDex = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->Stats.PermCon = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);
      ch->Stats.PermCha = GetRandomNumberFromRange(3, 6)+GetRandomNumberFromRange(1, 6)+GetRandomNumberFromRange(1, 6);

      ch->Stats.PermStr   += RaceTable[ch->Race].Stats.ModStr;
      ch->Stats.PermInt   += RaceTable[ch->Race].Stats.ModInt;
      ch->Stats.PermWis   += RaceTable[ch->Race].Stats.ModWis;
      ch->Stats.PermDex   += RaceTable[ch->Race].Stats.ModDex;
      ch->Stats.PermCon   += RaceTable[ch->Race].Stats.ModCon;
      ch->Stats.PermCha   += RaceTable[ch->Race].Stats.ModCha;

      sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n" ,
	       ch->Stats.PermStr, ch->Stats.PermInt, ch->Stats.PermWis,
	       ch->Stats.PermDex, ch->Stats.PermCon, ch->Stats.PermCha) ;

      WriteToBuffer( d, buf, 0 );
      WriteToBuffer( d, "\r\nOK?. ", 0 );
      return;
    default:
      WriteToBuffer( d, "Invalid selection.\r\nYES or NO? ", 0 );
      return;
    }

  SetBit( ch->Flags, PLR_ANSI );

  sprintf( log_buf, "%s@%s new %s.", ch->Name, d->Remote.Hostname,
	   RaceTable[ch->Race].Name);
  LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
  ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  WriteToBuffer( d, "Press [ENTER] ", 0 );
  WriteToBuffer( d, "Press enter...\r\n", 0 );

  for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
    {
      SetAbilityLevel( ch, ability, 0 );
    }

  ch->TopLevel = 0;
  ch->Position = POS_STANDING;
  d->ConnectionState = CON_PRESS_ENTER;
}

static void NannyPressEnter( Descriptor *d, char *argument )
{
  Character *ch = d->Character;

  if ( IsBitSet(ch->Flags, PLR_ANSI) )
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

  if ( ch->TopLevel > 0 )
    {
      SendToPager( "\r\n&WMessage of the Day&w\r\n", ch );
      do_help( ch, "motd" );
    }

  if ( ch->TopLevel >= 100)
    {
      SendToPager( "\r\n&WAvatar Message of the Day&w\r\n", ch );
      do_help( ch, "amotd" );
    }

  if ( ch->TopLevel == 0 )
    {
      do_help( ch, "nmotd" );
    }

  SendToPager( "\r\n&WPress [ENTER] &Y", ch );
  d->ConnectionState = CON_READ_MOTD;
}

static void NannyReadMotd( Descriptor *d, char *argument )
{
  Character *ch = d->Character;
  char buf[MAX_STRING_LENGTH];

  WriteToBuffer( d, "\r\nWelcome to SWRiP 1.5\r\n\r\n", 0 );
  AddCharacter( ch );
  d->ConnectionState      = CON_PLAYING;

  if ( ch->TopLevel == 0 )
    {
      Object *obj;
      int iLang;

      ch->PCData->ClanInfo.ClanName = CopyString( "" );
      ch->PCData->ClanInfo.Clan     = NULL;

      ch->Stats.PermLck = GetRandomNumberFromRange(6, 20);
      ch->Stats.PermFrc = GetRandomNumberFromRange(-800, 20);
      ch->AffectedBy         = RaceTable[ch->Race].Affected;
      ch->Stats.PermLck   += RaceTable[ch->Race].Stats.ModLck;
      ch->Stats.PermFrc   += RaceTable[ch->Race].Stats.ModFrc;

      if ( ch->Ability.Main == FORCE_ABILITY )
	{
	  ch->Stats.PermFrc = urange( 1 , ch->Stats.PermFrc , 20 );
	}
      else
	{
	  ch->Stats.PermFrc = urange( 0 , ch->Stats.PermFrc , 20 );
	}

      /* Hunters do not recieve force */

      if ( ch->Ability.Main == HUNTING_ABILITY )
	{
	  ch->Stats.PermFrc = 0;
	}

      /* Droids do not recieve force */

      if( IsDroid(ch) )
	{
	  ch->Stats.PermFrc = 0;
	}

      for ( iLang = 0; LanguageArray[iLang] != LANG_UNKNOWN; iLang++ )
	{
	  if ( LanguageArray[iLang] == RaceTable[ch->Race].Language )
	    {
	      break;
	    }
	}

      if ( LanguageArray[iLang] == LANG_UNKNOWN )
	{
	  Bug( "Nanny: invalid racial language." );
	}
      else
	{
	  if ( (iLang = LookupSkill( LanguageNames[iLang] )) < 0 )
	    {
	      Bug( "Nanny: cannot find racial language." );
	    }
	  else
	    {
	      ch->PCData->Learned[iLang] = 100;
	      ch->Speaking  =  RaceTable[ch->Race].Language;

	      if ( ch->Race == RACE_QUARREN
		   && (iLang = LookupSkill( "quarren" )) >= 0 )
		{
		  ch->PCData->Learned[iLang] = 100;
		  SetBit( ch->Speaks , LANG_QUARREN );
		}

	      if ( ch->Race == RACE_MON_CALAMARI
		   && (iLang = LookupSkill( "common" )) >= 0 )
		{
		  ch->PCData->Learned[iLang] = 100;
		}
	    }
	}

      ch->Resistant           += RaceTable[ch->Race].Resistant;
      ch->Susceptible     += RaceTable[ch->Race].Susceptible;

      {
	int ability;

	for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
	  {
	    SetAbilityLevel( ch, ability, 1 );
	    SetAbilityXP( ch, ability, 0 );
	  }
      }

      ch->TopLevel = 1;
      ch->Hit        = ch->MaxHit;
      ch->Hit     += RaceTable[ch->Race].Hit;
      ch->MaxHit += RaceTable[ch->Race].Hit;
      ch->Move       = ch->MaxMove;
      ch->Gold     = NEW_CHARACTER_START_CREDITS;

      if ( ch->Stats.PermFrc > 0 )
	{
	  ch->MaxMana = 200;
	}
      else
	{
	  ch->MaxMana = 0;
	}

      ch->MaxMana += RaceTable[ch->Race].Mana;
      ch->Mana      = ch->MaxMana;
      sprintf( buf, "%s the %s",ch->Name, RaceTable[ch->Race].Name );
      SetCharacterTitle( ch, buf );

      /* Added by Narn.  Start new characters with autoexit and autgold
	 already turned on.  Very few people don't use those. */
      SetBit( ch->Flags, PLR_AUTOGOLD );
      SetBit( ch->Flags, PLR_AUTOEXIT );

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

      if ( !SysData.NewPlayersMustWaitForAuth )
	{
	  CharacterToRoom( ch, GetRoom( ROOM_VNUM_SCHOOL ) );
	  ch->PCData->AuthState = 3;
	}
      else
	{
	  CharacterToRoom( ch, GetRoom( ROOM_VNUM_SCHOOL ) );
	  ch->PCData->AuthState = 1;
	  SetBit(ch->PCData->Flags, PCFLAG_UNAUTHED);
	}
      /* Display_prompt Interprets blank as default */
      ch->PCData->Prompt = CopyString("");
    }
  else if ( !IsImmortal(ch) && ch->PCData->ReleaseDate > current_time )
    {
      if ( ch->PCData->JailVnum )
	{
	  CharacterToRoom( ch, GetRoom(ch->PCData->JailVnum));
	}
      else
	{
	  CharacterToRoom( ch, GetRoom(ROOM_VNUM_HELL) );
	}
    }
  else if ( ch->InRoom && !IsImmortal( ch )
	    && !IsBitSet( ch->InRoom->Flags, ROOM_SPACECRAFT )
	    && ch->InRoom != GetRoom(ROOM_VNUM_HELL) )
    {
      CharacterToRoom( ch, ch->InRoom );
    }
  else if ( ch->InRoom && !IsImmortal( ch )
	    && IsBitSet( ch->InRoom->Flags, ROOM_SPACECRAFT )
	    && ch->InRoom != GetRoom(ROOM_VNUM_HELL) )
    {
      Ship *ship;

      for ( ship = first_ship; ship; ship = ship->Next )
	{
	  if ( ch->InRoom->Vnum >= ship->Room.First
	       && ch->InRoom->Vnum <= ship->Room.Last )
	    {
	      if ( ship->ShipClass != SHIP_PLATFORM || ship->Spaceobject )
		{
		  CharacterToRoom( ch, ch->InRoom );
		}
	    }
	}
    }
  else
    {
      CharacterToRoom( ch, GetRoom( WhereHome(ch) ) );
    }

  if ( IsBitSet(ch->Flags, ACT_POLYMORPHED) )
    RemoveBit(ch->Flags, ACT_POLYMORPHED);

  if ( GetTimer( ch, TIMER_SHOVEDRAG ) > 0 )
    RemoveTimer( ch, TIMER_SHOVEDRAG );

  if ( GetTimer( ch, TIMER_PKILLED ) > 0 )
    RemoveTimer( ch, TIMER_PKILLED );

  if ( ch->PlayerHome != NULL )
    {
      char filename[256];
      FILE *fph;
      Room *storeroom = ch->PlayerHome;
      Object *obj;
      Object *obj_next;

      for ( obj = storeroom->FirstContent; obj; obj = obj_next )
	{
	  obj_next = obj->NextContent;
	  ExtractObject( obj );
	}

      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->Name[0]),
	       Capitalize( ch->Name ) );
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
		  Bug( ch->Name, 0 );
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
		    Bug( ch->Name, 0 );
		    break;
		  }
	    }

	  fclose( fph );

	  for ( tobj = supermob->FirstCarrying; tobj; tobj = tobj_next )
	    {
	      tobj_next = tobj->NextContent;
	      ObjectFromCharacter( tobj );

	      if( tobj->ItemType != ITEM_MONEY )
		{
		  ObjectToRoom( tobj, storeroom );
		}
	    }

	  ReleaseSupermob();
	}
    }

  if ( ch->PCData->Pet )
    {
      Act( AT_ACTION, "$n returns with $s master.",
	   ch->PCData->Pet, NULL, ch, TO_NOTVICT );
      Act( AT_ACTION, "$N returns with you.",
	   ch, NULL, ch->PCData->Pet, TO_CHAR );
    }

  ch->PCData->Logon = current_time;

  Act( AT_ACTION, "$n has entered the game.", ch, NULL, NULL, TO_ROOM );
  do_look( ch, "auto" );
  CountMailMessages( ch );
}

bool IsNameAcceptable( const char *name )
{
  const char *pc = NULL;
  bool fIll = true;

  /*
   * Reserved words.
   */
  if ( IsName( name, "all auto someone immortal self god supreme demigod dog guard cityguard cat cornholio spock hicaine hithoric death ass fuck shit piss crap quit" ) )
    return false;

  /*
   * Length restrictions.
   */
  if( strlen(name) <  MIN_NAME_LENGTH || strlen(name) > MAX_NAME_LENGTH )
    return false;

  /*
   * Alphanumerics only.
   * Lock out IllIll twits.
   */
  for ( pc = name; !IsNullOrEmpty( pc ); pc++ )
    {
      if ( !isalpha(*pc) )
        return false;

      if ( CharToLowercase(*pc) != 'i' && CharToLowercase(*pc) != 'l' )
        fIll = false;
    }

  if ( fIll )
    {
      return false;
    }

  return true;
}
