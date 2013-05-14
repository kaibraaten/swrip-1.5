#include "mud.h"

void do_unfocusalias(CHAR_DATA *ch, char *argument)
{
  if ( IS_NPC(ch) )
    {
      send_to_char("Only players can have alias focuses!\r\n", ch);
      return;
    }

  if ( ch->pcdata->target && ch->pcdata->target[0] == '\0' )
    {
      send_to_char("Your alias focus is not defined at the moment.\r\n", ch);
      return;
    }

  send_to_char("You remove your current alias focus.\r\n", ch);
  ch->pcdata->target = STRALLOC("");
}
