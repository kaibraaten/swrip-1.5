#include "character.hpp"
#include "mud.hpp"

void do_disconnect( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

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

  CloseDescriptor( victim->Desc, false );
  SendToCharacter( "Ok.\r\n", ch );
}
