#include "character.hpp"
#include "mud.hpp"

void do_deny( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Deny whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "Not on NPC's.\r\n" );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo( "You failed.\r\n" );
      return;
    }

  SetBit(victim->Flags, PLR_DENY);
  victim->Echo( "You are denied access!\r\n" );
  ch->Echo( "OK.\r\n" );
  do_quit( victim, "" );
}

