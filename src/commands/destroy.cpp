#include <filesystem>
#include <cstring>
#include <cctype>
#include <cerrno>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "log.hpp"
#include "character.hpp"
#include "area.hpp"
#include "descriptor.hpp"
#include "home.hpp"
#include "ship.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"
#include "repos/homerepository.hpp"
#include "repos/shiprepository.hpp"

namespace fs = std::filesystem;

static void CloseDescriptorIfHalfwayLoggedIn(const std::string &name);
static void ExtractVictim(Character *victim);
static Character *GetVictimInWorld(const std::string &name);

class RemoveResident
{
public:
    RemoveResident(const std::string &name)
        : _resident(name)
    {

    }

    void operator()(const std::shared_ptr<Home> home) const
    {
        if(StrCmp(home->Owner(), _resident) == 0)
        {
            Homes->Delete(home);
        }
        else
        {
            home->RemoveResident(_resident);
            Homes->Save(home);
        }
    }

private:
    std::string _resident;
};

static bool RemoveShipOwner(std::shared_ptr<Ship> ship, void *userData)
{
    const char *victim = (char*)userData;

    if (StrCmp(ship->Owner, victim) == 0)
    {
        ship->Owner.erase();
        ship->Pilot.erase();
        ship->CoPilot.erase();

        Ships->Save(ship);
    }

    return true;
}

void do_destroy(Character *ch, std::string victimName)
{
    if (victimName.empty())
    {
        ch->Echo("Destroy what player file?\r\n");
        return;
    }

    Character *victim = GetVictimInWorld(victimName);

    if (!victim)
    {
        CloseDescriptorIfHalfwayLoggedIn(victimName);
    }
    else
    {
        ExtractVictim(victim);
    }

    if(PlayerCharacters->Exists(victimName))
    {
        PlayerCharacters->Delete(victimName);
        char ownerName[MAX_STRING_LENGTH];
        strcpy(ownerName, victimName.c_str());
        ForEachShip(RemoveShipOwner, ownerName);
        ForEach(Homes->FindHomesForResident(victimName), RemoveResident(victimName));

        auto areaName = ConvertToLuaFilename(victimName);

        for (auto pArea : Areas->AreasInProgress())
        {
            if (!StrCmp(pArea->Filename, areaName))
            {
                Areas->Save(pArea);
                CloseArea(pArea);
                SetCharacterColor(AT_RED, ch); /* Log message changes
                                                * colors */
                std::error_code ec;
                fs::rename(Areas->GetAreaFilename(pArea),
                           Areas->GetAreaFilename(pArea) + ".bak",
                           ec);
                ch->Echo("Player's area data destroyed. Area saved as backup.\r\n");
            }
        }
    }
    else
    {
        ch->Echo("There are no pfiles for that character.\r\n");
    }
}

static void CloseDescriptorIfHalfwayLoggedIn(const std::string &name)
{
    std::shared_ptr<Descriptor> d = Find(Descriptors->Entities(),
                                         [name](const auto desc)
                                         {
                                             return desc->Character != nullptr
                                             && !IsNpc(desc->Character)
                                             && !StrCmp(desc->Character->Name, name);
                                         });

    if (d != nullptr)
    {
        CloseDescriptor(d, true);
    }
}

static void ExtractVictim(Character *victim)
{
    quitting_char = victim;
    PlayerCharacters->Save(victim);
    saving_char = NULL;
    ExtractCharacter(victim, true);

    for (int x = 0; x < MAX_WEAR; x++)
    {
        for (int y = 0; y < MAX_LAYERS; y++)
        {
            save_equipment[x][y] = NULL;
        }
    }
}

static Character *GetVictimInWorld(const std::string &name)
{
    for (Character *victim = FirstCharacter; victim; victim = victim->Next)
    {
        if (!IsNpc(victim) && !StrCmp(victim->Name, name))
        {
            return victim;
        }
    }

    return nullptr;
}
