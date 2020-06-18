#include <sstream>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"

void do_rstat(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Room> location;
    int cnt = 0;
    static const char *const dir_text[] = { "n", "e", "s", "w", "u", "d", "ne", "nw", "se", "sw", "?" };

    OneArgument(argument, arg);

    if(GetTrustLevel(ch) < LEVEL_IMMORTAL)
    {
        std::shared_ptr<Area> pArea;

        if(!ch->PCData || !(pArea = ch->PCData->Build.Area))
        {
            ch->Echo("You must have an assigned area to goto.\r\n");
            return;
        }

        if(ch->InRoom->Vnum < pArea->VnumRanges.Room.First
           || ch->InRoom->Vnum > pArea->VnumRanges.Room.Last)
        {
            ch->Echo("You can only rstat within your assigned range.\r\n");
            return;
        }
    }

    if(!StrCmp(arg, "exits"))
    {
        location = ch->InRoom;

        ch->Echo("Exits for room '%s.' vnum %ld\r\n",
                 location->Name.c_str(),
                 location->Vnum);
        cnt = 0;

        for(auto pexit : location->Exits())
        {
            ch->Echo("%2d) %2s to %-5ld.  Key: %ld  Flags: %lu  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %ld  Exit's RoomVnum: %ld  Distance: %d\r\n",
                     ++cnt,
                     dir_text[pexit->Direction],
                     pexit->ToRoom ? pexit->ToRoom->Vnum : 0,
                     pexit->Key,
                     pexit->Flags.to_ulong(),
                     pexit->Keyword.c_str(),
                     !pexit->Description.empty() ? pexit->Description.c_str() : "(none).\r\n",
                     pexit->ReverseExit ? pexit->ReverseExit->Vnum : 0,
                     pexit->ReverseVnum,
                     pexit->Distance);
        }

        return;
    }

    location = arg.empty() ? ch->InRoom : FindLocation(ch, arg);

    if(!location)
    {
        ch->Echo("No such location.\r\n");
        return;
    }

    if(ch->InRoom != location && IsRoomPrivate(ch, location))
    {
        if(GetTrustLevel(ch) < LEVEL_GREATER)
        {
            ch->Echo("That room is private right now.\r\n");
            return;
        }
        else
        {
            ch->Echo("Overriding private flag!\r\n");
        }
    }

    ch->Echo("Name: %s.\r\nArea: %s  Filename: %s\r\n",
             location->Name.c_str(),
             location->Area ? location->Area->Name.c_str() : "None????",
             location->Area ? location->Area->Filename.c_str() : "None????");

    ch->Echo("Vnum: %ld  Sector: %s  Light: %d  TeleDelay: %d  TeleVnum: %ld  Tunnel: %d\r\n",
             location->Vnum,
             SectorNames[location->Sector][0],
             location->Light,
             location->TeleDelay,
             location->TeleVnum,
             location->Tunnel);

    ch->Echo("Room flags: %s\r\n",
             FlagString(location->Flags, RoomFlags).c_str());
    ch->Echo("Description:\r\n%s", location->Description.c_str());

    if(!location->ExtraDescriptions().empty())
    {
        std::ostringstream outbuf;
        ch->Echo("Extra description keywords: '");

        for(auto ed : location->ExtraDescriptions())
        {
            outbuf << ed->Keyword << " ";
        }

        ch->Echo("%s'.\r\n", TrimString(outbuf.str()).c_str());
    }

    ch->Echo("Characters:");

    for(auto rch : location->Characters())
    {
        if(CanSeeCharacter(ch, rch))
        {
            std::string buf;
            ch->Echo(" ");
            OneArgument(rch->Name, buf);
            ch->Echo(buf);
        }
    }

    ch->Echo(".\r\nObjects:   ");

    for(auto obj : location->Objects())
    {
        std::string buf;
        ch->Echo(" ");
        OneArgument(obj->Name, buf);
        ch->Echo(buf);
    }

    ch->Echo(".\r\n");

    if(!location->Exits().empty())
    {
        ch->Echo("------------------- EXITS -------------------\r\n");
    }

    cnt = 0;

    for(auto pexit : location->Exits())
    {
        ch->Echo("%2d) %-2s to %-5ld.  Key: %ld  Flags: %lu  Keywords: %s.\r\n",
                 ++cnt,
                 dir_text[pexit->Direction],
                 pexit->ToRoom ? pexit->ToRoom->Vnum : 0,
                 pexit->Key,
                 pexit->Flags.to_ulong(),
                 !pexit->Keyword.empty() ? pexit->Keyword.c_str() : "(none)");
    }
}
