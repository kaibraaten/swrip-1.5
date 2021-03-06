#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"

void do_remresident(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    auto home = Homes->FindByVnum(ch->InRoom->Vnum);

    if(home == nullptr || StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&RThis isn't your home!\r\n");
        return;
    }

    if(!home->Flags.test(Flag::Home::MultipleResidents))
    {
        ch->Echo("&RYou need to unlock this ability with UPGRADEHOME.\r\n&d");
        return;
    }

    if(argument.empty())
    {
        ch->Echo("&RRemove which resident?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, argument)) == NULL)
    {
        ch->Echo("&RThey aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("&RYou are the home owner. Use sellhome to sell it.\r\n");
        return;
    }

    if(!home->IsResident(victim->Name))
    {
        ch->Echo("&RThat player is not a resident of your home.\r\n");
        return;
    }

    home->RemoveResident(victim->Name);
    Homes->Save(home);

    Act(AT_PLAIN, "You remove $N as a resident.", ch, NULL, victim, ActTarget::Char);
    victim->Echo("You are no longer a resident of this home.\r\n");
}
