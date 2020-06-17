#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "act.hpp"

void do_openhatch(Character *ch, std::string argument)
{
    std::shared_ptr<Ship> ship;
    char buf[MAX_STRING_LENGTH] = { '\0' };

    if(argument.empty() || !StrCmp(argument, "hatch"))
    {
        ship = GetShipFromEntrance(ch->InRoom->Vnum);

        if(ship == NULL)
        {
            ch->Echo("&ROpen what?\r\n");
            return;
        }
        else
        {
            if(!ship->HatchOpen)
            {
                if(ship->Class == SHIP_PLATFORM)
                {
                    ch->Echo("&RTry one of the docking bays!\r\n");
                    return;
                }

                if(ship->Location != ship->LastDock ||
                   (ship->State != SHIP_LANDED && !IsShipDisabled(ship)))
                {
                    ch->Echo("&RPlease wait till the ship lands!\r\n");
                    return;
                }

                ship->HatchOpen = true;
                ch->Echo("&GYou open the hatch.\r\n");
                Act(AT_PLAIN, "$n opens the hatch.", ch, nullptr, argument, ActTarget::Room);
                sprintf(buf, "The hatch on %s opens.", ship->Name.c_str());
                EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);
                return;
            }
            else
            {
                ch->Echo("&RIt's already open.\r\n");
                return;
            }
        }
    }

    ship = GetShipInRoom(ch->InRoom, argument);

    if(!ship)
    {
        Act(AT_PLAIN, "I see no $T here.", ch, nullptr, argument, ActTarget::Char);
        return;
    }

    if(ship->State != SHIP_LANDED && !IsShipDisabled(ship))
    {
        ch->Echo("&RThat ship has already started to launch");
        return;
    }

    if(!CheckPilot(ch, ship))
    {
        ch->Echo("&RHey! Thats not your ship!\r\n");
        return;
    }

    if(!ship->HatchOpen)
    {
        ship->HatchOpen = true;
        Act(AT_PLAIN, "You open the hatch on $T.",
            ch, nullptr, ship->Name, ActTarget::Char);
        Act(AT_PLAIN, "$n opens the hatch on $T.",
            ch, nullptr, ship->Name, ActTarget::Room);
        EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Entrance), "The hatch opens from the outside.");
    }
    else
    {
        ch->Echo("&GIt's already open!\r\n");
    }
}
