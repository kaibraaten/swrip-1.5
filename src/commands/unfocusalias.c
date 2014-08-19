#include "character.h"
#include "mud.h"

void do_unfocusalias(Character *ch, char *argument)
{
  if ( IsNpc(ch) )
    {
      SendToCharacter("Only players can have alias focuses!\r\n", ch);
      return;
    }

  if ( ch->pcdata->target && ch->pcdata->target[0] == '\0' )
    {
      SendToCharacter("Your alias focus is not defined at the moment.\r\n", ch);
      return;
    }

  SendToCharacter("You remove your current alias focus.\r\n", ch);
  ch->pcdata->target = CopyString("");
}
