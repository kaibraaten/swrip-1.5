#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_steal(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Character> victim, mst;
    std::shared_ptr<Object> obj, obj_next;
    int percent = 0, xp = 0;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    if(arg1.empty() || arg2.empty())
    {
        ch->Echo("Steal what from whom?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if((victim = GetCharacterInRoom(ch, arg2)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("That's pointless.\r\n");
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("This isn't a good place to do that.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_steal]->Beats);
    percent = GetRandomPercent() + (IsAwake(victim) ? 10 : -50)
        - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 13)
        + TimesKilled(ch, victim) * 7;

    if((victim->Immune.test(Flag::Ris::Steal))
       || (victim->Position != POS_STUNNED
           && (victim->Position == POS_FIGHTING
               || percent > (IsNpc(ch) ? 90 : GetSkillLevel(ch, gsn_steal)))))
    {
        /*
         * Failure.
         */
        ch->Echo("Oops...\r\n");
        Act(AT_ACTION, "$n tried to steal from you!\r\n", ch, NULL, victim, ActTarget::Vict);
        Act(AT_ACTION, "$n tried to steal from $N.\r\n", ch, NULL, victim, ActTarget::NotVict);

        if(IsNpc(victim))
        {
            sprintf(buf, "%s is a bloody thief!", ch->Name.c_str());
            do_yell(victim, buf);
        }

        LearnFromFailure(ch, gsn_steal);

        if(!IsNpc(ch))
        {
            if(CanLootVictim(ch, victim))
            {
                if(IsNpc(victim))
                    global_retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
            }
            else
            {
                /* LogPrintf( buf ); */
                if(IsNpc(ch))
                {
                    if((mst = ch->Master) == NULL)
                        return;
                }
                else
                    mst = ch;

                if(IsNpc(mst))
                    return;
            }
        }

        return;
    }

    if(IsNpc(victim))
        AddKill(ch, victim);  /* makes it harder to steal from same char */

    if(!StrCmp(arg1, "credits")
       || !StrCmp(arg1, "credit")
       || !StrCmp(arg1, "money"))
    {
        int amount = (int)(victim->Gold * GetRandomNumberFromRange(1, 10) / 100);

        if(amount <= 0)
        {
            ch->Echo("You couldn't get any credits.\r\n");
            LearnFromFailure(ch, gsn_steal);
            return;
        }

        ch->Gold += amount;
        victim->Gold -= amount;
        ch->Echo("Aha! You got %d credits.\r\n", amount);

        if(!IsNpc(victim) || GetSkillLevel(ch, gsn_steal) < 50)
            LearnFromSuccess(ch, gsn_steal);

        if(IsNpc(victim))
        {
            auto ability = SkillTable[gsn_steal]->Class;
            xp = umin(amount * 10, (GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, ability))) / 35);
            xp = umin(xp, ComputeXP(ch, victim));
            GainXP(ch, ability, xp);
            ch->Echo("&WYou gain %d %s experience!\r\n", xp, AbilityName[(int)ability]);
        }

        return;
    }

    if((obj = GetCarriedObject(victim, arg1)) == NULL)
    {
        if(victim->Position <= POS_SLEEPING)
        {
            if((obj = GetWornObject(victim, arg1)) != NULL)
            {
                if((obj_next = GetEquipmentOnCharacter(victim, obj->WearLoc)) != obj)
                {
                    ch->Echo("They are wearing %s on top of %s.\r\n",
                             obj_next->ShortDescr.c_str(), obj->ShortDescr.c_str());
                    ch->Echo("You'll have to steal that first.\r\n");
                    LearnFromFailure(ch, gsn_steal);
                    return;
                }
                else
                    UnequipCharacter(victim, obj);
            }
        }

        ch->Echo("You can't seem to find it.\r\n");
        LearnFromFailure(ch, gsn_steal);
        return;
    }

    if(!CanDropObject(ch, obj)
       || obj->Flags.test(Flag::Obj::Inventory)
       || obj->Flags.test(Flag::Obj::Prototype))
    {
        ch->Echo("You can't manage to pry it away.\r\n");
        LearnFromFailure(ch, gsn_steal);
        return;
    }

    if(ch->CarryNumber + (GetObjectCount(obj) / obj->Count) > GetCarryCapacityNumber(ch))
    {
        ch->Echo("You have your hands full.\r\n");
        LearnFromFailure(ch, gsn_steal);
        return;
    }

    if(ch->CarryWeight + (GetObjectWeight(obj) / obj->Count) > GetCarryCapacityWeight(ch))
    {
        ch->Echo("You can't carry that much weight.\r\n");
        LearnFromFailure(ch, gsn_steal);
        return;
    }

    ch->Echo("Ok.\r\n");

    if(IsNpc(victim) || GetSkillLevel(ch, gsn_steal) > 0)
        LearnFromSuccess(ch, gsn_steal);

    if(IsNpc(victim))
    {
        auto ability = SkillTable[gsn_steal]->Class;
        xp = umin(obj->Cost * 10, (GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, ability))) / 10);
        xp = umin(xp, ComputeXP(ch, victim));
        GainXP(ch, ability, xp);
        ch->Echo("&WYou gain %d %s experience!\r\n", xp, AbilityName[(int)ability]);
    }

    SeparateOneObjectFromGroup(obj);
    ObjectFromCharacter(obj);
    ObjectToCharacter(obj, ch);
}
