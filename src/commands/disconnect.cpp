#include "character.hpp"
#include "mud.hpp"

void do_disconnect( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Disconnect whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->Desc == NULL )
    {
      Act( AT_PLAIN, "$N doesn't have a descriptor.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( GetTrustLevel(ch) <= GetTrustLevel( victim ) )
    {
      SendToCharacter( "They might not like that...\r\n", ch );
      return;
    }

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      if ( d == victim->Desc )
        {
          CloseSocket( d, false );
          SendToCharacter( "Ok.\r\n", ch );
	  return;
        }
    }

  Bug( "Do_disconnect: *** desc not found ***.", 0 );
  SendToCharacter( "Descriptor not found!\r\n", ch );
}
