#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/homerepository.hpp"
#include "editor.hpp"

void do_decorate(std::shared_ptr<Character> ch, std::string argument)
{
    if(ch->IsNpc())
    {
        return;
    }

    auto home = Homes->FindByVnum(ch->InRoom->Vnum);

    if (home == nullptr || StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&RThis isn't your home!\r\n&d");
        return;
    }

    if(!home->Flags.test(Flag::Home::CanDecorate))
    {
        ch->Echo("&RYou need to unlock this ability with UPGRADEHOME.\r\n&d");
        return;
    }

    std::string option;
    argument = OneArgument(argument, option);
    
    if (option.empty())
    {
        ch->Echo("Syntax: decorate <option> [argument]\r\n");
        ch->Echo("\r\n");
        ch->Echo("Available options:\r\n");
        ch->Echo("  * Name: Change the room name.\r\n");
        ch->Echo("  * Description: Edit room description.\r\n");
        return;
    }

    if(StrCmp(option, "name") == 0)
    {
        if(!argument.empty())
        {
            home->RoomName(argument);
            Homes->Save(home);
            ch->Echo("Ok.\r\n");
        }
        else
        {
            ch->Echo("Syntax: decorate name <insert name here>\r\n");
        }
    }
    else if(StrCmp(option, "description") == 0
            || StrCmp(option, "desc") == 0)
    {
        StartEditing(ch, home->Description(),
                     [home](const auto &txt)
                     {
                         home->Description(txt);
                         Homes->Save(home);
                     });
    }
    else
    {
        do_decorate(ch, "");
    }
}
