#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "spaceobject.hpp"
#include "room.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "vector3_aux.hpp"

void do_shiptrack(Character* ch, std::string argument)
{
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Spaceobject> spaceobject;
    std::string arg;
    std::string arg1;
    std::string arg2;
    std::string arg3;
    char buf[MAX_STRING_LENGTH] = { '\0' };

    argument = OneArgument(argument, arg);
    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);

    if ((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
        return;
    }

    if (ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!");
        return;
    }

    if (!ship->Spaceobject)
    {
        ch->Echo("&RYou can only do that in space!\r\n");
        return;
    }

    if (!StrCmp(arg, "dist"))
    {
        ship->tcount = ToLong(arg1);
        ch->Echo("&RJump distance set!\r\n");
        return;
    }

    if (!StrCmp(arg, "set"))
    {
        std::shared_ptr<Vector3> head = std::make_shared<Vector3>();

        if (IsShipInHyperspace(ship))
        {
            ch->Echo("&RYou can only do that in realspace!\r\n");
            return;
        }

        if (!IsNumber(arg1) || !IsNumber(arg2) || !IsNumber(arg3))
        {
            ch->Echo("Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n");
            return;
        }

        SetVector(head, ToLong(arg1), ToLong(arg2), ToLong(arg3));
        sprintf(buf, "%.0f %.0f %.0f", ship->Position->x + head->x,
            ship->Position->y + head->y, ship->Position->z + head->z);

        if (head->x < 1000)
            head->x *= 10000;

        if (head->y < 1000)
            head->y *= 10000;

        if (head->z < 1000)
            head->z *= 10000;

        ship->TrackVector->x = head->x;
        ship->TrackVector->y = head->y;
        ship->TrackVector->z = head->z;

        ship->Tracking = true;
        ship->Ch = ch;
        do_trajectory(ch, buf);

        SetVector(ship->Jump, ship->Position->x + head->x,
            ship->Position->y + head->y, ship->Position->z + head->z);


        for (auto so : Spaceobjects)
        {
            if (IsSpaceobjectInRange(ship, so))
            {
                ship->CurrentJump = so;
                spaceobject = so;
                break;
            }
        }

        if (!spaceobject)
        {
            ship->CurrentJump = ship->Spaceobject;
        }

        if(IsBeyondGalaxy(ship->Jump)
            || ship->Position->x > MAX_COORD || ship->Position->y > MAX_COORD || ship->Position->z > MAX_COORD
            || ship->Position->x < -MAX_COORD || ship->Position->y < -MAX_COORD || ship->Position->z < -MAX_COORD
            || ship->Heading->x > MAX_COORD || ship->Heading->y > MAX_COORD || ship->Heading->z > MAX_COORD
            || ship->Heading->x < -MAX_COORD || ship->Heading->y < -MAX_COORD || ship->Heading->z < -MAX_COORD)
        {
            EchoToCockpit(AT_RED, ship, "WARNING! Jump coordinates outside of the known galaxy.");
            EchoToCockpit(AT_RED, ship, "WARNING! Hyperjump NOT set.");
            ship->CurrentJump = NULL;
            ship->Tracking = false;
            return;
        }

        ship->Hyperdistance = GetDistanceBetweenVectors(ship->Position, ship->Jump) / 50;
        ship->OriginalHyperdistance = ship->Hyperdistance;

        ch->Echo("Course laid in. Beginning tracking program.\r\n");
        return;
    }

    if (!StrCmp(arg, "stop") || !StrCmp(arg, "halt"))
    {
        ship->Tracking = false;
        ch->Echo("Tracking program cancelled.\r\n");

        if (IsShipInHyperspace(ship))
            do_hyperspace(ch, "off");
    }
}
