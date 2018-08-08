#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_notitle( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Notitle whom?\r\n");
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

  if ( IsBitSet(victim->PCData->Flags, PCFLAG_NOTITLE) )
    {
      RemoveBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      victim->Echo("You can set your own title again.\r\n");
      ch->Echo("NOTITLE removed.\r\n");
    }
  else
    {
      SetBit(victim->PCData->Flags, PCFLAG_NOTITLE);
      sprintf( buf, "%s", victim->Name );
      SetCharacterTitle( victim, buf );
      victim->Echo("You can't set your own title!\r\n");
      ch->Echo("NOTITLE set.\r\n");
    }
}

