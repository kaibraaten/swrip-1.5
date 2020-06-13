#include <cstring>
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "act.hpp"

void do_drive(Character *ch, std::string argument)
{
    DirectionType dir = DIR_INVALID;
    std::shared_ptr<Ship> ship;
    std::shared_ptr<Ship> target;
    std::string arg;
    std::string arg2;
    char buf[MAX_INPUT_LENGTH];

    argument = OneArgument(argument, arg);
    arg2 = argument;

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the drivers seat of a land vehicle to do that!\r\n");
        return;
    }

    if(ship->Class < LAND_SPEEDER)
    {
        ch->Echo("&RThis isn't a land vehicle!\r\n");
        return;
    }

    if(IsShipDisabled(ship))
    {
        ch->Echo("&RThe drive is disabled.\r\n");
        return;
    }

    if(ship->Thrusters.Energy.Current < 1)
    {
        ch->Echo("&RThere isn't enough fuel!\r\n");
        return;
    }

    if(!StrCmp(arg, "in"))
    {
        target = GetShipInRoom(ship->InRoom, arg2);

        if(!target)
        {
            Act(AT_PLAIN, "I see no $T here.", ch, NULL, argument.c_str(), TO_CHAR);
            return;
        }

        if(!target->Rooms.Hangar)
        {
            ch->Echo("That ship does not have any room.\r\n");
            return;
        }

        if(!target->BayOpen)
        {
            ch->Echo("The ship's bay doors must be open.\r\n");
            return;
        }

        if(target->InRoom->Flags.test(Flag::Room::Indoors)
           || target->InRoom->Sector == SECT_INSIDE)
        {
            ch->Echo("You can't drive indoors!\r\n");
            return;
        }

        ch->Echo("You drive the vehicle into the bay.\r\n");
        sprintf(buf, "%s drives into %s.",
                ship->Name.c_str(), target->Name.c_str());
        EchoToRoom(AT_GREY, ship->InRoom, buf);

        TransferShip(ship, target->Rooms.Hangar);

        sprintf(buf, "%s drives into the bay", ship->Name.c_str());
        EchoToRoom(AT_GREY, ship->InRoom, buf);
        LearnFromSuccess(ch, gsn_speeders);
        return;
    }

    if(!StrCmp(arg, "out"))
    {
        target = GetShipFromHangar(ship->InRoom->Vnum);

        if(!target)
        {
            ch->Echo("You have to be in a ship's hangar to drive out of one.\r\n");
            return;
        }

        if(target->Spaceobject != NULL)
        {
            ch->Echo("The ship must be landed before you drive out of its hangar!\r\n");
            return;
        }

        if(!target->BayOpen)
        {
            ch->Echo("The ship's bay doors must be open.\r\n");
            return;
        }

        if(target->InRoom->Flags.test(Flag::Room::Indoors)
           || target->InRoom->Sector == SECT_INSIDE)
        {
            ch->Echo("You can't drive indoors!\r\n");
            return;
        }

        ch->Echo("You drive the vehicle out of the bay.\r\n");
        sprintf(buf, "%s drives out of the ship.", ship->Name.c_str());
        EchoToRoom(AT_GREY, ship->InRoom, buf);

        TransferShip(ship, target->InRoom->Vnum);

        sprintf(buf, "%s drives out of %s",
                ship->Name.c_str(), target->Name.c_str());
        EchoToRoom(AT_GREY, ship->InRoom, buf);
        LearnFromSuccess(ch, gsn_speeders);
        return;
    }

    if((dir = GetDirection(arg)) == -1)
    {
        ch->Echo("Usage: drive <direction>\r\n");
        return;
    }

    DriveShip(ch, ship, GetExit(GetRoom(ship->Location), dir), 0);
}
