#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "act.hpp"

static vnum_t GetNextVnum(const std::shared_ptr<Area> &area);

void do_mcreate(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    std::shared_ptr<Character> mob;
    vnum_t vnum = INVALID_VNUM, cvnum = INVALID_VNUM;

    if(IsNpc(ch))
    {
        ch->Echo("Mobiles cannot create.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(StrCmp(arg, "auto") == 0 && ch->PCData->Build.Area != nullptr)
    {
        arg = std::to_string(GetNextVnum(ch->PCData->Build.Area));
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
        std::shared_ptr<Area> pArea;

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to create mobiles.\r\n");
            return;
        }

        if(vnum < pArea->VnumRanges.Mob.First
           || vnum > pArea->VnumRanges.Mob.Last)
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
    Act(AT_IMMORT, "You wave your arms about, and $N appears at your command!",
        ch, NULL, mob, ActTarget::Char);
}

static vnum_t GetNextVnum(const std::shared_ptr<Area> &area)
{
    for(vnum_t vnum = area->VnumRanges.Mob.First;
        vnum <= area->VnumRanges.Mob.Last;
        ++vnum)
    {
        if(GetProtoMobile(vnum) == nullptr)
        {
            return vnum;
        }
    }

    return INVALID_VNUM;
}
