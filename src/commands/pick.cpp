#include <utility/random.hpp>
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "descriptor.hpp"
#include "exit.hpp"
#include "repos/descriptorrepository.hpp"
#include "act.hpp"

void do_pick(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Object> obj;
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Ship> ship;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Pick what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_pick_lock]->Beats);

    /* look for guards */
    for(auto gch : ch->InRoom->Characters())
    {
        if(IsNpc(gch) && IsAwake(gch) && GetAbilityLevel(ch, SMUGGLING_ABILITY) < gch->TopLevel)
        {
            Act(AT_PLAIN, "$N is standing too close to the lock.",
                ch, NULL, gch, ActTarget::Char);
            return;
        }
    }

    if((pexit = FindDoor(ch, arg, true)) != NULL)
    {
        /* 'pick door' */
        /*        Room *ActTarget::Room; */ /* Unused */
        std::shared_ptr<Exit> pexit_rev;

        if(!pexit->Flags.test(Flag::Exit::Closed))
        {
            ch->Echo("It's not closed.\r\n");
            return;
        }

        if(pexit->Key < 0)
        {
            ch->Echo("It can't be picked.\r\n");
            return;
        }

        if(!pexit->Flags.test(Flag::Exit::Locked))
        {
            ch->Echo("It's already unlocked.\r\n");
            return;
        }

        if(pexit->Flags.test(Flag::Exit::PickProof))
        {
            ch->Echo("You failed.\r\n");
            LearnFromFailure(ch, gsn_pick_lock);
            CheckRoomForTraps(ch, TRAP_PICK | TrapDoor[pexit->Direction]);
            return;
        }

        if(!IsNpc(ch) && GetRandomPercent() > GetSkillLevel(ch, gsn_pick_lock))
        {
            ch->Echo("You failed.\r\n");
            LearnFromFailure(ch, gsn_pick_lock);
            return;
        }

        pexit->Flags.reset(Flag::Exit::Locked);
        ch->Echo("*Click*\r\n");
        Act(AT_ACTION, "$n picks the $d.",
            ch, nullptr, pexit->Keyword, ActTarget::Room);
        LearnFromSuccess(ch, gsn_pick_lock);

        /* pick the other side */
        if((pexit_rev = pexit->ReverseExit) != NULL
           && pexit_rev->ToRoom == ch->InRoom)
        {
            pexit_rev->Flags.reset(Flag::Exit::Locked);
        }

        CheckRoomForTraps(ch, TRAP_PICK | TrapDoor[pexit->Direction]);
        return;
    }

    if((obj = GetObjectHere(ch, arg)) != NULL)
    {
        if(obj->ItemType != ITEM_CONTAINER)
        {
            ch->Echo("You can't pick that.\r\n");
            return;
        }

        if(!IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            ch->Echo("It's not closed.\r\n");
            return;
        }

        if(obj->Value[OVAL_CONTAINER_KEY] < 0)
        {
            ch->Echo("It can't be unlocked.\r\n");
            return;
        }

        if(!IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED))
        {
            ch->Echo("It's already unlocked.\r\n");
            return;
        }

        if(IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_PICKPROOF))
        {
            ch->Echo("You failed.\r\n");
            LearnFromFailure(ch, gsn_pick_lock);
            CheckObjectForTrap(ch, obj, TRAP_PICK);
            return;
        }

        if(!IsNpc(ch) && GetRandomPercent() > GetSkillLevel(ch, gsn_pick_lock))
        {
            ch->Echo("You failed.\r\n");
            LearnFromFailure(ch, gsn_pick_lock);
            return;
        }

        SeparateOneObjectFromGroup(obj);
        RemoveBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED);
        ch->Echo("*Click*\r\n");
        Act(AT_ACTION, "$n picks $p.", ch, obj, NULL, ActTarget::Room);
        LearnFromSuccess(ch, gsn_pick_lock);
        CheckObjectForTrap(ch, obj, TRAP_PICK);
        return;
    }

    if((ship = GetShipInRoom(ch->InRoom, arg)) != NULL)
    {
        if(CheckPilot(ch, ship))
        {
            ch->Echo("&RWhat would be the point of that!\r\n");
            return;
        }

        if(ship->State != SHIP_LANDED && !IsShipDisabled(ship))
        {
            ch->Echo("&RThat ship has already started to launch");
            return;
        }

        SetWaitState(ch, SkillTable[gsn_pickshiplock]->Beats);

        if(IsNpc(ch) || !ch->PCData || GetRandomPercent() > GetSkillLevel(ch, gsn_pickshiplock))
        {
            ch->Echo("You failed.\r\n");
            LearnFromFailure(ch, gsn_pickshiplock);

            if(!ship->Alarm)
                return;

            if(!StrCmp("Public", ship->Owner))
                return;

            for(auto d : Descriptors->Entities())
            {
                auto victim = d->Original ? d->Original : d->Char;

                if(d->ConnectionState != CON_PLAYING)
                    continue;

                if(!CheckPilot(victim, ship))
                    continue;

                if(!HasComlink(victim))
                    continue;

                if(!IsNpc(victim) && victim->Switched
                   && !victim->Switched->Flags.test(Flag::Mob::Polymorphed)
                   && !IsAffectedBy(victim->Switched, Flag::Affect::Possess))
                    continue;
                else if(!IsNpc(victim) && victim->Switched
                        && (victim->Switched->Flags.test(Flag::Mob::Polymorphed)
                            || IsAffectedBy(victim->Switched, Flag::Affect::Possess)))
                    victim = victim->Switched;

                if(!IsAwake(victim)
                   || victim->InRoom->Flags.test(Flag::Room::Silence))
                {
                    continue;
                }

                if(d->ConnectionState == CON_EDITING)
                {
                    continue;
                }

                victim->Echo("&R[Alarm] Attempt to pick %s.\r\n", ship->Name.c_str());
            }
            return;
        }

        if(!ship->HatchOpen)
        {
            ship->HatchOpen = true;
            Act(AT_PLAIN, "You pick the lock and open the hatch on $T.",
                ch, nullptr, ship->Name, ActTarget::Char);
            Act(AT_PLAIN, "$n picks open the hatch on $T.",
                ch, nullptr, ship->Name, ActTarget::Room);
            EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Entrance),
                       "The hatch opens from the outside.");
            LearnFromSuccess(ch, gsn_pickshiplock);

            if(!ship->Alarm)
                return;

            if(!StrCmp("Public", ship->Owner))
                return;

            for(auto d : Descriptors->Entities())
            {
                auto victim = d->Original ? d->Original : d->Char;

                if(d->ConnectionState != CON_PLAYING)
                    continue;

                if(!CheckPilot(victim, ship))
                    continue;

                if(!HasComlink(victim))
                    continue;

                if(!IsNpc(victim) && victim->Switched
                   && !victim->Switched->Flags.test(Flag::Mob::Polymorphed)
                   && !IsAffectedBy(victim->Switched, Flag::Affect::Possess))
                    continue;
                else if(!IsNpc(victim) && victim->Switched
                        && (victim->Switched->Flags.test(Flag::Mob::Polymorphed)
                            || IsAffectedBy(victim->Switched, Flag::Affect::Possess)))
                    victim = victim->Switched;

                if(!IsAwake(victim)
                   || victim->InRoom->Flags.test(Flag::Room::Silence))
                    continue;

                if(d->ConnectionState == CON_EDITING)
                    continue;

                victim->Echo("&R[Alarm] %s has been picked!\r\n",
                             ship->Name.c_str());
            }
        }

        return;
    }

    ch->Echo("You see no %s here.\r\n", arg.c_str());
}

