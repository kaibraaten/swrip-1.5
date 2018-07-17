#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_unfocusalias(Character *ch, char *argument)
{
  if ( IsNpc(ch) )
    {
      SendToCharacter("Only players can have alias focuses!\r\n", ch);
      return;
    }

  if ( IsNullOrEmpty( ch->PCData->Target ) )
    {
      SendToCharacter("Your alias focus is not defined at the moment.\r\n", ch);
      return;
    }

  SendToCharacter("You remove your current alias focus.\r\n", ch);
  ch->PCData->Target = CopyString("");
}
