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

#include <cassert>
#include <cctype>
#include <ctime>
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "luascript.hpp"
#include "room.hpp"
#include "object.hpp"
#include "descriptor.hpp"
#include "repos/descriptorrepository.hpp"

void EchoToAll(short AT_COLOR, const std::string &argument, short tar)
{
    if(argument.empty())
        return;

    for(auto d : Descriptors)
    {
        /* Added showing echoes to players who are editing, so they won't
           miss out on important info like upcoming reboots. --Narn */
        if(IsPlaying(d->Char) || IsInEditor(d->Char))
        {
            /* This one is kinda useless except for switched.. */
            if((tar == ECHOTAR_PC && IsNpc(d->Char))
               || (tar == ECHOTAR_IMM && !IsImmortal(d->Char)))
                continue;

            SetCharacterColor(AT_COLOR, d->Char);
            d->Char->Echo("%s\r\n", argument.c_str());
        }
    }
}

void EchoToRoom(short AT_COLOR, std::shared_ptr<Room> room, const std::string &argument)
{
    RealEchoToRoom(AT_COLOR, room, argument, true);
}

void EchoToRoomNoNewline(int ecolor, std::shared_ptr<Room> room, const std::string &argument)
{
    RealEchoToRoom(ecolor, room, argument, false);
}

void RealEchoToRoom(short color, std::shared_ptr<Room> room, const std::string &text, bool sendNewline)
{
    assert(room != nullptr);

    for(std::shared_ptr<Character> vic : room->Characters())
    {
        SetCharacterColor(color, vic);
        vic->Echo(text);

        if(sendNewline)
        {
            vic->Echo("\r\n");
        }
    }
}

std::shared_ptr<Room> FindLocation(std::shared_ptr<Character> ch, const std::string &arg)
{
    if(IsNumber(arg))
    {
        return GetRoom(strtol(arg.c_str(), nullptr, 10));
    }

    std::shared_ptr<Character> victim = GetCharacterAnywhere(ch, arg);

    if(victim != nullptr)
    {
        return victim->InRoom;
    }

    auto obj = GetObjectAnywhere(ch, arg);

    if(obj != nullptr)
    {
        return obj->InRoom;
    }
    else
    {
        return nullptr;
    }
}

void GenerateRebootString()
{
    reboot_time = asctime(new_boot_time);
}
