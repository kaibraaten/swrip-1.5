#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

static void RemoveAreaNames(std::string inp, std::string &out);
static void ExtractAreaNames(std::string inp, std::string &out);

void do_bestowarea(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    Character *victim = nullptr;

    argument = OneArgument(argument, arg);

    if (GetTrustLevel(ch) < LEVEL_SUB_IMPLEM)
    {
        ch->Echo("Sorry...\r\n");
        return;
    }

    if (arg.empty())
    {
        ch->Echo("Syntax:\r\n"
            "bestowarea <victim> <filename>.are\r\n"
            "bestowarea <victim> none             removes bestowed areas\r\n"
            "bestowarea <victim> list             lists bestowed areas\r\n"
            "bestowarea <victim>                  lists bestowed areas\r\n");
        return;
    }

    if (!(victim = GetCharacterAnywhere(ch, arg)))
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if (IsNpc(victim))
    {
        ch->Echo("You can't give special abilities to a mob!\r\n");
        return;
    }

    if (GetTrustLevel(victim) < LEVEL_IMMORTAL)
    {
        ch->Echo("They aren't an immortal.\r\n");
        return;
    }

    if (argument.empty() || !StrCmp(argument, "list"))
    {
        std::string buf;
        ExtractAreaNames(victim->PCData->Bestowments, buf);
        ch->Echo("Bestowed areas: %s\r\n", buf.c_str());
        return;
    }

    if (!StrCmp(argument, "none"))
    {
        std::string buf;
        RemoveAreaNames(victim->PCData->Bestowments, buf);
        victim->PCData->Bestowments = buf;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StringEndsWith(argument, ".are"))
    {
        ch->Echo("You can only bestow an area name\r\n");
        ch->Echo("E.G. bestow joe sam.are\r\n");
        return;
    }

    victim->PCData->Bestowments += " " + argument;
    victim->Echo("%s has bestowed on you the area: %s\r\n",
        ch->Name.c_str(), argument.c_str());
    ch->Echo("Done.\r\n");
}

/*
 * Extract area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "joe.are susan.are"
 * - Gorog
 */
static void ExtractAreaNames(std::string inp, std::string &out)
{
    out.erase();

    while (!inp.empty())
    {
        std::string segment;
        inp = OneArgument(inp, segment);

        if (segment.size() >= 5 && !StringSuffix(".are", segment))
        {
            if (!out.empty())
            {
                out += " ";
            }

            out += segment;
        }
    }
}

/*
 * Remove area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "aset sedit cset"
 * - Gorog
 */
static void RemoveAreaNames(std::string inp, std::string &out)
{
    out.erase();

    while (!inp.empty())
    {
        std::string segment;
        inp = OneArgument(inp, segment);

        if (segment.size() >= 5 && StringSuffix(".are", segment))
        {
            if (!out.empty())
            {
                out += " ";
            }

            out += segment;
        }
    }
}
