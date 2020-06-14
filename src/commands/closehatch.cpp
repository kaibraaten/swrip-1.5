#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "act.hpp"

void do_closehatch(Character *ch, std::string argument)
{
    std::shared_ptr<Ship> ship;
    char buf[MAX_STRING_LENGTH];

    if(argument.empty() || !StrCmp(argument, "hatch"))
    {
        ship = GetShipFromEntrance(ch->InRoom->Vnum);

        if(ship == NULL)
        {
            ch->Echo("&RClose what?\r\n");
            return;
        }
        else
        {
            if(ship->Class == SHIP_PLATFORM)
            {
                ch->Echo("&RTry one of the docking bays!\r\n");
                return;
            }

            if(ship->HatchOpen)
            {
                ship->HatchOpen = false;
                ch->Echo("&GYou close the hatch.\r\n");
                Act(AT_PLAIN, "$n closes the hatch.", ch, NULL, argument.c_str(), ActTarget::Room);
                sprintf(buf, "The hatch on %s closes.", ship->Name.c_str());
                EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);
                return;
            }
            else
            {
                ch->Echo("&RIt's already closed.\r\n");
                return;
            }
        }
    }

    ship = GetShipInRoom(ch->InRoom, argument);

    if(!ship)
    {
        Act(AT_PLAIN, "I see no $T here.", ch, NULL, argument.c_str(), ActTarget::Char);
        return;
    }

    if(ship->State != SHIP_LANDED && !IsShipDisabled(ship))
    {
        ch->Echo("&RThat ship has already started to launch");
        return;
    }
    else
    {
        if(ship->HatchOpen)
        {
            ship->HatchOpen = false;
            Act(AT_PLAIN, "You close the hatch on $T.",
                ch, NULL, ship->Name.c_str(), ActTarget::Char);
            Act(AT_PLAIN, "$n closes the hatch on $T.",
                ch, NULL, ship->Name.c_str(), ActTarget::Room);
            EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Entrance),
                       "The hatch is closed from outside.");
            return;
        }
        else
        {
            ch->Echo("&RIt's already closed.\r\n");
            return;
        }
    }
}
