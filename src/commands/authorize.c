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

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Usage:  authorize <player> <yes|name|no/deny>\r\n", ch );
      SendToCharacter( "Pending authorizations:\r\n", ch );
      SendToCharacter( " Chosen Character Name\r\n", ch );
      SendToCharacter( "---------------------------------------------\r\n", ch );
      for ( d = first_descriptor; d; d = d->next )
        if ( (victim = d->character) != NULL && IsWaitingForAuth(victim) )
          Echo( ch, " %s@%s new %s...\r\n",
                     victim->Name,
                     victim->Desc->remote.hostname,
                     RaceTable[victim->Race].race_name );
      return;
    }

  victim = get_waiting_desc( ch, arg1 );
  if ( victim == NULL )
    return;

  if ( IsNullOrEmpty( arg2 ) || !StrCmp( arg2,"accept" ) || !StrCmp( arg2,"yes" ))
    {
      victim->PCData->auth_state = 3;
      RemoveBit(victim->PCData->Flags, PCFLAG_UNAUTHED);
      if ( victim->PCData->authed_by )
        FreeMemory( victim->PCData->authed_by );
      victim->PCData->authed_by = CopyString( ch->Name );
      sprintf( buf, "%s authorized %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      Echo( ch, "You have authorized %s.\r\n", victim->Name);

      /* Below sends a message to player when name is accepted - Brittany   */

      Echo( victim,                                            /* B */
                 "The MUD Administrators have accepted the name %s.\r\n"       /* B */
                 "You are now fully authorized to play Rise in Power.\r\n",victim->Name);                               /* B */
      return;
    }
  else if ( !StrCmp( arg2, "no" ) || !StrCmp( arg2, "deny" ) )
    {
      SendToCharacter( "You have been denied access.\r\n", victim);
      sprintf( buf, "%s denied authorization to %s", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      Echo( ch, "You have denied %s.\r\n", victim->Name);
      do_quit(victim, "");
    }

  else if ( !StrCmp( arg2, "name" ) || !StrCmp(arg2, "n" ) )
    {
      sprintf( buf, "%s has denied %s's name", ch->Name,
               victim->Name );
      ToChannel( buf, CHANNEL_MONITOR, "Monitor", ch->TopLevel );
      Echo (victim,
                 "The MUD Administrators have found the name %s "
                 "to be unacceptable.\r\n"
                 "Use 'name' to change it to something more apropriate.\r\n", victim->Name);
      Echo( ch, "You requested %s change names.\r\n", victim->Name);
      victim->PCData->auth_state = 2;
      return;
    }

  else
    {
      SendToCharacter("Invalid argument.\r\n", ch);
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
      if ( d->character && (!StringPrefix( name, d->character->Name )) &&
           IsWaitingForAuth(d->character) )
        {
          if ( ++number_of_hits > 1 )
            {
              Echo( ch, "%s does not uniquely identify a char.\r\n", name );
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
      SendToCharacter( "No one like that waiting for authorization.\r\n", ch );
      return NULL;
    }
}
