#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "act.hpp"

void do_invis(Character *ch, std::string arg)
{
    short level = 0;

    if(!arg.empty())
    {
        if(!IsNumber(arg))
        {
            ch->Echo("Usage: invis [<level>]\r\n");
            return;
        }

        level = ToLong(arg);

        if(level < 2 || level > ch->TopLevel)
        {
            ch->Echo("Invalid level.\r\n");
            return;
        }

        if(!IsNpc(ch))
        {
            ch->PCData->WizInvis = level;
            ch->Echo("Wizinvis level set to %d.\r\n", level);
        }

        if(IsNpc(ch))
        {
            ch->MobInvis = level;
            ch->Echo("Mobinvis level set to %d.\r\n", level);
        }
        return;
    }

    if(!IsNpc(ch))
    {
        if(ch->PCData->WizInvis < 2)
            ch->PCData->WizInvis = ch->TopLevel;
    }

    if(IsNpc(ch))
    {
        if(ch->MobInvis < 2)
            ch->MobInvis = ch->TopLevel;
    }

    if(ch->Flags.test(Flag::Plr::WizInvis))
    {
        ch->Flags.reset(Flag::Plr::WizInvis);
        Act(AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, ActTarget::Room);
        ch->Echo("You slowly fade back into existence.\r\n");
    }
    else
    {
        ch->Flags.set(Flag::Plr::WizInvis);
        Act(AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, ActTarget::Room);
        ch->Echo("You slowly vanish into thin air.\r\n");
    }
}
