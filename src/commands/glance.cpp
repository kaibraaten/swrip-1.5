#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

/* A much simpler version of look, this function will show you only
   the condition of a mob or pc, or if used without an argument, the
   same you would see if you enter the room and have config +brief.
   -- Narn, winter '96
*/
void do_glance(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::shared_ptr<Character> victim;

    if(!ch->Desc)
        return;

    if(ch->Position < POS_SLEEPING)
    {
        ch->Echo("You can't see anything but stars!\r\n");
        return;
    }

    if(ch->Position == POS_SLEEPING)
    {
        ch->Echo("You can't see anything, you're sleeping!\r\n");
        return;
    }

    if(IsBlind(ch))
    {
        ch->Echo("You can't see a thing!\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);

    if(arg1.empty())
    {
        auto flags = ch->Flags;
        ch->Flags.set(Flag::Plr::Brief);
        do_look(ch, "auto");
        ch->Flags = flags;
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg1)) == NULL)
    {
        ch->Echo("They're not here.");
        return;
    }
    else
    {
        if(CanSeeCharacter(victim, ch))
        {
            Act(AT_ACTION, "$n glances at you.", ch, NULL, victim, ActTarget::Vict);
            Act(AT_ACTION, "$n glances at $N.", ch, NULL, victim, ActTarget::NotVict);
        }

        ShowCharacterCondition(ch, victim);
        return;
    }
}
