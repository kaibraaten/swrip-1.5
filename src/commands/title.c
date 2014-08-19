#include <string.h>
#include "mud.h"
#include "character.h"

void do_title( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
      SendToCharacter( "You try but the Force resists you.\r\n", ch );
      return;
    }


  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Change your title to what?\r\n", ch );
      return;
    }

  if ((GetTrustLevel(ch) <= LEVEL_IMMORTAL) && (!NiftyIsName(ch->name, argument)))
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
