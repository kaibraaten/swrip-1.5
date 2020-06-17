#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "object.hpp"
#include "act.hpp"

void do_use(Character *ch, std::string argument)
{
    std::string arg;
    std::string argd;
    Character *victim = nullptr;
    std::shared_ptr<Object> device;
    std::shared_ptr<Object> obj;
    ch_ret retcode = rNONE;

    argument = OneArgument(argument, argd);
    argument = OneArgument(argument, arg);

    if(!StrCmp(arg, "on"))
        argument = OneArgument(argument, arg);

    if(argd.empty())
    {
        ch->Echo("Use what?\r\n");
        return;
    }

    if((device = GetEquipmentOnCharacter(ch, WEAR_HOLD)) == NULL ||
       !NiftyIsName(argd, device->Name))
    {
        do_takedrug(ch, argd);
        return;
    }

    if(device->ItemType == ITEM_SPICE)
    {
        do_takedrug(ch, argd);
        return;
    }

    if(device->ItemType != ITEM_DEVICE)
    {
        ch->Echo("You can't figure out what it is your supposed to do with it.\r\n");
        return;
    }

    if(device->Value[OVAL_DEVICE_CHARGES] <= 0)
    {
        ch->Echo("It has no more charge left.");
        return;
    }

    obj = NULL;

    if(arg.empty())
    {
        if(ch->Fighting)
        {
            victim = GetFightingOpponent(ch);
        }
        else
        {
            ch->Echo("Use on whom or what?\r\n");
            return;
        }
    }
    else
    {
        if((victim = GetCharacterInRoom(ch, arg)) == NULL
           && (obj = GetObjectHere(ch, arg)) == NULL)
        {
            ch->Echo("You can't find your target.\r\n");
            return;
        }
    }

    SetWaitState(ch, 1 * PULSE_VIOLENCE);

    if(device->Value[OVAL_DEVICE_CHARGES] > 0)
    {
        device->Value[OVAL_DEVICE_CHARGES]--;

        if(victim)
        {
            if(!ObjProgUseTrigger(ch, device, victim, nullptr, nullptr))
            {
                Act(AT_MAGIC, "$n uses $p on $N.", ch, device, victim, ActTarget::Room);
                Act(AT_MAGIC, "You use $p on $N.", ch, device, victim, ActTarget::Char);
            }
        }
        else
        {
            if(!ObjProgUseTrigger(ch, device, nullptr, obj, nullptr))
            {
                Act(AT_MAGIC, "$n uses $p on $P.", ch, device, obj, ActTarget::Room);
                Act(AT_MAGIC, "You use $p on $P.", ch, device, obj, ActTarget::Char);
            }
        }

        retcode = CastSpellWithObject(device->Value[OVAL_DEVICE_SPELL],
                                      device->Value[OVAL_DEVICE_LEVEL], ch, victim, obj);

        if(retcode == rCHAR_DIED || retcode == rBOTH_DIED)
        {
            Log->Bug("do_use: char died");
            return;
        }
    }
}
