#include "character.h"
#include "mud.h"

void do_snoop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  Character *victim;

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
  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch )
       ||  (victim->pcdata && victim->pcdata->min_snoop > GetTrustLevel( ch )) )
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
      if ( GetTrustLevel(victim) > LEVEL_GREATER && GetTrustLevel(ch) < LEVEL_IMPLEMENTOR )
      write_to_descriptor( victim->desc->descriptor, "\r\nYou feel like someone is watching your every move...\r\n", 0 );
  */
  victim->desc->snoop_by = ch->desc;
  send_to_char( "Ok.\r\n", ch );
}
