#include "mud.hpp"
#include "home.hpp"
#include "character.hpp"
#include "room.hpp"
#include "repos/homerepository.hpp"

constexpr int FACTORY_PRICE = 50000;
constexpr int REFINERY_PRICE = 50000;

enum
{
    FactoryUpgrade,
    RefineryUpgrade,
    InvalidUpgrade
};

static int GetUpgrade(const std::string &type)
{
    int upgrade = 0;
    
    if(StrCmp(type, "factory") == 0)
    {
        upgrade = FactoryUpgrade;
    }
    else if(StrCmp(type, "refinery") == 0)
    {
        upgrade = RefineryUpgrade;
    }
    else
    {
        upgrade = InvalidUpgrade;
    }

    return upgrade;
}

static int GetUpgradePrice(int upgrade)
{
    int price = 0;

    switch(upgrade)
    {
    case FactoryUpgrade:
        price = FACTORY_PRICE;
        break;

    case RefineryUpgrade:
        price = REFINERY_PRICE;
        break;

    default:
        price = 0;
    }

    return price;
}

static bool AlreadyHasUpgrade(std::shared_ptr<Home> home, int type)
{
    bool has = false;
    
    switch(type)
    {
    case FactoryUpgrade:
        has = home->ExtraRoomFlags.test(Flag::Room::Factory);
        break;

    case RefineryUpgrade:
        has = home->ExtraRoomFlags.test(Flag::Room::Refinery);
        break;

    default:
        break;
    }

    return has;
}

static void PerformUpgrade(std::shared_ptr<Home> home, int type)
{
    switch(type)
    {
    case FactoryUpgrade:
        home->ExtraRoomFlags.set(Flag::Room::Factory);
        break;

    case RefineryUpgrade:
        home->ExtraRoomFlags.set(Flag::Room::Refinery);
        break;

    default:
        break;
    }
}

void do_upgradehome(Character *ch, std::string argument)
{
    if(IsNpc(ch))
    {
        return;
    }

    auto room = ch->InRoom;
    auto home = Homes->FindByVnum(room->Vnum);

    if(home == nullptr || !Homes->IsResidentOf(ch->Name, room->Vnum))
    {
        ch->Echo("&RYou don't live here.\r\n&d");
        return;
    }

    if(StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&ROnly the owner can do that.\r\n&d");
        return;
    }

    if(argument.empty())
    {
        ch->Echo("Syntax: upgradehome <type>\r\n");
        ch->Echo("\r\n");
        ch->Echo("Available upgrades:\r\n");
        ch->Echo("  * Factory: Craft items here. %d credits.\r\n", FACTORY_PRICE);
        ch->Echo("  * Refinery: Refine spice here. %d credits.\r\n", REFINERY_PRICE);
        return;
    }

    int upgradeType = GetUpgrade(argument);

    if(upgradeType == InvalidUpgrade)
    {
        ch->Echo("&RThat's not a valid upgrade type.\r\n&d");
        return;
    }

    if(AlreadyHasUpgrade(home, upgradeType))
    {
        ch->Echo("&RYour home already has that upgrade.\r\n&d");
        return;
    }
    

    int price = GetUpgradePrice(upgradeType);

    if(price > ch->Gold)
    {
        ch->Echo("&RThat upgrade costs %d credits. You can't afford it.\r\n&d", price);
        return;
    }

    PerformUpgrade(home, upgradeType);
    ch->Gold -= price;
    do_save(ch, "");
    Homes->Save(home);

    ch->Echo("You have upgraded your home.\r\n");
}
