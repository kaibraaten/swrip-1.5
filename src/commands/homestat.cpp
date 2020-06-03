#include "mud.hpp"
#include "character.hpp"
#include "home.hpp"
#include "room.hpp"
#include "repos/homerepository.hpp"

static std::list<std::string> GetUpgrades(std::shared_ptr<Home> home);

void do_homestat(Character *ch, std::string argument)
{
    if(ch->IsNpc())
    {
        return;
    }
    
    auto home = Homes->FindByVnum(ch->InRoom->Vnum);

    if(home == nullptr)
    {
        ch->Echo("&RYou must be inside your home.\r\n&d");
        return;
    }

    if(StrCmp(home->Owner(), ch->Name) != 0
       && !IsImmortal(ch))
    {
        ch->Echo("&RYou can only do this with homes you own.\r\n&d");
        return;
    }

    ch->Echo(std::string(80, '=') + "\r\n");
    ch->Echo(CenterString(ToUpper(home->RoomName()), 80, ' ') + "\r\n");
    ch->Echo(std::string(80, '-') + "\r\n");
    ch->Echo("Name: %s\r\n", home->RoomName().c_str());
    ch->Echo("Owner: %s\r\n", home->Owner().c_str());
    ch->Echo("Residents:\r\n");

    for(const auto &resident : home->Residents())
    {
        ch->Echo("  * %s\r\n", resident->Name.c_str());
    }

    ch->Echo("Upgrades:\r\n");

    for(const auto &upgrade : GetUpgrades(home))
    {
        ch->Echo("  * %s\r\n", upgrade.c_str());
    }
    
    ch->Echo(std::string(80, '=') + "\r\n");
}

static std::list<std::string> GetUpgrades(std::shared_ptr<Home> home)
{
    std::list<std::string> upgrades;

    if(home->ExtraRoomFlags.test(Flag::Room::Factory))
    {
        upgrades.push_back("Factory");
    }

    if(home->ExtraRoomFlags.test(Flag::Room::Refinery))
    {
        upgrades.push_back("Refinery");
    }

    if(home->Flags.test(Flag::Home::MultipleResidents))
    {
        upgrades.push_back("Residents");
    }
    
    if(upgrades.empty())
    {
        upgrades.push_back("None");
    }

    return upgrades;
}
