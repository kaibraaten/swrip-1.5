#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "act.hpp"

void do_closebay(Character *ch, std::string argument)
{
    std::shared_ptr<Ship> ship;
    char buf[MAX_STRING_LENGTH];

    if(GetShipFromPilotSeat(ch->InRoom->Vnum) == NULL
       && GetShipFromHangar(ch->InRoom->Vnum) == NULL)
    {
        ch->Echo("&RYou aren't in the pilots chair or hangar of a ship!\r\n");
        return;
    }

    if(GetShipFromPilotSeat(ch->InRoom->Vnum))
        ship = GetShipFromPilotSeat(ch->InRoom->Vnum);
    else
        ship = GetShipFromHangar(ch->InRoom->Vnum);

    if(ship->Rooms.Hangar == INVALID_VNUM)
    {
        ch->Echo("&RThis ship has no hangar!&d\r\n");
        return;
    }

    if(ship->BayOpen == false)
    {
        ch->Echo("Bay doors are already closed!");
        return;
    }

    Act(AT_PLAIN, "$n flips a switch on the control panel.", ch,
        NULL, argument.c_str(), TO_ROOM);
    ship->BayOpen = false;

    EchoToCockpit(AT_YELLOW, ship, "Bay Doors close");
    ch->Echo("You close the bay doors.");
    sprintf(buf, "%s's bay doors close.", ship->Name.c_str());
    EchoToNearbyShips(AT_YELLOW, ship, buf);
}
