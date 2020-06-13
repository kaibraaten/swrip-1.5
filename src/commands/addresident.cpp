#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"

void do_addresident(Character *ch, std::string argument)
{
    auto home = Homes->FindByVnum(ch->InRoom->Vnum);

    if (home == nullptr || StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&RThis isn't your home!\r\n&d");
        return;
    }

    if(!home->Flags.test(Flag::Home::MultipleResidents))
    {
        ch->Echo("&RYou need to unlock this ability with UPGRADEHOME.\r\n&d");
        return;
    }
    
    if (argument.empty())
    {
        ch->Echo("&RAdd who as a resident?\r\n&d");
        return;
    }

    Character *victim = GetCharacterInRoom(ch, argument);

    if (victim == nullptr)
    {
        ch->Echo("&RThey aren't here.\r\n&d");
        return;
    }

    if (victim == ch)
    {
        ch->Echo("&RNot only are you a resident of this home, but you are its owner.\r\n&d");
        return;
    }

    if(home->IsResident(victim->Name))
    {
        ch->Echo("&R%s is already a resident of this home.\r\n&d", PERS(victim, ch).c_str());
        return;
    }
    
    auto resident = std::make_shared<Resident>();
    resident->Name = victim->Name;
    home->Add(resident);
    Homes->Save(home);

    Act(AT_PLAIN, "You add $N as a resident.", ch, NULL, victim, TO_CHAR);
    victim->Echo("You are now a resident of this home.\r\n");
}
