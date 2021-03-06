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

#ifndef _SWRIP_HELP_HPP_
#define _SWRIP_HELP_HPP_

#include <memory>
#include <string>
#include "types.hpp"

class HelpFile
{
public:
    short Level = 0;
    std::string Keyword;
    std::string Text;
};

inline std::string HelpGreeting;

std::shared_ptr<HelpFile> GetHelpFile(std::shared_ptr<Character> ch, std::string argument);
std::shared_ptr<HelpFile> AllocateHelpFile(const std::string &keyword, short level);

short GetHelpFileLevel(const std::shared_ptr<HelpFile> &help);
void SetHelpFileLevel(const std::shared_ptr<HelpFile> &help, short level);

std::string GetHelpFileKeyword(const std::shared_ptr<HelpFile> &help);
void SetHelpFileKeyword(const std::shared_ptr<HelpFile> &help, const std::string &keyword);

#endif
