#include <string.h>
#include "mud.h"
#include "character.hpp"

void do_title( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->PCData->Flags, PCFLAG_NOTITLE ))
    {
      SendToCharacter( "You try but the Force resists you.\r\n", ch );
      return;
    }


  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Change your title to what?\r\n", ch );
      return;
    }

  if ((GetTrustLevel(ch) <= LEVEL_IMMORTAL) && (!NiftyIsName(ch->Name, argument)))
    {
      SendToCharacter("You must include your name somewhere in your title!", ch);
      return;
    }

  if (strlen(argument) > 40)
    {
      SendToCharacter("40 characters is maximum allowed for titles now.\r\n", ch);
      return;
    }

  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  SendToCharacter( "Ok.\r\n", ch );
}
