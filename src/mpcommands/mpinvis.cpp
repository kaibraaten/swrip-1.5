#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

/* Allow mobiles to go wizinvis with programs -- SB */
void do_mpinvis(Character *ch, std::string arg)
{
    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(arg.empty())
    {
        short level = 0;

        if(!IsNumber(arg))
        {
            ProgBug("Mpinvis - Non numeric argument ", ch);
            return;
        }

        level = ToLong(arg);

        if(level < 2 || level > MAX_LEVEL)
        {
            ProgBug("MPinvis - Invalid level ", ch);
            return;
        }

        ch->MobInvis = level;
        ch->Echo("Mobinvis level set to %d.\r\n", level);
        return;
    }

    if(ch->MobInvis < 2)
        ch->MobInvis = ch->TopLevel;

    if(ch->Flags.test(Flag::Mob::MobInvis))
    {
        ch->Flags.reset(Flag::Mob::MobInvis);
        Act(AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, ActTarget::Room);
        ch->Echo("You slowly fade back into existence.\r\n");
    }
    else
    {
        ch->Flags.set(Flag::Mob::MobInvis);
        Act(AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, ActTarget::Room);
        ch->Echo("You slowly vanish into thin air.\r\n");
    }
}
