#include "mud.h"
#include "character.h"
#include "help.h"

/*
 * Show help topics in a level range                            -Thoric
 * Idea suggested by Gorog
 */
void do_hlist( Character *ch, char *argument )
{
  int min = 0;
  int max = 0;
  int maxlimit = GetTrustLevel(ch);
  int minlimit = maxlimit >= LEVEL_GREATER ? -1 : 0;
  int cnt = 0;
  char arg[MAX_INPUT_LENGTH];
  ListIterator *iterator = NULL;
  argument = OneArgument( argument, arg );

  if ( !IsNullOrEmpty( arg ) )
    {
      min = urange( minlimit, atoi(arg), maxlimit );

      if ( !IsNullOrEmpty( argument ) )
	{
	  max = urange( min, atoi(argument), maxlimit );
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

  SetPagerColor( AT_GREEN, ch );
  PagerPrintf( ch, "Help Topics in level range %d to %d:\r\n\r\n", min, max );

  iterator = AllocateIterator(HelpFiles);

  while(HasMoreElements(iterator))
    {
      const HelpFile *help = (HelpFile*)GetData(iterator);

      if ( GetHelpFileLevel( help ) >= min && GetHelpFileLevel( help ) <= max )
	{
	  PagerPrintf( ch, "  %3d %s\r\n",
		       GetHelpFileLevel( help ), GetHelpFileKeyword( help ) );
	  ++cnt;
	}

      MoveToNextElement(iterator);
    }

  FreeIterator(iterator);

  if ( cnt )
    {
      PagerPrintf( ch, "\r\n%d pages found.\r\n", cnt );
    }
  else
    {
      SendToCharacter( "None found.\r\n", ch );
    }
}
