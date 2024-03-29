#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "act.hpp"
#include "protoobject.hpp"
#include "plugins.hpp"

static vnum_t GetNewObjectVnum(std::shared_ptr<Area> area, const std::string &arg);

void do_ocreate(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    std::shared_ptr<Object> obj;
    vnum_t vnum = INVALID_VNUM;
    vnum_t cvnum = INVALID_VNUM;
    auto area = ch->PCData->Build.Area;
    
    if(IsNpc(ch))
    {
        ch->Echo("Mobiles cannot create.\r\n");
        return;
    }

    if(area == nullptr)
    {
        ch->Echo("You must AASSIGN an area first.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    vnum = GetNewObjectVnum(area, arg);

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

    if(!ObjectVnumIsInArea(vnum, area))
    {
        ch->Echo("That number is not in your allocated range.\r\n");
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
        if(!ch->PCData || area == nullptr)
        {
            ch->Echo("You must have an assigned area to create objects.\r\n");
            return;
        }

        if(!ObjectVnumIsInArea(vnum, area))
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
    Act(AT_IMMORT,
        FormatString("You make some ancient arcane gestures, and open your hands to reveal $p (vnum %ld)!",
                     pObjIndex->Vnum),
        ch, obj, NULL, ActTarget::Char);

    auto plugin = ch->PCData->Build.Plugin;

    if(plugin != nullptr)
    {
        plugin->Add(pObjIndex);
    }
}

static vnum_t GetNewObjectVnum(std::shared_ptr<Area> area, const std::string &arg)
{
    vnum_t vnum = INVALID_VNUM;

    if(IsNumber(arg))
    {
        vnum = ToLong(arg);
    }
    else if(!StrCmp(arg, "auto"))
    {
        vnum = GetFreeObjectVnum(area);
    }
    else
    {
        vnum = INVALID_VNUM;
    }

    return vnum;
}
