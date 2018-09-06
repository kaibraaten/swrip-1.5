#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_retire( Character *ch, std::string arg )
{
  Character *victim = nullptr;

  if ( arg.empty() )
    {
      ch->Echo("Retire whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo("You failed.\r\n");
      return;
    }

  if ( victim->TopLevel < LEVEL_CREATOR )
    {
      ch->Echo("The minimum level for retirement is savior.\r\n");
      return;
    }

  if ( IsRetiredImmortal( victim ) )
    {
      RemoveBit( victim->PCData->Flags, PCFLAG_RETIRED );
      ch->Echo( "%s returns from retirement.\r\n",
                victim->Name.c_str() );
      victim->Echo( "%s brings you back from retirement.\r\n",
                    ch->Name.c_str() );
    }
  else
    {
      SetBit( victim->PCData->Flags, PCFLAG_RETIRED );
      ch->Echo( "%s is now a retired immortal.\r\n", victim->Name.c_str() );
      victim->Echo( "Courtesy of %s, you are now a retired immortal.\r\n",
                    ch->Name.c_str() );
    }
}
