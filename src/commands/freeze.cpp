#include "character.hpp"
#include "mud.hpp"

void do_freeze( Character *ch, std::string argument )
{
  std::string arg;
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( arg.empty() )
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

