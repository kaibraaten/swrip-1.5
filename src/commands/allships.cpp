#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

struct UserData;

static bool ShowShipTerse(std::shared_ptr<Ship> ship, std::shared_ptr<Character> ch);
static bool ShowShipVerbose(std::shared_ptr<Ship> ship, UserData *data);

struct UserData
{
    std::shared_ptr<Character> ch;
    bool unowned = false;
    bool mobship = false;
    bool checkowner = false;
    int type = 0;
    int count = 0;
    std::string argument;
};

void do_allships(std::shared_ptr<Character> ch, std::string argument)
{
    UserData data;
    data.ch = ch;
    data.unowned = false;
    data.mobship = false;
    data.checkowner = false;
    data.type = -1;
    data.count = 0;
    data.argument = argument;

    if(!StrCmp(argument, "unowned"))
    {
        data.unowned = true;
    }
    else if(!StrCmp(argument, "imperial"))
    {
        data.type = SHIP_IMPERIAL;
    }
    else if(!StrCmp(argument, "rebel"))
    {
        data.type = SHIP_REBEL;
    }
    else if(!StrCmp(argument, "civilian"))
    {
        data.type = SHIP_CIVILIAN;
    }
    else if(!StrCmp(argument, "mob"))
    {
        data.mobship = true;
    }
    else if(argument.empty())
    {
        ;
    }
    else
    {
        data.checkowner = true;
    }

    ch->Echo("&Y\r\nThe following ships are currently formed:\r\n");
    ch->Echo("\r\n&WShip                               Owner&d\r\n");

    if(IsImmortal(ch) && !data.unowned && !data.checkowner && data.type < 0)
    {
        ForEachShip(ShowShipTerse, ch);
    }

    if(!data.mobship)
    {
        ForEachShip(ShowShipVerbose, &data);
    }

    if(data.count == 0)
    {
        ch->Echo("There are no ships currently formed.\r\n");
        return;
    }
}

static bool ShowShipVerbose(std::shared_ptr<Ship> ship, UserData *data)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int shipType = ship->Type;

    if(ship->Class > SHIP_PLATFORM)
    {
        return true;
    }

    if(data->unowned && !ship->Owner.empty())
    {
        return true;
    }

    if(data->checkowner && StrCmp(ship->Owner, data->argument))
    {
        return true;
    }

    if(data->type >= SHIP_CIVILIAN && shipType != data->type)
    {
        return true;
    }

    if(ship->Type == MOB_SHIP)
    {
        return true;
    }
    else if(ship->Type == SHIP_REBEL)
    {
        SetCharacterColor(AT_BLOOD, data->ch);
    }
    else if(ship->Type == SHIP_IMPERIAL)
    {
        SetCharacterColor(AT_DGREEN, data->ch);
    }
    else
    {
        SetCharacterColor(AT_BLUE, data->ch);
    }

    sprintf(buf, "%-10s(%-10s)", ship->Name.c_str(), ship->PersonalName.c_str());
    data->ch->Echo("&w%-35s %-15s\r\n", buf, ship->Owner.c_str());

    if(ship->Type == MOB_SHIP || ship->Class == SHIP_PLATFORM)
    {
        data->ch->Echo("\r\n");
        return true;
    }

    if(!StrCmp(ship->Owner, "Public"))
    {
        data->ch->Echo("%ld to rent.\r\n", GetRentalPrice(ship));
    }
    else if(!ship->Owner.empty())
    {
        data->ch->Echo("\r\n");
    }
    else
    {
        data->ch->Echo("&W%-10s%ld to buy.&R&w\r\n", "", GetShipValue(ship));
    }

    data->count++;
    return true;
}

static bool ShowShipTerse(std::shared_ptr<Ship> ship, std::shared_ptr<Character> ch)
{
    char buf[MAX_STRING_LENGTH];

    if(ship->Type == MOB_SHIP && ship->Class != SHIP_DEBRIS)
    {
        sprintf(buf, "%s(%s)", ship->Name.c_str(), ship->PersonalName.c_str());
        ch->Echo("&w%-35s %-10s\r\n", buf, ship->Owner.c_str());
    }

    return true;
}

