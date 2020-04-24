#include "mud.hpp"
#include "area.hpp"
#include "character.hpp"
#include "repos/arearepository.hpp"

static void ShowArea(std::shared_ptr<Area> area, const Character *ch);

void do_areas(Character *ch, std::string argument)
{
    SetCharacterColor(AT_PLAIN, ch);
    ch->Echo("\r\n   Author    |             Area                     | Recommended |  Enforced\r\n");
    ch->Echo("-------------+--------------------------------------+-------------+-----------\r\n");

    for(auto area = Areas->FirstArea; area; area = area->Next)
    {
        ShowArea(area, ch);
    }
}

static void ShowArea(std::shared_ptr<Area> area, const Character *ch)
{
    ch->Echo("%-12s | %-36s | %4d - %-4d | %3d - %-3d \r\n",
        area->Author.c_str(), area->Name.c_str(), area->LevelRanges.Soft.Low,
        area->LevelRanges.Soft.High, area->LevelRanges.Hard.Low,
        area->LevelRanges.Hard.High);
}

