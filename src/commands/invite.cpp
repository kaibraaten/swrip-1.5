#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"

void do_invite(std::shared_ptr<Character> ch, std::string argument)
{
    auto home = ch->InRoom;
    Character *victim = nullptr;

    if(!home->Flags.test(Flag::Room::PlayerHome)
       || !Homes->IsResidentOf(ch->Name, home->Vnum))
    {
        ch->Echo("&RThis isn't your home!\r\n");
        return;
    }

    if(argument.empty())
    {
        ch->Echo("&RInvite who?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, argument)) == NULL)
    {
        ch->Echo("&RThey aren't here.\r\n");
        return;
    }

    if(victim->BuzzedFromRoom == NULL && victim->BuzzedHome != home)
    {
        ch->Echo("&RThey didn't buzz your home.\r\n");
        return;
    }

    if(victim->BuzzedFromRoom != victim->InRoom)
    {
        ch->Echo("&RThey aren't outside your home anymore.\r\n");
        return;
    }

    Act(AT_ACTION, "You invite $N to enter, and $E steps inside.", ch, NULL, victim, ActTarget::Char);
    Act(AT_ACTION, "$n invites you to enter, and you step inside.", ch, NULL, victim, ActTarget::Vict);
    CharacterFromRoom(victim);
    CharacterToRoom(victim, home);
    victim->BuzzedHome = NULL;
    victim->BuzzedFromRoom = NULL;
}
