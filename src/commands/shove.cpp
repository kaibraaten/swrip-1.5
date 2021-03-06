#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"
#include "timer.hpp"
#include "systemdata.hpp"
#include "skill.hpp"

void do_shove(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    DirectionType exit_dir = DIR_NORTH;
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Character> victim;
    bool nogo = false;
    int shove_chance = 0;

    argument = OneArgument(argument, arg);
    argument = OneArgument(argument, arg2);

    if(arg.empty())
    {
        ch->Echo("Shove whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You shove yourself around, to no avail.\r\n");
        return;
    }

    if((victim->Position) != POS_STANDING)
    {
        Act(AT_PLAIN, "$N isn't standing up.", ch, NULL, victim, ActTarget::Char);
        return;
    }

    if(arg2.empty())
    {
        ch->Echo("Shove them in which direction?\r\n");
        return;
    }

    exit_dir = GetDirection(arg2);

    if(victim->InRoom->Flags.test(Flag::Room::Safe)
       && !HasTimer(victim, TimerType::ShoveDrag))
    {
        ch->Echo("That character cannot be shoved right now.\r\n");
        return;
    }

    victim->Position = POS_SHOVE;

    if((pexit = GetExit(ch->InRoom, exit_dir)) == NULL)
    {
        if(!StrCmp(arg2, "in"))
        {
            std::shared_ptr<Ship> ship;

            if(argument.empty())
            {
                ch->Echo("Shove them into what?\r\n");
                return;
            }

            ship = GetShipInRoom(ch->InRoom, argument);

            if(!ship)
            {
                Act(AT_PLAIN, "I see no $T here.",
                    ch, nullptr, argument, ActTarget::Char);
                return;
            }

            if(ch->Mount != nullptr)
            {
                Act(AT_PLAIN, "You can't go in there riding THAT.",
                    ch, nullptr, argument, ActTarget::Char);
                return;
            }

            auto to_room = GetRoom(ship->Rooms.Entrance);

            if(to_room)
            {
                if(!ship->HatchOpen)
                {
                    ch->Echo("&RThe hatch is closed!\r\n");
                    return;
                }

                if(to_room->Tunnel > 0)
                {
                    int count = to_room->Characters().size();

                    if(count + 2 >= to_room->Tunnel)
                    {
                        ch->Echo("There is no room for you both in there.\r\n");
                        return;
                    }
                }

                if(ship->State == SHIP_LAUNCH
                   || ship->State == SHIP_LAUNCH_2)
                {
                    ch->Echo("&rThat ship has already started launching!\r\n");
                    return;
                }

                Act(AT_PLAIN, "$n enters $T.", ch,
                    nullptr, ship->Name, ActTarget::Room);
                Act(AT_PLAIN, "You enter $T.", ch,
                    nullptr, ship->Name, ActTarget::Char);
                CharacterFromRoom(ch);
                CharacterToRoom(ch, to_room);
                Act(AT_PLAIN, "$n enters the ship.", ch,
                    nullptr, argument, ActTarget::Room);
                do_look(ch, "auto");

                Act(AT_PLAIN, "$n enters $T.", victim,
                    nullptr, ship->Name, ActTarget::Room);
                Act(AT_PLAIN, "You enter $T.", victim,
                    nullptr, ship->Name, ActTarget::Char);
                CharacterFromRoom(victim);
                CharacterToRoom(victim, to_room);
                Act(AT_PLAIN, "$n enters the ship.", victim,
                    nullptr, argument, ActTarget::Room);
                do_look(victim, "auto");
                victim->Position = POS_STANDING;
                return;
            }
            else
            {
                ch->Echo("That ship has no entrance!\r\n");
                return;
            }
        }

        if(!StrCmp(arg2, "out"))
        {
            auto fromroom = ch->InRoom;
            auto ship = GetShipFromEntrance(fromroom->Vnum);

            if(!ship)
            {
                ch->Echo("I see no exit here.\r\n");
                return;
            }

            if(ch->Mount != nullptr)
            {
                Act(AT_PLAIN, "You can't go out there riding THAT.",
                    ch, nullptr, nullptr, ActTarget::Char);
                return;
            }

            if(ship->LastDock != ship->Location)
            {
                ch->Echo("&rMaybe you should wait until the ship lands.\r\n");
                return;
            }

            if(ship->State != SHIP_LANDED && !IsShipDisabled(ship))
            {
                ch->Echo("&rPlease wait till the ship is properly docked.\r\n");
                return;
            }

            if(!ship->HatchOpen)
            {
                ch->Echo("&RYou need to open the hatch first");
                return;
            }

            auto to_room = GetRoom(ship->Location);

            if(to_room)
            {
                if(to_room->Tunnel > 0)
                {
                    int count = to_room->Characters().size();

                    if(count + 2 >= to_room->Tunnel)
                    {
                        ch->Echo("There is no room for you both in there.\r\n");
                        return;
                    }
                }

                if(ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2)
                {
                    ch->Echo("&rThat ship has already started launching!\r\n");
                    return;
                }

                Act(AT_PLAIN, "$n exits the ship.", ch,
                    nullptr, nullptr, ActTarget::Room);
                Act(AT_PLAIN, "You exit the ship.", ch,
                    nullptr, nullptr, ActTarget::Char);
                CharacterFromRoom(ch);
                CharacterToRoom(ch, to_room);
                Act(AT_PLAIN, "$n exits $T.", ch,
                    nullptr, ship->Name, ActTarget::Room);
                do_look(ch, "auto");

                Act(AT_PLAIN, "$n exits the ship.", victim,
                    nullptr, nullptr, ActTarget::Room);
                Act(AT_PLAIN, "You exit the ship.", victim,
                    nullptr, nullptr, ActTarget::Char);
                CharacterFromRoom(victim);
                CharacterToRoom(victim, to_room);
                Act(AT_PLAIN, "$n exits $T.", victim,
                    nullptr, ship->Name, ActTarget::Room);
                do_look(victim, "auto");
                victim->Position = POS_STANDING;
                return;
            }
            else
            {
                ch->Echo("That ship has no entrance!\r\n");
                return;
            }
        }

        nogo = true;
    }
    else if(pexit->Flags.test(Flag::Exit::Closed)
            && (!IsAffectedBy(victim, Flag::Affect::PassDoor)
                || pexit->Flags.test(Flag::Exit::NoPassdoor)))
    {
        nogo = true;
    }

    if(nogo)
    {
        ch->Echo("There's no exit in that direction.\r\n");
        victim->Position = POS_STANDING;
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("You can only shove player characters.\r\n");
        return;
    }

    if(ch->InRoom->Area != pexit->ToRoom->Area
       && !InHardRange(victim, pexit->ToRoom->Area))
    {
        ch->Echo("That character cannot enter that area.\r\n");
        victim->Position = POS_STANDING;
        return;
    }

    int charLevel = 0;

    if(SysData.TopLevelFromAbility)
    {
        charLevel = GetAbilityLevel(ch, SkillTable[gsn_shove]->Class);
    }
    else
    {
        charLevel = ch->TopLevel();
    }
    
    shove_chance = 50;
    shove_chance += ((GetCurrentStrength(ch) - 15) * 3);
    shove_chance += (charLevel - victim->TopLevel());

    if(shove_chance < GetRandomPercent())
    {
        ch->Echo("You failed.\r\n");
        victim->Position = POS_STANDING;
        return;
    }

    Act(AT_ACTION, "You shove $M.", ch, NULL, victim, ActTarget::Char);
    Act(AT_ACTION, "$n shoves you.", ch, NULL, victim, ActTarget::Vict);
    MoveCharacter(victim, GetExit(ch->InRoom, exit_dir), 0);

    if(!CharacterDiedRecently(victim))
    {
        victim->Position = POS_STANDING;
    }

    SetWaitState(ch, 12);

    if(ch->InRoom->Flags.test(Flag::Room::Safe)
       && !HasTimer(ch, TimerType::ShoveDrag))
    {
        AddTimer(ch, TimerType::ShoveDrag, 10);
    }
}
