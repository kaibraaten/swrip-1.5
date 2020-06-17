#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "act.hpp"

static vnum_t GetNewObjectVnum(std::shared_ptr<Area> area, const std::string &arg)
{
    vnum_t vnum = INVALID_VNUM;

    if(IsNumber(arg))
    {
        vnum = ToLong(arg);
    }
    else if(!StrCmp(arg, "auto"))
    {
        for(vnum_t iter = area->VnumRanges.Object.First;
            iter <= area->VnumRanges.Object.Last;
            ++iter)
        {
            if(GetProtoObject(iter) == nullptr)
            {
                vnum = iter;
                break;
            }
        }
    }
    else
    {
        vnum = INVALID_VNUM;
    }

    return vnum;
}

void do_ocreate(Character *ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    std::shared_ptr<Object> obj;
    vnum_t vnum = INVALID_VNUM;
    vnum_t cvnum = INVALID_VNUM;

    if(IsNpc(ch))
    {
        ch->Echo("Mobiles cannot create.\r\n");
        return;
    }

    if(ch->PCData->Build.Area == nullptr)
    {
        ch->Echo("You must AASSIGN an area first.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    vnum = GetNewObjectVnum(ch->PCData->Build.Area, arg);

    if(vnum == INVALID_VNUM || argument.empty())
    {
        ch->Echo("Usage: ocreate <vnum> [copy vnum] <item name>\r\n");
        ch->Echo("\r\n");
        ch->Echo("Tip: Use \"auto\" for vnum to use the first available vnum in your assigned area.\r\n");
        return;
    }

    if(vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ch->Echo("Bad number.\r\n");
        return;
    }

    OneArgument(argument, arg2);
    cvnum = ToLong(arg2);

    if(cvnum != INVALID_VNUM)
        argument = OneArgument(argument, arg2);

    if(cvnum < 1)
        cvnum = INVALID_VNUM;

    if(GetProtoObject(vnum))
    {
        ch->Echo("An object with that number already exists.\r\n");
        return;
    }

    if(IsNpc(ch))
        return;

    if(GetTrustLevel(ch) <= LEVEL_IMMORTAL)
    {
        std::shared_ptr<Area> pArea;

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to create objects.\r\n");
            return;
        }

        if(vnum < pArea->VnumRanges.Object.First
           || vnum > pArea->VnumRanges.Object.Last)
        {
            ch->Echo("That number is not in your allocated range.\r\n");
            return;
        }
    }

    if(cvnum == vnum)
        ch->Echo("The vnums must be different!\r\n");

    std::shared_ptr<ProtoObject> pObjIndex = MakeObject(vnum, cvnum, argument);

    if(!pObjIndex)
    {
        ch->Echo("Error.\r\n");
        Log->Bug("do_ocreate: MakeObject failed.");
        return;
    }

    obj = CreateObject(pObjIndex, GetTrustLevel(ch));
    ObjectToCharacter(obj, ch);
    Act(AT_IMMORT, "$n makes some ancient arcane gestures, and opens $s hands to reveal $p!",
        ch, obj, NULL, ActTarget::Room);
    Act(AT_IMMORT, "You make some ancient arcane gestures, and open your hands to reveal $p!",
        ch, obj, NULL, ActTarget::Char);
}
