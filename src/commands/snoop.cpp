#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "descriptor.hpp"

void do_snoop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Snoop whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( !victim->Desc )
    {
      ch->Echo("No descriptor to snoop.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("Cancelling all snoops.\r\n");

      for(Descriptor *d : Descriptors->Entities())
        {
          if ( d->SnoopBy == ch->Desc )
            {
              d->SnoopBy = NULL;
            }
        }
      
      return;
    }

  if ( victim->Desc->SnoopBy )
    {
      ch->Echo("Busy already.\r\n");
      return;
    }

  /*
   * Minimum snoop level... a secret mset value
   * makes the snooper think that the victim is already being snooped
   */
  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch )
       ||  (victim->PCData && victim->PCData->MinSnoop > GetTrustLevel( ch )) )
    {
      ch->Echo("Busy already.\r\n");
      return;
    }

  if ( ch->Desc )
    {
      for ( const Descriptor *d = ch->Desc->SnoopBy; d; d = d->SnoopBy )
        {
          if ( d->Character == victim || d->Original == victim )
            {
              ch->Echo("No snoop loops.\r\n");
              return;
            }
        }
    }

  /*  Snoop notification for higher imms, if desired, uncomment this
      if ( GetTrustLevel(victim) > LEVEL_GREATER && GetTrustLevel(ch) < LEVEL_IMPLEMENTOR )
      WriteToDescriptor( victim->Desc->descriptor, "\r\nYou feel like someone is watching your every move...\r\n", 0 );
  */
  victim->Desc->SnoopBy = ch->Desc;
  ch->Echo("Ok.\r\n");
}

