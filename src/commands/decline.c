#include "mud.h"
#include "arena.h"
#include "character.h"

void do_decline(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (ch->challenged)
    {
      sprintf(buf,"%s has DECLINED %s's challenge! WHAT A WUSS!!!\r\n",ch->name,ch->challenged->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->challenged=NULL;
      return;
    }
  else
    {
      send_to_char("You have not been challenged!\r\n",ch);
      return;
    }
}
