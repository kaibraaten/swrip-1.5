#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "room.hpp"

static std::shared_ptr<Ship> GetFuelTarget(std::shared_ptr<Ship> fuelSource);

void do_fuel(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Ship> fuelSource;
    std::shared_ptr<Ship> fuelTarget;
    int amount = 0;
    std::string arg1;
    char buf[MAX_STRING_LENGTH] = { '\0' };

    argument = OneArgument(argument, arg1);

    if((fuelSource = GetShipFromHangar(ch->InRoom->Vnum)) == NULL
       && (fuelSource = GetShipFromEntrance(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the hangar or the entrance of a ship to do that!\r\n");
        return;
    }

    if(arg1.empty() || !IsNumber(arg1))
    {
        ch->Echo("Syntax: Fuel <amount> <ship>");
        return;
    }

    if(argument.empty())
    {
        fuelTarget = GetFuelTarget(fuelSource);
    }

    if(fuelTarget == NULL)
    {
        ch->Echo("Ship not docked. Fuel what ship?");
        return;
    }

    amount = ToLong(arg1);

    if(fuelSource->Thrusters.Energy.Current <= amount)
    {
        ch->Echo("&RError: Ordered energy over current stock. Sending everything but 1 unit.&w\r\n");
        amount = fuelSource->Thrusters.Energy.Current - 1;
    }

    if(fuelTarget->Thrusters.Energy.Max < fuelTarget->Thrusters.Energy.Current + amount)
    {
        ch->Echo("&rError: Ordered energy over target capacity. Filling tanks.\r\n");
        amount = fuelTarget->Thrusters.Energy.Max - fuelTarget->Thrusters.Energy.Current;
    }

    if(fuelSource->Class != SHIP_PLATFORM)
    {
        fuelSource->Thrusters.Energy.Current -= amount;
    }

    fuelTarget->Thrusters.Energy.Current += amount;

    sprintf(buf, "&YFuel order filled: &O%s: %d\r\n",
            fuelTarget->Name.c_str(), amount);
    EchoToCockpit(AT_YELLOW, fuelSource, buf);
    ch->Echo("%s", buf);
    sprintf(buf, "&YFuel remaining: %d\r\n", fuelSource->Thrusters.Energy.Current);
    EchoToCockpit(AT_YELLOW, fuelSource, buf);
    ch->Echo("%s", buf);
}

struct UserData
{
    std::shared_ptr<Ship> fuelSource;
    std::shared_ptr<Ship> fuelTarget;
};

static bool FindDockedShip(std::shared_ptr<Ship> fuelTarget, UserData *data)
{
    if(fuelTarget->Docked == data->fuelSource)
    {
        data->fuelTarget = fuelTarget;
        return false;
    }

    return true;
}

static std::shared_ptr<Ship> GetFuelTarget(std::shared_ptr<Ship> fuelSource)
{
    std::shared_ptr<Ship> fuelTarget;

    if(fuelSource->Docked != NULL)
    {
        fuelTarget = fuelSource->Docked;
    }
    else
    {
        UserData data;
        data.fuelSource = fuelSource;
        data.fuelTarget = NULL;
        ForEachShip(FindDockedShip, &data);
        fuelTarget = data.fuelTarget;
    }

    return fuelTarget;
}
