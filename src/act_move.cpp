/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cstring>
#include <cctype>
#include <cassert>
#include <sstream>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"

static std::shared_ptr<Room> vroom_hash[64];

static void DecorateVirtualRoom(std::shared_ptr<Room> room);
static void TeleportCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Room> room, bool show);

static void DecorateVirtualRoom(std::shared_ptr<Room> room)
{
    std::ostringstream buf;
    int previous[8];
    const SectorType sector = room->Sector;

    room->Name = SectorNames[(int)sector][0];
    const size_t nRand = GetRandomNumberFromRange(1, umin(8, SentTotal[(int)sector]));

    for(size_t iRand = 0; iRand < nRand; iRand++)
    {
        previous[iRand] = -1;
    }

    for(size_t iRand = 0; iRand < nRand; iRand++)
    {
        while(previous[iRand] == -1)
        {
            int z = 0;
            int x = GetRandomNumberFromRange(0, SentTotal[(int)sector] - 1);

            for(z = 0; z < iRand; z++)
                if(previous[z] == x)
                    break;

            if(z < iRand)
                continue;

            previous[iRand] = x;

            size_t len = buf.str().size();
            std::string buf2 = FormatString("%s", RoomSents[(int)sector][x]);

            if(len > 5 && buf.str()[len - 1] == '.')
            {
                buf << "  ";
                buf2[0] = CharToUppercase(buf2[0]);
            }
            else if(len == 0)
            {
                buf2[0] = CharToUppercase(buf2[0]);
            }

            buf << buf2;
        }
    }

    room->Description = WordWrap(buf.str(), 78) + "\r\n";
}

/*
 * Remove any unused virtual rooms                              -Thoric
 */
void ClearVirtualRooms()
{
    for(auto hash = 0; hash < 64; hash++)
    {
        while(vroom_hash[hash]
              && vroom_hash[hash]->Characters().empty()
              && vroom_hash[hash]->Objects().empty())
        {
            auto room = vroom_hash[hash];
            vroom_hash[hash] = room->Next;
            CleanRoom(room);
            --top_vroom;
        }

        std::shared_ptr<Room> prev, room_next;

        for(auto room = vroom_hash[hash]; room; room = room_next)
        {
            room_next = room->Next;

            if(room->Characters().empty() && room->Objects().empty())
            {
                if(prev)
                {
                    prev->Next = room_next;
                }

                CleanRoom(room);
                room = nullptr;
                --top_vroom;
            }

            if(room)
            {
                prev = room;
            }
        }
    }
}

/*
 * Function to get the equivalent exit of DIR 0-MAXDIR out of linked list.
 * Made to allow old-style diku-merc exit functions to work.    -Thoric
 */
std::shared_ptr<Exit> GetExit(std::shared_ptr<Room> room, DirectionType dir)
{
    assert(room != nullptr);

    for(auto xit : room->Exits())
    {
        if(xit->Direction == dir)
        {
            return xit;
        }
    }

    return nullptr;
}

/*
 * Function to get an exit, leading the the specified room
 */
std::shared_ptr<Exit> GetExitTo(std::shared_ptr<Room> room, DirectionType dir, vnum_t vnum)
{
    assert(room != nullptr);

    for(auto xit : room->Exits())
    {
        if(xit->Direction == dir && xit->Vnum == vnum)
        {
            return xit;
        }
    }

    return nullptr;
}

/*
 * Function to get the nth exit of a room                       -Thoric
 */
std::shared_ptr<Exit> GetExitNumber(std::shared_ptr<Room> room, short count)
{
    assert(room != nullptr);

    int cnt = 0;

    for(auto xit : room->Exits())
    {
        if(++cnt == count)
        {
            return xit;
        }
    }

    return nullptr;
}

/*
 * Check to see if a character can fall down, checks for looping   -Thoric
 */
bool CharacterFallIfNoFloor(std::shared_ptr<Character> ch, int fall)
{
    if(ch->InRoom->Flags.test(Flag::Room::NoFloor)
       && CAN_GO(ch, DIR_DOWN)
       && (!IsAffectedBy(ch, Flag::Affect::Flying)
           || (ch->Mount && !IsAffectedBy(ch->Mount, Flag::Affect::Flying))))
    {
        if(fall > 80)
        {
            Log->Bug("Falling (in a loop?) more than 80 rooms: vnum %ld", ch->InRoom->Vnum);
            CharacterFromRoom(ch);
            CharacterToRoom(ch, GetRoom(WhereHome(ch)));
            fall = 0;
            return true;
        }

        SetCharacterColor(AT_FALLING, ch);
        ch->Echo("You're falling down...\r\n");
        MoveCharacter(ch, GetExit(ch->InRoom, DIR_DOWN), ++fall);
        return true;
    }

    return false;
}

/*
 * create a 'virtual' room                                      -Thoric
 */
std::shared_ptr<Room> GenerateExit(std::shared_ptr<Room> in_room, std::shared_ptr<Exit> &pexit)
{
    std::shared_ptr<Exit> xit, bxit;
    const std::shared_ptr<Exit> orig_exit = pexit;
    std::shared_ptr<Room> room;
    std::shared_ptr<Room> backroom;
    vnum_t brvnum = INVALID_VNUM;
    vnum_t serial = INVALID_VNUM;
    vnum_t roomnum = INVALID_VNUM;
    int distance = -1;
    DirectionType vdir = orig_exit->Direction;
    short hash = 0;
    bool found = false;

    if(in_room->Vnum > 32767)  /* room is virtual */
    {
        serial = in_room->Vnum;
        roomnum = in_room->TeleVnum;

        if((serial & 65535) == orig_exit->Vnum)
        {
            brvnum = serial >> 16;
            --roomnum;
            distance = roomnum;
        }
        else
        {
            brvnum = serial & 65535;
            ++roomnum;
            distance = orig_exit->Distance - 1;
        }

        backroom = GetRoom(brvnum);
    }
    else
    {
        int r1 = in_room->Vnum;
        int r2 = orig_exit->Vnum;

        brvnum = r1;
        backroom = in_room;
        serial = (umax(r1, r2) << 16) | umin(r1, r2);
        distance = orig_exit->Distance - 1;
        roomnum = r1 < r2 ? 1 : distance;
    }

    hash = serial % 64;

    for(room = vroom_hash[hash]; room; room = room->Next)
    {
        if(room->Vnum == serial && room->TeleVnum == roomnum)
        {
            found = true;
            break;
        }
    }

    if(!found)
    {
        room = std::make_shared<Room>(serial);
        room->Area = in_room->Area;
        room->TeleVnum = roomnum;
        room->Sector = in_room->Sector;
        room->Flags = in_room->Flags;
        DecorateVirtualRoom(room);
        room->Next = vroom_hash[hash];
        vroom_hash[hash] = room;
        ++top_vroom;
    }

    if(!found || (xit = GetExit(room, vdir)) == NULL)
    {
        xit = MakeExit(room, orig_exit->ToRoom, vdir);
        xit->Key = -1;
        xit->Distance = distance;
    }

    if(!found)
    {
        bxit = MakeExit(room, backroom, GetReverseDirection(vdir));
        bxit->Key = -1;

        if((serial & 65535) != orig_exit->Vnum)
        {
            bxit->Distance = roomnum;
        }
        else
        {
            std::shared_ptr<Exit> tmp = GetExit(backroom, vdir);
            int fulldist = tmp->Distance;

            bxit->Distance = fulldist - distance;
        }
    }

    pexit = xit;
    return room;
}

ch_ret MoveCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Exit> pexit, int fall)
{
    bool drunk = false;

    if(!IsNpc(ch)
       && IsDrunk(ch) && ch->Position != POS_SHOVE
       && ch->Position != POS_DRAG)
    {
        drunk = true;
    }

    DirectionType door = DIR_INVALID;

    if(drunk && !fall)
    {
        door = (DirectionType)GetRandomDoor();
        pexit = GetExit(ch->InRoom, door);
    }

    if(IsNpc(ch) && ch->Flags.test(Flag::Mob::Mounted))
    {
        return rNONE;
    }

    auto in_room = ch->InRoom;
    auto from_room = in_room;
    std::shared_ptr<Room> to_room;

    if(!pexit || (to_room = pexit->ToRoom) == NULL)
    {
        if(drunk)
        {
            ch->Echo("You hit a wall in your drunken state.\r\n");
        }
        else
        {
            ch->Echo("Alas, you cannot go that way.\r\n");
        }

        return rNONE;
    }

    door = pexit->Direction;
    short distance = pexit->Distance;

    /*
     * Exit is only a "window", there is no way to travel in that direction
     * unless it's a door with a window in it             -Thoric
     */
    if(pexit->Flags.test(Flag::Exit::Window)
       && !pexit->Flags.test(Flag::Exit::IsDoor))
    {
        ch->Echo("Alas, you cannot go that way.\r\n");
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::Portal)
       && IsNpc(ch))
    {
        Act(AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, ActTarget::Char);
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::NoMob)
       && IsNpc(ch) && !ch->Flags.test(Flag::Mob::Scavenger))
    {
        Act(AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, ActTarget::Char);
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::Closed)
       && (!IsAffectedBy(ch, Flag::Affect::PassDoor)
           || pexit->Flags.test(Flag::Exit::NoPassdoor)))
    {
        if(!pexit->Flags.test(Flag::Exit::Secret)
           && !pexit->Flags.test(Flag::Exit::Dig))
        {
            if(drunk)
            {
                Act(AT_PLAIN, "$n runs into the $d in $s drunken state.", ch,
                    nullptr, pexit->Keyword, ActTarget::Room);
                Act(AT_PLAIN, "You run into the $d in your drunken state.", ch,
                    nullptr, pexit->Keyword, ActTarget::Char);
            }
            else
                Act(AT_PLAIN, "The $d is closed.", ch, nullptr, pexit->Keyword, ActTarget::Char);
        }
        else
        {
            if(drunk)
                ch->Echo("You hit a wall in your drunken state.\r\n");
            else
                ch->Echo("Alas, you cannot go that way.\r\n");
        }

        return rNONE;
    }

    /*
     * Crazy virtual room idea, created upon demand.              -Thoric
     */
    if(distance > 1)
    {
        to_room = GenerateExit(in_room, pexit);

        if(to_room == nullptr)
        {
            ch->Echo("Alas, you cannot go that way.\r\n");
        }
    }

    if(!fall
       && IsAffectedBy(ch, Flag::Affect::Charm)
       && ch->Master
       && in_room == ch->Master->InRoom)
    {
        ch->Echo("What? And leave your beloved master?\r\n");
        return rNONE;
    }

    if(IsRoomPrivate(ch, to_room))
    {
        if(ch->Master != nullptr
           && !IsNpc(ch->Master)
           && ch->Master->PCData->Pet == ch)
        {
            // Pets can follow master into private rooms.
        }
        else
        {
            ch->Echo("That room is private right now.\r\n");
            return rNONE;
        }
    }

    if(!IsImmortal(ch)
       && !IsNpc(ch)
       && ch->InRoom->Area != to_room->Area)
    {
        if(ch->TopLevel() < to_room->Area->LevelRanges.Hard.Low)
        {
            SetCharacterColor(AT_TELL, ch);

            switch(to_room->Area->LevelRanges.Hard.Low - ch->TopLevel())
            {
            case 1:
                ch->Echo("A voice in your mind says, 'You are nearly ready to go that way...'");
                break;

            case 2:
                ch->Echo("A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'");
                break;

            case 3:
                ch->Echo("A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n");
                break;

            default:
                ch->Echo("A voice in your mind says, 'You are not ready to go down that path.'.\r\n");
                break;
            }

            return rNONE;
        }
        else if(ch->TopLevel() > to_room->Area->LevelRanges.Hard.High)
        {
            SetCharacterColor(AT_TELL, ch);
            ch->Echo("A voice in your mind says, 'There is nothing more for you down that path.'");
            return rNONE;
        }
    }

    std::string txt;

    if(!fall && !IsNpc(ch))
    {
        int move = 0;

        if(in_room->Sector == SectorType::Air
           || to_room->Sector == SectorType::Air
           || pexit->Flags.test(Flag::Exit::Fly))
        {
            if(ch->Mount && !IsAffectedBy(ch->Mount, Flag::Affect::Flying))
            {
                ch->Echo("Your mount can't fly.\r\n");
                return rNONE;
            }

            if(!ch->Mount && !IsAffectedBy(ch, Flag::Affect::Flying))
            {
                ch->Echo("You'd need to fly to go there.\r\n");
                return rNONE;
            }
        }

        if(in_room->Sector == SectorType::WaterNotSwimmable
           || to_room->Sector == SectorType::WaterNotSwimmable)
        {
            bool found = false;

            if(ch->Mount)
            {
                if(IsAffectedBy(ch->Mount, Flag::Affect::Flying)
                   || IsAffectedBy(ch->Mount, Flag::Affect::Floating))
                {
                    found = true;
                }
            }
            else if(IsAffectedBy(ch, Flag::Affect::Flying)
                    || IsAffectedBy(ch, Flag::Affect::Floating))
            {
                found = true;
            }

            /*
             * Look for a boat.
             */
            if(!found)
            {
                found = GetFirstObjectOfType(ch, ITEM_BOAT) != nullptr;

                if(found)
                {
                    if(drunk)
                    {
                        txt = "paddles unevenly";
                    }
                    else
                    {
                        txt = "paddles";
                    }
                }
            }

            if(!found)
            {
                ch->Echo("You'd need a boat to go there.\r\n");
                return rNONE;
            }
        }

        if(pexit->Flags.test(Flag::Exit::Climb))
        {
            bool found = false;

            if(ch->Mount && IsAffectedBy(ch->Mount, Flag::Affect::Flying))
                found = true;
            else if(IsAffectedBy(ch, Flag::Affect::Flying))
                found = true;

            if(!found && !ch->Mount)
            {

                if((!IsNpc(ch) && GetRandomPercent() > GetSkillLevel(ch, gsn_climb))
                   || drunk || ch->MentalState < -90)
                {
                    bool ch_rope = GetFirstObjectOfType(ch, ITEM_ROPE) != nullptr;

                    if(!ch_rope)
                    {
                        ch_ret retcode = rNONE;
                        ch->Echo("You start to climb... but lose your grip and fall!\r\n");
                        LearnFromFailure(ch, gsn_climb);

                        if(pexit->Direction == DIR_DOWN)
                        {
                            retcode = MoveCharacter(ch, pexit, 1);
                            return retcode;
                        }

                        SetCharacterColor(AT_HURT, ch);
                        ch->Echo("OUCH! You hit the ground!\r\n");
                        SetWaitState(ch, 20);
                        retcode = InflictDamage(ch, ch, (pexit->Direction == DIR_UP ? 10 : 5),
                                                TYPE_UNDEFINED);
                        return retcode;
                    }
                }
                found = true;
                LearnFromSuccess(ch, gsn_climb);
                SetWaitState(ch, SkillTable[gsn_climb]->Beats);
                txt = "climbs";
            }

            if(!found)
            {
                ch->Echo("You can't climb.\r\n");
                return rNONE;
            }
        }

        if(ch->Mount)
        {
            switch(ch->Mount->Position)
            {
            case POS_DEAD:
                ch->Echo("Your mount is dead!\r\n");
                return rNONE;
                break;

            case POS_MORTAL:
            case POS_INCAP:
                ch->Echo("Your mount is hurt far too badly to move.\r\n");
                return rNONE;
                break;

            case POS_STUNNED:
                ch->Echo("Your mount is too stunned to do that.\r\n");
                return rNONE;
                break;

            case POS_SLEEPING:
                ch->Echo("Your mount is sleeping.\r\n");
                return rNONE;
                break;

            case POS_RESTING:
                ch->Echo("Your mount is resting.\r\n");
                return rNONE;
                break;

            case POS_SITTING:
                ch->Echo("Your mount is sitting down.\r\n");
                return rNONE;
                break;

            default:
                break;
            }

            if(!IsAffectedBy(ch->Mount, Flag::Affect::Flying)
               && !IsAffectedBy(ch->Mount, Flag::Affect::Floating))
                move = MovementLoss[umin((int)SectorType::Max - 1, (int)in_room->Sector)];
            else
                move = 1;

            if(ch->Mount->Fatigue.Current < move)
            {
                ch->Echo("Your mount is too exhausted.\r\n");
                return rNONE;
            }
        }
        else
        {
            int hpmove = 500 / (ch->HitPoints.Current ? ch->HitPoints.Current : 1);

            if(!IsAffectedBy(ch, Flag::Affect::Flying)
               && !IsAffectedBy(ch, Flag::Affect::Floating))
                move = hpmove * GetCarryEncumbrance(ch, MovementLoss[umin((int)SectorType::Max - 1, (int)in_room->Sector)]);
            else
                move = 1;

            if(ch->Fatigue.Current < move)
            {
                ch->Echo("You are too exhausted.\r\n");
                return rNONE;
            }
        }

        SetWaitState(ch, move);

        if(ch->Mount)
            ch->Mount->Fatigue.Current -= move;
        else
            ch->Fatigue.Current -= move;
    }

    /*
     * Check if player can fit in the room
     */
    if(to_room->Tunnel > 0)
    {
        int count = ch->Mount ? 1 : 0;
        count += to_room->Characters().size();

        if(count >= to_room->Tunnel)
        {
            if(ch->Mount && count == to_room->Tunnel)
                ch->Echo("There is no room for both you and your mount in there.\r\n");
            else
                ch->Echo("There is no room for you in there.\r\n");

            return rNONE;
        }
    }

    /* check for traps on exit - later */
    
    if(!IsAffectedBy(ch, Flag::Affect::Sneak)
       && (IsNpc(ch) || !ch->Flags.test(Flag::Plr::WizInvis)))
    {
        if(fall)
            txt = "falls";
        else if(txt.empty())
        {
            if(ch->Mount)
            {
                if(IsAffectedBy(ch->Mount, Flag::Affect::Floating))
                    txt = "floats";
                else
                    if(IsAffectedBy(ch->Mount, Flag::Affect::Flying))
                        txt = "flys";
                    else
                        txt = "rides";
            }
            else
            {
                if(IsAffectedBy(ch, Flag::Affect::Floating))
                {
                    if(drunk)
                        txt = "floats unsteadily";
                    else
                        txt = "floats";
                }
                else if(IsAffectedBy(ch, Flag::Affect::Flying))
                {
                    if(drunk)
                        txt = "flys shakily";
                    else
                        txt = "flys";
                }
                else if(ch->Position == POS_SHOVE)
                    txt = "is shoved";
                else if(ch->Position == POS_DRAG)
                    txt = "is dragged";
                else
                {
                    if(drunk)
                        txt = "stumbles drunkenly";
                    else
                        txt = "leaves";
                }
            }
        }

        if(ch->Mount)
        {
            std::string buf = FormatString("$n %s %s upon $N.", txt.c_str(), GetDirectionName(door));
            Act(AT_ACTION, buf, ch, NULL, ch->Mount, ActTarget::NotVict);
        }
        else
        {
            std::string buf = FormatString("$n %s $T.", txt.c_str());
            Act(AT_ACTION, buf, ch, nullptr,
                ActArg(GetDirectionName(door)), ActTarget::Room);
        }
    }

    RoomProgLeaveTrigger(ch);

    if(CharacterDiedRecently(ch))
        return global_retcode;

    CharacterFromRoom(ch);

    if(ch->Mount)
    {
        RoomProgLeaveTrigger(ch->Mount);

        if(CharacterDiedRecently(ch))
            return global_retcode;

        if(ch->Mount)
        {
            CharacterFromRoom(ch->Mount);
            CharacterToRoom(ch->Mount, to_room);
        }
    }


    CharacterToRoom(ch, to_room);

    if(!IsAffectedBy(ch, Flag::Affect::Sneak)
       && (IsNpc(ch) || !ch->Flags.test(Flag::Plr::WizInvis)))
    {
        if(fall)
        {
            txt = "falls";
        }
        else if(ch->Mount)
        {
            if(IsAffectedBy(ch->Mount, Flag::Affect::Floating))
            {
                txt = "floats in";
            }
            else if(IsAffectedBy(ch->Mount, Flag::Affect::Flying))
            {
                txt = "flys in";
            }
            else
            {
                txt = "rides in";
            }
        }
        else
        {
            if(IsAffectedBy(ch, Flag::Affect::Floating))
            {
                if(drunk)
                {
                    txt = "floats in unsteadily";
                }
                else
                {
                    txt = "floats in";
                }
            }
            else if(IsAffectedBy(ch, Flag::Affect::Flying))
            {
                if(drunk)
                {
                    txt = "flys in shakily";
                }
                else
                {
                    txt = "flys in";
                }
            }
            else if(ch->Position == POS_SHOVE)
            {
                txt = "is shoved in";
            }
            else if(ch->Position == POS_DRAG)
            {
                txt = "is dragged in";
            }
            else if(drunk)
            {
                txt = "stumbles drunkenly in";
            }
            else
            {
                txt = "arrives";
            }
        }

        std::string dtxt;

        switch(door)
        {
        default:
            dtxt = "somewhere";
            break;

        case DIR_NORTH:
            dtxt = "the south";
            break;

        case DIR_EAST:
            dtxt = "the west";
            break;

        case DIR_SOUTH:
            dtxt = "the north";
            break;

        case DIR_WEST:
            dtxt = "the east";
            break;

        case DIR_UP:
            dtxt = "below";
            break;

        case DIR_DOWN:
            dtxt = "above";
            break;

        case DIR_NORTHEAST:
            dtxt = "the south-west";
            break;

        case DIR_NORTHWEST:
            dtxt = "the south-east";
            break;

        case DIR_SOUTHEAST:
            dtxt = "the north-west";
            break;

        case DIR_SOUTHWEST:
            dtxt = "the north-east";
            break;
        }

        if(ch->Mount)
        {
            std::string buf = FormatString("$n %s from %s upon $N.", txt.c_str(), dtxt.c_str());
            Act(AT_ACTION, buf, ch, nullptr, ch->Mount, ActTarget::Room);
        }
        else
        {
            std::string buf = FormatString("$n %s from %s.", txt.c_str(), dtxt.c_str());
            Act(AT_ACTION, buf, ch, nullptr, nullptr, ActTarget::Room);
        }
    }

    if(!IsImmortal(ch)
       && !IsNpc(ch)
       && ch->InRoom->Area != to_room->Area)
    {
        if(ch->TopLevel() < to_room->Area->LevelRanges.Soft.Low)
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You feel uncomfortable being in this strange land...\r\n");
        }
        else if(ch->TopLevel() > to_room->Area->LevelRanges.Soft.High)
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You feel there is not much to gain visiting this place...\r\n");
        }
    }

    do_look(ch, "auto");

    /* BIG ugly looping problem here when the character is mptransed back
       to the starting room.  To avoid this, check how many chars are in
       the room at the start and stop processing followers after doing
       the right number of them.  -- Narn
    */
    if(!fall)
    {
        size_t count = 0;
        const size_t chars = from_room->Characters().size();
        auto copyOfCharacterList = from_room->Characters();

        for(std::shared_ptr<Character> fch : copyOfCharacterList)
        {
            if(count++ >= chars)
            {
                break;
            }

            if(fch != ch                /* loop room bug fix here by Thoric */
               && fch->Master == ch
               && fch->Position == POS_STANDING)
            {
                Act(AT_ACTION, "You follow $N.", fch, NULL, ch, ActTarget::Char);
                MoveCharacter(fch, pexit);
            }
        }
    }

    ch_ret retcode = rNONE;

    if(!ch->InRoom->Objects().empty())
        retcode = CheckRoomForTraps(ch, TRAP_ENTER_ROOM);

    if(retcode != rNONE)
        return retcode;

    if(CharacterDiedRecently(ch))
        return retcode;

    MobProgEntryTrigger(ch);

    if(CharacterDiedRecently(ch))
        return retcode;

    RoomProgEnterTrigger(ch);

    if(CharacterDiedRecently(ch))
        return retcode;

    MobProgGreetTrigger(ch);

    if(CharacterDiedRecently(ch))
        return retcode;

    ObjProgGreetTrigger(ch);
    if(CharacterDiedRecently(ch))
        return retcode;

    if(!CharacterFallIfNoFloor(ch, fall)
       && fall > 0)
    {
        if(!IsAffectedBy(ch, Flag::Affect::Floating)
           || (ch->Mount && !IsAffectedBy(ch->Mount, Flag::Affect::Floating)))
        {
            SetCharacterColor(AT_HURT, ch);
            ch->Echo("OUCH! You hit the ground!\r\n");
            SetWaitState(ch, 20);
            retcode = InflictDamage(ch, ch, 50 * fall, TYPE_UNDEFINED);
        }
        else
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You lightly float down to the ground.\r\n");
        }
    }

    return retcode;
}

std::shared_ptr<Exit> FindDoor(std::shared_ptr<Character> ch, const std::string &arg, bool quiet)
{
    std::shared_ptr<Exit> pexit;
    DirectionType door = DIR_INVALID;

    if(arg.empty())
        return nullptr;

    if(!StrCmp(arg, "n") || !StrCmp(arg, "north"))
    {
        door = DIR_NORTH;
    }
    else if(!StrCmp(arg, "e") || !StrCmp(arg, "east"))
    {
        door = DIR_EAST;
    }
    else if(!StrCmp(arg, "s") || !StrCmp(arg, "south"))
    {
        door = DIR_SOUTH;
    }
    else if(!StrCmp(arg, "w") || !StrCmp(arg, "west"))
    {
        door = DIR_WEST;
    }
    else if(!StrCmp(arg, "u") || !StrCmp(arg, "up"))
    {
        door = DIR_UP;
    }
    else if(!StrCmp(arg, "d") || !StrCmp(arg, "down"))
    {
        door = DIR_DOWN;
    }
    else if(!StrCmp(arg, "ne") || !StrCmp(arg, "northeast"))
    {
        door = DIR_NORTHEAST;
    }
    else if(!StrCmp(arg, "nw") || !StrCmp(arg, "northwest"))
    {
        door = DIR_NORTHWEST;
    }
    else if(!StrCmp(arg, "se") || !StrCmp(arg, "southeast"))
    {
        door = DIR_SOUTHEAST;
    }
    else if(!StrCmp(arg, "sw") || !StrCmp(arg, "southwest"))
    {
        door = DIR_SOUTHWEST;
    }
    else
    {
        for(std::shared_ptr<Exit> xit : ch->InRoom->Exits())
        {
            if((quiet || xit->Flags.test(Flag::Exit::IsDoor))
               && !xit->Keyword.empty()
               && NiftyIsName(arg, xit->Keyword))
            {
                return xit;
            }
        }

        if(!quiet)
        {
            Act(AT_PLAIN, "You see no $T here.", ch, nullptr, arg, ActTarget::Char);
        }

        return nullptr;
    }

    if((pexit = GetExit(ch->InRoom, door)) == nullptr)
    {
        if(!quiet)
            Act(AT_PLAIN, "You see no $T here.", ch, nullptr, arg, ActTarget::Char);

        return nullptr;
    }

    if(quiet)
        return pexit;

    if(pexit->Flags.test(Flag::Exit::Secret))
    {
        Act(AT_PLAIN, "You see no $T here.", ch, nullptr, arg, ActTarget::Char);
        return nullptr;
    }

    if(!pexit->Flags.test(Flag::Exit::IsDoor))
    {
        ch->Echo("You can't do that.\r\n");
        return nullptr;
    }

    return pexit;
}

void SetBExitFlag(std::shared_ptr<Exit> pexit, size_t flag)
{
    pexit->Flags.set(flag);

    std::shared_ptr<Exit> pexit_rev = pexit->ReverseExit;

    if(pexit_rev != nullptr
       && pexit_rev != pexit)
    {
        pexit_rev->Flags.set(flag);
    }
}

void RemoveBExitFlag(std::shared_ptr<Exit> pexit, size_t flag)
{
    pexit->Flags.reset(flag);

    std::shared_ptr<Exit> pexit_rev = pexit->ReverseExit;

    if(pexit_rev != nullptr
       && pexit_rev != pexit)
    {
        pexit_rev->Flags.reset(flag);
    }
}

/*
 * teleport a character to another room
 */
static void TeleportCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Room> room, bool show)
{
    if(IsRoomPrivate(ch, room))
    {
        return;
    }
    
    Act(AT_ACTION, "$n disappears suddenly!", ch, NULL, NULL, ActTarget::Room);
    CharacterFromRoom(ch);
    CharacterToRoom(ch, room);
    Act(AT_ACTION, "$n arrives suddenly!", ch, NULL, NULL, ActTarget::Room);

    if(show)
    {
        do_look(ch, "auto");
    }
}

void Teleport(std::shared_ptr<Character> ch, vnum_t room, int flags)
{
    auto pRoomIndex = GetRoom(room);

    if(pRoomIndex == nullptr)
    {
        Log->Bug("%s: bad room vnum %ld", __FUNCTION__, room);
        return;
    }

    bool show = IsBitSet(flags, TELE_SHOWDESC);

    if(!IsBitSet(flags, TELE_TRANSALL))
    {
        TeleportCharacter(ch, pRoomIndex, show);
    }
    else
    {
        auto charactersInRoom = ch->InRoom->Characters();

        for(auto nch : charactersInRoom)
        {
            TeleportCharacter(nch, pRoomIndex, show);
        }
    }
}

