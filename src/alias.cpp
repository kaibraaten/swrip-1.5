/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * -----------------------------------------------------------|   (0...0)   *
 * SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    *
 * -----------------------------------------------------------|    {o o}    *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~*
 * Tricops and Fireblade                                      |             *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 * ------------------------------------------------------------------------ *
 *                        Alias module                                      *
 ****************************************************************************/

 /******************************************************
             Desolation of the Dragon MUD II
       (C) 1997, 1998  Jesse DeFer and Heath Leach
  http://dotd.mudservices.com  dotd@dotd.mudservices.com
  ******************************************************/

#include <utility/algorithms.hpp>
#include <cstring>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "alias.hpp"

std::shared_ptr<Alias> FindAlias(std::shared_ptr<Character> ch, const std::string &argument)
{
    std::string alias_name;

    if(!ch || !ch->PCData)
    {
        return nullptr;
    }

    OneArgument(argument, alias_name);

    auto alias = Find(ch->PCData->Aliases(),
                      [alias_name](auto a)
                      {
                          return StringPrefix(alias_name, a->Name) == 0;
                      });

    return alias;
}

std::shared_ptr<Alias> AllocateAlias(const std::string &name, const std::string &command)
{
    auto alias = std::make_shared<Alias>();
    alias->Name = name;
    alias->Command = command;

    return alias;
}

void FreeAliases(std::shared_ptr<Character> ch)
{
    assert(ch != nullptr);

    if(IsNpc(ch))
    {
        return;
    }

    while(!ch->PCData->Aliases().empty())
    {
        auto alias = ch->PCData->Aliases().front();
        ch->PCData->Remove(alias);
    }
}

bool CheckAlias(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument)
{
    bool nullarg = true;

    if(!argument.empty())
    {
        nullarg = false;
    }

    auto alias = FindAlias(ch, command);

    if(alias == nullptr)
    {
        return false;
    }

    if(alias->Command.empty())
    {
        return false;
    }

    std::string arg = alias->Command;

    if(ch->CmdRecurse == -1 || ++ch->CmdRecurse > 50)
    {
        if(ch->CmdRecurse != -1)
        {
            ch->Echo("Unable to further process command, recurses too much.\r\n");
            ch->CmdRecurse = -1;
        }

        return false;
    }

    if(!argument.empty() && !nullarg)
    {
        arg += " " + argument;
    }

    Interpret(ch, arg);
    return true;
}

void AddAlias(std::shared_ptr<Character> ch, std::shared_ptr<Alias> alias)
{
    if(IsNpc(ch))
    {
        return;
    }

    bool alreadyExists = Find(ch->PCData->Aliases(),
                              [alias](const auto &a)
                              {
                                  return StrCmp(alias->Name, a->Name) == 0;
                              }) ? true : false;

    if(!alreadyExists)
    {
        ch->PCData->Add(alias);
    }
}

void UnlinkAlias(std::shared_ptr<Character> ch, std::shared_ptr<Alias> alias)
{
    if(IsNpc(ch))
    {
        return;
    }

    ch->PCData->Remove(alias);
}
