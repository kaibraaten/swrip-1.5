/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe     *
 * ------------------------------------------------------------------------ *
 *                        Alias module header information                   *
 ****************************************************************************/

 /******************************************************
             Desolation of the Dragon MUD II
       (C) 1997, 1998  Jesse DeFer and Heath Leach
  http://dotd.mudservices.com  dotd@dotd.mudservices.com
  ******************************************************/

#ifndef _SWRIP_ALIAS_HPP_
#define _SWRIP_ALIAS_HPP_

#include <string>
#include <memory>
#include "types.hpp"

class Alias
{
public:
    std::string Name;
    std::string Command;
};

void FreeAliases(std::shared_ptr<Character> ch);
bool CheckAlias(std::shared_ptr<Character> ch, const std::string &command, const std::string &argument);
std::shared_ptr<Alias> FindAlias(std::shared_ptr<Character> ch, const std::string &argument);
std::shared_ptr<Alias> AllocateAlias(const std::string &name, const std::string &command);
void AddAlias(std::shared_ptr<Character> ch, std::shared_ptr<Alias> alias);
void UnlinkAlias(std::shared_ptr<Character> ch, std::shared_ptr<Alias> alias);

#endif
