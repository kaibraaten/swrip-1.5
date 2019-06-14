#include "character.hpp"
#include "shuttle.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_board(Character *ch, std::string argument)
{
    std::shared_ptr<Room> toroom;
    std::shared_ptr<Ship> ship;
    std::string name;
    std::shared_ptr<Shuttle> shuttle;

    if (argument.empty())
    {
        ch->Echo("Board what?\r\n");
        return;
    }

    if (IsBitSet(ch->Flags, ACT_MOUNTED) && IsNpc(ch))
    {
        Act(AT_PLAIN, "&RYou can't go in there riding THAT.",
            ch, NULL, argument.c_str(), TO_CHAR);
        return;
    }

    if ((ship = GetShipInRoom(ch->InRoom, argument)) != NULL)
    {
        if ((toroom = GetRoom(ship->Rooms.Entrance)) == NULL)
        {
            ch->Echo("&RThat ship has no entrance!\r\n");
            return;
        }

        if (!ship->HatchOpen)
        {
            ch->Echo("&RThe hatch is closed!\r\n");
            return;
        }

        if (ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2)
        {
            ch->Echo("&RThat ship has already started launching!\r\n");
            return;
        }

        name = ship->Name;
    }
    else if ((shuttle = GetShuttleInRoom(ch->InRoom, argument)) != NULL)
    {
        name = shuttle->Name;

        if ((toroom = GetRoom(shuttle->Rooms.Entrance)) == NULL)
        {
            ch->Echo("That ship has no entrance!\r\n");
            return;
        }
    }
    else
    {
        Act(AT_PLAIN, "I see no $T here.",
            ch, NULL, argument.c_str(), TO_CHAR);
        return;
    }

    if (toroom->Tunnel > 0)
    {
        int count = toroom->Characters().size();

        if (count >= toroom->Tunnel)
        {
            ch->Echo("There is no room for you in there.\r\n");
            return;
        }
    }

    Act(AT_PLAIN, "$n enters $T.", ch, NULL, name.c_str(), TO_ROOM);
    Act(AT_PLAIN, "You enter $T.", ch, NULL, name.c_str(), TO_CHAR);
    CharacterFromRoom(ch);
    CharacterToRoom(ch, toroom);
    Act(AT_PLAIN, "$n enters the ship.", ch, NULL, NULL, TO_ROOM);
    do_look(ch, "auto");
}

