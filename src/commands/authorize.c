#include "character.h"
#include "mud.h"

static Character *get_waiting_desc( const Character *ch, const char *name );

void do_authorize( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim;
  Descriptor *d;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage:  authorize <player> <yes|name|no/deny>\r\n", ch );
      send_to_char( "Pending authorizations:\r\n", ch );
      send_to_char( " Chosen Character Name\r\n", ch );
      send_to_char( "---------------------------------------------\r\n", ch );
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) != NULL && IsWaitingForAuth(victim) )
          ch_printf( ch, " %s@%s new %s...\r\n",
                     victim->name,
                     victim->desc->remote.hostname,
                     race_table[victim->race].race_name );
      return;
    }

  victim = get_waiting_desc( ch, arg1 );
  if ( victim == NULL )
    return;

  if ( arg2[0]=='\0' || !StrCmp( arg2,"accept" ) || !StrCmp( arg2,"yes" ))
    {
      victim->pcdata->auth_state = 3;
      RemoveBit(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->pcdata->authed_by )
        FreeMemory( victim->pcdata->authed_by );
      victim->pcdata->authed_by = CopyString( ch->name );
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
  else if ( !StrCmp( arg2, "no" ) || !StrCmp( arg2, "deny" ) )
    {
      send_to_char( "You have been denied access.\r\n", victim);
      sprintf( buf, "%s denied authorization to %s", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
      ch_printf( ch, "You have denied %s.\r\n", victim->name);
      do_quit(victim, "");
    }

  else if ( !StrCmp( arg2, "name" ) || !StrCmp(arg2, "n" ) )
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

/*
 * Check if the name prefix uniquely identifies a char descriptor
 */
static Character *get_waiting_desc( const Character *ch, const char *name )
{
  Descriptor *d;
  Character       *ret_char;
  static unsigned int number_of_hits;

  number_of_hits = 0;

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d->character && (!StringPrefix( name, d->character->name )) &&
           IsWaitingForAuth(d->character) )
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
    {
      return ret_char;
    }
  else
    {
      send_to_char( "No one like that waiting for authorization.\r\n", ch );
      return NULL;
    }
}
