#include <sstream>
#include <cstring>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

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
    outbuf << "&gName: &G" << obj->Name << "&d\r\n";
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
        outbuf << "&G" << pdesc << "&d";

    outbuf << "&gVnum: &G" << obj->Prototype->Vnum
           << "  &gType: &G" << GetItemTypeName(obj)
           << "  &gCount: &G" << obj->Prototype->Count
           << "  &gGroupcount: &G" << obj->Count
           << "&d\r\n";

    outbuf << "&gSerial#: &G" << obj->Serial
           << "  &gTopIdxSerial#: &G" << obj->Prototype->Serial
           << "  &gTopSerial#: &G" << cur_obj_serial
           << "&d\r\n";

    outbuf << "&gShort description: &G" << obj->ShortDescr << "&d\r\n";
    
    outbuf << "&gLong description: &G" << obj->Description << "&d\r\n";

    if(!obj->ActionDescription.empty())
        outbuf << "&gAction description: &G" << obj->ActionDescription << "&d\r\n";

    outbuf << "&gWear flags: &G" << FlagString(obj->WearFlags, WearFlags) << "&d\r\n";

    outbuf << "&gExtra flags: &G" << FlagString(obj->Flags, ObjectFlags) << "&d\r\n";

    outbuf << "&gNumber: &G" << 1 << "&g/&G" << GetObjectCount(obj)
           << "  &gWeight: &G" << obj->Weight << "&g/&G" <<  GetObjectWeight(obj)
           << "  &gLayers: &G" << obj->Prototype->Layers
           << "&d\r\n";

    outbuf << "&gCost: &G" << obj->Cost
           << "  &gTimer: &G" << obj->Timer
           << "  &gLevel: &G" << obj->Level
           << "&d\r\n";

    outbuf << "&gIn room: &G" << (obj->InRoom == nullptr ? 0 : obj->InRoom->Vnum)
           << "  &gIn object: &G" << (obj->InObject == nullptr ? "(none)" : obj->InObject->ShortDescr)
           << "  &gCarried by: &G" << (obj->CarriedBy == nullptr ? "(none)" : obj->CarriedBy->Name)
           << "  &gWear_loc: &G" << obj->WearLoc
           << "&d\r\n";

    outbuf << "&gIndex Values : &G"
           << obj->Prototype->Value[0] << " "
           << obj->Prototype->Value[1] << " "
           << obj->Prototype->Value[2] << " "
           << obj->Prototype->Value[3] << " "
           << obj->Prototype->Value[4] << " "
           << obj->Prototype->Value[5] << " "
           << "&d\r\n";

    outbuf << "&gObject Values: &G"
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
        buf << "&gPrimary description keywords:   '&G";

        for(auto ed : obj->Prototype->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        outbuf << TrimString(buf.str()) << "&g'&d\r\n";
    }

    if(!obj->ExtraDescriptions().empty())
    {
        std::ostringstream buf;
        buf << "&gSecondary description keywords: '&G";

        for(auto ed : obj->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        outbuf << TrimString(buf.str()) << "&g'&d\r\n";
    }

    for(auto paf : obj->Affects())
        outbuf << "&gAffects &G" << GetAffectLocationName(paf->Location)
               << " &gby &G" << paf->Modifier << " &g(extra)&d\r\n";

    for(auto paf : obj->Prototype->Affects())
        outbuf << "&gAffects &G" << GetAffectLocationName(paf->Location)
               << " &gby &G" << paf->Modifier << "&d\r\n";
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
    
    buf << "&gFabric strength: &G" << strength << "&d\r\n";
    buf << "&gResulting AC when used for crafting armor:\r\n"
        << "  &gHead:  &G" << head << "&d\r\n"
        << "  &gBody:  &G" << body << "&d\r\n"
        << "  &gLegs:  &G" << legs << "&d\r\n"
        << "  &gFeet:  &G" << feet << "&d\r\n"
        << "  &gArms:  &G" << arms << "&d\r\n"
        << "  &gAbout: &G" << about << "&d\r\n"
        << "  &gWaist: &G" << waist << "&d\r\n"
        << "  &gOver:  &G" << over << "&d\r\n"
        << "  &gTOTAL: &G" << head + body + legs + feet + arms + about + waist + over << "&d\r\n";

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
        buf << "&gNote: &GThis is the best fabric in the game!&d\r\n";
    }
}

static void ShowItemTypeReport(std::shared_ptr<Object> obj, std::ostringstream &outbuf)
{
    std::ostringstream tmp;

    tmp << "\r\n"
        << "&g=================================================&d\r\n"
        << "&gReport for item type &G" << ObjectTypes[obj->ItemType] << "&d\r\n"
        << "&g-------------------------------------------------&d\r\n";
    
    switch(obj->ItemType)
    {
    case ITEM_FABRIC:
        ShowFabricStats(obj, tmp);
        break;
        
    default:
        tmp.str("");
        break;
    }

    outbuf << tmp.str();
}
