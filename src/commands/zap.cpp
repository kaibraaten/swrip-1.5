#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "object.hpp"
#include "act.hpp"

void do_zap(Character *ch, std::string arg)
{
    Character *victim = nullptr;
    Object *wand = nullptr;
    Object *obj = nullptr;
    ch_ret retcode = rNONE;

    if(arg.empty() && !ch->Fighting)
    {
        ch->Echo("Zap whom or what?\r\n");
        return;
    }

    if((wand = GetEquipmentOnCharacter(ch, WEAR_HOLD)) == NULL)
    {
        ch->Echo("You hold nothing in your hand.\r\n");
        return;
    }

    if(wand->ItemType != ITEM_WAND)
    {
        ch->Echo("You can zap only with a wand.\r\n");
        return;
    }

    if(arg.empty())
    {
        if(ch->Fighting)
        {
            victim = GetFightingOpponent(ch);
        }
        else
        {
            ch->Echo("Zap whom or what?\r\n");
            return;
        }
    }
    else
    {
        if((victim = GetCharacterInRoom(ch, arg)) == NULL
           && (obj = GetObjectHere(ch, arg)) == NULL)
        {
            ch->Echo("You can't find it.\r\n");
            return;
        }
    }

    SetWaitState(ch, 1 * PULSE_VIOLENCE);

    if(wand->Value[OVAL_WAND_CHARGES] > 0)
    {
        if(victim)
        {
            if(!ObjProgUseTrigger(ch, wand, victim, NULL, NULL))
            {
                Act(AT_MAGIC, "$n aims $p at $N.", ch, wand, victim, TO_ROOM);
                Act(AT_MAGIC, "You aim $p at $N.", ch, wand, victim, TO_CHAR);
            }
        }
        else
        {
            if(!ObjProgUseTrigger(ch, wand, NULL, obj, NULL))
            {
                Act(AT_MAGIC, "$n aims $p at $P.", ch, wand, obj, TO_ROOM);
                Act(AT_MAGIC, "You aim $p at $P.", ch, wand, obj, TO_CHAR);
            }
        }

        retcode = CastSpellWithObject(wand->Value[OVAL_WAND_SPELL],
                                      wand->Value[OVAL_WAND_LEVEL], ch, victim, obj);

        if(retcode == rCHAR_DIED || retcode == rBOTH_DIED)
        {
            Log->Bug("do_zap: char died");
            return;
        }
    }

    if(--wand->Value[OVAL_WAND_CHARGES] <= 0)
    {
        Act(AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_ROOM);
        Act(AT_MAGIC, "$p explodes into fragments.", ch, wand, NULL, TO_CHAR);

        if(wand->Serial == cur_obj)
            global_objcode = rOBJ_USED;

        ExtractObject(wand);
    }
}
