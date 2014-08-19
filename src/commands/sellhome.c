#include "character.h"
#include "mud.h"

void do_sellhome (Character *ch, char *argument)
{
  /* Added by Ulysses, Dec '99/Jan '00 */

  /* changed it so you can change the variable faster and easier. Darrik Vequir */

  int sellHomeCreditReturn = 50000;

  Room *room;

  if ( ch->plr_home == NULL )
    {
      SendToCharacter("&RYou don't own a home.\r\n",ch);
      return;
    }

  if ( (room = ch->in_room) != ch->plr_home )
    {
      SendToCharacter("&RYou need to be inside your home to sell it.\r\n",ch);
      return;
    }

  if ( IsBitSet(ch->act,PLR_HOME_RESIDENT) )
    {
      SendToCharacter("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  FreeMemory(room->name);
  room->name = CopyString("An Empty Apartment");
  ch->gold += sellHomeCreditReturn;
  RemoveBit(room->room_flags,ROOM_PLR_HOME);
  SetBit(room->room_flags,ROOM_EMPTY_HOME);
  FoldArea(room->area,room->area->filename,false);
  ch->plr_home = NULL;
  do_save(ch,"");
  ChPrintf(ch,"You sell your home. You receive %d credits.\r\n",sellHomeCreditReturn);
}
