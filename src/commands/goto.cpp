#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "systemdata.hpp"

void do_goto(Character *ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Room> location;
    std::shared_ptr<Area> pArea;
    vnum_t vnum = INVALID_VNUM;

    OneArgument(argument, arg);

    if (arg.empty())
    {
        ch->Echo("Goto where?\r\n");
        return;
    }

    if ((location = FindLocation(ch, arg)) == NULL)
    {
        vnum = ToLong(arg);

        if (vnum < 0 || GetRoom(vnum))
        {
            ch->Echo("You cannot find that...\r\n");
            return;
        }

        if (vnum < 1 || IsNpc(ch) || !ch->PCData->Build.Area)
        {
            ch->Echo("No such location.\r\n");
            return;
        }

        if (GetTrustLevel(ch) < SysData.LevelToModifyProto
            && !IsName("intergoto", ch->PCData->Bestowments))
        {
            if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
            {
                ch->Echo("You must have an assigned area to create rooms.\r\n");
                return;
            }

            if (vnum < pArea->VnumRanges.Room.First
                || vnum > pArea->VnumRanges.Room.Last)
            {
                ch->Echo("That room is not within your assigned range.\r\n");
                return;
            }
        }

        location = MakeRoom(vnum);
        location->Area = ch->PCData->Build.Area;
        SetCharacterColor(AT_WHITE, ch);
        ch->Echo("Waving your hand, you form order from swirling chaos,\r\nand step into a new reality...\r\n");
    }

    if (IsRoomPrivate(ch, location))
    {
        ch->Echo("Overriding private flag!\r\n");
    }

    if (GetTrustLevel(ch) < LEVEL_GREATER
        && !IsName("intergoto", ch->PCData->Bestowments))
    {
        vnum = ToLong(arg);

        if (!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to goto.\r\n");
            return;
        }

        if (vnum < pArea->VnumRanges.Room.First
            || vnum > pArea->VnumRanges.Room.Last)
        {
            ch->Echo("That room is not within your assigned range.\r\n");
            return;
        }

        if ((ch->InRoom->Vnum < pArea->VnumRanges.Room.First
            || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last)
            && !ch->InRoom->Flags.test(Flag::Room::Hotel))
        {
            ch->Echo("Builders can only use goto from a hotel or in their zone.\r\n");
            return;
        }
    }

    auto in_room = ch->InRoom;

    if (ch->Fighting)
        StopFighting(ch, true);

    if (!IsBitSet(ch->Flags, PLR_WIZINVIS))
    {
        if (ch->PCData && !ch->PCData->BamfOut.empty())
            Act(AT_IMMORT, "$T", ch, NULL, ch->PCData->BamfOut.c_str(), TO_ROOM);
        else
            Act(AT_IMMORT, "$n $T", ch, NULL, "leaves in a swirl of the force.", TO_ROOM);
    }

    ch->ReGoto = ch->InRoom->Vnum;
    CharacterFromRoom(ch);

    if (ch->Mount)
    {
        CharacterFromRoom(ch->Mount);
        CharacterToRoom(ch->Mount, location);
    }

    CharacterToRoom(ch, location);

    if (!IsBitSet(ch->Flags, PLR_WIZINVIS))
    {
        if (ch->PCData && !ch->PCData->BamfIn.empty())
            Act(AT_IMMORT, "$T", ch, NULL, ch->PCData->BamfIn.c_str(), TO_ROOM);
        else
            Act(AT_IMMORT, "$n $T", ch, NULL, "enters in a swirl of the Force.", TO_ROOM);
    }

    do_look(ch, "auto");

    if (ch->InRoom == in_room)
        return;

    std::list<Character*> copyOfCharactersInRoom(in_room->Characters());

    for (Character *fch : copyOfCharactersInRoom)
    {
        if (fch->Master == ch && IsImmortal(fch))
        {
            Act(AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR);
            do_goto(fch, argument);
        }
    }
}
