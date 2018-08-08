#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_title( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->PCData->Flags, PCFLAG_NOTITLE ))
    {
      ch->Echo("You try but the Force resists you.\r\n");
      return;
    }


  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Change your title to what?\r\n");
      return;
    }

  if ((GetTrustLevel(ch) <= LEVEL_IMMORTAL) && (!NiftyIsName(ch->Name, argument)))
    {
      ch->Echo("You must include your name somewhere in your title!");
      return;
    }

  if (strlen(argument) > 40)
    {
      ch->Echo("40 characters is maximum allowed for titles now.\r\n");
      return;
    }

  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  ch->Echo("Ok.\r\n");
}

