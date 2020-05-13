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
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"

namespace fs = std::filesystem;

static void CloseDescriptorIfHalfwayLoggedIn(const std::string &name);
static void ExtractVictim(Character *victim);
static Character *GetVictimInWorld(const std::string &name);

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

    try
    {
        auto oldPath = FormatString("%s%c/%s", PLAYER_DIR, tolower(victimName[0]),
                                    Capitalize(victimName).c_str());
        auto backupPath = FormatString("%s%c/%s", BACKUP_DIR, tolower(victimName[0]),
                                       Capitalize(victimName).c_str());
        fs::rename(oldPath, backupPath);

        auto areaName = ConvertToLuaFilename(victimName);

        for (auto pArea : Areas->AreasInProgress())
        {
            if (!StrCmp(pArea->Filename, areaName))
            {
                Areas->Save(pArea);
                CloseArea(pArea);
                SetCharacterColor(AT_RED, ch); /* Log message changes colors */
                fs::rename(Areas->GetAreaFilename(pArea),
                           Areas->GetAreaFilename(pArea) + ".bak");
                ch->Echo("Player's area data destroyed. Area saved as backup.\r\n");
            }
        }
    }
    catch(const fs::filesystem_error &ex)
    {
        Log->Bug("%s:%d:%s() - %s",
                 __FILE__, __LINE__, __FUNCTION__, ex.what());
        SetCharacterColor(AT_PLAIN, ch);
        ch->Echo("Player does not exist.\r\n");
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

