#include <string.h>
#include "character.hpp"
#include "mud.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "room.hpp"
#include "repos/arearepository.hpp"

void do_astat(Character *ch, std::string argument)
{
    std::shared_ptr<Area> tarea;
    bool proto = false;
    bool found = false;
    std::string filename;

    if (!StrCmp(argument, "this"))
    {
        filename = ch->InRoom->Area->Filename;
    }
    else
    {
        filename = argument;
    }

    for (tarea = Areas->FirstArea; tarea; tarea = tarea->Next)
        if (!StrCmp(tarea->Filename, filename))
        {
            found = true;
            break;
        }

    if (!found)
        for (tarea = Areas->FirstBuild; tarea; tarea = tarea->Next)
            if (!StrCmp(tarea->Filename, filename))
            {
                found = true;
                proto = true;
                break;
            }

    if (!found)
    {
        if (!filename.empty())
        {
            ch->Echo("Area not found. Check 'zones'.\r\n");
            return;
        }
        else
        {
            tarea = ch->InRoom->Area;
        }
    }

    ch->Echo("Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
        tarea->Name.c_str(),
        tarea->Filename.c_str(),
        proto ? "yes" : "no");

    if (!proto)
    {
        ch->Echo("Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
            tarea->MaxPlayers,
            tarea->IllegalPk,
            tarea->GoldLooted);

        if (tarea->HighEconomy)
            ch->Echo("Area economy: %d billion and %d credits.\r\n",
                tarea->HighEconomy,
                tarea->LowEconomy);
        else
            ch->Echo("Area economy: %d credits.\r\n", tarea->LowEconomy);

        if (tarea->Planet)
            ch->Echo("Planet: %s.\r\n", tarea->Planet->Name.c_str());

        ch->Echo("Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
            tarea->MDeaths,
            tarea->MKills,
            tarea->PDeaths,
            tarea->PKills);
    }

    ch->Echo("Author: %s\r\nAge: %d   Number of players: %d\r\n",
        tarea->Author.c_str(),
        tarea->Age,
        tarea->NumberOfPlayers);
    ch->Echo("Area flags: %s\r\n", FlagString(tarea->Flags, AreaFlags).c_str());
    ch->Echo("low_room: %5ld  hi_room: %ld\r\n",
        tarea->VnumRanges.Room.First,
        tarea->VnumRanges.Room.Last);
    ch->Echo("low_obj : %5ld  hi_obj : %ld\r\n",
        tarea->VnumRanges.Object.First,
        tarea->VnumRanges.Object.Last);
    ch->Echo("low_mob : %5ld  hi_mob : %ld\r\n",
        tarea->VnumRanges.Mob.First,
        tarea->VnumRanges.Mob.Last);
    ch->Echo("soft range: %d - %d.  hard range: %d - %d.\r\n",
        tarea->LevelRanges.Soft.Low,
        tarea->LevelRanges.Soft.High,
        tarea->LevelRanges.Hard.Low,
        tarea->LevelRanges.Hard.High);
    ch->Echo("Resetmsg: %s\r\n",
        !tarea->ResetMessage.empty() ? tarea->ResetMessage.c_str()
        : "(default)");
    ch->Echo("Reset frequency: %d minutes.\r\n",
        tarea->ResetFrequency ? tarea->ResetFrequency : 15);
}
