#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_mfind(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    int nMatch = 0;

    OneArgument(argument, arg);

    if (arg.empty())
    {
        ch->Echo("Mfind whom?\r\n");
        return;
    }

    bool fAll = !StrCmp(arg, "all");
    SetCharacterColor(AT_PLAIN, ch);

    for(const auto &i : ProtoMobs)
    {
        auto pMobIndex = i.second;
        
        if (fAll || NiftyIsName(arg, pMobIndex->Name))
        {
            nMatch++;
            ch->Echo("[%5ld] %s\r\n",
                     pMobIndex->Vnum, Capitalize(pMobIndex->ShortDescr).c_str());
        }
    }
    
    if (nMatch)
        ch->Echo("Number of matches: %d\n", nMatch);
    else
        ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

