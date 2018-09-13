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

#include "help.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "repos/helprepository.hpp"

std::string HelpGreeting;

HelpFile *GetHelpFile( const Character *ch, std::string argument )
{
  std::string argall;
  std::string argone;
  std::string argnew;
  HelpFile *foundHelpfile = NULL;
  int lev = 0;

  if ( argument.empty() )
    {
      argument = "summary";
    }

  if ( isdigit(argument[0]) )
    {
      lev = NumberArgument( argument, argnew );
      argument = argnew;
    }
  else
    {
      lev = -2;
    }

  /*
   * Tricky argument handling so 'help a b' doesn't match a.
   */
  while ( !argument.empty() )
    {
      argument = OneArgument( argument, argone );

      if ( !argall.empty() )
	{
          argall += " ";
	}

      argall += argone;
    }

  for(HelpFile *pHelp : HelpFiles->Entities())
    {
      if ( GetHelpFileLevel( pHelp ) > GetTrustLevel( ch ) )
	{
	  continue;
	}

      if ( lev != -2 && GetHelpFileLevel( pHelp ) != lev )
	{
	  continue;
	}

      if ( IsName( argall, GetHelpFileKeyword( pHelp ) ) )
	{
	  foundHelpfile = pHelp;
          break;
	}
    }

  return foundHelpfile;
}

HelpFile *AllocateHelpFile( const std::string &keyword, short level )
{
  HelpFile *help = new HelpFile();
  
  SetHelpFileKeyword( help, keyword );
  SetHelpFileText( help, "" );
  SetHelpFileLevel( help, level );

  return help;
}

void FreeHelpFile( HelpFile *help )
{
  delete help;
}

short GetHelpFileLevel( const HelpFile *help )
{
  return help->Level;
}

void SetHelpFileLevel( HelpFile *help, short level )
{
  if( level >= -1 && level <= MAX_LEVEL )
    {
      help->Level = level;
    }
  else
    {
      Log->Bug( "%s:%s:%d: Argument level = %d is out of range.",
                __FUNCTION__, __FILE__, __LINE__, level );
    }
}

std::string GetHelpFileKeyword( const HelpFile *help )
{
  return help->Keyword;
}

void SetHelpFileKeyword( HelpFile *help, const std::string &keyword )
{
  help->Keyword = keyword;
}

std::string GetHelpFileText( const HelpFile *help )
{
  return help->Text;
}

void SetHelpFileText( HelpFile *help, const std::string &text )
{
  help->Text = text;
}
