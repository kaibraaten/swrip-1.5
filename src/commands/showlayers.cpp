#include "mud.hpp"
#include "grub.hpp"
#include "character.hpp"
#include "protoobject.hpp"

/*
 * The "showlayers" command is used to list all layerable eq in the
 * mud so that we can keep track of it. It lists one line for each
 * piece of unique eq. If there are 1,000 shrouds in the game, it
 * doesn't list 1,000 lines for each shroud - just one line for the shroud.
 */

void do_showlayers( Character *ch, std::string arg )
{
  ProtoObject *pObj = nullptr;
  int hash = 0;                                           /* hash counter */
  int cou = 0;                                        /* display counter */
  int display_limit = 0;                                  /* display limit */

  if ( arg.empty() )
    {
      ch->Echo("Syntax:\r\n");
      ch->Echo("showlayers n  -  display maximum of n lines.\r\n");
      return;
    }

  display_limit = std::stoi(arg);
  ch->Echo("      Vnum      Wear Layer   Description \r\n");

  for (hash = 0; hash < MAX_KEY_HASH; hash++) /* loop thru ObjectIndexHash */
    if ( ObjectIndexHash[hash] )
      for (pObj=ObjectIndexHash[hash]; pObj; pObj=pObj->Next)
        if (pObj->Layers > 0)
          {
            if (++cou <= display_limit)
              ch->Echo("%4d&R&w %5d&R&w %9d&R&w %5d&R&w   %s&R&w\r\n",
                       cou, pObj->Vnum, pObj->WearFlags, pObj->Layers,
                       pObj->ShortDescr.c_str());
          }
}
