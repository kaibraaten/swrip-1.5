#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "room.hpp"
#include "repos/planetrepository.hpp"
#include "repos/arearepository.hpp"
#include "vnumconverter.hpp"

void do_aset(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Area> tarea;
    std::string arg1;
    std::string arg2;
    std::string arg3;
    int value = 0;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    value = strtol(argument.c_str(), nullptr, 10);

    if (arg1.empty() || arg2.empty())
    {
        ch->Echo("Usage: aset <area filename> <field> <value>\r\n");
        ch->Echo("\r\nField being one of:\r\n");
        ch->Echo("  low_room hi_room low_obj hi_obj low_mob hi_mob\r\n");
        ch->Echo("  name filename low_soft hi_soft low_hard hi_hard\r\n");
        ch->Echo("  author resetmsg resetfreq flags planet\r\n");
        return;
    }

    tarea = Areas->Find(arg1);
    
    if (tarea == nullptr)
    {
        tarea = Areas->FindProtoArea(arg1);
    }
    
    if (!StrCmp(arg1, "this"))
    {
        tarea = ch->InRoom->Area;
    }

    if (tarea == nullptr)
    {
        ch->Echo("Area not found.\r\n");
        return;
    }

    if (!StrCmp(arg2, "name"))
    {
        tarea->Name = argument;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "planet"))
    {
        std::shared_ptr<Planet> planet = Planets->FindByName(argument);

        if (planet)
        {
            if (tarea->Planet)
            {
                std::shared_ptr<Planet> old_planet = tarea->Planet;
                old_planet->Remove(tarea);
                tarea->Planet = nullptr;
            }

            planet->Add(tarea);
            tarea->Planet = planet;
            Planets->Save(planet);
        }

        return;
    }

    if (!StrCmp(arg2, "filename"))
    {
        if(tarea->Flags.test(Flag::Area::Prototype))
        {
            ch->Echo("Can't rename prototype areas.\r\n");
            return;
        }

        auto vnumConverter = VnumConverter::Create(tarea);
        Areas->ChangeFilename(tarea, vnumConverter, argument);
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_economy"))
    {
        tarea->LowEconomy = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "high_economy"))
    {
        tarea->HighEconomy = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_room"))
    {
        tarea->VnumRanges.Room.First = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "hi_room"))
    {
        tarea->VnumRanges.Room.Last = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_obj"))
    {
        tarea->VnumRanges.Object.First = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "hi_obj"))
    {
        tarea->VnumRanges.Object.Last = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_mob"))
    {
        tarea->VnumRanges.Mob.First = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "hi_mob"))
    {
        tarea->VnumRanges.Mob.Last = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_soft"))
    {
        if (value < 0 || value > MAX_LEVEL)
        {
            ch->Echo("That is not an acceptable value.\r\n");
            return;
        }

        tarea->LevelRanges.Soft.Low = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "hi_soft"))
    {
        if (value < 0 || value > MAX_LEVEL)
        {
            ch->Echo("That is not an acceptable value.\r\n");
            return;
        }

        tarea->LevelRanges.Soft.High = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "low_hard"))
    {
        if (value < 0 || value > MAX_LEVEL)
        {
            ch->Echo("That is not an acceptable value.\r\n");
            return;
        }

        tarea->LevelRanges.Hard.Low = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "hi_hard"))
    {
        if (value < 0 || value > MAX_LEVEL)
        {
            ch->Echo("That is not an acceptable value.\r\n");
            return;
        }

        tarea->LevelRanges.Hard.High = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "author"))
    {
        tarea->Author = argument;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "resetmsg"))
    {
        if (!StrCmp(argument, "clear"))
        {
            tarea->ResetMessage.erase();
        }
        else
        {
            tarea->ResetMessage = argument;
        }

        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "resetfreq"))
    {
        tarea->ResetFrequency = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "flags"))
    {
        if (argument.empty())
        {
            ch->Echo("Usage: aset <filename> flags <flag> [flag]...\r\n");
            return;
        }

        while (!argument.empty())
        {
            argument = OneArgument(argument, arg3);
            value = GetAreaFlag(arg3);

            if (value < 0 || static_cast<size_t>(value) > Flag::MAX)
            {
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str());
            }
            else
            {
                tarea->Flags.flip(value);
            }
        }

        return;
    }

    do_aset(ch, "");
}

