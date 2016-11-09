#include "character.hpp"
#include "mud.h"
#include "area.h"

void do_sellhome (Character *ch, char *argument)
{
  /* Added by Ulysses, Dec '99/Jan '00 */

  /* changed it so you can change the variable faster and easier. Darrik Vequir */

  int sellHomeCreditReturn = 50000;

  Room *room;

  if ( ch->PlayerHome == NULL )
    {
      SendToCharacter("&RYou don't own a home.\r\n",ch);
      return;
    }

  if ( (room = ch->InRoom) != ch->PlayerHome )
    {
      SendToCharacter("&RYou need to be inside your home to sell it.\r\n",ch);
      return;
    }

  if ( IsBitSet(ch->Flags,PLR_HOME_RESIDENT) )
    {
      SendToCharacter("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  FreeMemory(room->Name);
  room->Name = CopyString("An Empty Apartment");
  ch->Gold += sellHomeCreditReturn;
  RemoveBit(room->Flags,ROOM_PLR_HOME);
  SetBit(room->Flags,ROOM_EMPTY_HOME);
  FoldArea(room->Area,room->Area->Filename,false);
  ch->PlayerHome = NULL;
  do_save(ch,"");
  Echo(ch,"You sell your home. You receive %d credits.\r\n",sellHomeCreditReturn);
}
