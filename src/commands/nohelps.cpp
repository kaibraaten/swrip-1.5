#include "command.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "help.hpp"
#include "skill.hpp"
#include "area.hpp"
#include "repos/arearepository.hpp"

static void ShowMissingHelpsForCommands(const std::shared_ptr<Character> ch);
static void ShowMissingHelpsForSkills(const std::shared_ptr<Character> ch);
static void ShowMissingHelpsForAreas(const std::shared_ptr<Character> ch);

void do_nohelps(std::shared_ptr<Character> ch, std::string arg)
{
    if (!IsImmortal(ch) || IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if (arg.empty() || !StrCmp(arg, "all"))
    {
        do_nohelps(ch, "Commands");
        ch->Echo("\r\n");
        do_nohelps(ch, "Skills");
        ch->Echo("\r\n");
        do_nohelps(ch, "Areas");
        ch->Echo("\r\n");
        return;
    }

    if (!StrCmp(arg, "commands"))
    {
        ShowMissingHelpsForCommands(ch);
    }
    else if (!StrCmp(arg, "skills")
        || !StrCmp(arg, "spells"))
    {
        ShowMissingHelpsForSkills(ch);
    }
    else if (!StrCmp(arg, "areas"))
    {
        ShowMissingHelpsForAreas(ch);
    }
    else
    {
        ch->Echo("Syntax:  nohelps <all|areas|commands|skills>\r\n");
    }
}

static void ShowMissingHelpsForCommands(const std::shared_ptr<Character> ch)
{
    const List *commands = GetEntities(CommandRepository);
    ListIterator *iterator = AllocateListIterator(commands);
    int col = 0;
    const int NUM_COLUMNS = 5;

    ch->Echo("&C&YCommands for which there are no help files:\r\n\r\n");

    while (ListHasMoreElements(iterator))
    {
        const Command *command = (const Command*)GetListData(iterator);
        MoveToNextListElement(iterator);

        if (!GetHelpFile(ch, command->Name))
        {
            ch->Echo("&W%-15s", command->Name.c_str());

            if (++col % NUM_COLUMNS == 0)
            {
                ch->Echo("\r\n");
            }
        }
    }

    ch->Echo("\r\n");
}

static void ShowMissingHelpsForSkills(const std::shared_ptr<Character> ch)
{
    int sn = 0;
    int col = 0;
    const int NUM_COLUMNS = 4;

    ch->Echo("&CSkills/Spells for which there are no help files:\r\n\r\n");

    for (sn = 0; sn < TopSN && SkillTable[sn] != nullptr; sn++)
    {
        std::shared_ptr<Skill> skill = SkillTable[sn];

        if (skill == nullptr || !GetHelpFile(ch, skill->Name))
        {
            ch->Echo("&W%-20s", skill->Name.c_str());

            if (++col % NUM_COLUMNS == 0)
            {
                ch->Echo("\r\n");
            }
        }
    }

    ch->Echo("\r\n");
}

static void ShowMissingHelpsForAreas(const std::shared_ptr<Character> ch)
{
    int col = 0;
    const int NUM_COLUMNS = 2;

    ch->Echo("&GAreas for which there are no help files:\r\n\r\n");

    for (auto tArea : Areas)
    {
        if (!GetHelpFile(ch, tArea->Name))
        {
            ch->Echo("&W%-35s", tArea->Name.c_str());

            if (++col % NUM_COLUMNS == 0)
            {
                ch->Echo("\r\n");
            }
        }
    }

    ch->Echo("\r\n");
}
