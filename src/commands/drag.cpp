#include <utility/random.hpp>
#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_drag(Character *ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    DirectionType exit_dir = DIR_INVALID;
    Character *victim = nullptr;
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Room> to_room;
    bool nogo = false;
    int drag_chance = 0;
    std::shared_ptr<Room> fromroom;
    std::shared_ptr<Ship> ship;

    argument = OneArgument(argument, arg);
    argument = OneArgument(argument, arg2);

    if(arg.empty())
    {
        ch->Echo("Drag whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You take yourself by the scruff of your neck, but go nowhere.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("You can only drag player characters.\r\n");
        return;
    }

    if(victim->Fighting)
    {
        ch->Echo("You try, but can't get close enough.\r\n");
        return;
    }

    if(arg2.empty())
    {
        ch->Echo("Drag them in which direction?\r\n");
        return;
    }

    exit_dir = GetDirection(arg2);

    if(victim->InRoom->Flags.test(Flag::Room::Safe)
       && GetTimer(victim, TIMER_SHOVEDRAG) <= 0)
    {
        ch->Echo("That character cannot be dragged right now.\r\n");
        return;
    }

    nogo = false;

    if((pexit = GetExit(ch->InRoom, exit_dir)) == NULL)
    {
        if(!StrCmp(arg2, "in"))
        {
            if(argument.empty())
            {
                ch->Echo("Drag them into what?\r\n");
                return;
            }

            if((ship = GetShipInRoom(ch->InRoom, argument)) == NULL)
            {
                Act(AT_PLAIN, "I see no $T here.",
                    ch, nullptr, argument.c_str(), TO_CHAR);
                return;
            }

            if(ch->Mount != nullptr)
            {
                Act(AT_PLAIN, "You can't go in there riding THAT.", ch,
                    nullptr, argument.c_str(), TO_CHAR);
                return;
            }

            fromroom = ch->InRoom;

            if((to_room = GetRoom(ship->Rooms.Entrance)) != NULL)
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

                if(ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2)
                {
                    ch->Echo("&rThat ship has already started launching!\r\n");
                    return;
                }

                Act(AT_PLAIN, "$n enters $T.", ch,
                    NULL, ship->Name.c_str(), TO_ROOM);
                Act(AT_PLAIN, "You enter $T.", ch,
                    NULL, ship->Name.c_str(), TO_CHAR);
                CharacterFromRoom(ch);
                CharacterToRoom(ch, to_room);
                Act(AT_PLAIN, "$n enters the ship.", ch,
                    NULL, argument.c_str(), TO_ROOM);
                do_look(ch, "auto");

                Act(AT_PLAIN, "$n enters $T.", victim,
                    NULL, ship->Name.c_str(), TO_ROOM);
                Act(AT_PLAIN, "You enter $T.", victim,
                    NULL, ship->Name.c_str(), TO_CHAR);
                CharacterFromRoom(victim);
                CharacterToRoom(victim, to_room);
                Act(AT_PLAIN, "$n enters the ship.", victim,
                    NULL, argument.c_str(), TO_ROOM);
                do_look(victim, "auto");
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
            fromroom = ch->InRoom;

            if((ship = GetShipFromEntrance(fromroom->Vnum)) == NULL)
            {
                ch->Echo("I see no exit here.\r\n");
                return;
            }

            if(ch->Mount != nullptr)
            {
                Act(AT_PLAIN, "You can't go out there riding THAT.",
                    ch, NULL, argument.c_str(), TO_CHAR);
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

            if((to_room = GetRoom(ship->Location)) != NULL)
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
                    NULL, ship->Name.c_str(), TO_ROOM);
                Act(AT_PLAIN, "You exits the ship.", ch,
                    NULL, ship->Name.c_str(), TO_CHAR);
                CharacterFromRoom(ch);
                CharacterToRoom(ch, to_room);
                Act(AT_PLAIN, "$n exits $T.", ch,
                    NULL, ship->Name.c_str(), TO_ROOM);
                do_look(ch, "auto");

                Act(AT_PLAIN, "$n exits the ship.", victim,
                    NULL, ship->Name.c_str(), TO_ROOM);
                Act(AT_PLAIN, "You exits the ship.", victim,
                    NULL, ship->Name.c_str(), TO_CHAR);
                CharacterFromRoom(victim);
                CharacterToRoom(victim, to_room);
                Act(AT_PLAIN, "$n exits $T.", victim,
                    NULL, ship->Name.c_str(), TO_ROOM);
                do_look(victim, "auto");
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
        return;
    }

    to_room = pexit->ToRoom;

    if(ch->InRoom->Area != to_room->Area
       && !InHardRange(victim, to_room->Area))
    {
        ch->Echo("That character cannot enter that area.\r\n");
        return;
    }

    drag_chance = 50;

    /*
      sprintf(buf, "Drag percentage of %s = %d", ch->Name, drag_chance);
      Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
    */
    if(drag_chance < GetRandomPercent())
    {
        ch->Echo("You failed.\r\n");
        return;
    }

    if(victim->Position < POS_STANDING)
    {
        PositionType temp = victim->Position;
        victim->Position = POS_DRAG;
        Act(AT_ACTION, "You drag $M into the next room.", ch, NULL, victim, TO_CHAR);
        Act(AT_ACTION, "$n grabs your hair and drags you.", ch, NULL, victim, TO_VICT);
        MoveCharacter(victim, GetExit(ch->InRoom, exit_dir), 0);

        if(!CharacterDiedRecently(victim))
            victim->Position = temp;

        /* Move ch to the room too.. they are doing dragging - Scryn */
        MoveCharacter(ch, GetExit(ch->InRoom, exit_dir));
        SetWaitState(ch, 12);
        return;
    }

    ch->Echo("You cannot do that to someone who is standing.\r\n");
}
