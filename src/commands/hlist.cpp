#include "mud.hpp"
#include "character.hpp"
#include "help.hpp"

/*
 * Show help topics in a level range                            -Thoric
 * Idea suggested by Gorog
 */
void do_hlist( Character *ch, std::string argument )
{
  int min = 0;
  int max = 0;
  int maxlimit = GetTrustLevel(ch);
  int minlimit = maxlimit >= LEVEL_GREATER ? -1 : 0;
  int pagesFound = 0;
  std::string arg;
  argument = OneArgument( argument, arg );

  if ( !arg.empty() )
    {
      min = urange( minlimit, std::stoi(arg), maxlimit );

      if ( !argument.empty() )
	{
	  max = urange( min, std::stoi(argument), maxlimit );
	}
      else
	{
	  max = maxlimit;
	}
    }
  else
    {
      min = minlimit;
      max = maxlimit;
    }

  SetCharacterColor( AT_GREEN, ch );
  ch->Echo("Help Topics in level range %d to %d:\r\n\r\n", min, max );

  for(const HelpFile *help : HelpFiles->Entities())
    {
      if ( GetHelpFileLevel( help ) >= min && GetHelpFileLevel( help ) <= max )
	{
          ch->Echo("  %3d %s\r\n",
                   GetHelpFileLevel( help ), GetHelpFileKeyword( help ).c_str() );
	  ++pagesFound;
	}
    }

  if ( pagesFound > 0 )
    {
      ch->Echo("\r\n%d pages found.\r\n", pagesFound );
    }
  else
    {
      ch->Echo("None found.\r\n");
    }
}
