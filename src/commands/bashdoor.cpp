#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_bashdoor(Character *ch, std::string arg)
{
    std::shared_ptr<Exit> pexit;

    if (!IsNpc(ch)
        && ch->PCData->Learned[gsn_bashdoor] <= 0)
    {
        ch->Echo("You're not enough of a warrior to bash doors!\r\n");
        return;
    }

    if (arg.empty())
    {
        ch->Echo("Bash what?\r\n");
        return;
    }

    if (ch->Fighting)
    {
        ch->Echo("You can't break off your fight.\r\n");
        return;
    }

    if ((pexit = FindDoor(ch, arg, false)) != NULL)
    {
        std::shared_ptr<Room> to_room;
        std::shared_ptr<Exit> pexit_rev;
        int bash_chance = 0;
        std::string keyword;

        if (!pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("Calm down. It is already open.\r\n");
            return;
        }

        SetWaitState(ch, SkillTable[gsn_bashdoor]->Beats);

        if (pexit->Flags.test(Flag::Exit::Secret))
            keyword = "wall";
        else
            keyword = pexit->Keyword;

        if (!IsNpc(ch))
            bash_chance = ch->PCData->Learned[gsn_bashdoor] / 2;
        else
            bash_chance = 90;

        if (!pexit->Flags.test(Flag::Exit::BashProof)
            && ch->Fatigue.Current >= 15
            && GetRandomPercent() < (bash_chance + 4 * (GetCurrentStrength(ch) - 19)))
        {
            pexit->Flags.reset(Flag::Exit::Closed);

            if (pexit->Flags.test(Flag::Exit::Locked))
            {
                pexit->Flags.reset(Flag::Exit::Locked);
            }

            pexit->Flags.set(Flag::Exit::Bashed);
            Act(AT_SKILL, "Crash! You bashed open the $d!",
                ch, NULL, keyword.c_str(), TO_CHAR);
            Act(AT_SKILL, "$n bashes open the $d!",
                ch, NULL, keyword.c_str(), TO_ROOM);
            LearnFromSuccess(ch, gsn_bashdoor);

            if ((to_room = pexit->ToRoom) != NULL
                && (pexit_rev = pexit->ReverseExit) != NULL
                && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.reset(Flag::Exit::Closed);

                if (pexit_rev->Flags.test(Flag::Exit::Locked))
                {
                    pexit_rev->Flags.reset(Flag::Exit::Locked);
                }

                pexit_rev->Flags.set(Flag::Exit::Bashed);

                for (Character *rch : to_room->Characters())
                {
                    Act(AT_SKILL, "The $d crashes open!",
                        rch, NULL, pexit_rev->Keyword.c_str(), TO_CHAR);
                }
            }

            InflictDamage(ch, ch, (ch->HitPoints.Max / 20), gsn_bashdoor);
        }
        else
        {
            Act(AT_SKILL, "WHAAAAM!!! You bash against the $d, but it doesn't budge.",
                ch, NULL, keyword.c_str(), TO_CHAR);
            Act(AT_SKILL, "WHAAAAM!!! $n bashes against the $d, but it holds strong.",
                ch, NULL, keyword.c_str(), TO_ROOM);
            InflictDamage(ch, ch, (ch->HitPoints.Max / 20) + 10, gsn_bashdoor);
            LearnFromFailure(ch, gsn_bashdoor);
        }
    }
    else
    {
        Act(AT_SKILL, "WHAAAAM!!! You bash against the wall, but it doesn't budge.",
            ch, NULL, NULL, TO_CHAR);
        Act(AT_SKILL, "WHAAAAM!!! $n bashes against the wall, but it holds strong.",
            ch, NULL, NULL, TO_ROOM);
        InflictDamage(ch, ch, (ch->HitPoints.Max / 20) + 10, gsn_bashdoor);
        LearnFromFailure(ch, gsn_bashdoor);
    }

    if (!CharacterDiedRecently(ch))
    {
        for (Character *gch : ch->InRoom->Characters())
        {
            if (IsAwake(gch)
                && !gch->Fighting
                && (IsNpc(gch) && !IsAffectedBy(gch, AFF_CHARM))
                && (ch->TopLevel - gch->TopLevel <= 4)
                && NumberBits(2) == 0)
            {
                HitMultipleTimes(gch, ch, TYPE_UNDEFINED);
            }
        }
    }
}
