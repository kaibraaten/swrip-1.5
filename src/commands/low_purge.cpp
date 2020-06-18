#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_low_purge(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;
    std::shared_ptr<Object> obj;

    if(arg.empty())
    {
        ch->Echo("Purge what?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL
       && (obj = GetObjectHere(ch, arg)) == NULL)
    {
        ch->Echo("You can't find that here.\r\n");
        return;
    }

    if(obj)
    {
        SeparateOneObjectFromGroup(obj);
        Act(AT_IMMORT, "$n purges $p!", ch, obj, NULL, ActTarget::Room);
        Act(AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, ActTarget::Char);
        ExtractObject(obj);
        return;
    }

    if(!IsNpc(victim))
    {
        ch->Echo("Not on PC's.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You cannot purge yourself!\r\n");
        return;
    }

    Act(AT_IMMORT, "$n purges $N.", ch, NULL, victim, ActTarget::NotVict);
    Act(AT_IMMORT, "You make $N disappear in a puff of smoke!",
        ch, NULL, victim, ActTarget::Char);
    ExtractCharacter(victim, true);
}


