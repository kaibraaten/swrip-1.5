#include "shuttle.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_leaveship(Character *ch, std::string argument)
{
    std::shared_ptr<Room> toroom;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Shuttle> shuttle;
    auto fromroom = ch->InRoom;

    if((ship = GetShipFromEntrance(fromroom->Vnum)) != NULL)
    {
        if(ship->Class == SHIP_PLATFORM)
        {
            ch->Echo("You can't do that here.\r\n");
            return;
        }

        if(ship->LastDock != ship->Location)
        {
            ch->Echo("&rMaybe you should wait until the ship lands.\r\n");
            return;
        }

        if(ship->State != SHIP_LANDED
           && ship->State != SHIP_DOCKED
           && !IsShipDisabled(ship))
        {
            ch->Echo("&rPlease wait till the ship is properly docked.\r\n");
            return;
        }

        if(!ship->HatchOpen)
        {
            ch->Echo("&RYou need to open the hatch first");
            return;
        }

        if((toroom = GetRoom(ship->Location)) == NULL)
        {
            ch->Echo("The exit doesn't seem to be working properly.\r\n");
            return;
        }
    }
    else if((shuttle = GetShuttleFromEntrance(fromroom->Vnum)) != NULL)
    {
        if(!shuttle->InRoom || (toroom = GetRoom(shuttle->InRoom->Vnum)) == NULL)
        {
            ch->Echo("The ship hasn't landed yet. Do you want to kill yourself?\r\n");
            return;
        }
    }
    else
    {
        ch->Echo("I see no exit here.\r\n");
        return;
    }

    Act(AT_PLAIN, "$n exits the ship.", ch, NULL, NULL, ActTarget::Room);
    Act(AT_PLAIN, "You exit the ship.", ch, NULL, NULL, ActTarget::Char);
    CharacterFromRoom(ch);
    CharacterToRoom(ch, toroom);
    Act(AT_PLAIN, "$n steps out of a ship.", ch, NULL, NULL, ActTarget::Room);
    do_look(ch, "auto");
}
