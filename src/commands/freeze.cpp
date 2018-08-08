#include "character.hpp"
#include "mud.hpp"

void do_freeze( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Freeze whom?\r\n" );
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

  if ( IsBitSet(victim->Flags, PLR_FREEZE) )
    {
      RemoveBit(victim->Flags, PLR_FREEZE);
      victim->Echo( "You can play again.\r\n" );
      ch->Echo( "FREEZE removed.\r\n" );
    }
  else
    {
      SetBit(victim->Flags, PLR_FREEZE);
      victim->Echo( "You can't do ANYthing!\r\n" );
      ch->Echo( "FREEZE set.\r\n" );
    }

  SaveCharacter( victim );
}

