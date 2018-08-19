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

#include <utility/repository.hpp>
#include "types.hpp"

class HelpFile
{
public:
  short      Level = 0;
  char      *Keyword = nullptr;
  char      *Text = nullptr;
};

struct CompareHelpFile
{
  bool operator()(const HelpFile *pHelp, const HelpFile *tHelp) const
  {
    const char *lhs = pHelp->Keyword[0]=='\'' ? pHelp->Keyword+1 : pHelp->Keyword;
    const char *rhs = tHelp->Keyword[0]=='\'' ? tHelp->Keyword+1 : tHelp->Keyword;
    int match = StrCmp(lhs, rhs);

    if(match < 0 || (match == 0 && pHelp->Level > tHelp->Level))
      {
        return true;
      }
    else
      {
        return false;
      }
  }
};

class HelpFileRepository : public Ceris::Repository<HelpFile*, CompareHelpFile>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern HelpFileRepository *HelpFiles;
extern char *HelpGreeting;

HelpFile *GetHelpFile( const Character *ch, char *argument );
HelpFile *AllocateHelpFile( const char *keyword, short level );
void FreeHelpFile( HelpFile *help );

short GetHelpFileLevel( const HelpFile *help );
void SetHelpFileLevel( HelpFile *help, short level );

char *GetHelpFileKeyword( const HelpFile *help );
void SetHelpFileKeyword( HelpFile *help, const char *keyword );

char *GetHelpFileText( const HelpFile *help );
void SetHelpFileText( HelpFile *help, const char *text );
void SetHelpFileTextNoAlloc( HelpFile *help, char *text );

HelpFileRepository *NewHelpFileRepository();

#endif
