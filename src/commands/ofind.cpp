#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "protoobject.hpp"

static void ShowItemTypeInfo(std::shared_ptr<Character> ch, std::shared_ptr<ProtoObject> obj);

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

    for(const auto & [_, pObjIndex] : ProtoObjects)
    {
        if (fAll || NiftyIsName(arg, pObjIndex->Name))
        {
            nMatch++;
            ch->Echo("[%5ld] %-40s&d",
                     pObjIndex->Vnum, Capitalize(pObjIndex->ShortDescr).c_str());
            ShowItemTypeInfo(ch, pObjIndex);

            ch->Echo("\r\n");
        }
    }


    if (nMatch)
        ch->Echo("Number of matches: %d\n", nMatch);
    else
        ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
}

static std::string DmgString(std::shared_ptr<ProtoObject> obj)
{
    int minDam = obj->Value[OVAL_WEAPON_NUM_DAM_DIE];
    int maxDam = obj->Value[OVAL_WEAPON_SIZE_DAM_DIE];

    if (minDam > 0 && maxDam > 0)
    {
        maxDam *= minDam;
    }
    else
    {
        minDam = NumberFuzzy(NumberFuzzy(101 / 20));
        maxDam = NumberFuzzy(NumberFuzzy(110 / 10));
    }

    if(minDam > maxDam)
    {
        minDam = maxDam / 3;
    }

    std::ostringstream buf;
    buf << minDam << " - " << maxDam
        << " [avg " << ((minDam + maxDam) / 2) << "]";
    return buf.str();
}

static void ShowItemTypeInfo(std::shared_ptr<Character> ch, std::shared_ptr<ProtoObject> obj)
{
    std::string output = " (";

    switch(obj->ItemType)
    {
    case ITEM_FABRIC:
        output += "strength " + std::to_string(obj->Value[OVAL_FABRIC_STRENGTH]);
        break;

    case ITEM_WEAPON:
        output += "dmg " + DmgString(obj);
        break;
        
    default:
        output.erase();
        break;
    }

    if(!output.empty())
    {
        output += ")";
        ch->Echo(output);
    }
}
