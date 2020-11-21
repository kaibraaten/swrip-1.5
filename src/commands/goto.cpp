#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "systemdata.hpp"
#include "act.hpp"

static vnum_t GetNextVnum(const std::shared_ptr<Area> &area);

void do_goto(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Area> pArea;
    vnum_t vnum = INVALID_VNUM;
    
    OneArgument(argument, arg);

    if(arg.empty())
    {
        ch->Echo("Goto where?\r\n");
        return;
    }

    auto location = FindLocation(ch, arg);

    if(StrCmp(arg, "auto") == 0 && !IsNpc(ch) && ch->PCData->Build.Area != nullptr)
    {
        location = nullptr;
        arg = std::to_string(GetNextVnum(ch->PCData->Build.Area));
    }

    if(arg[0] == '#')
    {
        location = GetRoomFromTag(arg.substr(1));
    }
    
    if(IsRoomPrivate(ch, location))
    {
        ch->Echo("Overriding private flag!\r\n");
    }

    if(GetTrustLevel(ch) < LEVEL_GREATER
       && !IsName("intergoto", ch->PCData->Bestowments))
    {
        vnum = ToLong(arg);

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to goto.\r\n");
            return;
        }

        if(vnum < pArea->VnumRanges.Room.First
           || vnum > pArea->VnumRanges.Room.Last)
        {
            ch->Echo("That room is not within your assigned range.\r\n");
            return;
        }

        if((ch->InRoom->Vnum < pArea->VnumRanges.Room.First
            || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last)
           && !ch->InRoom->Flags.test(Flag::Room::Hotel))
        {
            ch->Echo("Builders can only use goto from a hotel or in their zone.\r\n");
            return;
        }
    }

    auto in_room = ch->InRoom;

    if(IsFighting(ch))
        StopFighting(ch, true);

    if(!ch->Flags.test(Flag::Plr::WizInvis))
    {
        if(ch->PCData && !ch->PCData->BamfOut.empty())
            Act(AT_IMMORT, "$T", ch, nullptr, ch->PCData->BamfOut, ActTarget::Room);
        else
            Act(AT_IMMORT, "$n $T", ch, nullptr, ActArg("leaves in a swirl of the force."), ActTarget::Room);
    }

    ch->ReGoto = ch->InRoom->Vnum;
    CharacterFromRoom(ch);

    if(ch->Mount)
    {
        CharacterFromRoom(ch->Mount);
        CharacterToRoom(ch->Mount, location);
    }

    CharacterToRoom(ch, location);

    if(!ch->Flags.test(Flag::Plr::WizInvis))
    {
        if(ch->PCData && !ch->PCData->BamfIn.empty())
            Act(AT_IMMORT, "$T", ch, nullptr, ch->PCData->BamfIn, ActTarget::Room);
        else
            Act(AT_IMMORT, "$n $T", ch, nullptr, ActArg("enters in a swirl of the Force."), ActTarget::Room);
    }

    do_look(ch, "auto");

    if(ch->InRoom == in_room)
        return;

    const auto charactersInRoom = in_room->Characters();

    for(auto fch : charactersInRoom)
    {
        if(fch->Master == ch && IsImmortal(fch))
        {
            Act(AT_ACTION, "You follow $N.", fch, nullptr, ch, ActTarget::Char);
            do_goto(fch, argument);
        }
    }
}

static vnum_t GetNextVnum(const std::shared_ptr<Area> &area)
{
    for(vnum_t vnum = area->VnumRanges.Room.First;
        vnum <= area->VnumRanges.Room.Last;
        ++vnum)
    {
        if(GetRoom(vnum) == nullptr)
        {
            return vnum;
        }
    }

    return INVALID_VNUM;
}
