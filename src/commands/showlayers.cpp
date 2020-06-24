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

void do_showlayers(std::shared_ptr<Character> ch, std::string arg)
{
    int cou = 0;                                        /* display counter */

    if (arg.empty())
    {
        ch->Echo("Syntax:\r\n");
        ch->Echo("showlayers n  -  display maximum of n lines.\r\n");
        return;
    }

    int displayLimit = ToLong(arg);
    ch->Echo("      Vnum      Wear Layer   Description \r\n");

    for(const auto &i : ProtoObjects)
    {
        const auto &pObj = i.second;
        
        if (pObj->Layers > 0)
        {
            if (++cou <= displayLimit)
                ch->Echo("%4d&R&w %5ld&R&w %9ld&R&w %5d&R&w   %s&R&w\r\n",
                         cou, pObj->Vnum, pObj->WearFlags.to_ulong(), pObj->Layers,
                         pObj->ShortDescr.c_str());
        }
    }
}
