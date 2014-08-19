#include "character.h"
#include "mud.h"

void do_disconnect( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  Character *victim;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Disconnect whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim->desc == NULL )
    {
      act( AT_PLAIN, "$N doesn't have a descriptor.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( GetTrustLevel(ch) <= GetTrustLevel( victim ) )
    {
      SendToCharacter( "They might not like that...\r\n", ch );
      return;
    }

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d == victim->desc )
        {
          CloseSocket( d, false );
          SendToCharacter( "Ok.\r\n", ch );
	  return;
        }
    }

  bug( "Do_disconnect: *** desc not found ***.", 0 );
  SendToCharacter( "Descriptor not found!\r\n", ch );
}
