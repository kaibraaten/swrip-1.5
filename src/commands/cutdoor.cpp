#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_cutdoor(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Object> wield;

    if((wield = GetEquipmentOnCharacter(ch, WEAR_WIELD)) == NULL
       || wield->Value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER)
    {
        ch->Echo("You need a lightsaber for that!\r\n");
        return;
    }

    if(!IsNpc(ch)
       && (ch->PCData->Learned[gsn_lightsabers] <= 0 || ch->PCData->Learned[gsn_cutdoor] <= 0))
    {
        ch->Echo("You can not use it well enough to cut a door open.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Cut what?\r\n");
        return;
    }

    if(IsFighting(ch))
    {
        ch->Echo("You can't break off your fight.\r\n");
        return;
    }

    if((pexit = FindDoor(ch, arg, false)) != NULL)
    {
        std::shared_ptr<Room> to_room;
        std::shared_ptr<Exit> pexit_rev;
        int the_chance = 0;
        std::string keyword;

        if(!pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("It is already open.\r\n");
            return;
        }

        SetWaitState(ch, SkillTable[gsn_cutdoor]->Beats);

        if(pexit->Flags.test(Flag::Exit::Secret))
            keyword = "wall";
        else
            keyword = pexit->Keyword;

        if(!IsNpc(ch))
            the_chance = ch->PCData->Learned[gsn_cutdoor] / 2;
        else
            the_chance = 90;

        if(!pexit->Flags.test(Flag::Exit::BashProof)
           && ch->Fatigue.Current >= 15
           && GetRandomPercent() < (the_chance + 4 * (GetCurrentStrength(ch) - 19)))
        {
            pexit->Flags.reset(Flag::Exit::Closed);

            if(pexit->Flags.test(Flag::Exit::Locked))
            {
                pexit->Flags.reset(Flag::Exit::Locked);
            }

            pexit->Flags.set(Flag::Exit::Bashed);

            Act(AT_SKILL, "You cut open the $d!", ch, NULL, keyword, ActTarget::Char);
            Act(AT_SKILL, "$n cuts open the $d!", ch, NULL, keyword, ActTarget::Room);
            LearnFromSuccess(ch, gsn_cutdoor);

            if((to_room = pexit->ToRoom) != NULL
               && (pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.reset(Flag::Exit::Closed);

                if(pexit_rev->Flags.test(Flag::Exit::Locked))
                {
                    pexit_rev->Flags.reset(Flag::Exit::Locked);
                }

                pexit_rev->Flags.set(Flag::Exit::Bashed);

                for(auto rch : to_room->Characters())
                {
                    Act(AT_SKILL, "The $d falls open!",
                        rch, NULL, pexit_rev->Keyword, ActTarget::Char);
                }
            }

            InflictDamage(ch, ch, (ch->HitPoints.Max / 20), gsn_cutdoor);
        }
        else
        {
            Act(AT_SKILL, "You cut at the $d, but you handle it badly and just score it.",
                ch, NULL, keyword, ActTarget::Char);
            Act(AT_SKILL, "$n cuts at the $d, but just scores it.",
                ch, NULL, keyword, ActTarget::Room);
            InflictDamage(ch, ch, (ch->HitPoints.Max / 20) + 10, gsn_cutdoor);
            LearnFromFailure(ch, gsn_cutdoor);
        }
    }
    else
    {
        Act(AT_SKILL, "You slice at the wall, but just score it.",
            ch, NULL, NULL, ActTarget::Char);
        Act(AT_SKILL, "$n cuts at the wall, but just scores it.",
            ch, NULL, NULL, ActTarget::Room);
        InflictDamage(ch, ch, (ch->HitPoints.Max / 20) + 10, gsn_cutdoor);
        LearnFromFailure(ch, gsn_cutdoor);
    }

    if(!CharacterDiedRecently(ch))
    {
        for(auto gch : ch->InRoom->Characters())
        {
            if(IsAwake(gch)
               && !IsFighting(gch)
               && (IsNpc(gch) && !IsAffectedBy(gch, Flag::Affect::Charm))
               && (ch->TopLevel - gch->TopLevel <= 4)
               && NumberBits(2) == 0)
                HitMultipleTimes(gch, ch, TYPE_UNDEFINED);
        }
    }
}

