#include "character.h"
#include "mud.h"

void do_snoop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Snoop whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( !victim->Desc )
    {
      SendToCharacter( "No descriptor to snoop.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Cancelling all snoops.\r\n", ch );
      for ( d = first_descriptor; d; d = d->next )
        if ( d->snoop_by == ch->Desc )
	  d->snoop_by = NULL;
      return;
    }

  if ( victim->Desc->snoop_by )
    {
      SendToCharacter( "Busy already.\r\n", ch );
      return;
    }

  /*
   * Minimum snoop level... a secret mset value
   * makes the snooper think that the victim is already being snooped
   */
  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch )
       ||  (victim->PCData && victim->PCData->min_snoop > GetTrustLevel( ch )) )
    {
      SendToCharacter( "Busy already.\r\n", ch );
      return;
    }

  if ( ch->Desc )
    {
      for ( d = ch->Desc->snoop_by; d; d = d->snoop_by )
        if ( d->character == victim || d->original == victim )
          {
            SendToCharacter( "No snoop loops.\r\n", ch );
            return;
          }
    }

  /*  Snoop notification for higher imms, if desired, uncomment this
      if ( GetTrustLevel(victim) > LEVEL_GREATER && GetTrustLevel(ch) < LEVEL_IMPLEMENTOR )
      WriteToDescriptor( victim->Desc->descriptor, "\r\nYou feel like someone is watching your every move...\r\n", 0 );
  */
  victim->Desc->snoop_by = ch->Desc;
  SendToCharacter( "Ok.\r\n", ch );
}
