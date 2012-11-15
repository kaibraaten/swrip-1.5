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
 *                         Wizard/god command module                       *
 ****************************************************************************/

#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <crypt.h>
#include "mud.h"

#define RESTORE_INTERVAL 21600

const char * const save_flag[] =
  { "death", "kill", "passwd", "drop", "put", "give", "auto", "zap",
    "auction", "get", "receive", "idle", "backup", "r13", "r14", "r15", "r16",
    "r17", "r18", "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", "r27",
    "r28", "r29", "r30", "r31" };

/*
 * Local functions.
 */
ROOM_INDEX_DATA * find_location( CHAR_DATA *ch, char *arg );
void              save_banlist( void );
void              close_area( AREA_DATA *pArea );
int               get_color(char *argument); /* function proto */
bool              check_for_immroom( CHAR_DATA *ch, ROOM_INDEX_DATA *location);


/*
 * Global variables.
 */

char reboot_time[50];
time_t new_boot_time_t;
extern struct tm new_boot_struct;
extern OBJ_INDEX_DATA *obj_index_hash[MAX_KEY_HASH];
extern MOB_INDEX_DATA *mob_index_hash[MAX_KEY_HASH];

bool check_for_immroom( CHAR_DATA *ch, ROOM_INDEX_DATA *location)
{
  if (ch->top_level == 105 ? 0: (location->vnum == IMP_ROOM1?1:(location->vnum == IMP_ROOM2?1:0)))
    return TRUE;
  return FALSE;
}

int get_saveflag( char *name )
{
  int x;

  for ( x = 0; x < sizeof(save_flag) / sizeof(save_flag[0]); x++ )
    if ( !str_cmp( name, save_flag[x] ) )
      return x;
  return -1;
}

void do_wizhelp( CHAR_DATA *ch, char *argument )
{
  CMDTYPE * cmd;
  int col, hash;

  col = 0;
  set_pager_color( AT_PLAIN, ch );
  for ( hash = 0; hash < 126; hash++ )
    for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
      if ( cmd->level >= LEVEL_HERO
           &&   cmd->level <= get_trust( ch ) )
        {
          pager_printf( ch, "%-12s", cmd->name );
          if ( ++col % 6 == 0 )
            send_to_pager( "\r\n", ch );
        }

  if ( col % 6 != 0 )
    send_to_pager( "\r\n", ch );
  return;
}

void do_restrict( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  short level, hash;
  CMDTYPE *cmd;
  bool found;

  found = FALSE;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Restrict which command?\r\n", ch );
      return;
    }

  argument = one_argument ( argument, arg2 );
  if ( arg2[0] == '\0' )
    level = get_trust( ch );
  else
    level = atoi( arg2 );

  level = UMAX( UMIN( get_trust( ch ), level ), 0 );

  hash = arg[0] % 126;
  for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
    {
      if ( !str_prefix( arg, cmd->name )
           &&    cmd->level <= get_trust( ch ) )
        {
          found = TRUE;
          break;
        }
    }

  if ( found )
    {
      if ( !str_prefix( arg2, "show" ) )
        {
          sprintf(buf, "%s show", cmd->name);
          do_cedit(ch, buf);
          /*                    ch_printf( ch, "%s is at level %d.\r\n", cmd->name, cmd->level );*/
          return;
        }
      cmd->level = level;
      ch_printf( ch, "You restrict %s to level %d\r\n",
                 cmd->name, level );
      sprintf( buf, "%s restricting %s to level %d",
               ch->name, cmd->name, level );
      log_string( buf );
    }
  else
    send_to_char( "You may not restrict that command.\r\n", ch );

  return;
}

/*
 * Check if the name prefix uniquely identifies a char descriptor
 */
CHAR_DATA *get_waiting_desc( CHAR_DATA *ch, char *name )
{
  DESCRIPTOR_DATA *d;
  CHAR_DATA       *ret_char;
  static unsigned int number_of_hits;

  number_of_hits = 0;
  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d->character && (!str_prefix( name, d->character->name )) &&
           IS_WAITING_FOR_AUTH(d->character) )
        {
          if ( ++number_of_hits > 1 )
            {
              ch_printf( ch, "%s does not uniquely identify a char.\r\n", name );
              return NULL;
            }
          ret_char = d->character;       /* return current char on exit */
        }
    }
  if ( number_of_hits==1 )
    return ret_char;
  else
    {
      send_to_char( "No one like that waiting for authorization.\r\n", ch );
      return NULL;
    }
}

void do_authorize( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  DESCRIPTOR_DATA *d;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage:  authorize <player> <yes|name|no/deny>\r\n", ch );
      send_to_char( "Pending authorizations:\r\n", ch );
      send_to_char( " Chosen Character Name\r\n", ch );
      send_to_char( "---------------------------------------------\r\n", ch );
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) != NULL && IS_WAITING_FOR_AUTH(victim) )
          ch_printf( ch, " %s@%s new %s...\r\n",
                     victim->name,
                     victim->desc->host,
                     race_table[victim->race].race_name );
      return;
    }

  victim = get_waiting_desc( ch, arg1 );
  if ( victim == NULL )
    return;

  if ( arg2[0]=='\0' || !str_cmp( arg2,"accept" ) || !str_cmp( arg2,"yes" ))
    {
      victim->pcdata->auth_state = 3;
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->pcdata->authed_by )
        STRFREE( victim->pcdata->authed_by );
      victim->pcdata->authed_by = QUICKLINK( ch->name );
      sprintf( buf, "%s authorized %s", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
      ch_printf( ch, "You have authorized %s.\r\n", victim->name);

      /* Below sends a message to player when name is accepted - Brittany   */

      ch_printf( victim,                                            /* B */
                 "The MUD Administrators have accepted the name %s.\r\n"       /* B */
                 "You are now fully authorized to play Rise in Power.\r\n",victim->name);                               /* B */
      return;
    }
  else if ( !str_cmp( arg2, "no" ) || !str_cmp( arg2, "deny" ) )
    {
      send_to_char( "You have been denied access.\r\n", victim);
      sprintf( buf, "%s denied authorization to %s", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
      ch_printf( ch, "You have denied %s.\r\n", victim->name);
      do_quit(victim, "");
    }

  else if ( !str_cmp( arg2, "name" ) || !str_cmp(arg2, "n" ) )
    {
      sprintf( buf, "%s has denied %s's name", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
      ch_printf (victim,
                 "The MUD Administrators have found the name %s "
                 "to be unacceptable.\r\n"
                 "Use 'name' to change it to something more apropriate.\r\n", victim->name);
      ch_printf( ch, "You requested %s change names.\r\n", victim->name);
      victim->pcdata->auth_state = 2;
      return;
    }

  else
    {
      send_to_char("Invalid argument.\r\n", ch);
      return;
    }
}

void do_bamfin( CHAR_DATA *ch, char *argument )
{
  if ( !IS_NPC(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfin );
      ch->pcdata->bamfin = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
  return;
}

void do_bamfout( CHAR_DATA *ch, char *argument )
{
  if ( !IS_NPC(ch) )
    {
      smash_tilde( argument );
      DISPOSE( ch->pcdata->bamfout );
      ch->pcdata->bamfout = str_dup( argument );
      send_to_char( "Ok.\r\n", ch );
    }
  return;
}

void do_rank( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC(ch) )
    return;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: rank <string>.\r\n", ch );
      send_to_char( "   or: rank none.\r\n", ch );
      return;
    }

  smash_tilde( argument );
  DISPOSE( ch->pcdata->rank );
  if ( !str_cmp( argument, "none" ) )
    ch->pcdata->rank = str_dup( "" );
  else
    ch->pcdata->rank = str_dup( argument );
  send_to_char( "Ok.\r\n", ch );

  return;
}


void do_retire( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Retire whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( victim->top_level < LEVEL_SAVIOR )
    {
      send_to_char( "The minimum level for retirement is savior.\r\n", ch );
      return;
    }

  if ( IS_RETIRED( victim ) )
    {
      REMOVE_BIT( victim->pcdata->flags, PCFLAG_RETIRED );
      ch_printf( ch, "%s returns from retirement.\r\n", victim->name );
      ch_printf( victim, "%s brings you back from retirement.\r\n", ch->name );
    }
  else
    {
      SET_BIT( victim->pcdata->flags, PCFLAG_RETIRED );
      ch_printf( ch, "%s is now a retired immortal.\r\n", victim->name );
      ch_printf( victim, "Courtesy of %s, you are now a retired immortal.\r\n", ch->name );
    }
  return;
}

void do_deny( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Deny whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  SET_BIT(victim->act, PLR_DENY);
  send_to_char( "You are denied access!\r\n", victim );
  send_to_char( "OK.\r\n", ch );
  do_quit( victim, "" );

  return;
}



void do_disconnect( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  DESCRIPTOR_DATA *d;
  CHAR_DATA *victim;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Disconnect whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->desc == NULL )
    {
      act( AT_PLAIN, "$N doesn't have a descriptor.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( get_trust(ch) <= get_trust( victim ) )
    {
      send_to_char( "They might not like that...\r\n", ch );
      return;
    }

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d == victim->desc )
        {
          close_socket( d, FALSE );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
    }

  bug( "Do_disconnect: *** desc not found ***.", 0 );
  send_to_char( "Descriptor not found!\r\n", ch );
  return;
}

/*
 * Force a level one player to quit.             Gorog
 */
void do_fquit( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg1[MAX_INPUT_LENGTH];
  argument = one_argument( argument, arg1 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Force whom to quit?\r\n", ch );
      return;
    }

  if ( !( victim = get_char_world( ch, arg1 ) ) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->top_level != 1 )
    {
      send_to_char( "They are not level one!\r\n", ch );
      return;
    }

  send_to_char( "The MUD administrators force you to quit\r\n", victim );
  do_quit (victim, "");
  send_to_char( "Ok.\r\n", ch );
  return;
}


void do_forceclose( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  DESCRIPTOR_DATA *d;
  int desc;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: forceclose <descriptor#>\r\n", ch );
      return;
    }
  desc = atoi( arg );

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d->descriptor == desc )
        {
          if ( d->character && get_trust(d->character) >= get_trust(ch) )
            {
              send_to_char( "They might not like that...\r\n", ch );
              return;
            }
          close_socket( d, FALSE );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
    }

  send_to_char( "Not found!\r\n", ch );
  return;
}



void do_pardon( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Syntax: pardon <character> <planet>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  send_to_char( "Syntax: pardon <character> <planet>.... But it doesn't work .... Tell Durga to hurry up and finish it :p\r\n", ch );
  return;
}


void echo_to_all( short AT_COLOR, char *argument, short tar )
{
  DESCRIPTOR_DATA *d;

  if ( !argument || argument[0] == '\0' )
    return;

  for ( d = first_descriptor; d; d = d->next )
    {
      /* Added showing echoes to players who are editing, so they won't
         miss out on important info like upcoming reboots. --Narn */
      if ( d->connected == CON_PLAYING || d->connected == CON_EDITING )
        {
          /* This one is kinda useless except for switched.. */
          if ( tar == ECHOTAR_PC && IS_NPC(d->character) )
            continue;
          else if ( tar == ECHOTAR_IMM && !IS_IMMORTAL(d->character) )
            continue;
          set_char_color( AT_COLOR, d->character );
          send_to_char( argument, d->character );
          send_to_char( "\r\n",   d->character );
        }
    }
  return;
}

void do_echo( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;
  int target;
  char *parg;

  if ( IS_SET(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You are noemoted and can not echo.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Echo what?\r\n", ch );
      return;
    }

  if ( (color = get_color(argument)) )
    argument = one_argument(argument, arg);
  parg = argument;
  argument = one_argument(argument, arg);
  if ( !str_cmp( arg, "PC" )
       ||   !str_cmp( arg, "player" ) )
    target = ECHOTAR_PC;
  else if ( !str_cmp( arg, "imm" ) )
    target = ECHOTAR_IMM;
  else
    {
      target = ECHOTAR_ALL;
      argument = parg;
    }
  if ( !color && (color = get_color(argument)) )
    argument = one_argument(argument, arg);
  if ( !color )
    color = AT_IMMORT;
  one_argument(argument, arg);
  if ( !str_cmp( arg, "Merth" )
       ||   !str_cmp( arg, "Durga" ))
    {
      ch_printf( ch, "I don't think %s would like that!\r\n", arg );
      return;
    }
  echo_to_all ( color, argument, target );
}

void echo_to_room( short AT_COLOR, ROOM_INDEX_DATA *room, char *argument )
{
  CHAR_DATA *vic;

  if ( room == NULL )
    return;


  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      set_char_color( AT_COLOR, vic );
      send_to_char( argument, vic );
      send_to_char( "\r\n",   vic );
    }
}

void do_recho( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IS_SET(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You are noemoted and can not recho.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Recho what?\r\n", ch );
      return;
    }

  one_argument( argument, arg );
  if ( !str_cmp( arg, "Thoric" )
       ||   !str_cmp( arg, "Dominus" )
       ||   !str_cmp( arg, "Circe" )
       ||   !str_cmp( arg, "Haus" )
       ||   !str_cmp( arg, "Narn" )
       ||   !str_cmp( arg, "Scryn" )
       ||   !str_cmp( arg, "Blodkai" )
       ||   !str_cmp( arg, "Damian" ) )
    {
      ch_printf( ch, "I don't think %s would like that!\r\n", arg );
      return;
    }
  if ( (color = get_color ( argument )) )
    {
      argument = one_argument ( argument, arg );
      echo_to_room ( color, ch->in_room, argument );
    }
  else
    echo_to_room ( AT_IMMORT, ch->in_room, argument );
}


ROOM_INDEX_DATA *find_location( CHAR_DATA *ch, char *arg )
{
  CHAR_DATA *victim;
  OBJ_DATA *obj;

  if ( is_number(arg) )
    return get_room_index( atoi( arg ) );

  if ( ( victim = get_char_world( ch, arg ) ) != NULL )
    return victim->in_room;

  if ( ( obj = get_obj_world( ch, arg ) ) != NULL )
    return obj->in_room;

  return NULL;
}



void do_transfer( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  DESCRIPTOR_DATA *d;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Transfer whom (and where)?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg1, "all" ) )
    {
      for ( d = first_descriptor; d; d = d->next )
        {
          if ( d->connected == CON_PLAYING
               &&   d->character != ch
               &&   d->character->in_room
               &&   d->newstate != 2
               &&   can_see( ch, d->character ) )
            {
              char buf[MAX_STRING_LENGTH];
              sprintf( buf, "%s %s", d->character->name, arg2 );
              do_transfer( ch, buf );
            }
        }
      return;
    }

  /*
   * Thanks to Grodyn for the optional location parameter.
   */
  if ( arg2[0] == '\0' )
    {
      location = ch->in_room;
    }
  else
    {
      if ( ( location = find_location( ch, arg2 ) ) == NULL )
        {
          send_to_char( "No such location.\r\n", ch );
          return;
        }

      if ( room_is_private( ch, location ) )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
    }

  if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if (NOT_AUTHED(victim))
    {
      send_to_char( "They are not authorized yet!\r\n", ch);
      return;
    }

  if ( !victim->in_room )
    {
      send_to_char( "They are in limbo.\r\n", ch );
      return;
    }

  if ( victim->fighting )
    stop_fighting( victim, TRUE );
  act( AT_MAGIC, "$n disappears in a cloud of swirling colors.", victim, NULL, NULL, TO_ROOM );
  victim->retran = victim->in_room->vnum;
  char_from_room( victim );
  char_to_room( victim, location );
  act( AT_MAGIC, "$n arrives from a puff of smoke.", victim, NULL, NULL, TO_ROOM );
  if ( ch != victim )
    act( AT_IMMORT, "$n has transferred you.", ch, NULL, victim, TO_VICT );
  do_look( victim, "auto" );
  send_to_char( "Ok.\r\n", ch );
  if (!IS_IMMORTAL(victim) && !IS_NPC(victim)
      &&  !in_hard_range( victim, location->area ) )
    send_to_char("Warning: the player's level is not within the area's level range.\r\n", ch);
}

void do_retran( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  char buf[MAX_STRING_LENGTH];

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char("Retransfer whom?\r\n", ch );
      return;
    }
  if ( !(victim = get_char_world(ch, arg)) )
    {
      send_to_char("They aren't here.\r\n", ch );
      return;
    }
  sprintf(buf, "'%s' %d", victim->name, victim->retran);
  do_transfer(ch, buf);
  return;
}

void do_regoto( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  sprintf(buf, "%d", ch->regoto);
  do_goto(ch, buf);
  return;
}

void do_scatter( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *pRoomIndex;

  set_char_color( AT_IMMORT, ch );

  one_argument( argument, arg );
  if ( arg[0] == '\0' ) {
    send_to_char( "Scatter whom?\r\n", ch );
    return; }
  if ( ( victim = get_char_room( ch, arg ) ) == NULL ) {
    send_to_char( "They aren't here.\r\n", ch );
    return; }
  if ( victim == ch ) {
    send_to_char( "It's called teleport.  Try it.\r\n", ch );
    return;
  }
  if ( !IS_NPC(victim) && get_trust( victim ) >= get_trust( ch ) ) {
    send_to_char( "You haven't the power to succeed against them.\r\n", ch );
    return; }
  for ( ; ; ) {
    pRoomIndex = get_room_index( number_range( 0, 32767 ) );
    if ( pRoomIndex )
      if ( !IS_SET(pRoomIndex->room_flags, ROOM_PRIVATE)
           &&   !IS_SET(pRoomIndex->room_flags, ROOM_SOLITARY)
           &&   !IS_SET(pRoomIndex->room_flags, ROOM_PROTOTYPE)
           &&   !IS_SET(pRoomIndex->room_flags, ROOM_SPACECRAFT) )
        break; }
  if ( victim->fighting ) stop_fighting( victim, TRUE );
  act( AT_MAGIC, "With the sweep of an arm, $n flings $N to the winds.", ch, NULL, victim, TO_NOTVICT );
  act( AT_MAGIC, "With the sweep of an arm, $n flings you to the astral winds.", ch, NULL, victim, TO_VICT );
  act( AT_MAGIC, "With the sweep of an arm, you fling $N to the astral winds.", ch, NULL, victim, TO_CHAR );
  char_from_room( victim );
  char_to_room( victim, pRoomIndex );
  victim->position = POS_RESTING;
  act( AT_MAGIC, "$n staggers forth from a sudden gust of wind, and collapses.", victim, NULL, NULL, TO_ROOM );
  do_look( victim, "auto" );
  return;
}

void do_mortalize( CHAR_DATA *ch, char *argument )
{
  return;
}
void do_delay( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  int delay;

  set_char_color( AT_IMMORT, ch );

  argument = one_argument( argument, arg );
  if ( !*arg ) {
    send_to_char( "Syntax:  delay <victim> <# of rounds>\r\n", ch );
    return;
  }
  if ( !( victim = get_char_world( ch, arg ) ) ) {
    send_to_char( "No such character online.\r\n", ch );
    return;
  }
  if ( IS_NPC( victim ) ) {
    send_to_char( "Mobiles are unaffected by lag.\r\n", ch );
    return;
  }
  if ( !IS_NPC(victim) && get_trust( victim ) >= get_trust( ch ) ) {
    send_to_char( "You haven't the power to succeed against them.\r\n", ch );
    return;
  }
  argument = one_argument(argument, arg);
  if ( !*arg ) {
    send_to_char( "For how long do you wish to delay them?\r\n", ch );
    return;
  }
  if ( !str_cmp( arg, "none" ) ) {
    send_to_char( "All character delay removed.\r\n", ch );
    victim->wait = 0;
    return;
  }
  delay = atoi( arg );
  if ( delay < 1 ) {
    send_to_char( "Pointless.  Try a positive number.\r\n", ch );
    return;
  }
  if ( delay > 999 ) {
    send_to_char( "You cruel bastard.  Just kill them.\r\n", ch );
    return;
  }
  WAIT_STATE( victim, delay * PULSE_VIOLENCE );
  ch_printf( ch, "You've delayed %s for %d rounds.\r\n", victim->name, delay );
  return;
}



void do_at( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  ROOM_INDEX_DATA *original;
  CHAR_DATA *wch;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "At where what?\r\n", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( get_trust( ch ) < LEVEL_GREATER )
    {
      if ( room_is_private( ch, location ) )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
    }
  if ( check_for_immroom( ch, location ) )
    {
      send_to_char( "That room is private right now.\r\n", ch );
      return;
    }
  if ( room_is_private( ch, location ) )
    send_to_char( "Overriding private flag!\r\n", ch );


  original = ch->in_room;
  char_from_room( ch );
  char_to_room( ch, location );
  interpret( ch, argument );

  /*
   * See if 'ch' still exists before continuing!
   * Handles 'at XXXX quit' case.
   */
  for ( wch = first_char; wch; wch = wch->next )
    {
      if ( wch == ch )
        {
          char_from_room( ch );
          char_to_room( ch, original );
          break;
        }
    }

  return;
}

void do_rat( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  ROOM_INDEX_DATA *original;
  int Start, End, vnum;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Syntax: rat <start> <end> <command>\r\n", ch );
      return;
    }

  Start = atoi( arg1 ); End = atoi( arg2 );

  if ( Start < 1 || End < Start || Start > End || Start == End || End > 32767 )
    {
      send_to_char( "Invalid range.\r\n", ch );
      return;
    }

  if ( !str_cmp( argument, "quit" ) )
    {
      send_to_char( "I don't think so!\r\n", ch );
      return;
    }

  original = ch->in_room;
  for ( vnum = Start; vnum <= End; vnum++ )
    {
      if ( (location = get_room_index(vnum)) == NULL )
        continue;
      char_from_room( ch );
      char_to_room( ch, location );
      interpret( ch, argument );
    }

  char_from_room( ch );
  char_to_room( ch, original );
  send_to_char( "Done.\r\n", ch );
  return;
}


void do_rstat( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;
  OBJ_DATA *obj;
  CHAR_DATA *rch;
  EXIT_DATA *pexit;
  int cnt;
  static char *dir_text[] = { "n", "e", "s", "w", "u", "d", "ne", "nw", "se", "sw", "?" };

  one_argument( argument, arg );

  if ( get_trust( ch ) < LEVEL_IMMORTAL )
    {
      AREA_DATA * pArea;

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( ch->in_room->vnum < pArea->low_r_vnum
           ||  ch->in_room->vnum > pArea->hi_r_vnum )
        {
          send_to_char( "You can only rstat within your assigned range.\r\n", ch );
          return;
        }

    }


  if ( !str_cmp( arg, "exits" ) )
    {
      location = ch->in_room;

      ch_printf( ch, "Exits for room '%s.' vnum %d\r\n",
                 location->name,
                 location->vnum );

      for ( cnt = 0, pexit = location->first_exit; pexit; pexit = pexit->next )
        ch_printf( ch,
                   "%2d) %2s to %-5d.  Key: %d  Flags: %d  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %d  Exit's RoomVnum: %d  Distance: %d\r\n",
                   ++cnt,
                   dir_text[pexit->vdir],
                   pexit->to_room ? pexit->to_room->vnum : 0,
                   pexit->key,
                   pexit->exit_info,
                   pexit->keyword,
                   pexit->description[0] != '\0'
                   ? pexit->description : "(none).\r\n",
                   pexit->rexit ? pexit->rexit->vnum : 0,
                   pexit->rvnum,
                   pexit->distance );
      return;
    }
  location = ( arg[0] == '\0' ) ? ch->in_room : find_location( ch, arg );
  if ( !location )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( ch->in_room != location && room_is_private( ch, location ) )
    {
      if ( get_trust( ch ) < LEVEL_GREATER )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
      else
        {
          send_to_char( "Overriding private flag!\r\n", ch );
        }

    }

  ch_printf( ch, "Name: %s.\r\nArea: %s  Filename: %s.\r\n",
             location->name,
             location->area ? location->area->name : "None????",
             location->area ? location->area->filename : "None????" );

  ch_printf( ch,
             "Vnum: %d.  Sector: %d.  Light: %d.  TeleDelay: %d.  TeleVnum: %d  Tunnel: %d.\r\n",
             location->vnum,
             location->sector_type,
             location->light,
             location->tele_delay,
             location->tele_vnum,
             location->tunnel );

  ch_printf( ch, "Room flags: %s\r\n",
             flag_string(location->room_flags, r_flags) );
  ch_printf( ch, "Description:\r\n%s", location->description );

  if ( location->first_extradesc )
    {
      EXTRA_DESCR_DATA *ed;

      send_to_char( "Extra description keywords: '", ch );
      for ( ed = location->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );
          if ( ed->next )
            send_to_char( " ", ch );
        }
      send_to_char( "'.\r\n", ch );
    }

  send_to_char( "Characters:", ch );
  for ( rch = location->first_person; rch; rch = rch->next_in_room )
    {
      if ( can_see( ch, rch ) )
        {
          send_to_char( " ", ch );
          one_argument( rch->name, buf );
          send_to_char( buf, ch );
        }
    }

  send_to_char( ".\r\nObjects:   ", ch );
  for ( obj = location->first_content; obj; obj = obj->next_content )
    {
      send_to_char( " ", ch );
      one_argument( obj->name, buf );
      send_to_char( buf, ch );
    }
  send_to_char( ".\r\n", ch );

  if ( location->first_exit )
    send_to_char( "------------------- EXITS -------------------\r\n", ch );
  for ( cnt = 0, pexit = location->first_exit; pexit; pexit = pexit->next )
    ch_printf( ch,
               "%2d) %-2s to %-5d.  Key: %d  Flags: %d  Keywords: %s.\r\n",
               ++cnt,
               dir_text[pexit->vdir],
               pexit->to_room ? pexit->to_room->vnum : 0,
               pexit->key,
               pexit->exit_info,
               pexit->keyword[0] != '\0' ? pexit->keyword : "(none)" );
  return;
}



void do_ostat( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  AFFECT_DATA *paf;
  OBJ_DATA *obj;
  char *pdesc;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Ostat what?\r\n", ch );
      return;
    }
  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( obj = get_obj_world( ch, arg ) ) == NULL )
    {
      send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );
      return;
    }

  ch_printf( ch, "Name: %s.\r\n",
             obj->name );

  pdesc=get_extra_descr(arg, obj->first_extradesc);
  if ( !pdesc )
    pdesc=get_extra_descr(arg, obj->pIndexData->first_extradesc);
  if ( !pdesc )
    pdesc = get_extra_descr( obj->name, obj->first_extradesc );
  if ( !pdesc )
    pdesc = get_extra_descr( obj->name, obj->pIndexData->first_extradesc );
  if ( pdesc )
    send_to_char( pdesc, ch );


  ch_printf( ch, "Vnum: %d.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->pIndexData->vnum, item_type_name( obj ), obj->pIndexData->count,
             obj->count );

  ch_printf( ch, "Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->serial, obj->pIndexData->serial, cur_obj_serial );

  ch_printf( ch, "Short description: %s.\r\nLong description: %s\r\n",
             obj->short_descr, obj->description );

  if ( obj->action_desc[0] != '\0' )
    ch_printf( ch, "Action description: %s.\r\n", obj->action_desc );

  ch_printf( ch, "Wear flags : %s\r\n", flag_string(obj->wear_flags, w_flags) );
  ch_printf( ch, "Extra flags: %s\r\n", flag_string(obj->extra_flags, o_flags) );

  ch_printf( ch, "Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1,           get_obj_number( obj ),
             obj->weight, get_obj_weight( obj ), obj->pIndexData->layers );

  ch_printf( ch, "Cost: %d.  Rent: %d.  Timer: %d.  Level: %d.\r\n",
             obj->cost, obj->pIndexData->rent, obj->timer, obj->level );

  ch_printf( ch,
             "In room: %d.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
             obj->in_room    == NULL    ?        0 : obj->in_room->vnum,
             obj->in_obj     == NULL    ? "(none)" : obj->in_obj->short_descr,
             obj->carried_by == NULL    ? "(none)" : obj->carried_by->name,
             obj->wear_loc );

  ch_printf( ch, "Index Values : %d %d %d %d %d %d.\r\n",
             obj->pIndexData->value[0], obj->pIndexData->value[1],
             obj->pIndexData->value[2], obj->pIndexData->value[3],
             obj->pIndexData->value[4], obj->pIndexData->value[5] );
  ch_printf( ch, "Object Values: %d %d %d %d %d %d.\r\n",
             obj->value[0], obj->value[1], obj->value[2], obj->value[3], obj->value[4], obj->value[5] );

  if ( obj->pIndexData->first_extradesc )
    {
      EXTRA_DESCR_DATA *ed;

      send_to_char( "Primary description keywords:   '", ch );
      for ( ed = obj->pIndexData->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );
          if ( ed->next )
            send_to_char( " ", ch );
        }
      send_to_char( "'.\r\n", ch );
    }
  if ( obj->first_extradesc )
    {
      EXTRA_DESCR_DATA *ed;

      send_to_char( "Secondary description keywords: '", ch );
      for ( ed = obj->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );
          if ( ed->next )
            send_to_char( " ", ch );
        }
      send_to_char( "'.\r\n", ch );
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    ch_printf( ch, "Affects %s by %d. (extra)\r\n",
               affect_loc_name( paf->location ), paf->modifier );

  for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
    ch_printf( ch, "Affects %s by %d.\r\n",
               affect_loc_name( paf->location ), paf->modifier );

  return;
}



void do_mstat( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  AFFECT_DATA *paf;
  CHAR_DATA *victim;
  SKILLTYPE *skill;
  int x;

  set_char_color( AT_PLAIN, ch );

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Mstat whom?\r\n", ch );
      return;
    }
  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }
  if ( ( ( get_trust( ch ) < LEVEL_GOD ) && !IS_NPC(victim) ) || ( ( get_trust( ch ) < get_trust( victim ) ) && !IS_NPC(victim) ) )
    {
      set_char_color( AT_IMMORT, ch );
      send_to_char( "Their godly glow prevents you from getting a good look.\r\n", ch );
      return;
    }
  ch_printf( ch, "Name: %s     Organization: %s\r\n",
             victim->name,
             ( IS_NPC( victim ) || !victim->pcdata->clan ) ? "(none)"
             : victim->pcdata->clan->name );
  if( get_trust(ch) >= LEVEL_GOD && !IS_NPC(victim) && victim->desc )
    ch_printf( ch, "User: %s@%s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
               victim->desc->user, victim->desc->host, victim->desc->descriptor,
               victim->trust, victim->pcdata->authed_by[0] != '\0'
               ? victim->pcdata->authed_by : "(unknown)" );
  if ( !IS_NPC(victim) && victim->pcdata->release_date != 0 )
    ch_printf(ch, "Helled until %24.24s by %s.\r\n",
              ctime(&victim->pcdata->release_date),
              victim->pcdata->helled_by);

  ch_printf( ch, "Vnum: %d   Sex: %s   Room: %d   Count: %d  Killed: %d\r\n",
             IS_NPC(victim) ? victim->pIndexData->vnum : 0,
             victim->sex == SEX_MALE    ? "male"   :
             victim->sex == SEX_FEMALE  ? "female" : "neutral",
             victim->in_room == NULL    ?        0 : victim->in_room->vnum,
             IS_NPC(victim) ? victim->pIndexData->count : 1,
             IS_NPC(victim) ? victim->pIndexData->killed
             : victim->pcdata->mdeaths + victim->pcdata->pdeaths
             );
  ch_printf( ch, "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             get_curr_str(victim),
             get_curr_int(victim),
             get_curr_wis(victim),
             get_curr_dex(victim),
             get_curr_con(victim),
             get_curr_cha(victim),
             get_curr_lck(victim),
             get_curr_frc(victim) );
  ch_printf( ch, "Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );
  if ( !IS_NPC( victim ) )
    {
      int ability;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        ch_printf( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   ability_name[ability], victim->skill_level[ability], max_level(victim, ability), victim->experience[ability],
                   exp_level( victim->skill_level[ability]+1 ) );
    }
  ch_printf( ch,
             "Top Level: %d     Race: %d  Align: %d  AC: %d  Gold: %d\r\n",
             victim->top_level,  victim->race,   victim->alignment,
             GET_AC(victim),      victim->gold );
  if (  victim->race  < MAX_NPC_RACE  && victim->race  >= 0 )
    ch_printf( ch, "Race: %s\r\n",
               npc_race[victim->race] );
  ch_printf( ch, "Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GET_HITROLL(victim), GET_DAMROLL(victim),
             victim->position,    victim->wimpy );
  ch_printf( ch, "Fighting: %s    Master: %s    Leader: %s\r\n",
             victim->fighting ? victim->fighting->who->name : "(none)",
             victim->master      ? victim->master->name   : "(none)",
             victim->leader      ? victim->leader->name   : "(none)" );
  ch_printf( ch, "Questpoints: %d    Current QuestMob: %d    Current QuestObj: %d\r\n",
             victim->questpoints, victim->questmob, victim->questobj );

  if ( !IS_NPC(victim) )
    ch_printf( ch,
               "Thirst: %d   Full: %d   Drunk: %d     Glory: %d/%d\r\n",
               victim->pcdata->condition[COND_THIRST],
               victim->pcdata->condition[COND_FULL],
               victim->pcdata->condition[COND_DRUNK],
               victim->pcdata->quest_curr,
               victim->pcdata->quest_accum );
  else
    ch_printf( ch, "Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
               victim->pIndexData->hitnodice,
               victim->pIndexData->hitsizedice,
               victim->pIndexData->hitplus,
               victim->pIndexData->damnodice,
               victim->pIndexData->damsizedice,
               victim->pIndexData->damplus );
  ch_printf( ch, "MentalState: %d   EmotionalState: %d\r\n",
             victim->mental_state, victim->emotional_state );
  ch_printf( ch, "Saving throws: %d %d %d %d %d.\r\n",
             victim->saving_poison_death,
             victim->saving_wand,
             victim->saving_para_petri,
             victim->saving_breath,
             victim->saving_spell_staff  );
  ch_printf( ch, "Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
             victim->carry_number, can_carry_n(victim), victim->carry_weight, can_carry_w(victim), victim->numattacks );
  if ( IS_NPC( victim ) )
    {
      ch_printf( ch, "Act flags: %s\r\n", flag_string(victim->act, act_flags) );
      ch_printf( ch, "VIP flags: %s\r\n", flag_string(victim->vip_flags, planet_flags) );
    }
  else
    {
      ch_printf( ch, "Years: %d   Seconds Played: %d   Timer: %d   Act: %d\r\n",
                 get_age( victim ), (int) victim->pcdata->played, victim->timer, victim->act );

      ch_printf( ch, "Player flags: %s\r\n",
                 flag_string(victim->act, plr_flags) );
      ch_printf( ch, "Pcflags: %s\r\n",
                 flag_string(victim->pcdata->flags, pc_flags) );
      ch_printf( ch, "Wanted flags: %s\r\n",
                 flag_string(victim->pcdata->wanted_flags, planet_flags) );
    }
  ch_printf( ch, "Affected by: %s\r\n",
             affect_bit_name( victim->affected_by ) );
  ch_printf( ch, "Speaks: %d   Speaking: %d\r\n",
             victim->speaks, victim->speaking );
  send_to_char( "Languages: ", ch );
  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    if ( knows_language( victim, lang_array[x], victim )
         ||  (IS_NPC(victim) && victim->speaks == 0) )
      {
        if ( IS_SET(lang_array[x], victim->speaking)
             ||  (IS_NPC(victim) && !victim->speaking) )
          set_char_color( AT_RED, ch );
        send_to_char( lang_names[x], ch );
        send_to_char( " ", ch );
        set_char_color( AT_PLAIN, ch );
      }
    else
      if ( IS_SET(lang_array[x], victim->speaking)
           ||  (IS_NPC(victim) && !victim->speaking) )
        {
          set_char_color( AT_PINK, ch );
          send_to_char( lang_names[x], ch );
          send_to_char( " ", ch );
          set_char_color( AT_PLAIN, ch );
        }
  send_to_char( "\r\n", ch );
  if ( victim->pcdata && victim->pcdata->bestowments
       && victim->pcdata->bestowments[0] != '\0' )
    ch_printf( ch, "Bestowments: %s\r\n", victim->pcdata->bestowments );
  ch_printf( ch, "Short description: %s\r\nLong  description: %s",
             victim->short_descr,
             victim->long_descr[0] != '\0' ? victim->long_descr : "(none)\r\n" );
  if ( IS_NPC(victim) && ( victim->spec_fun || victim->spec_2 ) )
    ch_printf( ch, "Mobile has spec fun: %s %s\r\n",
               lookup_spec( victim->spec_fun ),
               victim->spec_2 ? lookup_spec( victim->spec_2 ) : "" );
  ch_printf( ch, "Body Parts : %s\r\n",
             flag_string(victim->xflags, part_flags) );
  ch_printf( ch, "Resistant  : %s\r\n",
             flag_string(victim->resistant, ris_flags) );
  ch_printf( ch, "Immune     : %s\r\n",
             flag_string(victim->immune, ris_flags) );
  ch_printf( ch, "Susceptible: %s\r\n",
             flag_string(victim->susceptible, ris_flags) );
  ch_printf( ch, "Attacks    : %s\r\n",
             flag_string(victim->attacks, attack_flags) );
  ch_printf( ch, "Defenses   : %s\r\n",
             flag_string(victim->defenses, defense_flags) );
  for ( paf = victim->first_affect; paf; paf = paf->next )
    if ( (skill=get_skilltype(paf->type)) != NULL )
      ch_printf( ch,
                 "%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
                 skill_tname[skill->type],
                 skill->name,
                 affect_loc_name( paf->location ),
                 paf->modifier,
                 paf->duration,
                 affect_bit_name( paf->bitvector )
                 );
  return;
}



void do_mfind( CHAR_DATA *ch, char *argument )
{
  /*  extern int top_mob_index; */
  char arg[MAX_INPUT_LENGTH];
  MOB_INDEX_DATA *pMobIndex;
  /*  int vnum; */
  int hash;
  int nMatch;
  bool fAll;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Mfind whom?\r\n", ch );
      return;
    }

  fAll  = !str_cmp( arg, "all" );
  nMatch        = 0;
  set_pager_color( AT_PLAIN, ch );

  /*
   * Yeah, so iterating over all vnum's takes 10,000 loops.
   * Get_mob_index is fast, and I don't feel like threading another link.
   * Do you?
   * -- Furey
   */
  /*  for ( vnum = 0; nMatch < top_mob_index; vnum++ )
      {
      if ( ( pMobIndex = get_mob_index( vnum ) ) != NULL )
      {
      if ( fAll || is_name( arg, pMobIndex->player_name ) )
      {
      nMatch++;
      sprintf( buf, "[%5d] %s\r\n",
      pMobIndex->vnum, capitalize( pMobIndex->short_descr ) );
      send_to_char( buf, ch );
      }
      }
      }
  */

  /*
   * This goes through all the hash entry points (1024), and is therefore
   * much faster, though you won't get your vnums in order... oh well. :)
   *
   * Tests show that Furey's method will usually loop 32,000 times, calling
   * get_mob_index()... which loops itself, an average of 1-2 times...
   * So theoretically, the above routine may loop well over 40,000 times,
   * and my routine bellow will loop for as many index_mobiles are on
   * your mud... likely under 3000 times.
   * -Thoric
   */
  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pMobIndex = mob_index_hash[hash];
          pMobIndex;
          pMobIndex = pMobIndex->next )
      if ( fAll || nifty_is_name( arg, pMobIndex->player_name ) )
        {
          nMatch++;
          pager_printf( ch, "[%5d] %s\r\n",
                        pMobIndex->vnum, capitalize( pMobIndex->short_descr ) );
        }

  if ( nMatch )
    pager_printf( ch, "Number of matches: %d\n", nMatch );
  else
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );

  return;
}



void do_ofind( CHAR_DATA *ch, char *argument )
{
  /*  extern int top_obj_index; */
  char arg[MAX_INPUT_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  /*  int vnum; */
  int hash;
  int nMatch;
  bool fAll;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Ofind what?\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  fAll  = !str_cmp( arg, "all" );
  nMatch        = 0;
  /*  nLoop     = 0; */

  /*
   * Yeah, so iterating over all vnum's takes 10,000 loops.
   * Get_obj_index is fast, and I don't feel like threading another link.
   * Do you?
   * -- Furey
   for ( vnum = 0; nMatch < top_obj_index; vnum++ )
   {
   nLoop++;
   if ( ( pObjIndex = get_obj_index( vnum ) ) != NULL )
   {
   if ( fAll || nifty_is_name( arg, pObjIndex->name ) )
   {
   nMatch++;
   sprintf( buf, "[%5d] %s\r\n",
   pObjIndex->vnum, capitalize( pObjIndex->short_descr ) );
   send_to_char( buf, ch );
   }
   }
   }
  */

  /*
   * This goes through all the hash entry points (1024), and is therefore
   * much faster, though you won't get your vnums in order... oh well. :)
   *
   * Tests show that Furey's method will usually loop 32,000 times, calling
   * get_obj_index()... which loops itself, an average of 2-3 times...
   * So theoretically, the above routine may loop well over 50,000 times,
   * and my routine bellow will loop for as many index_objects are on
   * your mud... likely under 3000 times.
   * -Thoric
   */
  for ( hash = 0; hash < MAX_KEY_HASH; hash++ )
    for ( pObjIndex = obj_index_hash[hash];
          pObjIndex;
          pObjIndex = pObjIndex->next )
      if ( fAll || nifty_is_name( arg, pObjIndex->name ) )
        {
          nMatch++;
          pager_printf( ch, "[%5d] %s\r\n",
                        pObjIndex->vnum, capitalize( pObjIndex->short_descr ) );
        }

  if ( nMatch )
    pager_printf( ch, "Number of matches: %d\n", nMatch );
  else
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );

  return;
}



void do_mwhere( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  bool found;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Mwhere whom?\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  found = FALSE;
  for ( victim = first_char; victim; victim = victim->next )
    {
      if ( IS_NPC(victim)
           &&   victim->in_room
           &&   nifty_is_name( arg, victim->name ) )
        {
          found = TRUE;
          pager_printf( ch, "[%5d] %-28s [%5d] %s\r\n",
                        victim->pIndexData->vnum,
                        victim->short_descr,
                        victim->in_room->vnum,
                        victim->in_room->name );
        }
    }

  if ( !found )
    act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );

  return;
}


void do_bodybag( CHAR_DATA *ch, char *argument )
{
  char buf2[MAX_STRING_LENGTH];
  char buf3[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  bool found;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Bodybag whom?\r\n", ch );
      return;
    }

  /* make sure the buf3 is clear? */
  sprintf(buf3, " ");
  /* check to see if vict is playing? */
  sprintf(buf2,"the corpse of %s",arg);
  found = FALSE;
  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( obj->in_room
           && !str_cmp( buf2, obj->short_descr )
           && (obj->pIndexData->vnum == 11 ) )
        {
          found = TRUE;
          ch_printf( ch, "Bagging body: [%5d] %-28s [%5d] %s\r\n",
                     obj->pIndexData->vnum,
                     obj->short_descr,
                     obj->in_room->vnum,
                     obj->in_room->name );
          obj_from_room(obj);
          obj = obj_to_char(obj, ch);
          obj->timer = -1;
          save_char_obj( ch );
        }
    }

  if ( !found )
    ch_printf(ch," You couldn't find any %s\r\n",buf2);
  return;
}

#if 0
/* New owhere by Altrag, 03/14/96 */
void do_owhere( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  bool found;
  int icnt = 0;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Owhere what?\r\n", ch );
      return;
    }
  argument = one_argument(argument, arg1);

  set_pager_color( AT_PLAIN, ch );
  if ( arg1[0] != '\0' && !str_prefix(arg1, "nesthunt") )
    {
      if ( !(obj = get_obj_world(ch, arg)) )
        {
          send_to_char( "Nesthunt for what object?\r\n", ch );
          return;
        }
      for ( ; obj->in_obj; obj = obj->in_obj )
        {
          pager_printf(ch, "[%5d] %-28s in object [%5d] %s\r\n",
                       obj->pIndexData->vnum, obj_short(obj),
                       obj->in_obj->pIndexData->vnum, obj->in_obj->short_descr);
          ++icnt;
        }
      sprintf(buf, "[%5d] %-28s in ", obj->pIndexData->vnum,
              obj_short(obj));
      if ( obj->carried_by )
        sprintf(buf+strlen(buf), "invent [%5d] %s\r\n",
                (IS_NPC(obj->carried_by) ? obj->carried_by->pIndexData->vnum
                 : 0), PERS(obj->carried_by, ch));
      else if ( obj->in_room )
        sprintf(buf+strlen(buf), "room   [%5d] %s\r\n",
                obj->in_room->vnum, obj->in_room->name);
      else if ( obj->in_obj )
        {
          bug("do_owhere: obj->in_obj after NULL!",0);
          strcat(buf, "object??\r\n");
        }
      else
        {
          bug("do_owhere: object doesnt have location!",0);
          strcat(buf, "nowhere??\r\n");
        }
      send_to_pager(buf, ch);
      ++icnt;
      pager_printf(ch, "Nested %d levels deep.\r\n", icnt);
      return;
    }

  found = FALSE;
  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( !nifty_is_name( arg, obj->name ) )
        continue;
      found = TRUE;

      sprintf(buf, "(%3d) [%5d] %-28s in ", ++icnt, obj->pIndexData->vnum,
              obj_short(obj));
      if ( obj->carried_by )
        sprintf(buf+strlen(buf), "invent [%5d] %s\r\n",
                (IS_NPC(obj->carried_by) ? obj->carried_by->pIndexData->vnum
                 : 0), PERS(obj->carried_by, ch));
      else if ( obj->in_room )
        sprintf(buf+strlen(buf), "room   [%5d] %s\r\n",
                obj->in_room->vnum, obj->in_room->name);
      else if ( obj->in_obj )
        sprintf(buf+strlen(buf), "object [%5d] %s\r\n",
                obj->in_obj->pIndexData->vnum, obj_short(obj->in_obj));
      else
        {
          bug("do_owhere: object doesnt have location!",0);
          strcat(buf, "nowhere??\r\n");
        }
      send_to_pager(buf, ch);
    }

  if ( !found )
    act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
  else
    pager_printf(ch, "%d matches.\r\n", icnt);

  return;
}
#endif

void trunc1(char *s, int len)
{
  if ( strlen(s) > len )
    s[len] = '\0';
}

void do_owhere( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH], field[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj, *outer_obj;
  bool found = FALSE;
  int icnt=0, vnum=0;
  char heading[] =
    "    Vnum  Short Desc        Vnum  Room/Char          Vnum  Container\r\n";

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      pager_printf( ch, "Owhere what?\r\n" );
      return;
    }
  if ( is_number(arg) )
    vnum=atoi(arg);

  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( vnum )
        {
          if ( vnum!=obj->pIndexData->vnum)
            continue;
        }
      else if ( !nifty_is_name( arg, obj->name ) )
        continue;

      if ( !found )
        send_to_pager( heading, ch );       /* print report heading */
      found = TRUE;

      outer_obj = obj;
      while ( outer_obj->in_obj )
        outer_obj = outer_obj->in_obj;

      sprintf(field, "%-18s", obj_short(obj));
      trunc1(field, 18);
      sprintf(buf, "%3d &R&w%5d &R&w%-18s &R&w", ++icnt, obj->pIndexData->vnum, field);
      if ( outer_obj->carried_by )
        {
          sprintf(field, "%-18s", PERS(outer_obj->carried_by, ch));
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5d %-18s &R&w",
                  (IS_NPC(outer_obj->carried_by) ?
                   outer_obj->carried_by->pIndexData->vnum : 0), field);
          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->in_obj->name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5d %-18s &R&w",
                      obj->in_obj->pIndexData->vnum, field);
            }
          sprintf(buf+strlen(buf), "&R&w\r\n");
          send_to_pager(buf, ch);
        }
      else if ( outer_obj->in_room )
        {
          sprintf(field, "%-18s", outer_obj->in_room->name);
          trunc1(field, 18);
          sprintf(buf+strlen(buf), "%5d %-18s &R&w",
                  outer_obj->in_room->vnum, field);
          if ( outer_obj!=obj )
            {
              sprintf(field, "%-18s", obj->in_obj->name);
              trunc1(field, 18);
              sprintf(buf+strlen(buf), "%5d %-18s &R&w",
                      obj->in_obj->pIndexData->vnum, field);
            }
          sprintf(buf+strlen(buf), "&R&w\r\n");
          send_to_pager(buf, ch);
        }
    }
  if ( !found )
    pager_printf(ch, "None found.\r\n");
}

/*
 * Find the position of a target substring in a source string.
 * Returns pointer to the first occurrence of the string pointed to
 * bstr in the string pointed to by astr. It returns a null pointer
 * if no match is found.  --  Gorog (with help from Thoric)
 *
 * Note I made a change when modifying str_infix. If the target string is
 * null, I return NULL (meaning no match was found). str_infix returns
 * FALSE (meaning a match was found).  *grumble*
 */
char *str_str( char *astr, char *bstr )
{
  int sstr1, sstr2, ichar;
  char c0;

  if ( ( c0 = LOWER(bstr[0]) ) == '\0' )
    return NULL;

  sstr1 = strlen(astr);
  sstr2 = strlen(bstr);

  for ( ichar = 0; ichar <= sstr1 - sstr2; ichar++ )
    if ( c0 == LOWER(astr[ichar]) && !str_prefix(bstr, astr+ichar) )
      return (astr+ichar);
  return NULL;
}

/*
 * Counts the number of times a target string occurs in a source string.
 * case insensitive -- Gorog
 */
int str_count(char *psource, char *ptarget)
{
  char *ptemp=psource;
  int count=0;

  while ( (ptemp=str_str(ptemp, ptarget)) )
    {
      ptemp++;
      count++;
    }
  return count;
}

/*
 * Displays the help screen for the "opfind" command
 */
void opfind_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "opfind n lo_vnum hi_vnum text \r\n"
                "   Search obj vnums between lo_vnum and hi_vnum \r\n"
                "   for obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  send_to_char( "opfind n mud text \r\n"
                "   Search all the objs in the mud for\r\n"
                "   obj progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  send_to_char( "Example:\r\n", ch);
  send_to_char( "opfind 20 901 969 if isnpc \r\n"
                "   Search all obj progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all objects that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  send_to_char( "Example:\r\n", ch);
  send_to_char( "opfind 100 mud mpslay \r\n"
                "   Search all obj progs in the entire mud\r\n"
                "   and display all objects that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}

/*
 * Search objects for obj progs containing a specified text string.
 */
void do_opfind( CHAR_DATA *ch, char *argument )   /* Gorog */
{
  OBJ_INDEX_DATA  *   pObj;
  MPROG_DATA      *   pProg;
  char                arg1 [MAX_INPUT_LENGTH];
  char                arg2 [MAX_INPUT_LENGTH];
  char                arg3 [MAX_INPUT_LENGTH];
  int                 lo_vnum=1, hi_vnum=32767;
  int                 tot_vnum, tot_hits=0;
  int                 i, disp_cou=0, disp_limit;

  argument = one_argument( argument, arg1 );   /* display_limit */
  argument = one_argument( argument, arg2 );

  if ( arg1[0]=='\0' || arg2[0]=='\0' || !is_number(arg1) )
    {
      opfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = UMAX(0, disp_limit);

  if ( str_cmp(arg2, "mud") )
    {
      argument = one_argument( argument, arg3 );
      if ( arg3[0]=='\0' || argument[0]=='\0'
           ||   !is_number(arg2) || !is_number(arg3) )
        {
          opfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = URANGE(1, atoi(arg2), 32767);
          hi_vnum = URANGE(1, atoi(arg3), 32767);
          if ( lo_vnum > hi_vnum )
            {
              opfind_help(ch);
              return;
            }
        }
    }
  if ( argument[0] == '\0' )
    {
      opfind_help(ch);
      return;
    }

  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pObj=get_obj_index(i)) && (pProg=pObj->mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->next)
            tot_vnum += str_count(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            pager_printf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  pager_printf( ch, "Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "mpfind" command
 */
void mpfind_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "mpfind n lo_vnum hi_vnum text \r\n"
                "   Search mob vnums between lo_vnum and hi_vnum \r\n"
                "   for mob progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  send_to_char( "mpfind n mud text \r\n"
                "   Search all the mobs in the mud for\r\n"
                "   mob progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  send_to_char( "Example:\r\n", ch);
  send_to_char( "mpfind 20 901 969 if isnpc \r\n"
                "   Search all mob progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all mobs that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  send_to_char( "Example:\r\n", ch);
  send_to_char( "mpfind 100 mud mpslay \r\n"
                "   Search all mob progs in the entire mud\r\n"
                "   and display all mobs that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}

/*
 * Search mobs for mob progs containing a specified text string.
 */
void do_mpfind( CHAR_DATA *ch, char *argument )   /* Gorog */
{
  MOB_INDEX_DATA  *   pMob;
  MPROG_DATA      *   pProg;
  char                arg1 [MAX_INPUT_LENGTH];
  char                arg2 [MAX_INPUT_LENGTH];
  char                arg3 [MAX_INPUT_LENGTH];
  int                 lo_vnum=1, hi_vnum=32767;
  int                 tot_vnum, tot_hits=0;
  int                 i, disp_cou=0, disp_limit;

  argument = one_argument( argument, arg1 );   /* display_limit */
  argument = one_argument( argument, arg2 );

  if ( arg1[0]=='\0' || arg2[0]=='\0' || !is_number(arg1) )
    {
      mpfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = UMAX(0, disp_limit);

  if ( str_cmp(arg2, "mud") )
    {
      argument = one_argument( argument, arg3 );
      if ( arg3[0]=='\0' || !is_number(arg2) || !is_number(arg3) )
        {
          mpfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = URANGE(1, atoi(arg2), 32767);
          hi_vnum = URANGE(1, atoi(arg3), 32767);
          if ( lo_vnum > hi_vnum )
            {
              mpfind_help(ch);
              return;
            }
        }
    }
  if ( argument[0] == '\0' )
    {
      mpfind_help(ch);
      return;
    }

  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pMob=get_mob_index(i)) && (pProg=pMob->mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->next)
            tot_vnum += str_count(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            pager_printf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  pager_printf( ch, "Total: %10d\r\n", tot_hits);
}

/*
 * Displays the help screen for the "rpfind" command
 */
void rpfind_help (CHAR_DATA *ch)
{
  send_to_char( "Syntax:\r\n", ch);
  send_to_char( "rpfind n lo_vnum hi_vnum text \r\n"
                "   Search room vnums between lo_vnum and hi_vnum \r\n"
                "   for room progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );
  send_to_char( "rpfind n mud text \r\n"
                "   Search all the rooms in the mud for\r\n"
                "   room progs that contain an occurrence of text. \r\n"
                "   Display a maxiumu of n lines.\r\n\r\n", ch );

  send_to_char( "Example:\r\n", ch);
  send_to_char( "rpfind 20 901 969 if isnpc \r\n"
                "   Search all room progs in Olympus (vnums 901 thru 969)\r\n"
                "   and display all vnums that contain the text \"if isnpc\".\r\n"
                "   Display a maximum of 20 lines.\r\n\r\n", ch );
  send_to_char( "Example:\r\n", ch);
  send_to_char( "rpfind 100 mud mpslay \r\n"
                "   Search all room progs in the entire mud\r\n"
                "   and display all vnums that contain the text \"mpslay\".\r\n"
                "   Display a maximum of 100 lines.\r\n\r\n", ch );
}

/*
 * Search rooms for room progs containing a specified text string.
 */
void do_rpfind( CHAR_DATA *ch, char *argument )   /* Gorog */
{
  ROOM_INDEX_DATA *   pRoom;
  MPROG_DATA      *   pProg;
  char                arg1 [MAX_INPUT_LENGTH];
  char                arg2 [MAX_INPUT_LENGTH];
  char                arg3 [MAX_INPUT_LENGTH];
  int                 lo_vnum=1, hi_vnum=32767;
  int                 tot_vnum, tot_hits=0;
  int                 i, disp_cou=0, disp_limit;

  argument = one_argument( argument, arg1 );   /* display_limit */
  argument = one_argument( argument, arg2 );

  if ( arg1[0]=='\0' || arg2[0]=='\0' || !is_number(arg1) )
    {
      rpfind_help(ch);
      return;
    }

  disp_limit = atoi (arg1);
  disp_limit = UMAX(0, disp_limit);

  if ( str_cmp(arg2, "mud") )
    {
      argument = one_argument( argument, arg3 );
      if ( arg3[0]=='\0' || argument[0]=='\0'
           ||   !is_number(arg2) || !is_number(arg3) )
        {
          rpfind_help(ch);
          return;
        }
      else
        {
          lo_vnum = URANGE(1, atoi(arg2), 32767);
          hi_vnum = URANGE(1, atoi(arg3), 32767);
          if ( lo_vnum > hi_vnum )
            {
              rpfind_help(ch);
              return;
            }
        }
    }
  if ( argument[0] == '\0' )
    {
      rpfind_help(ch);
      return;
    }
  /*
    pager_printf( ch, "display:%d lo:%d hi:%d test=\"%s\"\r\n",
    disp_limit, lo_vnum, hi_vnum, argument);
  */
  for (i = lo_vnum; i <= hi_vnum; i++)
    {
      if ( (pRoom=get_room_index(i)) && (pProg=pRoom->mudprogs) )
        {
          tot_vnum = 0;
          for ( ; pProg; pProg=pProg->next)
            tot_vnum += str_count(pProg->comlist, argument);
          tot_hits += tot_vnum;
          if ( tot_vnum && ++disp_cou <= disp_limit)
            pager_printf( ch, "%5d %5d %5d\r\n", disp_cou, i, tot_vnum);
        }
    }
  pager_printf( ch, "Total: %10d\r\n", tot_hits);
}

void do_reboo( CHAR_DATA *ch, char *argument )
{
  send_to_char( "If you want to REBOOT, spell it out.\r\n", ch );
  return;
}



void do_reboot( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  extern bool mud_down;
  CHAR_DATA *vch;
  SHIP_DATA *ship;

  if ( str_cmp( argument, "mud now" )
       &&   str_cmp( argument, "nosave" )
       &&   str_cmp( argument, "and sort skill table" ) )
    {
      send_to_char( "Syntax: 'reboot mud now' or 'reboot nosave'\r\n", ch );
      return;
    }

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Reboot by %s.", ch->name );
  do_echo( ch, buf );

  if ( !str_cmp(argument, "and sort skill table") )
    {
      sort_skill_table();
      save_skill_table();
    }

  /* Save all characters before booting. */
  if ( str_cmp(argument, "nosave") )
    for ( vch = first_char; vch; vch = vch->next )
      if ( !IS_NPC( vch ) )
        save_char_obj( vch );

  for ( ship = first_ship; ship; ship = ship->next )
    save_ship( ship );

  mud_down = TRUE;
  return;
}



void do_shutdow( CHAR_DATA *ch, char *argument )
{
  send_to_char( "If you want to SHUTDOWN, spell it out.\r\n", ch );
  return;
}



void do_shutdown( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  extern bool mud_down;
  CHAR_DATA *vch;
  SHIP_DATA *ship;

  if ( str_cmp( argument, "mud now" ) && str_cmp(argument, "nosave") )
    {
      send_to_char( "Syntax: 'shutdown mud now' or 'shutdown nosave'\r\n", ch );
      return;
    }

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Shutdown by %s.", ch->name );
  append_file( ch, SHUTDOWN_FILE, buf );
  strcat( buf, "\r\n" );
  do_echo( ch, buf );

  /* Save all characters before booting. */
  if ( str_cmp(argument, "nosave") )
    {
      for ( vch = first_char; vch; vch = vch->next )
        if ( !IS_NPC( vch ) )
          save_char_obj( vch );
      for ( ship = first_ship; ship; ship = ship->next )
        save_ship( ship );
    }

  mud_down = TRUE;
  return;
}


void do_snoop( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  DESCRIPTOR_DATA *d;
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Snoop whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !victim->desc )
    {
      send_to_char( "No descriptor to snoop.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Cancelling all snoops.\r\n", ch );
      for ( d = first_descriptor; d; d = d->next )
        if ( d->snoop_by == ch->desc )
          d->snoop_by = NULL;
      return;
    }

  if ( victim->desc->snoop_by )
    {
      send_to_char( "Busy already.\r\n", ch );
      return;
    }

  /*
   * Minimum snoop level... a secret mset value
   * makes the snooper think that the victim is already being snooped
   */
  if ( get_trust( victim ) >= get_trust( ch )
       ||  (victim->pcdata && victim->pcdata->min_snoop > get_trust( ch )) )
    {
      send_to_char( "Busy already.\r\n", ch );
      return;
    }

  if ( ch->desc )
    {
      for ( d = ch->desc->snoop_by; d; d = d->snoop_by )
        if ( d->character == victim || d->original == victim )
          {
            send_to_char( "No snoop loops.\r\n", ch );
            return;
          }
    }

  /*  Snoop notification for higher imms, if desired, uncomment this
      if ( get_trust(victim) > LEVEL_GOD && get_trust(ch) < LEVEL_SUPREME )
      write_to_descriptor( victim->desc->descriptor, "\r\nYou feel like someone is watching your every move...\r\n", 0 );
  */
  victim->desc->snoop_by = ch->desc;
  send_to_char( "Ok.\r\n", ch );
  return;
}



void do_switch( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Switch into whom?\r\n", ch );
      return;
    }

  if ( !ch->desc )
    return;

  if ( ch->desc->original )
    {
      send_to_char( "You are already switched.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( victim->desc )
    {
      send_to_char( "Character in use.\r\n", ch );
      return;
    }

  if ( !IS_NPC(victim) && get_trust(ch) < LEVEL_GREATER )
    {
      send_to_char( "You cannot switch into a player!\r\n", ch );
      return;
    }

  ch->desc->character = victim;
  ch->desc->original  = ch;
  victim->desc        = ch->desc;
  ch->desc            = NULL;
  ch->switched  = victim;
  send_to_char( "Ok.\r\n", victim );
  return;
}



void do_return( CHAR_DATA *ch, char *argument )
{
  if ( !ch->desc )
    return;

  if ( !ch->desc->original )
    {
      send_to_char( "You aren't switched.\r\n", ch );
      return;
    }

  if (IS_SET(ch->act, ACT_POLYMORPHED))
    {
      send_to_char("Use revert to return from a polymorphed mob.\r\n", ch);
      return;
    }

  send_to_char( "You return to your original body.\r\n", ch );
  if ( IS_NPC( ch ) && IS_AFFECTED( ch, AFF_POSSESS ) )
    {
      affect_strip( ch, gsn_possess );
      REMOVE_BIT( ch->affected_by, AFF_POSSESS );
    }
  /*    if ( IS_NPC( ch->desc->character ) )
        REMOVE_BIT( ch->desc->character->affected_by, AFF_POSSESS );*/
  ch->desc->character       = ch->desc->original;
  ch->desc->original        = NULL;
  ch->desc->character->desc = ch->desc;
  ch->desc->character->switched = NULL;
  ch->desc                  = NULL;
  return;
}



void do_minvoke( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  MOB_INDEX_DATA *pMobIndex;
  CHAR_DATA *victim;
  short vnum;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: minvoke <vnum>.\r\n", ch );
      return;
    }

  if ( !is_number( arg ) )
    {
      char arg2[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = number_argument( arg, arg2 );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pMobIndex = mob_index_hash[hash];
              pMobIndex;
              pMobIndex = pMobIndex->next )
          if ( nifty_is_name( arg2, pMobIndex->player_name )
               &&   ++cnt == count )
            {
              vnum = pMobIndex->vnum;
              break;
            }
      if ( vnum == -1 )
        {
          send_to_char( "No such mobile exists.\r\n", ch );
          return;
        }
    }
  else
    vnum = atoi( arg );

  if ( get_trust(ch) < LEVEL_DEMI )
    {
      AREA_DATA *pArea;

      if ( IS_NPC(ch) )
        {
          send_to_char( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to invoke this mobile.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_m_vnum
           &&   vnum > pArea->hi_m_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pMobIndex = get_mob_index( vnum ) ) == NULL )
    {
      send_to_char( "No mobile has that vnum.\r\n", ch );
      return;
    }

  victim = create_mobile( pMobIndex );
  char_to_room( victim, ch->in_room );
  act( AT_IMMORT, "$n has created $N!", ch, NULL, victim, TO_ROOM );
  send_to_char( "Ok.\r\n", ch );
  return;
}



void do_oinvoke( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  OBJ_DATA *obj;
  short vnum;
  int level;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      level = get_trust( ch );
    }
  else
    {
      if ( !is_number( arg2 ) )
        {
          send_to_char( "Syntax: oinvoke <vnum> <level>.\r\n", ch );
          return;
        }
      level = atoi( arg2 );
      if ( level < 0 || level > get_trust( ch ) )
        {
          send_to_char( "Limited to your trust level.\r\n", ch );
          return;
        }
    }

  if ( !is_number( arg1 ) )
    {
      char arg[MAX_INPUT_LENGTH];
      int  hash, cnt;
      int  count = number_argument( arg1, arg );

      vnum = -1;
      for ( hash = cnt = 0; hash < MAX_KEY_HASH; hash++ )
        for ( pObjIndex = obj_index_hash[hash];
              pObjIndex;
              pObjIndex = pObjIndex->next )
          if ( nifty_is_name( arg, pObjIndex->name )
               &&   ++cnt == count )
            {
              vnum = pObjIndex->vnum;
              break;
            }
      if ( vnum == -1 )
        {
          send_to_char( "No such object exists.\r\n", ch );
          return;
        }
    }
  else
    vnum = atoi( arg1 );

  if ( get_trust(ch) < LEVEL_DEMI )
    {
      AREA_DATA *pArea;

      if ( IS_NPC(ch) )
        {
          send_to_char( "Huh?\r\n", ch );
          return;
        }

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          send_to_char( "You must have an assigned area to invoke this object.\r\n", ch );
          return;
        }
      if ( vnum < pArea->low_o_vnum
           &&   vnum > pArea->hi_o_vnum )
        {
          send_to_char( "That number is not in your allocated range.\r\n", ch );
          return;
        }
    }

  if ( ( pObjIndex = get_obj_index( vnum ) ) == NULL )
    {
      send_to_char( "No object has that vnum.\r\n", ch );
      return;
    }

  /* Commented out by Narn, it seems outdated
     if ( IS_OBJ_STAT( pObjIndex, ITEM_PROTOTYPE )
     &&  pObjIndex->count > 5 )
     {
     send_to_char( "That object is at its limit.\r\n", ch );
     return;
     }
  */

  obj = create_object( pObjIndex, level );
  if ( CAN_WEAR(obj, ITEM_TAKE) )
    {
      obj = obj_to_char( obj, ch );
    }
  else
    {
      obj = obj_to_room( obj, ch->in_room );
      act( AT_IMMORT, "$n has created $p!", ch, obj, NULL, TO_ROOM );
    }
  send_to_char( "Ok.\r\n", ch );
  return;
}



void do_purge( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *obj;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      /* 'purge' */
      CHAR_DATA *vnext;
      OBJ_DATA  *obj_next;

      for ( victim = ch->in_room->first_person; victim; victim = vnext )
        {
          vnext = victim->next_in_room;
          if ( IS_NPC(victim) && victim != ch && !IS_SET(victim->act, ACT_POLYMORPHED))
            extract_char( victim, TRUE );
        }

      for ( obj = ch->in_room->first_content; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          if ( obj->item_type == ITEM_SPACECRAFT )
            continue;
          extract_obj( obj );
        }

      act( AT_IMMORT, "$n purges the room!", ch, NULL, NULL, TO_ROOM);
      send_to_char( "Ok.\r\n", ch );
      return;
    }
  victim = NULL; obj = NULL;

  /* fixed to get things in room first -- i.e., purge portal (obj),
   * no more purging mobs with that keyword in another room first
   * -- Tri */
  if ( ( victim = get_char_room( ch, arg ) ) == NULL
       && ( obj = get_obj_here( ch, arg ) ) == NULL )
    {
      if ( ( victim = get_char_world( ch, arg ) ) == NULL
           &&   ( obj = get_obj_world( ch, arg ) ) == NULL )  /* no get_obj_room */
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }
    }

  /* Single object purge in room for high level purge - Scryn 8/12*/
  if ( obj )
    {
      separate_obj( obj );
      act( AT_IMMORT, "$n purges $p.", ch, obj, NULL, TO_ROOM);
      act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR);
      extract_obj( obj );
      return;
    }


  if ( !IS_NPC(victim) )
    {
      send_to_char( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You cannot purge yourself!\r\n", ch );
      return;
    }

  if (IS_SET(victim->act, ACT_POLYMORPHED))
    {
      send_to_char("You cannot purge a polymorphed player.\r\n", ch);
      return;
    }
  act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  extract_char( victim, TRUE );
  return;
}


void do_low_purge( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *obj;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Purge what?\r\n", ch );
      return;
    }

  victim = NULL; obj = NULL;
  if ( ( victim = get_char_room( ch, arg ) ) == NULL
       &&        ( obj    = get_obj_here ( ch, arg ) ) == NULL )
    {
      send_to_char( "You can't find that here.\r\n", ch );
      return;
    }

  if ( obj )
    {
      separate_obj( obj );
      act( AT_IMMORT, "$n purges $p!", ch, obj, NULL, TO_ROOM );
      act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR );
      extract_obj( obj );
      return;
    }

  if ( !IS_NPC(victim) )
    {
      send_to_char( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You cannot purge yourself!\r\n", ch );
      return;
    }

  act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  act( AT_IMMORT, "You make $N disappear in a puff of smoke!", ch, NULL, victim, TO_CHAR );
  extract_char( victim, TRUE );
  return;
}


void do_balzhur( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  int sn;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Who is deserving of such a fate?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't playing.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "I wouldn't even think of that if I were you...\r\n", ch );
      return;
    }

  set_char_color( AT_WHITE, ch );
  send_to_char( "You summon the demon Balzhur to wreak your wrath!\r\n", ch );
  send_to_char( "Balzhur sneers at you evilly, then vanishes in a puff of smoke.\r\n", ch );
  set_char_color( AT_IMMORT, victim );
  send_to_char( "You hear an ungodly sound in the distance that makes your blood run cold!\r\n", victim );
  sprintf( buf, "Balzhur screams, 'You are MINE %s!!!'", victim->name );
  echo_to_all( AT_IMMORT, buf, ECHOTAR_ALL );
  victim->top_level =1;
  victim->trust  = 0;
  {
    int ability;

    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      {
        victim->experience[ability] = 1;
        victim->skill_level[ability] = 1;
      }
  }
  victim->max_hit  = 500;
  victim->max_mana = 0;
  victim->max_move = 1000;
  for ( sn = 0; sn < top_sn; sn++ )
    victim->pcdata->learned[sn] = 0;
  victim->hit      = victim->max_hit;
  victim->mana     = victim->max_mana;
  victim->move     = victim->max_move;


  sprintf( buf, "%s%s", GOD_DIR, capitalize(victim->name) );

  if ( !remove( buf ) )
    send_to_char( "Player's immortal data destroyed.\r\n", ch );
  else if ( errno != ENOENT )
    {
      ch_printf( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s balzhuring %s", ch->name, buf );
      perror( buf2 );
    }
  sprintf( buf2, "%s.are", capitalize(arg) );
  /*    for ( pArea = first_build; pArea; pArea = pArea->next )
        if ( pArea && !str_cmp( pArea->filename, buf2 ) )
        {
        sprintf( buf, "%s%s", BUILD_DIR, buf2 );
        if ( IS_SET( pArea->status, AREA_LOADED ) )
        fold_area( pArea, buf, FALSE );
        close_area( pArea );
        sprintf( buf2, "%s.bak", buf );
        set_char_color( AT_RED, ch );  Log message changes colors
        if ( !rename( buf, buf2 ) )
        send_to_char( "Player's area data destroyed.  Area saved as
        backup.\r\n", ch);
        else if ( errno != ENOENT )
        {
        ch_printf( ch, "Unknown error #%d - %s (area data).  Report to
        Thoric.\r\n",
        errno, strerror( errno ) );
        sprintf( buf2, "%s destroying %s", ch->name, buf );
        perror( buf2 );
        }
        }
  */


  make_wizlist();
  do_help(victim, "M_BALZHUR_" );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You awake after a long period of time...\r\n", victim );
  while ( victim->first_carrying )
    extract_obj( victim->first_carrying );
  return;
}

void do_advance( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  int level, ability;
  int iLevel, iAbility;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || arg3[0] == '\0' || !is_number( arg2 ) )
    {
      send_to_char( "Syntax: advance <char> <ability> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  ability = -1;
  for ( iAbility = 0 ; iAbility < MAX_ABILITY ; iAbility++ )
    {
      if ( !str_prefix( arg3 , ability_name[iAbility] ) )
        {
          ability = iAbility;
          break;
        }
    }

  if ( ability == -1 )
    {
      send_to_char( "No Such Ability.\r\n", ch);
      do_advance(ch, "" );
      return;
    }


  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  /* You can demote yourself but not someone else at your own trust. -- Narn */
  if ( get_trust( ch ) <= get_trust( victim ) && ch != victim )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 1 || level > 500 )
    {
      send_to_char( "Level must be 1 to 500.\r\n", ch );
      return;
    }

  /*
   * Lower level:
   *   Reset to level 1.
   *   Then raise again.
   *   Currently, an imp can lower another imp.
   *   -- Swiftest
   */
  if ( level <= victim->skill_level[ability] )
    {
      send_to_char( "Lowering a player's level!\r\n", ch );
      set_char_color( AT_IMMORT, victim );
      send_to_char( "Cursed and forsaken! The gods have lowered your level.\r\n", victim );
      victim->experience[ability] = 0;
      victim->skill_level[ability] = 1;
      if ( ability == COMBAT_ABILITY )
        victim->max_hit = 500;
      if ( ability == FORCE_ABILITY )
        victim->max_mana = 0;
    }
  else
    {
      send_to_char( "Raising a player's level!\r\n", ch );
      send_to_char( "The gods feel fit to raise your level!\r\n", victim );
    }

  for ( iLevel = victim->skill_level[ability] ; iLevel < level; iLevel++ )
    {
      victim->experience[ability] = exp_level(iLevel+1);
      gain_exp( victim, 0 , ability );
    }
  return;
}

void do_immortalize( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: immortalize <char>\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim->top_level != LEVEL_AVATAR )
    {
      send_to_char( "This player is not worthy of immortality yet.\r\n", ch );
      return;
    }

  send_to_char( "Immortalizing a player...\r\n", ch );
  set_char_color( AT_IMMORT, victim );
  act( AT_IMMORT, "$n begins to chant softly... then raises $s arms to the sky...",
       ch, NULL, NULL, TO_ROOM );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You suddenly feel very strange...\r\n\r\n", victim );
  set_char_color( AT_LBLUE, victim );

  do_help(victim, "M_GODLVL1_" );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You awake... all your possessions are gone.\r\n", victim );
  while ( victim->first_carrying )
    extract_obj( victim->first_carrying );

  victim->top_level = LEVEL_IMMORTAL;

  /*    advance_level( victim );  */

  victim->trust = 0;
  return;
}



void do_trust( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  int level;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || !is_number( arg2 ) )
    {
      send_to_char( "Syntax: trust <char> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      send_to_char( "Level must be 0 (reset) or 1 to 60.\r\n", ch );
      return;
    }

  if ( level > get_trust( ch ) )
    {
      send_to_char( "Limited to your own trust.\r\n", ch );
      return;
    }

  if ( ch->top_level < LEVEL_SUPREME && get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  victim->trust = level;
  send_to_char( "Ok.\r\n", ch );
  return;
}

void do_toplevel( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  int level;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || !is_number( arg2 ) )
    {
      send_to_char( "Syntax: toplevel <char> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      send_to_char( "Level must be 0 (reset) or 1 to 60.\r\n", ch );
      return;
    }

  if ( level > ch->top_level )
    {
      send_to_char( "Limited to your own top level.\r\n", ch );
      return;
    }

  if ( ch->top_level < LEVEL_SUPREME && victim->top_level >= ch->top_level )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  victim->top_level = level;
  send_to_char( "Ok.\r\n", ch );
  return;
}


void do_restore( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Restore whom?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      CHAR_DATA *vch;
      CHAR_DATA *vch_next;

      if ( !ch->pcdata )
        return;

      if ( get_trust( ch ) < LEVEL_SUB_IMPLEM )
        {
          if ( IS_NPC( ch ) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }
          else
            {
              /* Check if the player did a restore all within the last 18 hours. */
              if ( current_time - last_restore_all_time < RESTORE_INTERVAL )
                {
                  send_to_char( "Sorry, you can't do a restore all yet.\r\n", ch );
                  do_restoretime( ch, "" );
                  return;
                }
            }
        }
      last_restore_all_time    = current_time;
      ch->pcdata->restore_time = current_time;
      save_char_obj( ch );
      send_to_char( "Ok.\r\n", ch);
      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !IS_NPC( vch ) && !IS_IMMORTAL( vch ) )
            {
              vch->hit = vch->max_hit;
              vch->mana = vch->max_mana;
              vch->move = vch->max_move;
              vch->pcdata->condition[COND_BLOODTHIRST] = (10 + vch->top_level);
              update_pos (vch);
              act( AT_IMMORT, "$n has restored you.", ch, NULL, vch, TO_VICT);
            }
        }
    }
  else
    {

      CHAR_DATA *victim;

      if ( ( victim = get_char_world( ch, arg ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( get_trust( ch ) < LEVEL_LESSER
           &&  victim != ch
           && !( IS_NPC( victim ) && IS_SET( victim->act, ACT_PROTOTYPE ) ) )
        {
          send_to_char( "You can't do that.\r\n", ch );
          return;
        }

      victim->hit  = victim->max_hit;
      victim->mana = victim->max_mana;
      victim->move = victim->max_move;
      if ( victim->pcdata )
        victim->pcdata->condition[COND_BLOODTHIRST] = (10 + victim->top_level);
      update_pos( victim );
      if ( ch != victim )
        act( AT_IMMORT, "$n has restored you.", ch, NULL, victim, TO_VICT );
      send_to_char( "Ok.\r\n", ch );
      return;
    }
}

void do_restoretime( CHAR_DATA *ch, char *argument )
{
  long int time_passed;
  int hour, minute;

  if ( !last_restore_all_time )
    ch_printf( ch, "There has been no restore all since reboot\r\n");
  else
    {
      time_passed = current_time - last_restore_all_time;
      hour = (int) ( time_passed / 3600 );
      minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
      ch_printf( ch, "The  last restore all was %d hours and %d minutes ago.\r\n",
                 hour, minute );
    }

  if ( !ch->pcdata )
    return;

  if ( !ch->pcdata->restore_time )
    {
      send_to_char( "You have never done a restore all.\r\n", ch );
      return;
    }

  time_passed = current_time - ch->pcdata->restore_time;
  hour = (int) ( time_passed / 3600 );
  minute = (int) ( ( time_passed - ( hour * 3600 ) ) / 60 );
  ch_printf( ch, "Your last restore all was %d hours and %d minutes ago.\r\n",
             hour, minute );
  return;
}

void do_freeze( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Freeze whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_FREEZE) )
    {
      REMOVE_BIT(victim->act, PLR_FREEZE);
      send_to_char( "You can play again.\r\n", victim );
      send_to_char( "FREEZE removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_FREEZE);
      send_to_char( "You can't do ANYthing!\r\n", victim );
      send_to_char( "FREEZE set.\r\n", ch );
    }

  save_char_obj( victim );

  return;
}



void do_log( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Log whom?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      if ( fLogAll )
        {
          fLogAll = FALSE;
          send_to_char( "Log ALL off.\r\n", ch );
        }
      else
        {
          fLogAll = TRUE;
          send_to_char( "Log ALL on.\r\n", ch );
        }
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  /*
   * No level check, gods can log anyone.
   */
  if ( IS_SET(victim->act, PLR_LOG) )
    {
      REMOVE_BIT(victim->act, PLR_LOG);
      send_to_char( "LOG removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_LOG);
      send_to_char( "LOG set.\r\n", ch );
    }

  return;
}


void do_litterbug( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Set litterbug flag on whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_LITTERBUG) )
    {
      REMOVE_BIT(victim->act, PLR_LITTERBUG);
      send_to_char( "You can drop items again.\r\n", victim );
      send_to_char( "LITTERBUG removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_LITTERBUG);
      send_to_char( "You a strange force prevents you from dropping any more items!\r\n", victim );
      send_to_char( "LITTERBUG set.\r\n", ch );
    }

  return;
}


void do_noemote( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Noemote whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_NO_EMOTE) )
    {
      REMOVE_BIT(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can emote again.\r\n", victim );
      send_to_char( "NO_EMOTE removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can't emote!\r\n", victim );
      send_to_char( "NO_EMOTE set.\r\n", ch );
    }

  return;
}



void do_notell( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Notell whom?", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_NO_TELL) )
    {
      REMOVE_BIT(victim->act, PLR_NO_TELL);
      send_to_char( "You can tell again.\r\n", victim );
      send_to_char( "NO_TELL removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_NO_TELL);
      send_to_char( "You can't tell!\r\n", victim );
      send_to_char( "NO_TELL set.\r\n", ch );
    }

  return;
}


void do_notitle( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Notitle whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->pcdata->flags, PCFLAG_NOTITLE) )
    {
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_NOTITLE);
      send_to_char( "You can set your own title again.\r\n", victim );
      send_to_char( "NOTITLE removed.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->pcdata->flags, PCFLAG_NOTITLE);
      sprintf( buf, "%s", victim->name );
      set_title( victim, buf );
      send_to_char( "You can't set your own title!\r\n", victim );
      send_to_char( "NOTITLE set.\r\n", ch );
    }

  return;
}

void do_silence( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Silence whom?", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_SILENCE) )
    {
      send_to_char( "Player already silenced, use unsilence to remove.\r\n", ch );
    }
  else
    {
      SET_BIT(victim->act, PLR_SILENCE);
      send_to_char( "You can't use channels!\r\n", victim );
      send_to_char( "SILENCE set.\r\n", ch );
    }

  return;
}

void do_unsilence( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Unsilence whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_SILENCE) )
    {
      REMOVE_BIT(victim->act, PLR_SILENCE);
      send_to_char( "You can use channels again.\r\n", victim );
      send_to_char( "SILENCE removed.\r\n", ch );
    }
  else
    {
      send_to_char( "That player is not silenced.\r\n", ch );
    }

  return;
}




void do_peace( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *rch;

  act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( rch->fighting )
        {
          stop_fighting( rch, TRUE );
          do_sit( rch, "" );
        }

      /* Added by Narn, Nov 28/95 */
      stop_hating( rch );
      stop_hunting( rch );
      stop_fearing( rch );
    }

  send_to_char( "Ok.\r\n", ch );
  return;
}



BAN_DATA *              first_ban;
BAN_DATA *              last_ban;

void save_banlist( void )
{
  BAN_DATA *pban;
  FILE *fp;

  if ( !(fp = fopen( SYSTEM_DIR BAN_LIST, "w" )) )
    {
      bug( "Save_banlist: Cannot open " BAN_LIST, 0 );
      perror(BAN_LIST);
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    fprintf( fp, "%d %s~~%s~\n", pban->level, pban->name, pban->ban_time );

  fprintf( fp, "-1\n" );
  fclose( fp );
}

void do_ban( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  BAN_DATA *pban;
  int bnum;

  if ( IS_NPC(ch) )
    return;

  argument = one_argument( argument, arg );

  set_pager_color( AT_PLAIN, ch );
  if ( arg[0] == '\0' )
    {
      send_to_pager( "Banned sites:\r\n", ch );
      send_to_pager( "[ #] (Lv) Time                     Site\r\n", ch );
      send_to_pager( "---- ---- ------------------------ ---------------\r\n", ch );
      for ( pban = first_ban, bnum = 1; pban; pban = pban->next, bnum++ )
        pager_printf(ch, "[%2d] (%2d) %-24s %s\r\n", bnum,
                     pban->level, pban->ban_time, pban->name);
      return;
    }

  /* People are gonna need .# instead of just # to ban by just last
     number in the site ip.                               -- Altrag */
  if ( is_number(arg) )
    {
      for ( pban = first_ban, bnum = 1; pban; pban = pban->next, bnum++ )
        if ( bnum == atoi(arg) )
          break;
      if ( !pban )
        {
          do_ban(ch, "");
          return;
        }
      argument = one_argument(argument, arg);
      if ( arg[0] == '\0' )
        {
          do_ban( ch, "help" );
          return;
        }
      if ( !str_cmp(arg, "level") )
        {
          argument = one_argument(argument, arg);
          if ( arg[0] == '\0' || !is_number(arg) )
            {
              do_ban( ch, "help" );
              return;
            }
          if ( atoi(arg) < 1 || atoi(arg) > LEVEL_SUPREME )
            {
              ch_printf(ch, "Level range: 1 - %d.\r\n", LEVEL_SUPREME);
              return;
            }
          pban->level = atoi(arg);
          send_to_char( "Ban level set.\r\n", ch );
        }
      else if ( !str_cmp(arg, "newban") )
        {
          pban->level = 1;
          send_to_char( "New characters banned.\r\n", ch );
        }
      else if ( !str_cmp(arg, "mortal") )
        {
          pban->level = LEVEL_AVATAR;
          send_to_char( "All mortals banned.\r\n", ch );
        }
      else if ( !str_cmp(arg, "total") )
        {
          pban->level = LEVEL_SUPREME;
          send_to_char( "Everyone banned.\r\n", ch );
        }
      else
        {
          do_ban(ch, "help");
          return;
        }
      save_banlist( );
      return;
    }

  if ( !str_cmp(arg, "help") )
    {
      send_to_char( "Syntax: ban <site address>\r\n", ch );
      send_to_char( "Syntax: ban <ban number> <level <lev>|newban|mortal|"
                    "total>\r\n", ch );
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( !str_cmp( arg, pban->name ) )
        {
          send_to_char( "That site is already banned!\r\n", ch );
          return;
        }
    }

  CREATE( pban, BAN_DATA, 1 );
  LINK( pban, first_ban, last_ban, next, prev );
  pban->name    = str_dup( arg );
  pban->level = LEVEL_AVATAR;
  sprintf(buf, "%24.24s", ctime(&current_time));
  pban->ban_time = str_dup( buf );
  save_banlist( );
  send_to_char( "Ban created.  Mortals banned from site.\r\n", ch );
  return;
}


void do_allow( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  BAN_DATA *pban;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Remove which site from the ban list?\r\n", ch );
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( !str_cmp( arg, pban->name ) )
        {
          UNLINK( pban, first_ban, last_ban, next, prev );
          if ( pban->ban_time )
            DISPOSE(pban->ban_time);
          DISPOSE( pban->name );
          DISPOSE( pban );
          save_banlist( );
          send_to_char( "Site no longer banned.\r\n", ch );
          return;
        }
    }

  send_to_char( "Site is not banned.\r\n", ch );
  return;
}



void do_wizlock( CHAR_DATA *ch, char *argument )
{
  extern bool wizlock;
  wizlock = !wizlock;

  if ( wizlock )
    send_to_char( "Game wizlocked.\r\n", ch );
  else
    send_to_char( "Game un-wizlocked.\r\n", ch );

  return;
}


void do_noresolve( CHAR_DATA *ch, char *argument )
{
  sysdata.NO_NAME_RESOLVING = !sysdata.NO_NAME_RESOLVING;

  if ( sysdata.NO_NAME_RESOLVING )
    send_to_char( "Name resolving disabled.\r\n", ch );
  else
    send_to_char( "Name resolving enabled.\r\n", ch );

  return;
}


void do_users( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  DESCRIPTOR_DATA *d;
  int count;
  char arg[MAX_INPUT_LENGTH];

  one_argument (argument, arg);
  count = 0;
  buf[0]        = '\0';

  set_pager_color( AT_PLAIN, ch );
  sprintf(buf,
          "Desc|Con|Idle| Port | Player@HostIP                 ");
  strcat(buf, "\r\n");
  strcat(buf, "----+---+----+------+-------------------------------");
  strcat(buf, "\r\n");
  send_to_pager(buf, ch);

  for ( d = first_descriptor; d; d = d->next )
    {
      if (arg[0] == '\0')
        {
          if (  get_trust(ch) >= LEVEL_SUPREME
                ||   (d->character && can_see( ch, d->character )) )
            {
              count++;
              sprintf( buf,
                       " %3d| %2d|%4d|%6d| %s@%s ",
                       d->descriptor,
                       d->connected,
                       d->idle / 4,
                       d->port,
                       d->original  ? d->original->name  :
                       d->character ? d->character->name : "(none)",
                       d->hostip );
              if ( ch->top_level >= LEVEL_GOD && ( !d->character || d->character->top_level <= LEVEL_GOD ) )
                sprintf( buf + strlen( buf ), " (%s@%s)", d->user, d->host  );
              strcat(buf, "\r\n");
              send_to_pager( buf, ch );
            }
        }
      else
        {
          if ( (get_trust(ch) >= LEVEL_SUPREME
                ||   (d->character && can_see( ch, d->character )) )
               &&   ( !str_prefix( arg, d->host )
                      ||   ( d->character && !str_prefix( arg, d->character->name ) ) ) )
            {
              count++;
              pager_printf( ch,
                            " %3d| %2d|%4d|%6d| %-12s@%-16s ",
                            d->descriptor,
                            d->connected,
                            d->idle / 4,
                            d->port,
                            d->original  ? d->original->name  :
                            d->character ? d->character->name : "(none)",
                            d->host
                            );
              buf[0] = '\0';
              if (get_trust(ch) >= LEVEL_GOD)
                sprintf(buf, "| %s", d->user);
              strcat(buf, "\r\n");
              send_to_pager( buf, ch );
            }
        }
    }
  pager_printf( ch, "%d user%s.\r\n", count, count == 1 ? "" : "s" );
  return;
}



/*
 * Thanks to Grodyn for pointing out bugs in this function.
 */
void do_force( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool mobsonly;
  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Force whom to do what?\r\n", ch );
      return;
    }

  mobsonly = get_trust( ch ) < sysdata.level_forcepc;

  if ( !str_cmp( arg, "all" ) )
    {
      CHAR_DATA *vch;
      CHAR_DATA *vch_next;

      if ( mobsonly )
        {
          send_to_char( "Force whom to do what?\r\n", ch );
          return;
        }

      for ( vch = first_char; vch; vch = vch_next )
        {
          vch_next = vch->next;

          if ( !IS_NPC(vch) && get_trust( vch ) < get_trust( ch ) )
            {
              act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, vch, TO_VICT );
              interpret( vch, argument );
            }
        }
    }
  else
    {
      CHAR_DATA *victim;

      if ( ( victim = get_char_world( ch, arg ) ) == NULL )
        {
          send_to_char( "They aren't here.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          send_to_char( "Aye aye, right away!\r\n", ch );
          return;
        }

      if ( ( get_trust( victim ) >= get_trust( ch ) )
           || ( mobsonly && !IS_NPC( victim ) ) )
        {
          send_to_char( "Do it yourself!\r\n", ch );
          return;
        }

      act( AT_IMMORT, "$n forces you to '$t'.", ch, argument, victim, TO_VICT );
      interpret( victim, argument );
    }

  send_to_char( "Ok.\r\n", ch );
  return;
}


void do_invis( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short level = 0;

  argument = one_argument( argument, arg );
  if ( arg[0] != '\0' )
    {
      if ( !is_number( arg ) )
        {
          send_to_char( "Usage: invis | invis <level>\r\n", ch );
          return;
        }
      level = atoi( arg );
      if ( level < 2 || level > ch->top_level)
        {
          send_to_char( "Invalid level.\r\n", ch );
          return;
        }

      if (!IS_NPC(ch))
        {
          ch->pcdata->wizinvis = level;
          ch_printf( ch, "Wizinvis level set to %d.\r\n", level );
        }

      if (IS_NPC(ch))
        {
          ch->mobinvis = level;
          ch_printf( ch, "Mobinvis level set to %d.\r\n", level );
        }
      return;
    }

  if (!IS_NPC(ch))
    {
      if ( ch->pcdata->wizinvis < 2 )
        ch->pcdata->wizinvis = ch->top_level;
    }

  if (IS_NPC(ch))
    {
      if ( ch->mobinvis < 2 )
        ch->mobinvis = ch->top_level;
    }

  if ( IS_SET(ch->act, PLR_WIZINVIS) )
    {
      REMOVE_BIT(ch->act, PLR_WIZINVIS);
      act( AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, TO_ROOM );
      send_to_char( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SET_BIT(ch->act, PLR_WIZINVIS);
      act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      send_to_char( "You slowly vanish into thin air.\r\n", ch );
    }

  return;
}


void do_holylight( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC(ch) )
    return;

  if ( IS_SET(ch->act, PLR_HOLYLIGHT) )
    {
      REMOVE_BIT(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode off.\r\n", ch );
    }
  else
    {
      SET_BIT(ch->act, PLR_HOLYLIGHT);
      send_to_char( "Holy light mode on.\r\n", ch );
    }

  return;
}

void do_rassign( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  r_lo, r_hi;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  r_lo = atoi( arg2 );  r_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || r_lo < 0 || r_hi < 0 )
    {
      send_to_char( "Syntax: assign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IS_NPC( victim ) || get_trust( victim ) < LEVEL_AVATAR )
    {
      send_to_char( "They wouldn't know what to do with a room range.\r\n", ch );
      return;
    }
  if ( r_lo > r_hi )
    {
      send_to_char( "Unacceptable room range.\r\n", ch );
      return;
    }
  if ( r_lo == 0 )
    r_hi = 0;
  victim->pcdata->r_range_lo = r_lo;
  victim->pcdata->r_range_hi = r_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the room range %d - %d.\r\n",
             ch->name, r_lo, r_hi );
  assign_area( victim );        /* Put back by Thoric on 02/07/96 */
  if ( !victim->pcdata->area )
    {
      bug( "rassign: assign_area failed", 0 );
      return;
    }

  if (r_lo == 0)                                /* Scryn 8/12/95 */
    {
      REMOVE_BIT ( victim->pcdata->area->status, AREA_LOADED );
      SET_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
  else
    {
      SET_BIT( victim->pcdata->area->status, AREA_LOADED );
      REMOVE_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
  return;
}

void do_vassign( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  r_lo, r_hi;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  r_lo = atoi( arg2 );  r_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || r_lo < 0 || r_hi < 0 )
    {
      send_to_char( "Syntax: vassign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IS_NPC( victim ) || get_trust( victim ) < LEVEL_CREATOR )
    {
      send_to_char( "They wouldn't know what to do with a vnum range.\r\n", ch );
      return;
    }
  if ( r_lo > r_hi )
    {
      send_to_char( "Unacceptable room range.\r\n", ch );
      return;
    }
  if ( r_lo == 0 )
    r_hi = 0;
  victim->pcdata->r_range_lo = r_lo;
  victim->pcdata->r_range_hi = r_hi;
  victim->pcdata->o_range_lo = r_lo;
  victim->pcdata->o_range_hi = r_hi;
  victim->pcdata->m_range_lo = r_lo;
  victim->pcdata->m_range_hi = r_hi;

  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the vnum range %d - %d.\r\n",
             ch->name, r_lo, r_hi );
  assign_area( victim );        /* Put back by Thoric on 02/07/96 */
  if ( !victim->pcdata->area )
    {
      bug( "rassign: assign_area failed", 0 );
      return;
    }

  if (r_lo == 0)                                /* Scryn 8/12/95 */
    {
      REMOVE_BIT ( victim->pcdata->area->status, AREA_LOADED );
      SET_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
  else
    {
      SET_BIT( victim->pcdata->area->status, AREA_LOADED );
      REMOVE_BIT( victim->pcdata->area->status, AREA_DELETED );
    }
  return;
}

void do_oassign( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  o_lo, o_hi;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  o_lo = atoi( arg2 );  o_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || o_lo < 0 || o_hi < 0 )
    {
      send_to_char( "Syntax: oassign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IS_NPC( victim ) || get_trust( victim ) < LEVEL_SAVIOR )
    {
      send_to_char( "They wouldn't know what to do with an object range.\r\n", ch );
      return;
    }
  if ( o_lo > o_hi )
    {
      send_to_char( "Unacceptable object range.\r\n", ch );
      return;
    }
  victim->pcdata->o_range_lo = o_lo;
  victim->pcdata->o_range_hi = o_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the object vnum range %d - %d.\r\n",
             ch->name, o_lo, o_hi );
  return;
}

void do_massign( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  short  m_lo, m_hi;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  m_lo = atoi( arg2 );  m_hi = atoi( arg3 );

  if ( arg1[0] == '\0' || m_lo < 0 || m_hi < 0 )
    {
      send_to_char( "Syntax: massign <who> <low> <high>\r\n", ch );
      return;
    }
  if ( (victim = get_char_world( ch, arg1 )) == NULL )
    {
      send_to_char( "They don't seem to be around.\r\n", ch );
      return;
    }
  if ( IS_NPC( victim ) || get_trust( victim ) < LEVEL_SAVIOR )
    {
      send_to_char( "They wouldn't know what to do with a monster range.\r\n", ch );
      return;
    }
  if ( m_lo > m_hi )
    {
      send_to_char( "Unacceptable monster range.\r\n", ch );
      return;
    }
  victim->pcdata->m_range_lo = m_lo;
  victim->pcdata->m_range_hi = m_hi;
  assign_area( victim );
  send_to_char( "Done.\r\n", ch );
  ch_printf( victim, "%s has assigned you the monster vnum range %d - %d.\r\n",
             ch->name, m_lo, m_hi );
  return;
}

void do_cmdtable( CHAR_DATA *ch, char *argument )
{
  int hash, cnt;
  CMDTYPE *cmd;

  set_pager_color( AT_PLAIN, ch );
  send_to_pager("Commands and Number of Uses This Run\r\n", ch);

  for ( cnt = hash = 0; hash < 126; hash++ )
    for ( cmd = command_hash[hash]; cmd; cmd = cmd->next )
      {
        if ((++cnt)%4)
          pager_printf(ch,"%-6.6s %4d\t",cmd->name,cmd->userec.num_uses);
        else
          pager_printf(ch,"%-6.6s %4d\r\n", cmd->name,cmd->userec.num_uses );
      }
  return;
}

/*
 * Load up a player file
 */
void do_loadup( CHAR_DATA *ch, char *argument )
{
  char fname[1024];
  char name[256];
  struct stat fst;
  bool loaded;
  DESCRIPTOR_DATA *d;
  int old_room_vnum;
  char buf[MAX_STRING_LENGTH];

  one_argument( argument, name );
  if ( name[0] == '\0' )
    {
      send_to_char( "Usage: loadup <playername>\r\n", ch );
      return;
    }

  name[0] = UPPER(name[0]);

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           capitalize( name ) );
  if ( stat( fname, &fst ) != -1 )
    {
      CREATE( d, DESCRIPTOR_DATA, 1 );
      d->next = NULL;
      d->prev = NULL;
      d->connected = CON_GET_NAME;
      d->outsize = 2000;
      CREATE( d->outbuf, char, d->outsize );

      loaded = load_char_obj( d, name, FALSE );
      add_char( d->character );
      old_room_vnum = d->character->in_room->vnum;
      char_to_room( d->character, ch->in_room );

      if ( d->character->plr_home != NULL )
        {
          char filename[256];
          FILE *fph;
          ROOM_INDEX_DATA *storeroom = d->character->plr_home;
          OBJ_DATA *obj;
          OBJ_DATA *obj_next;

          for ( obj = storeroom->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              extract_obj( obj );
            }

          sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(d->character->name[0]),
                   capitalize( d->character->name ) );
          if ( ( fph = fopen( filename, "r" ) ) != NULL )
            {
              bool found;
              OBJ_DATA *tobj, *tobj_next;

              rset_supermob(storeroom);

              found = TRUE;
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
                      bug( d->character->name, 0 );
                      break;
                    }

                  word = fread_word( fph );
                  if ( !str_cmp( word, "OBJECT" ) )     /* Objects      */
                    fread_obj  ( supermob, fph, OS_CARRY );
                  else
                    if ( !str_cmp( word, "END"    ) )   /* Done         */
                      break;
                    else
                      {
                        bug( "Load_plr_home: bad section.", 0 );
                        bug( d->character->name, 0 );
                        break;
                      }
                }

              fclose( fph );

              for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
                {
                  tobj_next = tobj->next_content;
                  obj_from_char( tobj );
                  if( tobj->item_type != ITEM_MONEY )
                    obj_to_room( tobj, storeroom );
                }

              release_supermob();

            }
        }


      if ( get_trust(d->character) >= get_trust( ch ) )
        {
          do_say( d->character, "Do *NOT* disturb me again!" );
          send_to_char( "I think you'd better leave that player alone!\r\n", ch );
          d->character->desc    = NULL;
          do_quit( d->character, "" );
          return;
        }
      d->character->desc        = NULL;
      d->character->retran    = old_room_vnum;
      d->character              = NULL;
      DISPOSE( d->outbuf );
      DISPOSE( d );
      ch_printf(ch, "Player %s loaded from room %d.\r\n", capitalize( name ),old_room_vnum );
      sprintf(buf, "%s appears from nowhere, eyes glazed over.\r\n", capitalize( name ) );
      act( AT_IMMORT, buf, ch, NULL, NULL, TO_ROOM );

      send_to_char( "Done.\r\n", ch );
      return;
    }
  /* else no player file */
  send_to_char( "No such player.\r\n", ch );
  return;
}

void do_fixchar( CHAR_DATA *ch, char *argument )
{
  char name[MAX_STRING_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, name );
  if ( name[0] == '\0' )
    {
      send_to_char( "Usage: fixchar <playername>\r\n", ch );
      return;
    }
  victim = get_char_room( ch, name );
  if ( !victim )
    {
      send_to_char( "They're not here.\r\n", ch );
      return;
    }
  fix_char( victim );
  /*  victim->armor     = 100;
      victim->mod_str   = 0;
      victim->mod_dex   = 0;
      victim->mod_wis   = 0;
      victim->mod_int   = 0;
      victim->mod_con   = 0;
      victim->mod_cha   = 0;
      victim->mod_lck   = 0;
      victim->damroll   = 0;
      victim->hitroll   = 0;
      victim->alignment = URANGE( -1000, victim->alignment, 1000 );
      victim->saving_spell_staff = 0; */
  send_to_char( "Done.\r\n", ch );
}

void do_newbieset( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  CHAR_DATA *victim;

  argument = one_argument( argument, arg1 );
  argument = one_argument (argument, arg2);

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: newbieset <char>.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( ( victim->top_level < 1 ) || ( victim->top_level > 5 ) )
    {
      send_to_char( "Level of victim must be 1 to 5.\r\n", ch );
      return;
    }
  obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_SHIELD), 1 );
  obj_to_char(obj, victim);

  obj = create_object( get_obj_index(OBJ_VNUM_SCHOOL_DAGGER), 1 );
  obj_to_char(obj, victim);

  /* Added by Brittany, on Nov. 24, 1996. The object is the adventurer's
     guide to the realms of despair, part of academy.are. */
  {
    OBJ_INDEX_DATA *obj_ind = get_obj_index( 10333 );
    if ( obj_ind != NULL )
      {
        obj = create_object( obj_ind, 1 );
        obj_to_char( obj, victim );
      }
  }

  /* Added the burlap sack to the newbieset.  The sack is part of sgate.are
     called Spectral Gate.  Brittany */

  {

    OBJ_INDEX_DATA *obj_ind = get_obj_index( 123 );
    if ( obj_ind != NULL )
      {
        obj = create_object( obj_ind, 1 );
        obj_to_char( obj, victim );
      }
  }

  act( AT_IMMORT, "$n has equipped you with a newbieset.", ch, NULL, victim, TO_VICT);
  ch_printf( ch, "You have re-equipped %s.\r\n", victim->name );
  return;
}

/*
 * Extract area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "joe.are susan.are"
 * - Gorog
 */
void extract_area_names (char *inp, char *out)
{
  char buf[MAX_INPUT_LENGTH], *pbuf=buf;
  int  len;

  *out='\0';
  while (inp && *inp)
    {
      inp = one_argument(inp, buf);
      if ( (len=strlen(buf)) >= 5 && !strcmp(".are", pbuf+len-4) )
        {
          if (*out) strcat (out, " ");
          strcat (out, buf);
        }
    }
}

/*
 * Remove area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "aset sedit cset"
 * - Gorog
 */
void remove_area_names (char *inp, char *out)
{
  char buf[MAX_INPUT_LENGTH], *pbuf=buf;
  int  len;

  *out='\0';
  while (inp && *inp)
    {
      inp = one_argument(inp, buf);
      if ( (len=strlen(buf)) < 5 || strcmp(".are", pbuf+len-4) )
        {
          if (*out) strcat (out, " ");
          strcat (out, buf);
        }
    }
}

void do_bestowarea( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  int  arg_len;

  argument = one_argument( argument, arg );

  if ( get_trust (ch) < LEVEL_SUB_IMPLEM )
    {
      send_to_char( "Sorry...\r\n", ch );
      return;
    }

  if ( !*arg )
    {
      send_to_char(
                   "Syntax:\r\n"
                   "bestowarea <victim> <filename>.are\r\n"
                   "bestowarea <victim> none             removes bestowed areas\r\n"
                   "bestowarea <victim> list             lists bestowed areas\r\n"
                   "bestowarea <victim>                  lists bestowed areas\r\n", ch);
      return;
    }

  if ( !(victim = get_char_world( ch, arg )) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC( victim ) )
    {
      send_to_char( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( get_trust(victim) < LEVEL_IMMORTAL )
    {
      send_to_char( "They aren't an immortal.\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = str_dup("");

  if ( !*argument || !str_cmp (argument, "list") )
    {
      extract_area_names (victim->pcdata->bestowments, buf);
      ch_printf( ch, "Bestowed areas: %s\r\n", buf);
      return;
    }

  if ( !str_cmp (argument, "none") )
    {
      remove_area_names (victim->pcdata->bestowments, buf);
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      send_to_char( "Done.\r\n", ch);
      return;
    }

  arg_len = strlen(argument);
  if ( arg_len < 5
       || argument[arg_len-4] != '.' || argument[arg_len-3] != 'a'
       || argument[arg_len-2] != 'r' || argument[arg_len-1] != 'e' )
    {
      send_to_char( "You can only bestow an area name\r\n", ch );
      send_to_char( "E.G. bestow joe sam.are\r\n", ch );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = str_dup( buf );
  ch_printf( victim, "%s has bestowed on you the area: %s\r\n",
             ch->name, argument );
  send_to_char( "Done.\r\n", ch );
}

void do_bestow( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Bestow whom with what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC( victim ) )
    {
      send_to_char( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( get_trust( victim ) > get_trust( ch ) )
    {
      send_to_char( "You aren't powerful enough...\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = str_dup("");

  if ( argument[0] == '\0' || !str_cmp( argument, "list" ) )
    {
      ch_printf( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      return;
    }

  if ( !str_cmp( argument, "none" ) )
    {
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup("");
      ch_printf( ch, "Bestowments removed from %s.\r\n", victim->name );
      ch_printf( victim, "%s has removed your bestowed commands.\r\n", ch->name );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = str_dup( buf );
  ch_printf( victim, "%s has bestowed on you the command(s): %s\r\n",
             ch->name, argument );
  send_to_char( "Done.\r\n", ch );
}

struct tm *update_time ( struct tm *old_time )
{
  time_t time;

  time = mktime(old_time);
  return localtime(&time);
}

void do_set_boot_time( CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  bool check;

  check = FALSE;

  argument = one_argument(argument, arg);

  if ( arg[0] == '\0' )
    {
      send_to_char( "Syntax: setboot time {hour minute <day> <month> <year>}\r\n", ch);
      send_to_char( "        setboot manual {0/1}\r\n", ch);
      send_to_char( "        setboot default\r\n", ch);
      ch_printf( ch, "Boot time is currently set to %s, manual bit is set to %d\r\n"
                 ,reboot_time, set_boot_time->manual );
      return;
    }

  if ( !str_cmp(arg, "time") )
    {
      struct tm *now_time;

      argument = one_argument(argument, arg);
      argument = one_argument(argument, arg1);
      if ( !*arg || !*arg1 || !is_number(arg) || !is_number(arg1) )
        {
          send_to_char("You must input a value for hour and minute.\r\n", ch);
          return;
        }
      now_time = localtime(&current_time);

      if ( (now_time->tm_hour = atoi(arg)) < 0 || now_time->tm_hour > 23 )
        {
          send_to_char("Valid range for hour is 0 to 23.\r\n", ch);
          return;
        }

      if ( (now_time->tm_min = atoi(arg1)) < 0 || now_time->tm_min > 59 )
        {
          send_to_char("Valid range for minute is 0 to 59.\r\n", ch);
          return;
        }

      argument = one_argument(argument, arg);
      if ( *arg != '\0' && is_number(arg) )
        {
          if ( (now_time->tm_mday = atoi(arg)) < 1 || now_time->tm_mday > 31 )
            {
              send_to_char("Valid range for day is 1 to 31.\r\n", ch);
              return;
            }
          argument = one_argument(argument, arg);
          if ( *arg != '\0' && is_number(arg) )
            {
              if ( (now_time->tm_mon = atoi(arg)) < 1 || now_time->tm_mon > 12 )
                {
                  send_to_char( "Valid range for month is 1 to 12.\r\n", ch );
                  return;
                }
              now_time->tm_mon--;
              argument = one_argument(argument, arg);
              if ( (now_time->tm_year = atoi(arg)-1900) < 0 ||
                   now_time->tm_year > 199 )
                {
                  send_to_char( "Valid range for year is 1900 to 2099.\r\n", ch );
                  return;
                }
            }
        }
      now_time->tm_sec = 0;
      if ( mktime(now_time) < current_time )
        {
          send_to_char( "You can't set a time previous to today!\r\n", ch );
          return;
        }
      if (set_boot_time->manual == 0)
        set_boot_time->manual = 1;
      new_boot_time = update_time(now_time);
      new_boot_struct = *new_boot_time;
      new_boot_time = &new_boot_struct;
      reboot_check(mktime(new_boot_time));
      get_reboot_string();

      ch_printf(ch, "Boot time set to %s\r\n", reboot_time);
      check = TRUE;
    }
  else if ( !str_cmp(arg, "manual") )
    {
      argument = one_argument(argument, arg1);
      if (arg1[0] == '\0')
        {
          send_to_char("Please enter a value for manual boot on/off\r\n", ch);
          return;
        }

      if ( !is_number(arg1))
        {
          send_to_char("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      if (atoi(arg1) < 0 || atoi(arg1) > 1)
        {
          send_to_char("Value for manual must be 0 (off) or 1 (on)\r\n", ch);
          return;
        }

      set_boot_time->manual = atoi(arg1);
      ch_printf(ch, "Manual bit set to %s\r\n", arg1);
      check = TRUE;
      get_reboot_string();
      return;
    }

  else if (!str_cmp( arg, "default" ))
    {
      set_boot_time->manual = 0;
      /* Reinitialize new_boot_time */
      new_boot_time = localtime(&current_time);
      new_boot_time->tm_mday += 1;
      if (new_boot_time->tm_hour > 12)
        new_boot_time->tm_mday += 1;
      new_boot_time->tm_hour = 6;
      new_boot_time->tm_min = 0;
      new_boot_time->tm_sec = 0;
      new_boot_time = update_time(new_boot_time);

      sysdata.DENY_NEW_PLAYERS = FALSE;

      send_to_char("Reboot time set back to normal.\r\n", ch);
      check = TRUE;
    }

  if (!check)
    {
      send_to_char("Invalid argument for setboot.\r\n", ch);
      return;
    }

  else
    {
      get_reboot_string();
      new_boot_time_t = mktime(new_boot_time);
    }
}
/* Online high level immortal command for displaying what the encryption
 * of a name/password would be, taking in 2 arguments - the name and the
 * password - can still only change the password if you have access to
 * pfiles and the correct password
 */
void do_form_password( CHAR_DATA *ch, char *argument)
{
  char arg[MAX_STRING_LENGTH];

  argument = one_argument(argument, arg);

  ch_printf(ch, "Those two arguments encrypted would result in: %s",
            crypt(arg, argument));
  return;
}

/*
 * Purge a player file.  No more player.  -- Altrag
 */
void do_destro( CHAR_DATA *ch, char *argument )
{
  set_char_color( AT_RED, ch );
  send_to_char("If you want to destroy a character, spell it out!\r\n",ch);
  return;
}

/*
 * This could have other applications too.. move if needed. -- Altrag
 */
void close_area( AREA_DATA *pArea )
{
  extern ROOM_INDEX_DATA *room_index_hash[MAX_KEY_HASH];
  extern OBJ_INDEX_DATA   *obj_index_hash[MAX_KEY_HASH];
  extern MOB_INDEX_DATA   *mob_index_hash[MAX_KEY_HASH];
  CHAR_DATA *ech;
  CHAR_DATA *ech_next;
  OBJ_DATA *eobj;
  OBJ_DATA *eobj_next;
  int icnt;
  ROOM_INDEX_DATA *rid;
  ROOM_INDEX_DATA *rid_next;
  OBJ_INDEX_DATA *oid;
  OBJ_INDEX_DATA *oid_next;
  MOB_INDEX_DATA *mid;
  MOB_INDEX_DATA *mid_next;
  RESET_DATA *ereset;
  RESET_DATA *ereset_next;
  EXTRA_DESCR_DATA *eed;
  EXTRA_DESCR_DATA *eed_next;
  EXIT_DATA *exit;
  EXIT_DATA *exit_next;
  MPROG_ACT_LIST *mpact;
  MPROG_ACT_LIST *mpact_next;
  MPROG_DATA *mprog;
  MPROG_DATA *mprog_next;
  AFFECT_DATA *paf;
  AFFECT_DATA *paf_next;

  for ( ech = first_char; ech; ech = ech_next )
    {
      ech_next = ech->next;

      if ( ech->fighting )
        stop_fighting( ech, TRUE );
      if ( IS_NPC(ech) )
        {
          /* if mob is in area, or part of area. */
          if ( URANGE(pArea->low_m_vnum, ech->pIndexData->vnum,
                      pArea->hi_m_vnum) == ech->pIndexData->vnum ||
               (ech->in_room && ech->in_room->area == pArea) )
            extract_char( ech, TRUE );
          continue;
        }
      if ( ech->in_room && ech->in_room->area == pArea )
        do_recall( ech, "" );
    }
  for ( eobj = first_object; eobj; eobj = eobj_next )
    {
      eobj_next = eobj->next;
      /* if obj is in area, or part of area. */
      if ( URANGE(pArea->low_o_vnum, eobj->pIndexData->vnum,
                  pArea->hi_o_vnum) == eobj->pIndexData->vnum ||
           (eobj->in_room && eobj->in_room->area == pArea) )
        extract_obj( eobj );
    }
  for ( icnt = 0; icnt < MAX_KEY_HASH; icnt++ )
    {
      for ( rid = room_index_hash[icnt]; rid; rid = rid_next )
        {
          rid_next = rid->next;

          for ( exit = rid->first_exit; exit; exit = exit_next )
            {
              exit_next = exit->next;
              if ( rid->area == pArea || exit->to_room->area == pArea )
                {
                  STRFREE( exit->keyword );
                  STRFREE( exit->description );
                  UNLINK( exit, rid->first_exit, rid->last_exit, next, prev );
                  DISPOSE( exit );
                }
            }
          if ( rid->area != pArea )
            continue;
          STRFREE(rid->name);
          STRFREE(rid->description);
          if ( rid->first_person )
            {
              bug( "close_area: room with people #%d", rid->vnum );
              for ( ech = rid->first_person; ech; ech = ech_next )
                {
                  ech_next = ech->next_in_room;
                  if ( ech->fighting )
                    stop_fighting( ech, TRUE );
                  if ( IS_NPC(ech) )
                    extract_char( ech, TRUE );
                  else
                    do_recall( ech, "" );
                }
            }
          if ( rid->first_content )
            {
              bug( "close_area: room with contents #%d", rid->vnum );
              for ( eobj = rid->first_content; eobj; eobj = eobj_next )
                {
                  eobj_next = eobj->next_content;
                  extract_obj( eobj );
                }
            }
          for ( eed = rid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              STRFREE( eed->keyword );
              STRFREE( eed->description );
              DISPOSE( eed );
            }
          for ( mpact = rid->mpact; mpact; mpact = mpact_next )
            {
              mpact_next = mpact->next;
              STRFREE( mpact->buf );
              DISPOSE( mpact );
            }
          for ( mprog = rid->mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              STRFREE( mprog->arglist );
              STRFREE( mprog->comlist );
              DISPOSE( mprog );
            }
          if ( rid == room_index_hash[icnt] )
            room_index_hash[icnt] = rid->next;
          else
            {
              ROOM_INDEX_DATA *trid;

              for ( trid = room_index_hash[icnt]; trid; trid = trid->next )
                if ( trid->next == rid )
                  break;
              if ( !trid )
                bug( "Close_area: rid not in hash list %d", rid->vnum );
              else
                trid->next = rid->next;
            }
          DISPOSE(rid);
        }

      for ( mid = mob_index_hash[icnt]; mid; mid = mid_next )
        {
          mid_next = mid->next;

          if ( mid->vnum < pArea->low_m_vnum || mid->vnum > pArea->hi_m_vnum )
            continue;

          STRFREE( mid->player_name );
          STRFREE( mid->short_descr );
          STRFREE( mid->long_descr  );
          STRFREE( mid->description );
          if ( mid->pShop )
            {
              UNLINK( mid->pShop, first_shop, last_shop, next, prev );
              DISPOSE( mid->pShop );
            }
          if ( mid->rShop )
            {
              UNLINK( mid->rShop, first_repair, last_repair, next, prev );
              DISPOSE( mid->rShop );
            }
          for ( mprog = mid->mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              STRFREE(mprog->arglist);
              STRFREE(mprog->comlist);
              DISPOSE(mprog);
            }
          if ( mid == mob_index_hash[icnt] )
            mob_index_hash[icnt] = mid->next;
          else
            {
              MOB_INDEX_DATA *tmid;

              for ( tmid = mob_index_hash[icnt]; tmid; tmid = tmid->next )
                if ( tmid->next == mid )
                  break;
              if ( !tmid )
                bug( "Close_area: mid not in hash list %s", mid->vnum );
              else
                tmid->next = mid->next;
            }
          DISPOSE(mid);
        }

      for ( oid = obj_index_hash[icnt]; oid; oid = oid_next )
        {
          oid_next = oid->next;

          if ( oid->vnum < pArea->low_o_vnum || oid->vnum > pArea->hi_o_vnum )
            continue;

          STRFREE(oid->name);
          STRFREE(oid->short_descr);
          STRFREE(oid->description);
          STRFREE(oid->action_desc);

          for ( eed = oid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              STRFREE(eed->keyword);
              STRFREE(eed->description);
              DISPOSE(eed);
            }
          for ( paf = oid->first_affect; paf; paf = paf_next )
            {
              paf_next = paf->next;
              DISPOSE(paf);
            }
          for ( mprog = oid->mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              STRFREE(mprog->arglist);
              STRFREE(mprog->comlist);
              DISPOSE(mprog);
            }
          if ( oid == obj_index_hash[icnt] )
            obj_index_hash[icnt] = oid->next;
          else
            {
              OBJ_INDEX_DATA *toid;

              for ( toid = obj_index_hash[icnt]; toid; toid = toid->next )
                if ( toid->next == oid )
                  break;
              if ( !toid )
                bug( "Close_area: oid not in hash list %s", oid->vnum );
              else
                toid->next = oid->next;
            }
          DISPOSE(oid);
        }
    }
  for ( ereset = pArea->first_reset; ereset; ereset = ereset_next )
    {
      ereset_next = ereset->next;
      DISPOSE(ereset);
    }
  DISPOSE(pArea->name);
  DISPOSE(pArea->filename);
  STRFREE(pArea->author);
  UNLINK( pArea, first_build, last_build, next, prev );
  UNLINK( pArea, first_asort, last_asort, next_sort, prev_sort );
  DISPOSE( pArea );
}

void do_destroy( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Destroy what player file?\r\n", ch );
      return;
    }

  for ( victim = first_char; victim; victim = victim->next )
    if ( !IS_NPC(victim) && !str_cmp(victim->name, arg) )
      break;
  if ( !victim )
    {
      DESCRIPTOR_DATA *d;

      /* Make sure they aren't halfway logged in. */
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) && !IS_NPC(victim) &&
             !str_cmp(victim->name, arg) )
          break;
      if ( d )
        close_socket( d, TRUE );
    }
  else
    {
      int x, y;

      quitting_char = victim;
      save_char_obj( victim );
      saving_char = NULL;
      extract_char( victim, TRUE );
      for ( x = 0; x < MAX_WEAR; x++ )
        for ( y = 0; y < MAX_LAYERS; y++ )
          save_equipment[x][y] = NULL;
    }

  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]),
           capitalize( arg ) );
  sprintf( buf2, "%s%c/%s", BACKUP_DIR, tolower(arg[0]),
           capitalize( arg ) );
  if ( !rename( buf, buf2 ) )
    {
      AREA_DATA *pArea;

      set_char_color( AT_RED, ch );
      send_to_char( "Player destroyed.  Pfile saved in backup directory.\r\n", ch );
      sprintf( buf, "%s%s", GOD_DIR, capitalize(arg) );
      if ( !remove( buf ) )
        send_to_char( "Player's immortal data destroyed.\r\n", ch );
      else if ( errno != ENOENT )
        {
          ch_printf( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric.\r\n",
                     errno, strerror( errno ) );
          sprintf( buf2, "%s destroying %s", ch->name, buf );
          perror( buf2 );
        }

      sprintf( buf2, "%s.are", capitalize(arg) );
      for ( pArea = first_build; pArea; pArea = pArea->next )
        if ( !strcmp( pArea->filename, buf2 ) )
          {
            sprintf( buf, "%s%s", BUILD_DIR, buf2 );
            if ( IS_SET( pArea->status, AREA_LOADED ) )
              fold_area( pArea, buf, FALSE );
            close_area( pArea );
            sprintf( buf2, "%s.bak", buf );
            set_char_color( AT_RED, ch ); /* Log message changes colors */
            if ( !rename( buf, buf2 ) )
              send_to_char( "Player's area data destroyed.  Area saved as backup.\r\n", ch );
            else if ( errno != ENOENT )
              {
                ch_printf( ch, "Unknown error #%d - %s (area data).  Report to Thoric.\r\n",
                           errno, strerror( errno ) );
                sprintf( buf2, "%s destroying %s", ch->name, buf );
                perror( buf2 );
              }
          }
    }
  else if ( errno == ENOENT )
    {
      set_char_color( AT_PLAIN, ch );
      send_to_char( "Player does not exist.\r\n", ch );
    }
  else
    {
      set_char_color( AT_WHITE, ch );
      ch_printf( ch, "Unknown error #%d - %s.  Report to Thoric.\r\n",
                 errno, strerror( errno ) );
      sprintf( buf, "%s destroying %s", ch->name, arg );
      perror( buf );
    }
  return;
}
extern ROOM_INDEX_DATA *       room_index_hash         [MAX_KEY_HASH]; /* db.c */


/* Super-AT command:

   FOR ALL <action>
   FOR MORTALS <action>
   FOR GODS <action>
   FOR MOBS <action>
   FOR EVERYWHERE <action>


   Executes action several times, either on ALL players (not including yourself),
   MORTALS (including trusted characters), GODS (characters with level higher than
   L_HERO), MOBS (Not recommended) or every room (not recommended either!)

   If you insert a # in the action, it will be replaced by the name of the target.

   If # is a part of the action, the action will be executed for every target
   in game. If there is no #, the action will be executed for every room containg
   at least one target, but only once per room. # cannot be used with FOR EVERY-
   WHERE. # can be anywhere in the action.

   Example:

   FOR ALL SMILE -> you will only smile once in a room with 2 players.
   FOR ALL TWIDDLE # -> In a room with A and B, you will twiddle A then B.

   Destroying the characters this command acts upon MAY cause it to fail. Try to
   avoid something like FOR MOBS PURGE (although it actually works at my MUD).

   FOR MOBS TRANS 3054 (transfer ALL the mobs to Midgaard temple) does NOT work
   though :)

   The command works by transporting the character to each of the rooms with
   target in them. Private rooms are not violated.

*/

/* Expand the name of a character into a string that identifies THAT
   character within a room. E.g. the second 'guard' -> 2. guard
*/
const char * name_expand (CHAR_DATA *ch)
{
  int count = 1;
  CHAR_DATA *rch;
  char name[MAX_INPUT_LENGTH]; /*  HOPEFULLY no mob has a name longer than THAT */

  static char outbuf[MAX_INPUT_LENGTH];

  if (!IS_NPC(ch))
    return ch->name;

  one_argument (ch->name, name); /* copy the first word into name */

  if (!name[0]) /* weird mob .. no keywords */
    {
      strcpy (outbuf, ""); /* Do not return NULL, just an empty buffer */
      return outbuf;
    }

  /* ->people changed to ->first_person -- TRI */
  for (rch = ch->in_room->first_person; rch && (rch != ch);rch =
         rch->next_in_room)
    if (is_name (name, rch->name))
      count++;


  sprintf (outbuf, "%d.%s", count, name);
  return outbuf;
}


void do_for (CHAR_DATA *ch, char *argument)
{
  char range[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  bool fGods = FALSE, fMortals = FALSE, fMobs = FALSE, fEverywhere = FALSE, found;
  ROOM_INDEX_DATA *room, *old_room;
  CHAR_DATA *p, *p_prev;  /* p_next to p_prev -- TRI */
  int i;

  argument = one_argument (argument, range);

  if (!range[0] || !argument[0]) /* invalid usage? */
    {
      do_help (ch, "for");
      return;
    }

  if (!str_prefix("quit", argument))
    {
      send_to_char ("Are you trying to crash the MUD or something?\r\n",ch);
      return;
    }


  if (!str_cmp (range, "all"))
    {
      fMortals = TRUE;
      fGods = TRUE;
    }
  else if (!str_cmp (range, "gods"))
    fGods = TRUE;
  else if (!str_cmp (range, "mortals"))
    fMortals = TRUE;
  else if (!str_cmp (range, "mobs"))
    fMobs = TRUE;
  else if (!str_cmp (range, "everywhere"))
    fEverywhere = TRUE;
  else
    do_help (ch, "for"); /* show syntax */

  /* do not allow # to make it easier */
  if (fEverywhere && strchr (argument, '#'))
    {
      send_to_char ("Cannot use FOR EVERYWHERE with the # thingie.\r\n",ch);
      return;
    }

  if (strchr (argument, '#')) /* replace # ? */
    {
      /* char_list - last_char, p_next - gch_prev -- TRI */
      for (p = last_char; p ; p = p_prev )
        {
          p_prev = p->prev;  /* TRI */
          /*    p_next = p->next; */ /* In case someone DOES try to AT MOBS SLAY # */
          found = FALSE;

          if (!(p->in_room) || room_is_private(p, p->in_room) || (p == ch))
            continue;

          if (IS_NPC(p) && fMobs)
            found = TRUE;
          else if (!IS_NPC(p) && get_trust(p) >= LEVEL_IMMORTAL && fGods)
            found = TRUE;
          else if (!IS_NPC(p) && get_trust(p) < LEVEL_IMMORTAL && fMortals)
            found = TRUE;

          /* It looks ugly to me.. but it works :) */
          if (found) /* p is 'appropriate' */
            {
              char *pSource = argument; /* head of buffer to be parsed */
              char *pDest = buf; /* parse into this */

              while (*pSource)
                {
                  if (*pSource == '#') /* Replace # with name of target */
                    {
                      const char *namebuf = name_expand (p);

                      if (namebuf) /* in case there is no mob name ?? */
                        while (*namebuf) /* copy name over */
                          *(pDest++) = *(namebuf++);

                      pSource++;
                    }
                  else
                    *(pDest++) = *(pSource++);
                } /* while */
              *pDest = '\0'; /* Terminate */

              /* Execute */
              old_room = ch->in_room;
              char_from_room (ch);
              char_to_room (ch,p->in_room);
              interpret (ch, buf);
              char_from_room (ch);
              char_to_room (ch,old_room);

            } /* if found */
        } /* for every char */
    }
  else /* just for every room with the appropriate people in it */
    {
      for (i = 0; i < MAX_KEY_HASH; i++) /* run through all the buckets */
        for (room = room_index_hash[i] ; room ; room = room->next)
          {
            found = FALSE;

            /* Anyone in here at all? */
            if (fEverywhere) /* Everywhere executes always */
              found = TRUE;
            else if (!room->first_person) /* Skip it if room is empty */
              continue;
            /* ->people changed to first_person -- TRI */

            /* Check if there is anyone here of the requried type */
            /* Stop as soon as a match is found or there are no more ppl in room */
            /* ->people to ->first_person -- TRI */
            for (p = room->first_person; p && !found; p = p->next_in_room)
              {

                if (p == ch) /* do not execute on oneself */
                  continue;

                if (IS_NPC(p) && fMobs)
                  found = TRUE;
                else if (!IS_NPC(p) && ( get_trust(p) >= LEVEL_IMMORTAL) && fGods)
                  found = TRUE;
                else if (!IS_NPC(p) && ( get_trust(p) <= LEVEL_IMMORTAL) && fMortals)
                  found = TRUE;
              } /* for everyone inside the room */

            if (found && !room_is_private(p, room)) /* Any of the required type here AND room not private? */
              {
                /* This may be ineffective. Consider moving character out of old_room
                   once at beginning of command then moving back at the end.
                   This however, is more safe?
                */

                old_room = ch->in_room;
                char_from_room (ch);
                char_to_room (ch, room);
                interpret (ch, argument);
                char_from_room (ch);
                char_to_room (ch, old_room);
              } /* if found */
          } /* for every room in a bucket */
    } /* if strchr */
} /* do_for */

void save_sysdata( SYSTEM_DATA sys );

void do_cset( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  short level;

  set_char_color( AT_IMMORT, ch );

  if (argument[0] == '\0')
    {
      ch_printf(ch, "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
                sysdata.read_all_mail, sysdata.read_mail_free, sysdata.write_mail_free );
      ch_printf(ch, "  Take all mail: %d.\r\n",
                sysdata.take_others_mail);
      ch_printf(ch, "Channels:\r\n  Muse: %d. Think: %d. Log: %d. Build: %d.\r\n",
                sysdata.muse_level, sysdata.think_level, sysdata.log_level,
                sysdata.build_level);
      ch_printf(ch, "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
                sysdata.level_modify_proto, sysdata.level_mset_player );
      ch_printf(ch, "Guilds:\r\n  Overseer: %s.  Advisor: %s.\r\n",
                sysdata.guild_overseer, sysdata.guild_advisor );
      ch_printf(ch, "Other:\r\n  Force on players: %d.  ", sysdata.level_forcepc);
      ch_printf(ch, "Private room override: %d.\r\n", sysdata.level_override_private);
      ch_printf(ch, "  Penalty to regular stun chance: %d.  ", sysdata.stun_regular );
      ch_printf(ch, "Penalty to stun plr vs. plr: %d.\r\n", sysdata.stun_plr_vs_plr );
      ch_printf(ch, "  Percent damage plr vs. plr: %3d.  ", sysdata.dam_plr_vs_plr );
      ch_printf(ch, "Percent damage plr vs. mob: %d.\r\n", sysdata.dam_plr_vs_mob );
      ch_printf(ch, "  Percent damage mob vs. plr: %3d.  ", sysdata.dam_mob_vs_plr );
      ch_printf(ch, "Percent damage mob vs. mob: %d.\r\n", sysdata.dam_mob_vs_mob );
      ch_printf(ch, "  Get object without take flag: %d.  ", sysdata.level_getobjnotake);
      ch_printf(ch, "Autosave frequency (minutes): %d.\r\n", sysdata.save_frequency );
      ch_printf(ch, "  Save flags: %s\r\n", flag_string( sysdata.save_flags, save_flag ) );
      return;
    }

  argument = one_argument( argument, arg );

  if (!str_cmp(arg, "help"))
    {
      do_help(ch, "controls");
      return;
    }

  if (!str_cmp(arg, "save"))
    {
      save_sysdata(sysdata);
      return;
    }

  if (!str_cmp(arg, "saveflag"))
    {
      int x = get_saveflag( argument );

      if ( x == -1 )
        send_to_char( "Not a save flag.\r\n", ch );
      else
        {
          TOGGLE_BIT( sysdata.save_flags, 1 << x );
          send_to_char( "Ok.\r\n", ch );
        }
      return;
    }

  if (!str_prefix( arg, "guild_overseer" ) )
    {
      STRFREE( sysdata.guild_overseer );
      sysdata.guild_overseer = str_dup( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_prefix( arg, "guild_advisor" ) )
    {
      STRFREE( sysdata.guild_advisor );
      sysdata.guild_advisor = str_dup( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }

  level = (short) atoi(argument);

  if (!str_prefix( arg, "savefrequency" ) )
    {
      sysdata.save_frequency = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "stun"))
    {
      sysdata.stun_regular = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "stun_pvp"))
    {
      sysdata.stun_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_pvp"))
    {
      sysdata.dam_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "get_notake"))
    {
      sysdata.level_getobjnotake = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_pvm"))
    {
      sysdata.dam_plr_vs_mob = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_mvp"))
    {
      sysdata.dam_mob_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_mvm"))
    {
      sysdata.dam_mob_vs_mob = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (level < 0 || level > MAX_LEVEL)
    {
      send_to_char("Invalid value for new control.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "read_all"))
    {
      sysdata.read_all_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "read_free"))
    {
      sysdata.read_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "write_free"))
    {
      sysdata.write_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "take_all"))
    {
      sysdata.take_others_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "muse"))
    {
      sysdata.muse_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "think"))
    {
      sysdata.think_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "log"))
    {
      sysdata.log_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "build"))
    {
      sysdata.build_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "proto_modify"))
    {
      sysdata.level_modify_proto = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "override_private"))
    {
      sysdata.level_override_private = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "forcepc"))
    {
      sysdata.level_forcepc = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "mset_player"))
    {
      sysdata.level_mset_player = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  else
    {
      send_to_char("Invalid argument.\r\n", ch);
      return;
    }
}

void get_reboot_string(void)
{
  sprintf(reboot_time, "%s", asctime(new_boot_time));
}


void do_orange( CHAR_DATA *ch, char *argument )
{
  send_to_char( "Function under construction.\r\n", ch );
  return;
}

void do_mrange( CHAR_DATA *ch, char *argument )
{
  send_to_char( "Function under construction.\r\n", ch );
  return;
}

void do_hell( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  short time;
  bool h_d = FALSE;
  struct tm *tms;

  argument = one_argument(argument, arg);
  if ( !*arg )
    {
      send_to_char( "Hell who, and for how long?\r\n", ch );
      return;
    }
  if ( !(victim = get_char_world(ch, arg)) || IS_NPC(victim) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }
  if ( IS_IMMORTAL(victim) )
    {
      send_to_char( "There is no point in helling an immortal.\r\n", ch );
      return;
    }
  if ( victim->pcdata->release_date != 0 )
    {
      ch_printf(ch, "They are already in hell until %24.24s, by %s.\r\n",
                ctime(&victim->pcdata->release_date), victim->pcdata->helled_by);
      return;
    }
  argument = one_argument(argument, arg);
  if ( !*arg || !is_number(arg) )
    {
      send_to_char( "Hell them for how long?\r\n", ch );
      return;
    }
  time = atoi(arg);
  if ( time <= 0 )
    {
      send_to_char( "You cannot hell for zero or negative time.\r\n", ch );
      return;
    }
  argument = one_argument(argument, arg);
  if ( !*arg || !str_prefix(arg, "hours") )
    h_d = TRUE;
  else if ( str_prefix(arg, "days") )
    {
      send_to_char( "Is that value in hours or days?\r\n", ch );
      return;
    }
  else if ( time > 30 )
    {
      send_to_char( "You may not hell a person for more than 30 days at a time.\r\n", ch );
      return;
    }
  tms = localtime(&current_time);
  if ( h_d )
    tms->tm_hour += time;
  else
    tms->tm_mday += time;
  victim->pcdata->release_date = mktime(tms);
  victim->pcdata->helled_by = STRALLOC(ch->name);
  ch_printf(ch, "%s will be released from hell at %24.24s.\r\n", victim->name,
            ctime(&victim->pcdata->release_date));
  act(AT_MAGIC, "$n disappears in a cloud of hellish light.", victim, NULL, ch, TO_NOTVICT);
  char_from_room(victim);
  char_to_room(victim, get_room_index(6));
  act(AT_MAGIC, "$n appears in a could of hellish light.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  ch_printf(victim, "The immortals are not pleased with your actions.\r\n"
            "You shall remain in hell for %d %s%s.\r\n", time,
            (h_d ? "hour" : "day"), (time == 1 ? "" : "s"));
  save_char_obj(victim);        /* used to save ch, fixed by Thoric 09/17/96 */
  return;
}

void do_unhell( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;

  argument = one_argument(argument, arg);
  if ( !*arg )
    {
      send_to_char( "Unhell whom..?\r\n", ch );
      return;
    }
  location = ch->in_room;
  ch->in_room = get_room_index(6);
  victim = get_char_room(ch, arg);
  ch->in_room = location;            /* The case of unhell self, etc. */
  if ( !victim || IS_NPC(victim) || victim->in_room->vnum != 6 )
    {
      send_to_char( "No one like that is in hell.\r\n", ch );
      return;
    }
  location = get_room_index( wherehome(victim) );
  if ( !location )
    location = ch->in_room;
  MOBtrigger = FALSE;
  act( AT_MAGIC, "$n disappears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  char_from_room(victim);
  char_to_room(victim, location);
  send_to_char( "The gods have smiled on you and released you from hell early!\r\n", victim );
  do_look(victim, "auto");
  send_to_char( "They have been released.\r\n", ch );

  if ( victim->pcdata->helled_by )
    {
      if( str_cmp(ch->name, victim->pcdata->helled_by) )
        ch_printf(ch, "(You should probably write a note to %s, explaining the early release.)\r\n",
                  victim->pcdata->helled_by);
      STRFREE(victim->pcdata->helled_by);
      victim->pcdata->helled_by = NULL;
    }

  MOBtrigger = FALSE;
  act( AT_MAGIC, "$n appears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  victim->pcdata->release_date = 0;
  save_char_obj(victim);
  return;
}

/* Vnum search command by Swordbearer */
void do_vsearch( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool found = FALSE;
  OBJ_DATA *obj;
  OBJ_DATA *in_obj;
  int obj_counter = 1;
  int argi;

  one_argument( argument, arg );

  if( arg[0] == '\0' )
    {
      send_to_char( "Syntax:  vsearch <vnum>.\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  argi=atoi(arg);
  if (argi<0 && argi>20000)
    {
      send_to_char( "Vnum out of range.\r\n", ch);
      return;
    }
  for ( obj = first_object; obj != NULL; obj = obj->next )
    {
      if ( !can_see_obj( ch, obj ) || !( argi == obj->pIndexData->vnum ))
        continue;

      found = TRUE;
      for ( in_obj = obj; in_obj->in_obj != NULL;
            in_obj = in_obj->in_obj );

      if ( in_obj->carried_by != NULL )
        pager_printf( ch, "[%2d] Level %d %s carried by %s.\r\n",
                      obj_counter,
                      obj->level, obj_short(obj),
                      PERS( in_obj->carried_by, ch ) );
      else
        pager_printf( ch, "[%2d] [%-5d] %s in %s.\r\n", obj_counter,
                      ( ( in_obj->in_room ) ? in_obj->in_room->vnum : 0 ),
                      obj_short(obj), ( in_obj->in_room == NULL ) ?
                      "somewhere" : in_obj->in_room->name );

      obj_counter++;
    }

  if ( !found )
    send_to_char( "Nothing like that in hell, earth, or heaven.\r\n" , ch );

  return;
}

/*
 * Simple function to let any imm make any player instantly sober.
 * Saw no need for level restrictions on this.
 * Written by Narn, Apr/96
 */
void do_sober( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg1 [MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IS_NPC( victim ) )
    {
      send_to_char( "Not on mobs.\r\n", ch );
      return;
    }

  if ( victim->pcdata )
    victim->pcdata->condition[COND_DRUNK] = 0;
  send_to_char( "Ok.\r\n", ch );
  send_to_char( "You feel sober again.\r\n", victim );
  return;
}


/*
 * Free a social structure                                      -Thoric
 */
void free_social( SOCIALTYPE *social )
{
  if ( social->name )
    DISPOSE( social->name );
  if ( social->char_no_arg )
    DISPOSE( social->char_no_arg );
  if ( social->others_no_arg )
    DISPOSE( social->others_no_arg );
  if ( social->char_found )
    DISPOSE( social->char_found );
  if ( social->others_found )
    DISPOSE( social->others_found );
  if ( social->vict_found )
    DISPOSE( social->vict_found );
  if ( social->char_auto )
    DISPOSE( social->char_auto );
  if ( social->others_auto )
    DISPOSE( social->others_auto );
  DISPOSE( social );
}

/*
 * Remove a social from it's hash index                         -Thoric
 */
void unlink_social( SOCIALTYPE *social )
{
  SOCIALTYPE *tmp, *tmp_next;
  int hash;

  if ( !social )
    {
      bug( "Unlink_social: NULL social", 0 );
      return;
    }

  if ( social->name[0] < 'a' || social->name[0] > 'z' )
    hash = 0;
  else
    hash = (social->name[0] - 'a') + 1;

  if ( social == (tmp=social_index[hash]) )
    {
      social_index[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( social == tmp_next )
        {
          tmp->next = tmp_next->next;
          return;
        }
    }
}

/*
 * Add a social to the social index table                       -Thoric
 * Hashed and insert sorted
 */
void add_social( SOCIALTYPE *social )
{
  int hash, x;
  SOCIALTYPE *tmp, *prev;

  if ( !social )
    {
      bug( "Add_social: NULL social", 0 );
      return;
    }

  if ( !social->name )
    {
      bug( "Add_social: NULL social->name", 0 );
      return;
    }

  if ( !social->char_no_arg )
    {
      bug( "Add_social: NULL social->char_no_arg", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; social->name[x] != '\0'; x++ )
    social->name[x] = LOWER(social->name[x]);

  if ( social->name[0] < 'a' || social->name[0] > 'z' )
    hash = 0;
  else
    hash = (social->name[0] - 'a') + 1;

  if ( (prev = tmp = social_index[hash]) == NULL )
    {
      social->next = social_index[hash];
      social_index[hash] = social;
      return;
    }

  for ( ; tmp; tmp = tmp->next )
    {
      if ( (x=strcmp(social->name, tmp->name)) == 0 )
        {
          bug( "Add_social: trying to add duplicate name to bucket %d", hash );
          free_social( social );
          return;
        }
      else
        if ( x < 0 )
          {
            if ( tmp == social_index[hash] )
              {
                social->next = social_index[hash];
                social_index[hash] = social;
                return;
              }
            prev->next = social;
            social->next = tmp;
            return;
          }
      prev = tmp;
    }

  /* add to end */
  prev->next = social;
  social->next = NULL;
  return;
}

/*
 * Social editor/displayer/save/delete                          -Thoric
 */
void do_sedit( CHAR_DATA *ch, char *argument )
{
  SOCIALTYPE *social;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  set_char_color( AT_SOCIAL, ch );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: sedit <social> [field]\r\n", ch );
      send_to_char( "Syntax: sedit <social> create\r\n", ch );
      if ( get_trust(ch) > LEVEL_GOD )
        send_to_char( "Syntax: sedit <social> delete\r\n", ch );
      if ( get_trust(ch) > LEVEL_LESSER )
        send_to_char( "Syntax: sedit <save>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  cnoarg onoarg cfound ofound vfound cauto oauto\r\n", ch );
      return;
    }

  if ( get_trust(ch) > LEVEL_LESSER && !str_cmp( arg1, "save" ) )
    {
      save_socials();
      send_to_char( "Saved.\r\n", ch );
      return;
    }

  social = find_social( arg1 );

  if ( !str_cmp( arg2, "create" ) )
    {
      if ( social )
        {
          send_to_char( "That social already exists!\r\n", ch );
          return;
        }
      CREATE( social, SOCIALTYPE, 1 );
      social->name = str_dup( arg1 );
      sprintf( arg2, "You %s.", arg1 );
      social->char_no_arg = str_dup( arg2 );
      add_social( social );
      send_to_char( "Social added.\r\n", ch );
      return;
    }

  if ( !social )
    {
      send_to_char( "Social not found.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' || !str_cmp( arg2, "show" ) )
    {
      ch_printf( ch, "Social: %s\r\n\r\nCNoArg: %s\r\n",
                 social->name,  social->char_no_arg );
      ch_printf( ch, "ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
                 social->others_no_arg  ? social->others_no_arg : "(not set)",
                 social->char_found             ? social->char_found    : "(not set)",
                 social->others_found   ? social->others_found  : "(not set)" );
      ch_printf( ch, "VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
                 social->vict_found     ? social->vict_found    : "(not set)",
                 social->char_auto      ? social->char_auto     : "(not set)",
                 social->others_auto    ? social->others_auto   : "(not set)" );
      return;
    }

  if ( get_trust(ch) > LEVEL_GOD && !str_cmp( arg2, "delete" ) )
    {
      unlink_social( social );
      free_social( social );
      send_to_char( "Deleted.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cnoarg" ) )
    {
      if ( argument[0] == '\0' || !str_cmp( argument, "clear" ) )
        {
          send_to_char( "You cannot clear this field.  It must have a message.\r\n", ch );
          return;
        }
      if ( social->char_no_arg )
        DISPOSE( social->char_no_arg );
      social->char_no_arg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "onoarg" ) )
    {
      if ( social->others_no_arg )
        DISPOSE( social->others_no_arg );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_no_arg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cfound" ) )
    {
      if ( social->char_found )
        DISPOSE( social->char_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->char_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "ofound" ) )
    {
      if ( social->others_found )
        DISPOSE( social->others_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "vfound" ) )
    {
      if ( social->vict_found )
        DISPOSE( social->vict_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->vict_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cauto" ) )
    {
      if ( social->char_auto )
        DISPOSE( social->char_auto );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->char_auto = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "oauto" ) )
    {
      if ( social->others_auto )
        DISPOSE( social->others_auto );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_auto = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( get_trust(ch) > LEVEL_GREATER && !str_cmp( arg2, "name" ) )
    {
      bool relocate;

      one_argument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
          send_to_char( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != social->name[0] )
        {
          unlink_social( social );
          relocate = TRUE;
        }
      else
        relocate = FALSE;
      if ( social->name )
        DISPOSE( social->name );
      social->name = str_dup( arg1 );
      if ( relocate )
        add_social( social );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}

/*
 * Free a command structure                                     -Thoric
 */
void free_command( CMDTYPE *command )
{
  if ( command->name )
    DISPOSE( command->name );
  DISPOSE( command );
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void unlink_command( CMDTYPE *command )
{
  CMDTYPE *tmp, *tmp_next;
  int hash;

  if ( !command )
    {
      bug( "Unlink_command NULL command", 0 );
      return;
    }

  hash = command->name[0]%126;

  if ( command == (tmp=command_hash[hash]) )
    {
      command_hash[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( command == tmp_next )
        {
          tmp->next = tmp_next->next;
          return;
        }
    }
}

/*
 * Add a command to the command hash table                      -Thoric
 */
void add_command( CMDTYPE *command )
{
  int hash, x;
  CMDTYPE *tmp, *prev;

  if ( !command )
    {
      bug( "Add_command: NULL command", 0 );
      return;
    }

  if ( !command->name )
    {
      bug( "Add_command: NULL command->name", 0 );
      return;
    }

  if ( !command->do_fun )
    {
      bug( "Add_command: NULL command->do_fun", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; command->name[x] != '\0'; x++ )
    command->name[x] = LOWER(command->name[x]);

  hash = command->name[0] % 126;

  if ( (prev = tmp = command_hash[hash]) == NULL )
    {
      command->next = command_hash[hash];
      command_hash[hash] = command;
      return;
    }

  /* add to the END of the list */
  for ( ; tmp; tmp = tmp->next )
    if ( !tmp->next )
      {
        tmp->next = command;
        command->next = NULL;
      }
  return;
}

/*
 * Command editor/displayer/save/delete                         -Thoric
 */
void do_cedit( CHAR_DATA *ch, char *argument )
{
  CMDTYPE *command;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  set_char_color( AT_IMMORT, ch );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: cedit save\r\n", ch );
      if ( get_trust(ch) > LEVEL_SUB_IMPLEM )
        {
          send_to_char( "Syntax: cedit <command> create [code]\r\n", ch );
          send_to_char( "Syntax: cedit <command> delete\r\n", ch );
          send_to_char( "Syntax: cedit <command> show\r\n", ch );
          send_to_char( "Syntax: cedit <command> [field]\r\n", ch );
          send_to_char( "\r\nField being one of:\r\n", ch );
          send_to_char( "  level position log code\r\n", ch );
        }
      return;
    }

  if ( get_trust(ch) > LEVEL_GREATER && !str_cmp( arg1, "save" ) )
    {
      save_commands();
      send_to_char( "Saved.\r\n", ch );
      return;
    }

  command = find_command( arg1 );

  if ( get_trust(ch) > LEVEL_SUB_IMPLEM && !str_cmp( arg2, "create" ) )
    {
      if ( command )
        {
          send_to_char( "That command already exists!\r\n", ch );
          return;
        }
      CREATE( command, CMDTYPE, 1 );
      command->name = str_dup( arg1 );
      command->level = get_trust(ch);
      if ( *argument )
        one_argument(argument, arg2);
      else
        sprintf( arg2, "do_%s", arg1 );
      command->do_fun = skill_function( arg2 );
      add_command( command );
      send_to_char( "Command added.\r\n", ch );
      if ( command->do_fun == skill_notfound )
        ch_printf( ch, "Code %s not found.  Set to no code.\r\n", arg2 );
      return;
    }

  if ( !command )
    {
      send_to_char( "Command not found.\r\n", ch );
      return;
    }
  else
    if ( command->level > get_trust(ch) )
      {
        send_to_char( "You cannot touch this command.\r\n", ch );
        return;
      }

  if ( arg2[0] == '\0' || !str_cmp( arg2, "show" ) )
    {
      ch_printf( ch, "Command:  %s\r\nLevel:    %d\r\nPosition: %d\r\nLog:      %d\r\nCode:     %s\r\n",
                 command->name, command->level, command->position, command->log,
                 skill_name(command->do_fun) );
      if ( command->userec.num_uses )
        send_timer(&command->userec, ch);
      return;
    }

  if ( get_trust(ch) <= LEVEL_SUB_IMPLEM )
    {
      do_cedit( ch, "" );
      return;
    }

  if ( !str_cmp( arg2, "delete" ) )
    {
      unlink_command( command );
      free_command( command );
      send_to_char( "Deleted.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "code" ) )
    {
      DO_FUN *fun = skill_function( argument );

      if ( fun == skill_notfound )
        {
          send_to_char( "Code not found.\r\n", ch );
          return;
        }
      command->do_fun = fun;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "level" ) )
    {
      int level = atoi( argument );

      if ( level < 0 || level > get_trust(ch) )
        {
          send_to_char( "Level out of range.\r\n", ch );
          return;
        }
      command->level = level;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "log" ) )
    {
      int log = atoi( argument );

      if ( log < 0 || log > LOG_COMM )
        {
          send_to_char( "Log out of range.\r\n", ch );
          return;
        }
      command->log = log;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "position" ) )
    {
      int position = atoi( argument );

      if ( position < 0 || position > POS_DRAG )
        {
          send_to_char( "Position out of range.\r\n", ch );
          return;
        }
      command->position = position;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      bool relocate;

      one_argument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
          send_to_char( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != command->name[0] )
        {
          unlink_command( command );
          relocate = TRUE;
        }
      else
        relocate = FALSE;
      if ( command->name )
        DISPOSE( command->name );
      command->name = str_dup( arg1 );
      if ( relocate )
        add_command( command );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_cedit( ch, "" );
}
void do_badname(CHAR_DATA *ch, char *arguments)
{
  if (arguments[0] == '\0')
    {
      send_to_char("Usage: badname <name>\r\n",ch);
      return;
    }
  switch (add_bad_name(arguments))
    {
    case -1 : send_to_char("Error opening badname file.\r\n",ch); break;
    case  0 : send_to_char("That name is already in the badname file.\r\n",ch); break;
    case  1 : send_to_char("Name successfully added to the badname file.\r\n",ch); break;
    default : send_to_char("If you're reading this, add_bad_name is really messed up.\r\n",ch);break;
    }
  return;
}


void do_dnd( CHAR_DATA *ch, char *argument )
{
  if ( !IS_NPC(ch) && ch->pcdata )
    if ( IS_SET(ch->pcdata->flags, PCFLAG_DND) )
      {
        REMOVE_BIT(ch->pcdata->flags, PCFLAG_DND);
        send_to_char( "Your 'do not disturb' flag is now off.\r\n", ch );
      }
    else
      {
        SET_BIT(ch->pcdata->flags, PCFLAG_DND);
        send_to_char( "Your 'do not disturb' flag is now on.\r\n", ch );
      }
  else
    send_to_char( "huh?\r\n", ch );
}

void do_viewskills( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  int sn;
  int col;

  argument = one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "&zSyntax: skills <player>.\r\n", ch );
      return;
    }
  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char("No such person in the game.\r\n", ch );
      return;
    }

  col = 0;

  if ( !IS_NPC( victim ) )
    {
      set_char_color( AT_MAGIC, ch );
      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        {
          if ( skill_table[sn]->name == NULL )
            break;
          if ( victim->pcdata->learned[sn] == 0 )
            continue;

          sprintf( buf, "%20s %3d%% ", skill_table[sn]->name,
                   victim->pcdata->learned[sn]);
          send_to_char( buf, ch );

          if ( ++col % 3 == 0 )
            send_to_char( "\r\n", ch );
        }
    }
  return;
}
