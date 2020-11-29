#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "act.hpp"
#include "plugins.hpp"
#include "protomob.hpp"

void do_mcreate(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    std::shared_ptr<Character> mob;
    vnum_t vnum = INVALID_VNUM, cvnum = INVALID_VNUM;
    auto area = ch->PCData->Build.Area;
    
    if(IsNpc(ch))
    {
        ch->Echo("Mobiles cannot create.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(StrCmp(arg, "auto") == 0 && area != nullptr)
    {
        arg = std::to_string(GetFreeMobileVnum(area));
    }

    vnum = IsNumber(arg) ? ToLong(arg) : INVALID_VNUM;

    
    if(vnum == INVALID_VNUM || argument.empty())
    {
        ch->Echo("Usage: mcreate <vnum> [cvnum] <mobile name>\r\n");
        return;
    }

    if(vnum < MIN_VNUM || vnum > MAX_VNUM)
    {
        ch->Echo("Bad number.\r\n");
        return;
    }

    if(area != nullptr && !MobileVnumIsInArea(vnum, area))
    {
        ch->Echo("Vnum isn't within your area's range.\r\n");
        return;
    }

    OneArgument(argument, arg2);
    cvnum = ToLong(arg2);

    if(cvnum != 0)
        argument = OneArgument(argument, arg2);

    if(cvnum < 1)
        cvnum = 0;

    if(GetProtoMobile(vnum))
    {
        ch->Echo("A mobile with that number already exists.\r\n");
        return;
    }

    if(IsNpc(ch))
        return;

    if(GetTrustLevel(ch) <= LEVEL_IMMORTAL)
    {
        if(!ch->PCData || area == nullptr)
        {
            ch->Echo("You must have an assigned area to create mobiles.\r\n");
            return;
        }

        if(!MobileVnumIsInArea(vnum, area))
        {
            ch->Echo("That number is not in your allocated range.\r\n");
            return;
        }
    }

    auto pMobIndex = MakeMobile(vnum, cvnum, argument);

    if(!pMobIndex)
    {
        ch->Echo("Error.\r\n");
        Log->Bug("do_mcreate: MakeMobile failed.");
        return;
    }

    mob = CreateMobile(pMobIndex);
    CharacterToRoom(mob, ch->InRoom);
    Act(AT_IMMORT, "$n waves $s arms about, and $N appears at $s command!",
        ch, NULL, mob, ActTarget::Room);
    Act(AT_IMMORT,
        FormatString("You wave your arms about, and $N (vnum %ld) appears at your command!",
                     pMobIndex->Vnum),
        ch, NULL, mob, ActTarget::Char);

    auto plugin = ch->PCData->Build.Plugin;

    if(plugin != nullptr)
    {
        plugin->Add(pMobIndex);
    }
}
