#include "character.hpp"
#include "mud.hpp"

void do_disconnect( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Disconnect whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( victim->Desc == NULL )
    {
      Act( AT_PLAIN, "$N doesn't have a descriptor.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( GetTrustLevel(ch) <= GetTrustLevel( victim ) )
    {
      ch->Echo( "They might not like that...\r\n" );
      return;
    }

  CloseDescriptor( victim->Desc, false );
  ch->Echo( "Ok.\r\n" );
}

