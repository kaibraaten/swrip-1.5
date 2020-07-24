#include <sstream>
#include <cstring>
#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "skill.hpp"

static void ShowGeneralStats(std::shared_ptr<Object> obj, const std::string arg,
                             std::ostringstream &outbuf);
static void ShowItemTypeReport(std::shared_ptr<Object> obj, std::ostringstream &outbuf);

void do_ostat(std::shared_ptr<Character> ch, std::string arg)
{
    if(arg.empty())
    {
        ch->Echo("Ostat what?\r\n");
        return;
    }

    auto obj = GetObjectAnywhere(ch, arg);
    
    if(obj == nullptr)
    {
        ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
        return;
    }

    std::ostringstream outbuf;

    ShowGeneralStats(obj, arg, outbuf);
    ShowItemTypeReport(obj, outbuf);
    
    ch->Echo(outbuf.str());
}

static void ShowGeneralStats(std::shared_ptr<Object> obj, const std::string arg,
                             std::ostringstream &outbuf)
{
    outbuf << "&cName: &C" << obj->Name << "&d\r\n";
    const auto objExtraDescriptions = obj->ExtraDescriptions();
    const auto protoExtraDescriptions = obj->Prototype->ExtraDescriptions();

    std::string pdesc = GetExtraDescription(arg, objExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(arg, protoExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(obj->Name, objExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(obj->Name, protoExtraDescriptions);

    if(!pdesc.empty())
        outbuf << "&C" << pdesc << "&d";

    outbuf << "&cVnum: &C" << obj->Prototype->Vnum
           << "  &cType: &C" << GetItemTypeName(obj)
           << "  &cCount: &C" << obj->Prototype->Count
           << "  &cGroupcount: &C" << obj->Count
           << "&d\r\n";

    outbuf << "&cSerial#: &C" << obj->Serial
           << "  &cTopIdxSerial#: &C" << obj->Prototype->Serial
           << "  &cTopSerial#: &C" << cur_obj_serial
           << "&d\r\n";

    outbuf << "&cShort description: &C" << obj->ShortDescr << "&d\r\n";
    
    outbuf << "&cLong description: &C" << obj->Description << "&d\r\n";

    if(!obj->ActionDescription.empty())
        outbuf << "&cAction description: &C" << obj->ActionDescription << "&d\r\n";

    outbuf << "&cWear flags: &C" << FlagString(obj->WearFlags, WearFlags) << "&d\r\n";

    outbuf << "&cExtra flags: &C" << FlagString(obj->Flags, ObjectFlags) << "&d\r\n";

    outbuf << "&cNumber: &C" << 1 << "&c/&C" << GetObjectCount(obj)
           << "  &cWeight: &C" << obj->Weight << "&c/&C" <<  GetObjectWeight(obj)
           << "  &cLayers: &C" << obj->Prototype->Layers
           << "&d\r\n";

    outbuf << "&cCost: &C" << obj->Cost
           << "  &cTimer: &C" << obj->Timer
           << "  &cLevel: &C" << obj->Level
           << "&d\r\n";

    outbuf << "&cIn room: &C" << (obj->InRoom == nullptr ? 0 : obj->InRoom->Vnum)
           << "  &cIn object: &C" << (obj->InObject == nullptr ? "(none)" : obj->InObject->ShortDescr)
           << "  &cCarried by: &C" << (obj->CarriedBy == nullptr ? "(none)" : obj->CarriedBy->Name)
           << "  &cWear_loc: &C" << obj->WearLoc
           << "&d\r\n";

    outbuf << "&cIndex Values : &C"
           << obj->Prototype->Value[0] << " "
           << obj->Prototype->Value[1] << " "
           << obj->Prototype->Value[2] << " "
           << obj->Prototype->Value[3] << " "
           << obj->Prototype->Value[4] << " "
           << obj->Prototype->Value[5] << " "
           << "&d\r\n";

    outbuf << "&cObject Values: &C"
           << obj->Value[0] << " "
           << obj->Value[1] << " "
           << obj->Value[2] << " "
           << obj->Value[3] << " "
           << obj->Value[4] << " "
           << obj->Value[5] << " "
           << "&d\r\n";

    if(!obj->Prototype->ExtraDescriptions().empty())
    {
        std::ostringstream buf;
        buf << "&cPrimary description keywords:   '&C";

        for(auto ed : obj->Prototype->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        outbuf << TrimString(buf.str()) << "&c'&d\r\n";
    }

    if(!obj->ExtraDescriptions().empty())
    {
        std::ostringstream buf;
        buf << "&cSecondary description keywords: '&C";

        for(auto ed : obj->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        outbuf << TrimString(buf.str()) << "&c'&d\r\n";
    }

    for(auto paf : obj->Affects())
        outbuf << "&cAffects &C" << GetAffectLocationName(paf->Location)
               << " &cby &C" << paf->Modifier << " &c(extra)&d\r\n";

    for(auto paf : obj->Prototype->Affects())
        outbuf << "&cAffects &C" << GetAffectLocationName(paf->Location)
               << " &cby &C" << paf->Modifier << "&d\r\n";
}

static void ShowFabricStats(std::shared_ptr<Object> obj, std::ostringstream &buf)
{
    const int strength = obj->Value[OVAL_FABRIC_STRENGTH];
    const int head = strength * 2;
    const int body = strength * 3;
    const int legs = strength * 2;
    const int feet = strength * 1;
    const int arms = strength * 1;
    const int about = strength * 2;
    const int waist = strength * 1;
    const int over = strength * 0;
    
    buf << "&cFabric strength: &C" << strength << "&d\r\n";
    buf << "&cResulting AC when used for crafting armor:\r\n"
        << "  &cHead:  &C" << head << "&d\r\n"
        << "  &cBody:  &C" << body << "&d\r\n"
        << "  &cLegs:  &C" << legs << "&d\r\n"
        << "  &cFeet:  &C" << feet << "&d\r\n"
        << "  &cArms:  &C" << arms << "&d\r\n"
        << "  &cAbout: &C" << about << "&d\r\n"
        << "  &cWaist: &C" << waist << "&d\r\n"
        << "  &cOver:  &C" << over << "&d\r\n"
        << "  &cTOTAL: &C" << head + body + legs + feet + arms + about + waist + over << "&d\r\n";

    bool isBest = true;
    
    ForEach(ProtoObjects,
            [&isBest, obj](const auto &tuple)
            {
                auto objToCheck = tuple.second;
                
                if(objToCheck->ItemType == obj->ItemType
                   && objToCheck->Value[OVAL_FABRIC_STRENGTH] >= obj->Value[OVAL_FABRIC_STRENGTH]
                   && objToCheck->Vnum != obj->Prototype->Vnum)
                {
                    isBest = false;
                }
            });

    if(isBest)
    {
        buf << "&cNote: &CThis is the best fabric in the game!&d\r\n";
    }
}

static void ShowWeaponStats(std::shared_ptr<Object> obj, std::ostringstream &buf)
{
    int minDam = obj->Prototype->Value[OVAL_WEAPON_NUM_DAM_DIE];
    int maxDam = obj->Prototype->Value[OVAL_WEAPON_SIZE_DAM_DIE];

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
    
    buf << "&cWeapon type: &C" << Capitalize(GetWeaponTypeName(obj->Prototype->Value[OVAL_WEAPON_TYPE])) << "&d\r\n";
    buf << "&cDamage:      &C" << minDam << " - " << maxDam
        << " (avg " << ((minDam + maxDam) / 2) << ")&d\r\n";
    buf << "&cCharges:     &C" << obj->Prototype->Value[OVAL_WEAPON_MAX_CHARGE] << "&d\r\n";
}

static void ShowBookStats(std::shared_ptr<Object> obj, std::ostringstream &buf)
{
    bool teachesSkills = false;
    
    for(int i = OVAL_BOOK_SKILL1; i <= OVAL_BOOK_SKILL3; ++i)
    {
        if(obj->Prototype->Value[i] >= 0)
        {
            int sn = obj->Prototype->Value[i];
            buf << "&cSkill " << i << ": &C";
            
            if(sn >= 0 && sn < MAX_SKILL && SkillTable[sn] != nullptr)
            {
                const auto &skill = SkillTable[sn];
                buf << skill->Name;
            }
            else
            {
                buf << "&R*** invalid skill number ***";
            }

            buf << "&d\r\n";
            teachesSkills = true;
        }
    }

    if(!teachesSkills)
    {
        buf << "&cThis book doesn't teach any skills.&d\r\n"
            << "&cAssign skill numbers to "
            << "value" << OVAL_BOOK_SKILL1 << ", "
            << "value" << OVAL_BOOK_SKILL1 << ", and "
            << "value" << OVAL_BOOK_SKILL1 << "&d\r\n";
    }
}

static void ShowItemTypeReport(std::shared_ptr<Object> obj, std::ostringstream &outbuf)
{
    std::ostringstream tmp;

    tmp << "\r\n"
        << "&C=================================================&d\r\n"
        << "&cReport for item type &C" << ObjectTypes[obj->ItemType] << "&d\r\n"
        << "&C-------------------------------------------------&d\r\n";
    
    switch(obj->ItemType)
    {
    case ITEM_FABRIC:
        ShowFabricStats(obj, tmp);
        break;

    case ITEM_WEAPON:
        ShowWeaponStats(obj, tmp);
        break;

    case ITEM_BOOK:
    case ITEM_SCROLL:
        ShowBookStats(obj, tmp);
        break;
        
    default:
        tmp.str("");
        break;
    }

    outbuf << tmp.str();
}
