/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cstdio>
#include <cstring>
#include <cassert>
#include <utility/random.hpp>
#include "track.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

#define TRACK_THROUGH_DOORS

static bool MobSnipe(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

/* You can define or not define TRACK_THOUGH_DOORS, above, depending on
   whether or not you want track to find paths which lead through closed
   or hidden doors.
*/

struct bfs_queue_struct
{
    std::shared_ptr<Room> room;
    DirectionType dir = DIR_INVALID;
    std::shared_ptr<bfs_queue_struct> Next;
};

static std::shared_ptr<bfs_queue_struct> queue_head;
static std::shared_ptr<bfs_queue_struct> queue_tail;
static std::shared_ptr<bfs_queue_struct> room_queue;

/* Utility macros */
static void MARK(std::shared_ptr<Room> room)
{
    room->Flags.set(BFSMark);
}

static void UNMARK(std::shared_ptr<Room> room)
{
    room->Flags.reset(BFSMark);
}

static bool IS_MARKED(std::shared_ptr<Room> room)
{
    return room->Flags.test(BFSMark);
}

static std::shared_ptr<Room> ToRoom(std::shared_ptr<Room> room, DirectionType door)
{
    return GetExit(room, door)->ToRoom;
}

static bool IsValidEdge(std::shared_ptr<Room> room, DirectionType door)
{
    std::shared_ptr<Room> to_room;
    std::shared_ptr<Exit> pexit = GetExit(room, door);

    if(pexit
       && (to_room = pexit->ToRoom) != NULL
#ifndef TRACK_THROUGH_DOORS
       && !pexit->Flags.test(Flag::Exit::Closed)
#endif
       && !IS_MARKED(to_room))
    {
        return true;
    }
    else
    {
        return false;
    }
}

static void bfs_enqueue(std::shared_ptr<Room> room, DirectionType dir)
{
    auto curr = std::make_shared<bfs_queue_struct>();
    curr->room = room;
    curr->dir = dir;

    if(queue_tail)
    {
        queue_tail->Next = curr;
        queue_tail = curr;
    }
    else
    {
        queue_head = queue_tail = curr;
    }
}

static void bfs_dequeue()
{
    queue_head = queue_head->Next;

    if(queue_head == nullptr)
    {
        queue_tail = nullptr;
    }
}

static void bfs_clear_queue()
{
    while(queue_head != nullptr)
    {
        bfs_dequeue();
    }
}

static void room_enqueue(std::shared_ptr<Room> room)
{
    auto curr = std::make_shared<bfs_queue_struct>();
    curr->room = room;
    curr->Next = room_queue;

    room_queue = curr;
}

static void CleanRoom_queue()
{
    for(std::shared_ptr<bfs_queue_struct> curr = room_queue, curr_next; curr; curr = curr_next)
    {
        UNMARK(curr->room);
        curr_next = curr->Next;
    }

    room_queue = nullptr;
}

int FindFirstStep(std::shared_ptr<Room> src, std::shared_ptr<Room> target, int maxdist)
{
    assert(src != nullptr);
    assert(target != nullptr);

    DirectionType curr_dir = DIR_INVALID;
    int count = 0;

    if(src == target)
    {
        return BFS_ALREADY_THERE;
    }

    if(src->Area != target->Area)
    {
        return BFS_NO_PATH;
    }

    room_enqueue(src);
    MARK(src);

    /* first, enqueue the first steps, saving which direction we're going. */
    for(curr_dir = DIR_NORTH; curr_dir < DIR_SOMEWHERE; curr_dir = (DirectionType)(curr_dir + 1))
    {
        if(IsValidEdge(src, curr_dir))
        {
            MARK(ToRoom(src, curr_dir));
            room_enqueue(ToRoom(src, curr_dir));
            bfs_enqueue(ToRoom(src, curr_dir), curr_dir);
        }
    }

    count = 0;

    while(queue_head != nullptr)
    {
        if(++count > maxdist)
        {
            bfs_clear_queue();
            CleanRoom_queue();
            return BFS_NO_PATH;
        }

        if(queue_head->room == target)
        {
            curr_dir = queue_head->dir;
            bfs_clear_queue();
            CleanRoom_queue();
            return curr_dir;
        }
        else
        {
            for(curr_dir = DIR_NORTH; curr_dir < DIR_SOMEWHERE; curr_dir = (DirectionType)(curr_dir + 1))
            {
                if(IsValidEdge(queue_head->room, curr_dir))
                {
                    MARK(ToRoom(queue_head->room, curr_dir));
                    room_enqueue(ToRoom(queue_head->room, curr_dir));
                    bfs_enqueue(ToRoom(queue_head->room, curr_dir), queue_head->dir);
                }
            }

            bfs_dequeue();
        }
    }

    CleanRoom_queue();

    return BFS_NO_PATH;
}

void FoundPrey(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    assert(victim != nullptr);
    assert(ch != nullptr);
    assert(victim->InRoom != nullptr);

    if(!CanSeeCharacter(ch, victim))
    {
        if(GetRandomPercent() < 90)
        {
            return;
        }

        switch(NumberBits(2))
        {
        case 0:
            do_say(ch, "Don't make me find you!");
            break;

        case 1:
            Act(AT_ACTION, "$n sniffs around the room for someone.", ch, nullptr, victim, ActTarget::NotVict);
            Act(AT_ACTION, "You sniff around the room for someone.", ch, nullptr, victim, ActTarget::Char);
            Act(AT_ACTION, "$n sniffs around the room for someone.", ch, nullptr, victim, ActTarget::Vict);
            do_say(ch, "I can smell your blood!");
            break;

        case 2:
            do_yell(ch, "I'm going to tear you apart!");
            break;

        case 3:
            do_say(ch, "Just wait until I find you...");
            break;
        }

        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        if(GetRandomPercent() < 90)
        {
            return;
        }

        std::string victname = IsNpc(victim) ? victim->ShortDescr : victim->Name;
        std::string buf;

        switch(NumberBits(2))
        {
        case 0:
            do_say(ch, "C'mon out, you coward!");
            buf = FormatString("%s is a bloody coward!", victname.c_str());
            do_yell(ch, buf);
            break;

        case 1:
            buf = FormatString("Let's take this outside, %s.", victname.c_str());
            do_say(ch, buf);
            break;

        case 2:
            buf = FormatString("%s is a yellow-bellied wimp!", victname.c_str());
            do_yell(ch, buf);
            break;

        case 3:
            Act(AT_ACTION, "$n takes a few swipes at someone.", ch, NULL, victim, ActTarget::NotVict);
            Act(AT_ACTION, "You try to take a few swipes someone.", ch, NULL, victim, ActTarget::Char);
            Act(AT_ACTION, "$n takes a few swipes at you.", ch, NULL, victim, ActTarget::Vict);
            break;
        }

        return;
    }

    switch(NumberBits(2))
    {
    case 0:
        do_yell(ch, "Your blood is mine!");
        break;

    case 1:
        do_say(ch, "Alas, we meet again!");
        break;

    case 2:
        do_say(ch, "What do you want on your tombstone?");
        break;

    case 3:
        Act(AT_ACTION, "$n lunges at $N from out of nowhere!", ch, nullptr, victim, ActTarget::NotVict);
        Act(AT_ACTION, "You lunge at $N catching $M off guard!", ch, nullptr, victim, ActTarget::Char);
        Act(AT_ACTION, "$n lunges at you from out of nowhere!", ch, nullptr, victim, ActTarget::Vict);
        break;
    }

    StopHunting(ch);
    StartFighting(ch, victim);
    HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
}

void HuntVictim(std::shared_ptr<Character> ch)
{
    bool found = false;

    if(!ch || !ch->HHF.Hunting || !ch->HHF.Hunting->Who)
    {
        return;
    }

    /* make sure the char still exists */
    for(auto tmp = FirstCharacter; tmp && !found; tmp = tmp->Next)
    {
        if(ch->HHF.Hunting->Who == tmp)
        {
            found = true;
        }
    }

    if(!found)
    {
        do_say(ch, "Damn! My prey is gone!");
        StopHunting(ch);
        return;
    }

    if(ch->InRoom == ch->HHF.Hunting->Who->InRoom)
    {
        if(IsFighting(ch))
        {
            return;
        }

        FoundPrey(ch, ch->HHF.Hunting->Who);
        return;
    }

    /* hunting with snipe */
    std::shared_ptr<Object> wield = GetEquipmentOnCharacter(ch, WEAR_WIELD);

    if(wield != nullptr && wield->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER)
    {
        if(MobSnipe(ch, ch->HHF.Hunting->Who) == true)
        {
            return;
        }
    }
    else if(!IsDroid(ch))
    {
        do_hide(ch, "");
    }

    DirectionType ret = (DirectionType)FindFirstStep(ch->InRoom, ch->HHF.Hunting->Who->InRoom, 5000);

    if(ret == BFS_NO_PATH)
    {
        for(int attempt = 0; attempt < 25; attempt++)
        {
            ret = (DirectionType)GetRandomDoor();
            auto pexit = GetExit(ch->InRoom, ret);

            if(pexit == nullptr
               || !pexit->ToRoom
               || pexit->Flags.test(Flag::Exit::Closed)
               || pexit->ToRoom->Flags.test(Flag::Room::NoMob))
            {
                continue;
            }
        }
    }

    if(ret < 0)
    {
        do_say(ch, "Damn! Lost my prey!");
        StopHunting(ch);
    }
    else
    {
        MoveCharacter(ch, GetExit(ch->InRoom, ret), false);

        if(CharacterDiedRecently(ch))
        {
            return;
        }

        if(!ch->HHF.Hunting)
        {
            assert(ch->InRoom != nullptr);

            do_say(ch, "Damn! Lost my prey!");
            return;
        }

        if(ch->InRoom == ch->HHF.Hunting->Who->InRoom)
        {
            FoundPrey(ch, ch->HHF.Hunting->Who);
        }
    }
}

static bool MobSnipe(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    constexpr short max_dist = 3;

    if(!ch->InRoom || !victim->InRoom)
    {
        return false;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        return false;
    }

    for(DirectionType dir = DIR_NORTH; dir <= DIR_SOMEWHERE; dir = (DirectionType)(dir + 1))
    {
        auto pexit = GetExit(ch->InRoom, dir);

        if(pexit == nullptr)
        {
            continue;
        }

        if(pexit->Flags.test(Flag::Exit::Closed))
        {
            continue;
        }

        auto was_in_room = ch->InRoom;
        bool pfound = false;

        for(short dist = 0; dist <= max_dist; dist++)
        {
            if(pexit->Flags.test(Flag::Exit::Closed))
            {
                break;
            }

            if(!pexit->ToRoom)
            {
                break;
            }

            std::shared_ptr<Room> to_room;

            if(pexit->Distance > 1)
            {
                to_room = GenerateExit(ch->InRoom, pexit);
            }

            if(to_room == nullptr)
            {
                to_room = pexit->ToRoom;
            }

            CharacterFromRoom(ch);
            CharacterToRoom(ch, to_room);

            if(ch->InRoom == victim->InRoom)
            {
                pfound = true;
                break;
            }

            if((pexit = GetExit(ch->InRoom, dir)) == NULL)
            {
                break;
            }
        }

        CharacterFromRoom(ch);
        CharacterToRoom(ch, was_in_room);

        if(!pfound)
        {
            CharacterFromRoom(ch);
            CharacterToRoom(ch, was_in_room);
            continue;
        }

        if(victim->InRoom->Flags.test(Flag::Room::Safe))
        {
            return false;
        }

        if(IsSafe(ch, victim))
        {
            return false;
        }

        if(IsAffectedBy(ch, Flag::Affect::Charm) && ch->Master == victim)
        {
            return false;
        }

        if(ch->Position == POS_FIGHTING)
        {
            return false;
        }

        if(!CanSeeCharacter(ch, victim))
        {
            return false;
        }

        switch(dir)
        {
        case DIR_NORTH:
        case DIR_EAST:
            dir = (DirectionType)(dir + 2);
            break;

        case DIR_SOUTH:
        case DIR_WEST:
            dir = (DirectionType)(dir - 2);
            break;

        case DIR_UP:
        case DIR_NORTHWEST:
            dir = (DirectionType)(dir + 1);
            break;

        case DIR_DOWN:
        case DIR_SOUTHEAST:
            dir = (DirectionType)(dir - 1);
            break;

        case DIR_NORTHEAST:
            dir = (DirectionType)(dir + 3);
            break;

        case DIR_SOUTHWEST:
            dir = (DirectionType)(dir - 3);
            break;

        default:
            break;
        }

        CharacterFromRoom(ch);
        CharacterToRoom(ch, victim->InRoom);

        std::string buf = FormatString("A blaster shot fires at you from the %s.",
                                       GetDirectionName(dir));
        Act(AT_ACTION, buf, victim, NULL, ch, ActTarget::Char);
        Act(AT_ACTION, "You fire at $N.", ch, NULL, victim, ActTarget::Char);
        buf = FormatString("A blaster shot fires at $N from the %s.",
                           GetDirectionName(dir));
        Act(AT_ACTION, buf, ch, NULL, victim, ActTarget::NotVict);

        HitOnce(ch, victim, TYPE_UNDEFINED);

        if(CharacterDiedRecently(ch))
        {
            return true;
        }

        StopFighting(ch, true);

        if(victim && !CharacterDiedRecently(victim) && victim->HitPoints.Current < 0)
        {
            StopHunting(ch);
            StopHating(ch);
        }

        CharacterFromRoom(ch);
        CharacterToRoom(ch, was_in_room);

        return true;
    }

    return false;
}

