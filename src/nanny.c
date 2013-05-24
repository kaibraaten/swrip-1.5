#include <ctype.h>
#include <string.h>
#include <arpa/telnet.h>

#include "mud.h"
#include "character.h"

static const char echo_off_str    [] = { (const char)IAC, (const char)WILL, TELOPT_ECHO, '\0' };
static const char echo_on_str     [] = { (const char)IAC, (const char)WONT, TELOPT_ECHO, '\0' };
static const char go_ahead_str    [] = { (const char)IAC, (const char)GA, '\0' };
extern bool wizlock;

/*
 * comm.c
 */
bool check_playing( DESCRIPTOR_DATA *d, char *name, bool kick );
bool check_reconnect( DESCRIPTOR_DATA *d, char *name, bool fConn );
bool check_multi( DESCRIPTOR_DATA *d, char *name );

/*
 * boards.c
 */
void mail_count( CHAR_DATA *ch );

/*
 * Local functions
 */
static void nanny_get_name( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_old_password( DESCRIPTOR_DATA *d, char *argument );
static void nanny_confirm_new_name( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_new_password( DESCRIPTOR_DATA *d, char *argument );
static void nanny_confirm_new_password( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_new_sex( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_new_race( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_new_class( DESCRIPTOR_DATA *d, char *argument );
static void nanny_stats_ok( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_want_ansi( DESCRIPTOR_DATA *d, char *argument );
static void nanny_get_msp( DESCRIPTOR_DATA *d, char *argument );
static void nanny_press_enter( DESCRIPTOR_DATA *d, char *argument );
static void nanny_read_motd( DESCRIPTOR_DATA *d, char *argument );

/*
 * Deal with sockets that haven't logged in yet.
 */
void nanny( DESCRIPTOR_DATA *d, char *argument )
{
  while ( isspace(*argument) )
    argument++;

  switch ( d->connected )
    {
    default:
      bug( "Nanny: bad d->connected %d.", d->connected );
      close_socket( d, TRUE );
      return;

    case CON_GET_NAME:
      nanny_get_name( d, argument );
      break;

    case CON_GET_OLD_PASSWORD:
      nanny_get_old_password( d, argument );
      break;

    case CON_CONFIRM_NEW_NAME:
      nanny_confirm_new_name( d, argument );
      break;

    case CON_GET_NEW_PASSWORD:
      nanny_get_new_password( d, argument );
      break;

    case CON_CONFIRM_NEW_PASSWORD:
      nanny_confirm_new_password( d, argument );
      break;

    case CON_GET_NEW_SEX:
      nanny_get_new_sex( d, argument );
      break;

    case CON_GET_NEW_RACE:
      nanny_get_new_race( d, argument );
      break;

    case CON_GET_NEW_CLASS:
      nanny_get_new_class( d, argument );
      break;

    case CON_STATS_OK:
      nanny_stats_ok( d, argument );
      break;

    case CON_GET_WANT_RIPANSI:
      nanny_get_want_ansi( d, argument );
      break;

    case CON_GET_MSP:
      nanny_get_msp( d, argument );
      break;

    case CON_PRESS_ENTER:
      nanny_press_enter( d, argument );
      break;

    case CON_READ_MOTD:
      nanny_read_motd( d, argument );
      break;
    }
}

static void nanny_get_name( DESCRIPTOR_DATA *d, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  bool fOld = FALSE, chk = FALSE;
  BAN_DATA *pban = NULL;
  CHAR_DATA *ch = d->character;

  if ( argument[0] == '\0' )
    {
      close_socket( d, FALSE );
      return;
    }

  argument[0] = UPPER(argument[0]);

  if ( !check_parse_name( argument ) )
    {
      write_to_buffer( d, "Illegal name, try another.\r\nName: ", 0 );
      return;
    }

  if ( !str_cmp( argument, "New" ) )
    {
      if (d->newstate == 0)
	{
	  /* New player */
	  /* Don't allow new players if DENY_NEW_PLAYERS is true */
	  if (sysdata.DENY_NEW_PLAYERS == TRUE)
	    {
	      sprintf( buf, "The mud is currently preparing for a reboot.\r\n" );
	      write_to_buffer( d, buf, 0 );
	      sprintf( buf, "New players are not accepted during this time.\r\n" );
	      write_to_buffer( d, buf, 0 );
	      sprintf( buf, "Please try again in a few minutes.\r\n" );
	      write_to_buffer( d, buf, 0 );
	      close_socket( d, FALSE );
	    }

	  sprintf( buf, "\r\nChoosing a name is one of the most important parts of this game...\r\n"
                       "Make sure to pick a name appropriate to the character you are going\r\n"
                       "to role play, and be sure that it suits our Star Wars theme.\r\n"
                       "If the name you select is not acceptable, you will be asked to choose\r\n"
 "another one.\r\n\r\nPlease choose a name for your character: ");
	  write_to_buffer( d, buf, 0 );
	  d->newstate++;
	  d->connected = CON_GET_NAME;
	  return;
	}
      else
	{
	  write_to_buffer(d, "Illegal name, try another.\r\nName: ", 0);
	  return;
	}
    }

  if ( check_playing( d, argument, FALSE ) == BERR )
    {
      write_to_buffer( d, "Name: ", 0 );
      return;
    }

  fOld = load_char_obj( d, argument, TRUE );

  if ( !d->character )
    {
      sprintf( log_buf, "Bad player file %s@%s.", argument, d->remote.host );
      log_string( log_buf );
      write_to_buffer( d, "Your playerfile is corrupt...Please notify mail@mymud.com\r\n", 0 );
      close_socket( d, FALSE );
      return;
    }

  ch = d->character;

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( ( !str_prefix( pban->name, d->remote.host )
	     || !str_suffix( pban->name, d->remote.host ) )
	   && pban->level >= ch->top_level )
	{
	  write_to_buffer( d,
			   "Your site has been banned from this Mud.\r\n", 0 );
	  close_socket( d, FALSE );
	  return;
	}
    }

  if ( IS_SET(ch->act, PLR_DENY) )
    {
      sprintf( log_buf, "Denying access to %s@%s.", argument, d->remote.host );
      log_string_plus( log_buf, LOG_COMM, sysdata.log_level );

      if (d->newstate != 0)
	{
	  write_to_buffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->connected = CON_GET_NAME;
	  return;
	}

      write_to_buffer( d, "You are denied access.\r\n", 0 );
      close_socket( d, FALSE );
      return;
    }

  chk = check_reconnect( d, argument, FALSE );

  if ( chk == BERR )
    {
      return;
    }

  if ( chk )
    {
      fOld = TRUE;
    }
  else
    {
      if ( wizlock && !is_immortal(ch) )
	{
	  write_to_buffer( d, "The game is wizlocked. Only immortals can connect now.\r\n", 0 );
	  write_to_buffer( d, "Please try back later.\r\n", 0 );
	  close_socket( d, FALSE );
	  return;
	}
    }

  if ( fOld )
    {
      if (d->newstate != 0)
	{
	  write_to_buffer( d, "That name is already taken. Please choose another: ", 0 );
	  d->connected = CON_GET_NAME;
	  return;
	}

      /* Old player */
      write_to_buffer( d, "Password: ", 0 );
      write_to_buffer( d, echo_off_str, 0 );
      d->connected = CON_GET_OLD_PASSWORD;
      return;
    }
  else
    {
      if (check_bad_name(ch->name)) {
	write_to_buffer( d, "\r\nThat name is unacceptable, please choose a\
nother.\r\n", 0);
	write_to_buffer( d, "Name: ",0);
	d->connected = CON_GET_NAME;
	return;
      }

      write_to_buffer( d, "\r\nI don't recognize your name, you must be new\
 here.\r\n\r\n", 0 );
      sprintf( buf, "Did I get that right, %s (Y/N)? ", argument );
      write_to_buffer( d, buf, 0 );
      d->connected = CON_CONFIRM_NEW_NAME;
      return;
    }
}

static void nanny_get_old_password( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;
  bool fOld = FALSE, chk = FALSE;
  char buf[MAX_STRING_LENGTH];

  write_to_buffer( d, "\r\n", 2 );

  if ( str_cmp( encode_string( argument ), ch->pcdata->pwd ) )
    {
      write_to_buffer( d, "Wrong password.\r\n", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->character->desc = NULL;
      close_socket( d, FALSE );
      return;
    }

  write_to_buffer( d, echo_on_str, 0 );

  if ( check_playing( d, ch->name, TRUE ) )
    {
      return;
    }

  chk = check_reconnect( d, ch->name, TRUE );

  if ( chk == BERR )
    {
      if ( d->character && d->character->desc )
	{
	  d->character->desc = NULL;
	}

      close_socket( d, FALSE );
      return;
    }

  if ( chk == TRUE )
    {
      return;
    }

  if ( check_multi( d , ch->name  ) )
    {
      close_socket( d, FALSE );
      return;
    }

  sprintf( buf, "%s", ch->name );
  d->character->desc = NULL;
  free_char( d->character );
  fOld = load_char_obj( d, buf, FALSE );
  ch = d->character;
  sprintf( log_buf, "%s@%s has connected.", ch->name, d->remote.host );

  if ( ch->top_level < LEVEL_DEMI )
    {
      /*to_channel( log_buf, CHANNEL_MONITOR, "Monitor", ch->top_level );*/
      log_string_plus( log_buf, LOG_COMM, sysdata.log_level );
    }
  else
    {
      log_string_plus( log_buf, LOG_COMM, ch->top_level );
    }

  write_to_buffer( d, "Press enter...\r\n", 0 );
  d->connected = CON_PRESS_ENTER;

  if ( ch->pcdata->area )
    {
      do_loadarea (ch , "" );
    }
}

static void nanny_confirm_new_name( DESCRIPTOR_DATA *d, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *ch = d->character;

  switch ( *argument )
    {
    case 'y': case 'Y':
      sprintf( buf, "\r\nMake sure to use a password that won't be easily guessed by someone else."
	       "\r\nPick a good password for %s: %s",
	       ch->name, echo_off_str );
      write_to_buffer( d, buf, 0 );
      d->connected = CON_GET_NEW_PASSWORD;
      break;

    case 'n': case 'N':
      write_to_buffer( d, "Ok, what IS it, then? ", 0 );
      /* clear descriptor pointer to get rid of bug message in log */
      d->character->desc = NULL;
      free_char( d->character );
      d->character = NULL;
      d->connected = CON_GET_NAME;
      break;

    default:
      write_to_buffer( d, "Please type Yes or No. ", 0 );
      break;
    }
}

static void nanny_get_new_password( DESCRIPTOR_DATA *d, char *argument )
{
  char *pwdnew = NULL, *p = NULL;
  CHAR_DATA *ch = d->character;

  write_to_buffer( d, "\r\n", 2 );

  if ( strlen(argument) < 5 )
    {
      write_to_buffer( d, "Password must be at least five characters long.\r\nPassword: ", 0 );
      return;
    }

  pwdnew = encode_string( argument );

  for ( p = pwdnew; *p != '\0'; p++ )
    {
      if ( *p == '~' )
	{
	  write_to_buffer( d, "New password not acceptable, try again.\r\nPassword: ", 0 );
	  return;
	}
    }

  DISPOSE( ch->pcdata->pwd );
  ch->pcdata->pwd   = str_dup( pwdnew );
  write_to_buffer( d, "\r\nPlease retype the password to confirm: ", 0 );
  d->connected = CON_CONFIRM_NEW_PASSWORD;
}

static void nanny_confirm_new_password( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;

  write_to_buffer( d, "\r\n", 2 );

  if ( str_cmp( encode_string( argument ), ch->pcdata->pwd ) )
    {
      write_to_buffer( d, "Passwords don't match.\r\nRetype password: ", 0 );
      d->connected = CON_GET_NEW_PASSWORD;
      return;
    }

  write_to_buffer( d, echo_on_str, 0 );
  write_to_buffer( d, "\r\nWhat is your sex (M/F/N)? ", 0 );
  d->connected = CON_GET_NEW_SEX;
}

static void nanny_get_new_sex( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
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
      write_to_buffer( d, "That's not a sex.\r\nWhat IS your sex? ", 0 );
      return;
    }

  write_to_buffer( d, "\r\nYou may choose from the following races, or type showstat [race] to learn more:\r\n", 0 );
  buf[0] = '\0';
  buf2[0] = '\0';
  halfmax = (MAX_RACE/3) + 1;

  for ( iRace = 0; iRace < halfmax; iRace++ )
    {
      if ( iRace == RACE_GOD )
	{
	  continue;
	}

      if(race_table[iRace].race_name && race_table[iRace].race_name[0] != '\0')
	{
	  sprintf( buf2, "%-20s", race_table[iRace].race_name );
	  strcat( buf, buf2 );
	  sprintf( buf2, "%-20s", race_table[iRace+halfmax].race_name );
	  strcat( buf, buf2 );

	  if( iRace + (halfmax*2) < MAX_RACE )
	    {
	      sprintf( buf2, "%s", race_table[iRace+(halfmax*2)].race_name );
	      strcat( buf, buf2 );
	    }

	  strcat( buf, "\r\n" );
	  write_to_buffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  write_to_buffer( d, buf, 0 );
  d->connected = CON_GET_NEW_RACE;
}

static void nanny_get_new_race( DESCRIPTOR_DATA *d, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  CHAR_DATA *ch = d->character;
  int iRace = 0, iClass = 0, halfmax = 0;

  argument = one_argument(argument, arg);

  if (!str_cmp( arg, "help") )
    {
      do_help(ch, argument);
      write_to_buffer( d, "Please choose a race: ", 0);
      return;
    }

  if (!str_cmp( arg, "showstat") )
    {
      do_showstatistic(ch, argument);
      write_to_buffer( d, "Please choose a race: ", 0);
      return;
    }

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    {
      if ( toupper(arg[0]) == toupper(race_table[iRace].race_name[0])
	   &&   !str_prefix( arg, race_table[iRace].race_name ) )
	{
	  ch->race = iRace;
	  break;
	}
    }

  /*
        if ( iRace == RACE_ASSASSIN_DROID || iRace == RACE_YEVETHA || iRace == RACE_COYNITE || iRace == RACE_TOGARIAN)
        {
        write_to_buffer( d,
        "Do to too many people choosing this race, it now must be applied for.\r\nWhat IS your race? ", 0 );
        return;
        }
  */

  if ( iRace == MAX_RACE || iRace == RACE_GOD
       || !race_table[iRace].race_name
       || race_table[iRace].race_name[0] == '\0')
    {
      write_to_buffer( d, "That's not a race.\r\nWhat IS your race? ", 0 );
      return;
    }

  write_to_buffer( d, "\r\nPlease choose a main ability from the following classes:\r\n", 0 );
  buf[0] = '\0';
  buf2[0] = '\0';
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
	  write_to_buffer( d, buf, 0 );
	  buf[0] = '\0';
	}
    }

  strcat( buf, ": " );
  write_to_buffer( d, buf, 0 );
  d->connected = CON_GET_NEW_CLASS;
}

static void nanny_get_new_class( DESCRIPTOR_DATA *d, char *argument )
{
  char arg[MAX_STRING_LENGTH], buf[MAX_STRING_LENGTH];
  CHAR_DATA *ch = d->character;
  int iClass = 0;

  argument = one_argument(argument, arg);

  if (!str_cmp( arg, "help") )
    {
      do_help(ch, argument);
      write_to_buffer( d, "Please choose an ability class: ", 0);
      return;
    }

  for ( iClass = 0; iClass < MAX_ABILITY; iClass++ )
    {
      if ( toupper(arg[0]) == toupper(ability_name[iClass][0])
	   && !str_prefix( arg, ability_name[iClass] ) )
	{
	  ch->ability.main = iClass;
	  break;
	}
    }

  if ( iClass == MAX_ABILITY || iClass == FORCE_ABILITY
       || !ability_name[iClass] || ability_name[iClass][0] == '\0')
    {
      write_to_buffer( d, "That's not a skill class.\r\nWhat IS it going to be? ", 0 );
      return;
    }

  write_to_buffer( d, "\r\nRolling stats....\r\n", 0 );

  ch->stats.perm_str = number_range(1, 6)+number_range(1, 6)+number_range(1, 6);
  ch->stats.perm_int = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
  ch->stats.perm_wis = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
  ch->stats.perm_dex = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
  ch->stats.perm_con = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
  ch->stats.perm_cha = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);

  ch->stats.perm_str       += race_table[ch->race].stats.mod_str;
  ch->stats.perm_int       += race_table[ch->race].stats.mod_int;
  ch->stats.perm_wis       += race_table[ch->race].stats.mod_wis;
  ch->stats.perm_dex       += race_table[ch->race].stats.mod_dex;
  ch->stats.perm_con       += race_table[ch->race].stats.mod_con;
  ch->stats.perm_cha       += race_table[ch->race].stats.mod_cha;

  sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n",
	   ch->stats.perm_str, ch->stats.perm_int, ch->stats.perm_wis,
	   ch->stats.perm_dex, ch->stats.perm_con, ch->stats.perm_cha) ;

  write_to_buffer( d, buf, 0 );
  write_to_buffer( d, "\r\nAre these stats OK, (Y/N)? ", 0 );
  d->connected = CON_STATS_OK;
}

static void nanny_stats_ok( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;
  char buf[MAX_STRING_LENGTH];

  switch ( argument[0] )
    {
    case 'y':
    case 'Y':
      break;

    case 'n':
    case 'N':
      ch->stats.perm_str = number_range(1, 6)+number_range(1, 6)+number_range(1, 6);
      ch->stats.perm_int = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
      ch->stats.perm_wis = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
      ch->stats.perm_dex = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
      ch->stats.perm_con = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);
      ch->stats.perm_cha = number_range(3, 6)+number_range(1, 6)+number_range(1, 6);

      ch->stats.perm_str   += race_table[ch->race].stats.mod_str;
      ch->stats.perm_int   += race_table[ch->race].stats.mod_int;
      ch->stats.perm_wis   += race_table[ch->race].stats.mod_wis;
      ch->stats.perm_dex   += race_table[ch->race].stats.mod_dex;
      ch->stats.perm_con   += race_table[ch->race].stats.mod_con;
      ch->stats.perm_cha   += race_table[ch->race].stats.mod_cha;

      sprintf( buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n" ,
	       ch->stats.perm_str, ch->stats.perm_int, ch->stats.perm_wis,
	       ch->stats.perm_dex, ch->stats.perm_con, ch->stats.perm_cha) ;

      write_to_buffer( d, buf, 0 );
      write_to_buffer( d, "\r\nOK?. ", 0 );
      return;
    default:
      write_to_buffer( d, "Invalid selection.\r\nYES or NO? ", 0 );
      return;
    }

  write_to_buffer( d, "\r\nWould you like ANSI color support, (Y/N)? ", 0 );
  d->connected = CON_GET_WANT_RIPANSI;
}

static void nanny_get_want_ansi( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;

  switch ( argument[0] )
    {
    case 'y':
    case 'Y':
      SET_BIT(ch->act,PLR_ANSI);
    break;

    case 'n':
    case 'N':
      break;

    default:
      write_to_buffer( d, "Invalid selection.\r\nYES or NO? ", 0 );
      return;
    }

  write_to_buffer( d, "Does your mud client have the Mud Sound Protocol, (Y/N)? ", 0);
  d->connected = CON_GET_MSP;
}

static void nanny_get_msp( DESCRIPTOR_DATA *d, char *argument )
{
  int ability = 0;
  CHAR_DATA *ch = d->character;

  switch ( argument[0] )
    {
    case 'y':
    case 'Y':
      SET_BIT(ch->act,PLR_SOUND);
    break;

    case 'n':
    case 'N':
      break;

    default:
      write_to_buffer( d, "Invalid selection.\r\nYES or NO? ", 0 );
      return;
    }

  sprintf( log_buf, "%s@%s new %s.", ch->name, d->remote.host,
	   race_table[ch->race].race_name);
  log_string_plus( log_buf, LOG_COMM, sysdata.log_level);
  to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
  write_to_buffer( d, "Press [ENTER] ", 0 );
  write_to_buffer( d, "Press enter...\r\n", 0 );
  d->connected = CON_PRESS_ENTER;

  for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
    {
      set_level( ch, ability, 0 );
    }

  ch->top_level = 0;
  ch->position = POS_STANDING;
  d->connected = CON_PRESS_ENTER;
}

static void nanny_press_enter( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;

  if ( IS_SET(ch->act, PLR_ANSI) )
    {
      send_to_pager( "\033[2J", ch );
    }
  else
    {
      send_to_pager( "\014", ch );
    }

  if ( is_immortal(ch) )
    {
      send_to_pager( "&WImmortal Message of the Day&w\r\n", ch );
      do_help( ch, "imotd" );
    }

  if ( ch->top_level > 0 )
    {
      send_to_pager( "\r\n&WMessage of the Day&w\r\n", ch );
      do_help( ch, "motd" );
    }

  if ( ch->top_level >= 100)
    {
      send_to_pager( "\r\n&WAvatar Message of the Day&w\r\n", ch );
      do_help( ch, "amotd" );
    }

  if ( ch->top_level == 0 )
    {
      do_help( ch, "nmotd" );
    }

  send_to_pager( "\r\n&WPress [ENTER] &Y", ch );
  d->connected = CON_READ_MOTD;
}

static void nanny_read_motd( DESCRIPTOR_DATA *d, char *argument )
{
  CHAR_DATA *ch = d->character;
  char buf[MAX_STRING_LENGTH];

  write_to_buffer( d, "\r\nWelcome to Rise in Power...\r\n\r\n", 0 );
  add_char( ch );
  d->connected      = CON_PLAYING;

  if ( !is_npc(ch) && IS_SET( ch->act , PLR_SOUND ) )
    {
      send_to_char( "!!MUSIC(starwars.mid V=100)" , ch );
    }

  if ( ch->top_level == 0 )
    {
      OBJ_DATA *obj;
      int iLang;

      ch->pcdata->clan_name = STRALLOC( "" );
      ch->pcdata->clan        = NULL;

      ch->stats.perm_lck = number_range(6, 20);
      ch->stats.perm_frc = number_range(-800, 20);
      ch->affected_by         = race_table[ch->race].affected;
      ch->stats.perm_lck   += race_table[ch->race].stats.mod_lck;
      ch->stats.perm_frc   += race_table[ch->race].stats.mod_frc;

      if ( ch->ability.main == FORCE_ABILITY )
	{
	  ch->stats.perm_frc = URANGE( 1 , ch->stats.perm_frc , 20 );
	}
      else
	{
	  ch->stats.perm_frc = URANGE( 0 , ch->stats.perm_frc , 20 );
	}

      /* Hunters do not recieve force */

      if ( ch->ability.main == HUNTING_ABILITY )
	{
	  ch->stats.perm_frc = 0;
	}

      /* Droids do not recieve force */

      if( is_droid(ch) )
	{
	  ch->stats.perm_frc = 0;
	}

      /* Noghri are auto commando */
      /*
            if (ch->race == RACE_NOGHRI )
            {
            ch->pcdata->clan = get_clan( "The Death Commandos");
            ch->pcdata->clan_name = QUICKLINK( ch->pcdata->clan->name );
            }
      */
      /* took out automaticly knowing common
if ( (iLang = skill_lookup( "common" )) < 0 )
             bug( "Nanny: cannot find common language." );
             else
             ch->pcdata->learned[iLang] = 100;
      */

      for ( iLang = 0; lang_array[iLang] != LANG_UNKNOWN; iLang++ )
	{
	  if ( lang_array[iLang] == race_table[ch->race].language )
	    {
	      break;
	    }
	}

      if ( lang_array[iLang] == LANG_UNKNOWN )
	{
	  bug( "Nanny: invalid racial language." );
	}
      else
	{
	  if ( (iLang = skill_lookup( lang_names[iLang] )) < 0 )
	    {
	      bug( "Nanny: cannot find racial language." );
	    }
	  else
	    {
	      ch->pcdata->learned[iLang] = 100;
	      ch->speaking  =  race_table[ch->race].language;

	      if ( ch->race == RACE_QUARREN
		   && (iLang = skill_lookup( "quarren" )) >= 0 )
		{
		  ch->pcdata->learned[iLang] = 100;
		  SET_BIT( ch->speaks , LANG_QUARREN );
		}

	      if ( ch->race == RACE_MON_CALAMARI
		   && (iLang = skill_lookup( "common" )) >= 0 )
		{
		  ch->pcdata->learned[iLang] = 100;
		}
	    }
	}

      ch->resistant           += race_table[ch->race].resist;
      ch->susceptible     += race_table[ch->race].suscept;

      {
	int ability;

	for ( ability =0 ; ability < MAX_ABILITY ; ability++ )
	  {
	    set_level( ch, ability, 1 );
	    set_exp( ch, ability, 0 );
	  }
      }

      ch->top_level = 1;
      ch->hit        = ch->max_hit;
      ch->hit     += race_table[ch->race].hit;
      ch->max_hit += race_table[ch->race].hit;
      ch->move       = ch->max_move;
      ch->gold     = NEW_CHARACTER_START_CREDITS;

      if ( ch->stats.perm_frc > 0 )
	{
	  ch->max_mana = 100 + 100*ch->stats.perm_frc;
	}
      else
	{
	  ch->max_mana = 0;
	}

      ch->max_mana += race_table[ch->race].mana;
      ch->mana      = ch->max_mana;
      sprintf( buf, "%s the %s",ch->name, race_table[ch->race].race_name );
      set_title( ch, buf );

      /* Added by Narn.  Start new characters with autoexit and autgold
	 already turned on.  Very few people don't use those. */
      SET_BIT( ch->act, PLR_AUTOGOLD );
      SET_BIT( ch->act, PLR_AUTOEXIT );

      /* New players don't have to earn some eq */

      obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_BANNER), 0 );
      obj_to_char( obj, ch );
      equip_char( ch, obj, WEAR_LIGHT );

      /* armor they do though
             obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_VEST), 0 );
             obj_to_char( obj, ch );
             equip_char( ch, obj, WEAR_BODY );

             obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_SHIELD), 0 );
             obj_to_char( obj, ch );
             equip_char( ch, obj, WEAR_SHIELD );
      */

      obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_DAGGER), 0 );
      obj_to_char( obj, ch );
      equip_char( ch, obj, WEAR_WIELD );

      /* comlink */

      {
	OBJ_INDEX_DATA *obj_ind = get_obj_index( OBJ_VNUM_SCHOOL_COMLINK );

	if ( obj_ind != NULL )
	  {
	    obj = create_object( obj_ind, 0 );
	    obj_to_char( obj, ch );
	  }
      }

      if (!sysdata.WAIT_FOR_AUTH)
	{
	  char_to_room( ch, get_room_index( ROOM_VNUM_SCHOOL ) );
	  ch->pcdata->auth_state = 3;
	}
      else
	{
	  char_to_room( ch, get_room_index( ROOM_VNUM_SCHOOL ) );
	  ch->pcdata->auth_state = 1;
	  SET_BIT(ch->pcdata->flags, PCFLAG_UNAUTHED);
	}
      /* Display_prompt interprets blank as default */
      ch->pcdata->prompt = STRALLOC("");
    }
  else if ( !is_immortal(ch) && ch->pcdata->release_date > current_time )
    {
      if ( ch->pcdata->jail_vnum )
	{
	  char_to_room( ch, get_room_index(ch->pcdata->jail_vnum));
	}
      else
	{
	  char_to_room( ch, get_room_index(6) );
	}
    }
  else if ( ch->in_room && !is_immortal( ch )
	    && !IS_SET( ch->in_room->room_flags, ROOM_SPACECRAFT )
	    && ch->in_room != get_room_index(6) )
    {
      char_to_room( ch, ch->in_room );
    }
  else if ( ch->in_room && !is_immortal( ch )
	    && IS_SET( ch->in_room->room_flags, ROOM_SPACECRAFT )
	    && ch->in_room != get_room_index(6) )
    {
      SHIP_DATA *ship;

      for ( ship = first_ship; ship; ship = ship->next )
	{
	  if ( ch->in_room->vnum >= ship->firstroom
	       && ch->in_room->vnum <= ship->lastroom )
	    {
	      if ( ship->sclass != SHIP_PLATFORM || ship->spaceobject )
		{
		  char_to_room( ch, ch->in_room );
		}
	    }
	}
    }
  else
    {
      char_to_room( ch, get_room_index( wherehome(ch) ) );
    }

  if ( IS_SET(ch->act, ACT_POLYMORPHED) )
    REMOVE_BIT(ch->act, ACT_POLYMORPHED);

  if ( IS_SET(ch->act, PLR_QUESTOR) )
    REMOVE_BIT(ch->act, PLR_QUESTOR);

  if ( get_timer( ch, TIMER_SHOVEDRAG ) > 0 )
    remove_timer( ch, TIMER_SHOVEDRAG );

  if ( get_timer( ch, TIMER_PKILLED ) > 0 )
    remove_timer( ch, TIMER_PKILLED );

  if ( ch->plr_home != NULL )
    {
      char filename[256];
      FILE *fph;
      ROOM_INDEX_DATA *storeroom = ch->plr_home;
      OBJ_DATA *obj;
      OBJ_DATA *obj_next;

      for ( obj = storeroom->first_content; obj; obj = obj_next )
	{
	  obj_next = obj->next_content;
	  extract_obj( obj );
	}

      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->name[0]),
	       capitalize( ch->name ) );
      if ( ( fph = fopen( filename, "r" ) ) != NULL )
	{
	  OBJ_DATA *tobj, *tobj_next;

	  rset_supermob(storeroom);

	  for ( ; ; )
	    {
	      char letter;
	      char *word;

	      letter = fread_letter( fph );

	      if ( letter == '*' )
		{
		  fread_to_eol( fph );
		  continue;
		}

	      if ( letter != '#' )
		{
		  bug( "Load_plr_home: # not found.", 0 );
		  bug( ch->name, 0 );
		  break;
		}

	      word = fread_word( fph );

	      if ( !str_cmp( word, "OBJECT" ) )     /* Objects      */
		{
		  fread_obj  ( supermob, fph, OS_CARRY );
		}
	      else
		if ( !str_cmp( word, "END"    ) )   /* Done         */
		  {
		    break;
		  }
		else
		  {
		    bug( "Load_plr_home: bad section.", 0 );
		    bug( ch->name, 0 );
		    break;
		  }
	    }

	  fclose( fph );

	  for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
	    {
	      tobj_next = tobj->next_content;
	      obj_from_char( tobj );

	      if( tobj->item_type != ITEM_MONEY )
		{
		  obj_to_room( tobj, storeroom );
		}
	    }

	  release_supermob();
	}
    }

  if ( ch->pcdata->pet )
    {
      act( AT_ACTION, "$n returns with $s master.",
	   ch->pcdata->pet, NULL, ch, TO_NOTVICT );
      act( AT_ACTION, "$N returns with you.",
	   ch, NULL, ch->pcdata->pet, TO_CHAR );
    }

  ch->pcdata->logon = current_time;

  act( AT_ACTION, "$n has entered the game.", ch, NULL, NULL, TO_ROOM );
  do_look( ch, "auto" );
  mail_count(ch);
}
