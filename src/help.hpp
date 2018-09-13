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

#include <string>
#include "types.hpp"

class HelpFile
{
public:
  short Level = 0;
  std::string Keyword;
  std::string Text;
};

extern std::string HelpGreeting;

HelpFile *GetHelpFile( const Character *ch, std::string argument );
HelpFile *AllocateHelpFile( const std::string &keyword, short level );
void FreeHelpFile( HelpFile *help );

short GetHelpFileLevel( const HelpFile *help );
void SetHelpFileLevel( HelpFile *help, short level );

std::string GetHelpFileKeyword( const HelpFile *help );
void SetHelpFileKeyword( HelpFile *help, const std::string &keyword );

std::string GetHelpFileText( const HelpFile *help );
void SetHelpFileText( HelpFile *help, const std::string &text );

#endif
