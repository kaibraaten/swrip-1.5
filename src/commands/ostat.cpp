#include <sstream>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_ostat(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> obj;
    std::string pdesc;

    if(arg.empty())
    {
        ch->Echo("Ostat what?\r\n");
        return;
    }

    if((obj = GetObjectAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
        return;
    }

    ch->Echo("Name: %s.\r\n", obj->Name.c_str());
    const auto objExtraDescriptions(obj->ExtraDescriptions());
    const auto protoExtraDescriptions(obj->Prototype->ExtraDescriptions());

    pdesc = GetExtraDescription(arg, objExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(arg, protoExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(obj->Name, objExtraDescriptions);

    if(pdesc.empty())
        pdesc = GetExtraDescription(obj->Name, protoExtraDescriptions);

    if(!pdesc.empty())
        ch->Echo(pdesc);

    ch->Echo("Vnum: %ld.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->Prototype->Vnum, GetItemTypeName(obj), obj->Prototype->Count,
             obj->Count);

    ch->Echo("Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->Serial, obj->Prototype->Serial, cur_obj_serial);

    ch->Echo("Short description: %s.\r\nLong description: %s\r\n",
             obj->ShortDescr.c_str(), obj->Description.c_str());

    if(!obj->ActionDescription.empty())
        ch->Echo("Action description: %s.\r\n", obj->ActionDescription.c_str());

    ch->Echo("Wear flags : %s\r\n", FlagString(obj->WearFlags, WearFlags).c_str());
    ch->Echo("Extra flags: %s\r\n", FlagString(obj->Flags, ObjectFlags).c_str());

    ch->Echo("Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1, GetObjectCount(obj),
             obj->Weight, GetObjectWeight(obj), obj->Prototype->Layers);

    ch->Echo("Cost: %d.  Timer: %d.  Level: %d.\r\n",
             obj->Cost, obj->Timer, obj->Level);

    ch->Echo("In room: %ld.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
             obj->InRoom == NULL ? 0 : obj->InRoom->Vnum,
             obj->InObject == NULL ? "(none)" : obj->InObject->ShortDescr.c_str(),
             obj->CarriedBy == NULL ? "(none)" : obj->CarriedBy->Name.c_str(),
             obj->WearLoc);

    ch->Echo("Index Values : %d %d %d %d %d %d.\r\n",
             obj->Prototype->Value[0], obj->Prototype->Value[1],
             obj->Prototype->Value[2], obj->Prototype->Value[3],
             obj->Prototype->Value[4], obj->Prototype->Value[5]);
    ch->Echo("Object Values: %d %d %d %d %d %d.\r\n",
             obj->Value[0], obj->Value[1], obj->Value[2], obj->Value[3], obj->Value[4], obj->Value[5]);

    if(!obj->Prototype->ExtraDescriptions().empty())
    {
        std::ostringstream buf;
        ch->Echo("Primary description keywords:   '");

        for(auto ed : obj->Prototype->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        std::string output = TrimString(buf.str());
        ch->Echo("%s'.\r\n", output.c_str());
    }

    if(!obj->ExtraDescriptions().empty())
    {
        std::ostringstream buf;

        ch->Echo("Secondary description keywords: '");

        for(auto ed : obj->ExtraDescriptions())
        {
            buf << ed->Keyword << " ";
        }

        std::string output = TrimString(buf.str());
        ch->Echo("%s'.\r\n", output.c_str());
    }

    for(auto paf : obj->Affects())
        ch->Echo("Affects %s by %d. (extra)\r\n",
                 GetAffectLocationName(paf->Location), paf->Modifier);

    for(auto paf : obj->Prototype->Affects())
        ch->Echo("Affects %s by %d.\r\n",
                 GetAffectLocationName(paf->Location), paf->Modifier);
}

