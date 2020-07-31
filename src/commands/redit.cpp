#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "reset.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_redit(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    std::string arg3;
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Room> location;
    std::shared_ptr<Room> tmp;
    std::shared_ptr<ExtraDescription> ed;
    std::shared_ptr<Exit> xit, texit;
    int value = 0;
    DirectionType edir = DIR_INVALID;
    vnum_t evnum = INVALID_VNUM;
    std::string origarg = argument;

    if(!ch->Desc)
    {
        ch->Echo("You have no descriptor.\r\n");
        return;
    }

    location = ch->InRoom;

    SmashTilde(argument);
    argument = OneArgument(argument, arg);

    if(arg.empty() || !StrCmp(arg, "?"))
    {
        ch->Echo("Syntax: redit <field> value\r\n");
        ch->Echo("\r\n");
        ch->Echo("Field being one of:\r\n");
        ch->Echo("  name desc wordwrap ed rmed\r\n");
        ch->Echo("  exit bexit exdesc exflags exname exkey\r\n");
        ch->Echo("  flags sector teledelay televnum tunnel\r\n");
        ch->Echo("  rlist exdistance tag\r\n");
        return;
    }

    if(!CanModifyRoom(ch, location))
        return;

    if(!StrCmp(arg, "name"))
    {
        if(argument.empty())
        {
            ch->Echo("Set the room name. A very brief single line room description.\r\n");
            ch->Echo("Usage: redit name <Room summary>\r\n");
            return;
        }

        location->Name = argument;
    }
    else if(!StrCmp(arg, "wordwrap"))
    {
        size_t lineWidth = strtol(argument.c_str(), nullptr, 10);

        if(lineWidth == 0)
        {
            lineWidth = 79;
        }

        location->Description = WordWrap(location->Description, lineWidth);
        ch->Echo("Ok.\r\n");
    }
    else if(StrCmp(arg, "tag") == 0)
    {
        if(argument.empty())
        {
            ch->Echo("Add a tag to a room to be used by the GOTO (and mpgoto) command.\r\n");
            ch->Echo("Usage: redit tag <tag-name>\r\n");
            ch->Echo("       redit tag none\r\n");
        }
        else if(GetRoomFromTag(argument))
        {
            ch->Echo("That tag is already in use.\r\n");
        }
        else if(StrCmp(argument, "none") == 0
           || StrCmp(argument, "clear") == 0)
        {
            location->Tag("");
            ch->Echo("Tag cleared.\r\n");
        }
        else
        {
            location->Tag(argument);
            ch->Echo("Tag set to: %s\r\n", argument.c_str());
        }
    }
    else if(!StrCmp(arg, "desc"))
    {
        StartEditing(ch, location->Description,
                     [location](const auto &txt)
                     {
                         location->Description = txt;
                     });
        SetEditorDesc(ch, "Room %ld (%s) description",
                      location->Vnum, location->Name.c_str());
    }
    else if(!StrCmp(arg, "tunnel"))
    {
        if(argument.empty())
        {
            ch->Echo("Set the maximum characters allowed in the room at one time. (0 = unlimited).\r\n");
            ch->Echo("Usage: redit tunnel <value>\r\n");
            return;
        }

        location->Tunnel = urange(0, ToLong(argument), 1000);
        ch->Echo("Done.\r\n");
    }
    else if(!StrCmp(arg, "ed"))
    {
        if(argument.empty())
        {
            ch->Echo("Create an extra description.\r\n");
            ch->Echo("You must supply keyword(s).\r\n");
            return;
        }

        auto extraDescription = SetRExtra(location, argument);

        StartEditing(ch, extraDescription->Description,
                     [extraDescription](const auto &txt)
                     {
                         extraDescription->Description = txt;
                     });
        SetEditorDesc(ch, "Room %ld (%s) extra description: %s",
                      location->Vnum, location->Name.c_str(), argument.c_str());
    }
    else if(!StrCmp(arg, "rmed"))
    {
        if(argument.empty())
        {
            ch->Echo("Remove an extra description.\r\n");
            ch->Echo("You must supply keyword(s).\r\n");
            return;
        }

        if(DelRExtra(location, argument))
            ch->Echo("Deleted.\r\n");
        else
            ch->Echo("Not found.\r\n");
    }
    else if(!StrCmp(arg, "rlist"))
    {
        auto tarea = location->Area;
        short num = 0;

        if(!tarea->FirstReset)
        {
            ch->Echo("This area has no resets to list.\r\n");
            return;
        }

        for(auto pReset = tarea->FirstReset; pReset; pReset = pReset->Next)
        {
            num++;

            std::string bptr = SPrintReset(ch, pReset, num, true);

            if(bptr.empty())
            {
                continue;
            }

            ch->Echo(bptr);
        }
    }
    else if(!StrCmp(arg, "flags"))
    {
        if(argument.empty())
        {
            ch->Echo("Toggle the room flags.\r\n");
            ch->Echo("Usage: redit flags <flag> [flag]...\r\n");
            ch->Echo("\r\nPossible Flags: \r\n");

            for(size_t i = 0, counter = 0; i < RoomFlags.size(); ++i)
            {
                if(RoomFlags[i][0] != '_')
                {
                    ++counter;

                    ch->Echo("   %s", RoomFlags[i]);

                    if(counter % 4 == 0)
                    {
                        ch->Echo("\r\n");
                    }
                }
            }

            ch->Echo("\r\n");
            return;
        }

        while(!argument.empty())
        {
            argument = OneArgument(argument, arg2);
            size_t bit = GetRoomFlag(arg2);

            if(bit >= Flag::MAX)
            {
                ch->Echo("Unknown flag: %s\r\n", arg2.c_str());
            }
            else
            {
                location->Flags.flip(bit);
            }
        }
    }
    else if(!StrCmp(arg, "teledelay"))
    {
        if(argument.empty())
        {
            ch->Echo("Set the delay of the teleport. (0 = off).\r\n");
            ch->Echo("Usage: redit teledelay <value>\r\n");
        }
        else
        {
            location->TeleDelay = ToLong(argument);
            ch->Echo("Done.\r\n");
        }
    }
    else if(!StrCmp(arg, "televnum"))
    {
        vnum_t televnum = INVALID_VNUM;

        if(argument.empty())
        {
            ch->Echo("Set the vnum of the room to teleport to.\r\n");
            ch->Echo("Usage: redit televnum <vnum>\r\n");
            return;

        }

        televnum = ToLong(argument);

        if(!GetRoom(televnum))
        {
            ch->Echo("&R%ld is not a valid room vnum.\r\n", televnum);
        }
        else
        {
            location->TeleVnum = televnum;
            ch->Echo("Done.\r\n");
        }
    }
    else if(!StrCmp(arg, "sector"))
    {
        if(argument.empty())
        {
            ch->Echo("Set the sector type.\r\n");
            ch->Echo("Usage: redit sector <value>\r\n");
            ch->Echo("\r\nSector Values:\r\n");

            for(SectorType sector = SectorType::Inside;
                sector < SectorType::Max;
                sector = (SectorType)((int)sector + 1))
            {
                ch->Echo("  %s\r\n", SectorNames[(int)sector][1]);
            }

            return;
        }

        location->Sector = GetSectorType(argument);

        if(location->Sector == SectorType::Invalid)
        {
            location->Sector = SectorType::City;
            ch->Echo("Out of range\r\n.");
        }
        else
        {
            ch->Echo("Done.\r\n");
        }
    }
    else if(!StrCmp(arg, "exkey"))
    {
        vnum_t keyvnum = INVALID_VNUM;

        argument = OneArgument(argument, arg2);
        argument = OneArgument(argument, arg3);

        if(arg2.empty() || arg3.empty())
        {
            ch->Echo("Usage: redit exkey <dir> <key vnum>\r\n");
            return;
        }

        if(arg2[0] == '#')
        {
            edir = (DirectionType)ToLong(arg2.substr(1));
            xit = GetExitNumber(location, edir);
        }
        else
        {
            edir = GetDirection(arg2);
            xit = GetExit(location, edir);
        }

        keyvnum = ToLong(arg3);

        if(!xit)
        {
            ch->Echo("No exit in that direction. Use 'redit exit ...' first.\r\n");
        }
        else
        {
            xit->Key = keyvnum;
            ch->Echo("Done.\r\n");
        }
    }
    else if(!StrCmp(arg, "exname"))
    {
        argument = OneArgument(argument, arg2);

        if(arg2.empty())
        {
            ch->Echo("Change or clear exit keywords.\r\n");
            ch->Echo("Usage: redit exname <dir> [keywords]\r\n");
            return;
        }

        if(arg2[0] == '#')
        {
            edir = (DirectionType)ToLong(arg2.substr(1));
            xit = GetExitNumber(location, edir);
        }
        else
        {
            edir = GetDirection(arg2);
            xit = GetExit(location, edir);
        }

        if(!xit)
        {
            ch->Echo("No exit in that direction.  Use 'redit exit ...' first.\r\n");
        }
        else
        {
            xit->Keyword = argument;
            ch->Echo("Done.\r\n");
        }
    }
    else if(!StrCmp(arg, "exflags"))
    {
        if(argument.empty())
        {
            ch->Echo("Toggle or display exit flags.\r\n");
            ch->Echo("Usage: redit exflags <dir> <flag> [flag]...\r\n");
            ch->Echo("\r\nExit flags:\r\n");
            ch->Echo("  isdoor, closed, locked, can_look, searchable, can_leave, can_climb,\r\n");
            ch->Echo("  nopassdoor, secret, pickproof, fly, climb, dig, window, auto, can_enter\r\n");
            ch->Echo("  hidden, no_mob, bashproof, bashed\r\n");
            return;
        }

        argument = OneArgument(argument, arg2);

        if(arg2[0] == '#')
        {
            edir = (DirectionType)ToLong(arg2.substr(1));
            xit = GetExitNumber(location, edir);
        }
        else
        {
            edir = GetDirection(arg2);
            xit = GetExit(location, edir);
        }

        if(!xit)
        {
            ch->Echo("No exit in that direction. Use 'redit exit ...' first.\r\n");
            return;
        }

        if(argument.empty())
        {
            sprintf(buf, "Flags for exit direction: %d  Keywords: %s  Key: %ld\r\n[ ",
                    xit->Direction, xit->Keyword.c_str(), xit->Key);

            for(size_t bit = 0; bit <= Flag::MAX; ++bit)
            {
                if(xit->Flags.test(bit))
                {
                    strcat(buf, ExitFlags[bit]);
                    strcat(buf, " ");
                }
            }

            strcat(buf, "]\r\n");
            ch->Echo("%s", buf);
            return;
        }

        while(!argument.empty())
        {
            argument = OneArgument(argument, arg2);
            value = GetExitFlag(arg2);

            if(value < 0)
                ch->Echo("Unknown flag: %s\r\n", arg2.c_str());
            else
                xit->Flags.flip(value);
        }
    }
    else if(!StrCmp(arg, "exit"))
    {
        bool addexit = false;
        bool numnotdir = false;

        argument = OneArgument(argument, arg2);
        argument = OneArgument(argument, arg3);

        if(arg2.empty())
        {
            ch->Echo("Create, change or remove an exit.\r\n");
            ch->Echo("Usage: redit exit <dir> [room] [flags] [key] [keywords]\r\n");
            return;
        }

        switch(arg2[0])
        {
        default:
            edir = GetDirection(arg2);
            break;

        case '+':
            edir = GetDirection(arg2.substr(1));
            addexit = true;
            break;

        case '#':
            edir = (DirectionType)ToLong(arg2.substr(1));
            numnotdir = true;
            break;
        }

        if(arg3.empty())
            evnum = INVALID_VNUM;
        else
            evnum = ToLong(arg3);

        if(numnotdir)
        {
            if((xit = GetExitNumber(location, edir)) != NULL)
            {
                edir = xit->Direction;
            }
        }
        else
        {
            xit = GetExit(location, edir);
        }

        if(evnum == INVALID_VNUM)
        {
            if(xit)
            {
                ExtractExit(location, xit);
                ch->Echo("Exit removed.\r\n");
                return;
            }

            ch->Echo("No exit in that direction.\r\n");
            return;
        }

        if(evnum < 1 || evnum > MAX_VNUM)
        {
            ch->Echo("Invalid room number.\r\n");
            return;
        }

        if((tmp = GetRoom(evnum)) == NULL)
        {
            ch->Echo("Non-existant room.\r\n");
            return;
        }

        if(GetTrustLevel(ch) <= LEVEL_IMMORTAL && tmp->Area != location->Area)
        {
            ch->Echo("You can't make an exit to that room.\r\n");
            return;
        }

        if(addexit || !xit)
        {
            if(numnotdir)
            {
                ch->Echo("Cannot add an exit by number, sorry.\r\n");
                return;
            }

            if(addexit && xit && GetExitTo(location, edir, tmp->Vnum))
            {
                ch->Echo("There is already an exit in that direction leading to that location.\r\n");
                return;
            }

            xit = MakeExit(location, tmp, edir);
            xit->Key = -1;
            Act(AT_IMMORT, "$n reveals a hidden passage!", ch, NULL, NULL, ActTarget::Room);
        }
        else
        {
            Act(AT_IMMORT, "Something is different...", ch, NULL, NULL, ActTarget::Room);
        }

        if(xit->ToRoom != tmp)
        {
            xit->ToRoom = tmp;
            xit->Vnum = evnum;
            texit = GetExitTo(xit->ToRoom, GetReverseDirection(edir), location->Vnum);

            if(texit)
            {
                texit->ReverseExit = xit;
                xit->ReverseExit = texit;
            }
        }

        argument = OneArgument(argument, arg3);

        if(!arg3.empty())
        {
            xit->Flags = ToLong(arg3);
        }

        if(!argument.empty())
        {
            vnum_t ekey = INVALID_VNUM;

            OneArgument(argument, arg3);
            ekey = ToLong(arg3);

            if(ekey != 0 || arg3[0] == '0')
            {
                argument = OneArgument(argument, arg3);
                xit->Key = ekey;
            }

            if(argument.empty())
            {
                xit->Keyword = argument;
            }
        }
        
        ch->Echo("Done.\r\n");
    }
    else if(!StrCmp(arg, "bexit"))
    {
        std::shared_ptr<Exit> this_exit, rxit;
        std::string tmpcmd;
        vnum_t vnum = INVALID_VNUM;
        int exnum = 0;
        std::string rvnum;
        bool numnotdir = false;

        argument = OneArgument(argument, arg2);
        argument = OneArgument(argument, arg3);

        if(arg2.empty())
        {
            ch->Echo("Create, change or remove a two-way exit.\r\n");
            ch->Echo("Usage: redit bexit <dir> [room] [flags] [key] [keywords]\r\n");
            return;
        }

        switch(arg2[0])
        {
        default:
            edir = GetDirection(arg2);
            break;

        case '#':
            numnotdir = true;
            edir = (DirectionType)ToLong(arg2.substr(1));
            break;

        case '+':
            edir = GetDirection(arg2.substr(1));
            break;
        }

        auto tmploc = location;
        exnum = edir;

        if(numnotdir)
        {
            if((this_exit = GetExitNumber(tmploc, edir)) != NULL)
            {
                edir = this_exit->Direction;
            }
        }
        else
        {
            this_exit = GetExit(tmploc, edir);
        }

        if(this_exit)
        {
            vnum = this_exit->Vnum;

            if(!arg3.empty())
                rvnum = FormatString("%ld", tmploc->Vnum);

            if(this_exit->ToRoom)
                rxit = GetExit(this_exit->ToRoom, GetReverseDirection(edir));
            else
                rxit = NULL;
        }

        tmpcmd = FormatString("exit %s %s %s",
                              arg2.c_str(), arg3.c_str(), argument.c_str());
        do_redit(ch, tmpcmd);

        if(numnotdir)
            this_exit = GetExitNumber(tmploc, exnum);
        else
            this_exit = GetExit(tmploc, edir);

        if(!rxit && this_exit)
        {
            vnum = this_exit->Vnum;

            if(!arg3.empty())
                rvnum = FormatString("%ld", tmploc->Vnum);

            if(this_exit->ToRoom)
                rxit = GetExit(this_exit->ToRoom, GetReverseDirection(edir));
            else
                rxit = NULL;
        }

        if(vnum != INVALID_VNUM)
        {
            tmpcmd = FormatString("%ld redit exit %d %s %s",
                                  vnum, GetReverseDirection(edir),
                                  rvnum.c_str(), argument.c_str());
            do_at(ch, tmpcmd);
        }
    }
    else if(!StrCmp(arg, "exdistance"))
    {
        argument = OneArgument(argument, arg2);

        if(arg2.empty())
        {
            ch->Echo("Set the distance (in rooms) between this room, and the destination room.\r\n");
            ch->Echo("Usage: redit exdistance <dir> [distance]\r\n");
            return;
        }

        if(arg2[0] == '#')
        {
            edir = (DirectionType)ToLong(arg2.substr(1));
            xit = GetExitNumber(location, edir);
        }
        else
        {
            edir = GetDirection(arg2);
            xit = GetExit(location, edir);
        }

        if(xit)
        {
            xit->Distance = urange(1, ToLong(argument), 50);
            ch->Echo("Done.\r\n");
        }
        else
        {
            ch->Echo("No exit in that direction. Use 'redit exit ...' first.\r\n");
        }
    }
    else if(!StrCmp(arg, "exdesc"))
    {
        argument = OneArgument(argument, arg2);

        if(arg2.empty())
        {
            ch->Echo("Create or clear a description for an exit.\r\n");
            ch->Echo("Usage: redit exdesc <dir> [description]\r\n");
            return;
        }

        if(arg2[0] == '#')
        {
            edir = (DirectionType)ToLong(arg2.substr(1));
            xit = GetExitNumber(location, edir);
        }
        else
        {
            edir = GetDirection(arg2);
            xit = GetExit(location, edir);
        }

        if(xit)
        {
            if(argument.empty())
            {
                xit->Description.erase();
            }
            else
            {
                xit->Description = FormatString("%s\r\n", argument.c_str());
            }

            ch->Echo("Done.\r\n");
        }
        else
        {
            ch->Echo("No exit in that direction. Use 'redit exit ...' first.\r\n");
        }
    }
    else
    {
        do_redit(ch, "");
    }
}
