#include "mud.h"
#include "arena.h"
#include "character.hpp"

void do_decline(Character *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (ch->Challenged)
    {
      sprintf(buf,"%s has DECLINED %s's challenge! WHAT A WUSS!!!\r\n",ch->Name,ch->Challenged->Name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->Challenged=NULL;
      return;
    }
  else
    {
      SendToCharacter("You have not been challenged!\r\n",ch);
      return;
    }
}
