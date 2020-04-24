#include <cstring>
#include <cctype>
#include <cerrno>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "descriptor.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"

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

    char oldPath[256];
    char backupPath[256];

    sprintf(oldPath, "%s%c/%s", PLAYER_DIR, tolower(victimName[0]),
        Capitalize(victimName).c_str());
    sprintf(backupPath, "%s%c/%s", BACKUP_DIR, tolower(victimName[0]),
        Capitalize(victimName).c_str());

    if (rename(oldPath, backupPath) == 0)
    {
        char godDataPath[256];

        SetCharacterColor(AT_RED, ch);
        ch->Echo("Player destroyed. Pfile saved in backup directory.\r\n");
        sprintf(godDataPath, "%s%s", GOD_DIR, Capitalize(victimName).c_str());

        if (remove(godDataPath) == 0)
        {
            ch->Echo("Player's immortal data destroyed.\r\n");
        }
        else if (errno != ENOENT)
        {
            ch->Echo("Unknown error #%d - %s (immortal data).  Report to Thoric.\r\n",
                errno, strerror(errno));
            char errorMessage[1024];
            sprintf(errorMessage, "%s destroying %s", ch->Name.c_str(), godDataPath);
            perror(errorMessage);
        }

        char areaName[100];
        sprintf(areaName, "%s.are", Capitalize(victimName).c_str());

        for (auto pArea = Areas->FirstBuild; pArea; pArea = pArea->Next)
        {
            if (!StrCmp(pArea->Filename, areaName))
            {
                char areaPath[256];
                sprintf(areaPath, "%s%s", BUILD_DIR, areaName);

                if (IsBitSet(pArea->Status, AREA_LOADED))
                {
                    FoldArea(pArea, areaName, false);
                }

                CloseArea(pArea);
                char areaBackupPath[512];
                sprintf(areaBackupPath, "%s.bak", areaPath);
                SetCharacterColor(AT_RED, ch); /* Log message changes colors */

                if (!rename(areaPath, areaBackupPath))
                {
                    ch->Echo("Player's area data destroyed. Area saved as backup.\r\n");
                }
                else if (errno != ENOENT)
                {
                    ch->Echo("Unknown error #%d - %s (area data).  Report to Thoric.\r\n",
                        errno, strerror(errno));
                    char errorMessage[1024];
                    sprintf(errorMessage, "%s destroying %s",
                        ch->Name.c_str(), areaPath);
                    perror(errorMessage);
                }
            }
        }
    }
    else if (errno == ENOENT)
    {
        SetCharacterColor(AT_PLAIN, ch);
        ch->Echo("Player does not exist.\r\n");
    }
    else
    {
        SetCharacterColor(AT_WHITE, ch);
        ch->Echo("Unknown error #%d - %s.  Report to Thoric.\r\n",
            errno, strerror(errno));
        char errorMessage[1024];
        sprintf(errorMessage, "%s destroying %s", ch->Name.c_str(), victimName.c_str());
        perror(errorMessage);
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

