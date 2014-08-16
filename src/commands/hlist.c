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
  HelpFile *help = NULL;

  argument = one_argument( argument, arg );

  if ( arg[0] != '\0' )
    {
      min = urange( minlimit, atoi(arg), maxlimit );

      if ( argument[0] != '\0' )
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

  set_pager_color( AT_GREEN, ch );
  pager_printf( ch, "Help Topics in level range %d to %d:\r\n\r\n", min, max );

  for ( cnt = 0, help = first_help; help; help = help->next )
    {
      if ( help->level >= min && help->level <= max )
	{
	  pager_printf( ch, "  %3d %s\r\n", help->level, help->keyword );
	  ++cnt;
	}
    }

  if ( cnt )
    {
      pager_printf( ch, "\r\n%d pages found.\r\n", cnt );
    }
  else
    {
      send_to_char( "None found.\r\n", ch );
    }
}
