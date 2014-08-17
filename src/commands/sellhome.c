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
      send_to_char("&RYou don't own a home.\r\n",ch);
      return;
    }

  if ( (room = ch->in_room) != ch->plr_home )
    {
      send_to_char("&RYou need to be inside your home to sell it.\r\n",ch);
      return;
    }

  if ( IsBitSet(ch->act,PLR_HOME_RESIDENT) )
    {
      send_to_char("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  DISPOSE(room->name);
  room->name = CopyString("An Empty Apartment");
  ch->gold += sellHomeCreditReturn;
  RemoveBit(room->room_flags,ROOM_PLR_HOME);
  SetBit(room->room_flags,ROOM_EMPTY_HOME);
  fold_area(room->area,room->area->filename,false);
  ch->plr_home = NULL;
  do_save(ch,"");
  ch_printf(ch,"You sell your home. You receive %d credits.\r\n",sellHomeCreditReturn);
}
