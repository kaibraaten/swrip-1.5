#include "mud.hpp"
#include "character.hpp"
#include "protoobject.hpp"

void do_ofind(std::shared_ptr<Character> ch, std::string arg)
{
    int nMatch = 0;
    bool fAll = false;

    if (arg.empty())
    {
        ch->Echo("Ofind what?\r\n");
        return;
    }

    SetCharacterColor(AT_PLAIN, ch);
    fAll = !StrCmp(arg, "all");

    for(const auto &i : ProtoObjects)
    {
        auto pObjIndex = i.second;

        if (fAll || NiftyIsName(arg, pObjIndex->Name))
        {
            nMatch++;
            ch->Echo("[%5ld] %s\r\n",
                     pObjIndex->Vnum, Capitalize(pObjIndex->ShortDescr).c_str());
        }
    }


    if (nMatch)
        ch->Echo("Number of matches: %d\n", nMatch);
    else
        ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}
