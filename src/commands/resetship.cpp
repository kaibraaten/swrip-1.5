#include "mud.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "spaceobject.hpp"
#include "character.hpp"

void do_resetship(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Ship> ship = GetShipAnywhere(argument);

    if(ship == NULL)
    {
        ch->Echo("&RNo such ship!");
        return;
    }

    ResetShip(ship);

    if((ship->Class == SHIP_PLATFORM || ship->Type == MOB_SHIP || ship->Class == CAPITAL_SHIP)
       && !ship->Home.empty())
    {
        ShipToSpaceobject(ship, GetSpaceobject(ship->Home));

        if(ship->Spaceobject)
        {
            ship->Position = ship->Spaceobject->Position;
        }
        else
        {
            ship->Position = Vector3();
        }

        RandomizeVector(ship->Position, -5000, 5000);
        ship->State = SHIP_READY;
        ship->Autopilot = true;
        ship->AutoRecharge = true;
        ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
    }
}
