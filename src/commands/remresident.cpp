#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "home.hpp"
#include "repos/homerepository.hpp"

void do_remresident(Character *ch, std::string argument)
{
    Character *victim = nullptr;
    auto home = Homes->FindByVnum(ch->InRoom->Vnum);

    if (home == nullptr || StrCmp(home->Owner(), ch->Name) != 0)
    {
        ch->Echo("&RThis isn't your home!\r\n");
        return;
    }

    if (argument.empty())
    {
        ch->Echo("&RRemove which resident?\r\n");
        return;
    }

    if ((victim = GetCharacterInRoom(ch, argument)) == NULL)
    {
        ch->Echo("&RThey aren't here.\r\n");
        return;
    }

    if (victim == ch)
    {
        ch->Echo("&RYou are the home owner. Use sellhome to sell it.\r\n");
        return;
    }

    if (!home->IsResident(victim->Name))
    {
        ch->Echo("&RThat player is not a resident of your home.\r\n");
        return;
    }

    home->RemoveResident(victim->Name);
    Homes->Save(home);

    Act(AT_PLAIN, "You remove $N as a resident.", ch, NULL, victim, TO_CHAR);
    victim->Echo("You are no longer a resident of this home.\r\n");
}
