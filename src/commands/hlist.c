#include "mud.h"
#include "character.h"
#include "help.h"

/*
 * Show help topics in a level range                            -Thoric
 * Idea suggested by Gorog
 */
void do_hlist( CHAR_DATA *ch, char *argument )
{
  int min = 0;
  int max = 0;
  int maxlimit = get_trust(ch);
  int minlimit = maxlimit >= LEVEL_GREATER ? -1 : 0;
  int cnt = 0;
  char arg[MAX_INPUT_LENGTH];
  CerisMapIterator *iter = NULL;

  argument = one_argument( argument, arg );

  if ( arg[0] != '\0' )
    {
      min = URANGE( minlimit, atoi(arg), maxlimit );

      if ( argument[0] != '\0' )
	{
	  max = URANGE( min, atoi(argument), maxlimit );
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

  iter = CreateMapIterator( HelpFiles );

  for ( cnt = 0 ; !MapIterator_IsDone( iter ); MapIterator_Next( iter ) )
    {
      HELP_DATA *help = (HELP_DATA*) MapIterator_GetKey( iter );
      int level = get_help_level( help );

      if ( level >= min && level <= max )
	{
	  pager_printf( ch, "  %3d %s\r\n", level, get_help_keyword( help ) );
	  ++cnt;
	}
    }

  DestroyMapIterator( iter );

  if ( cnt )
    {
      pager_printf( ch, "\r\n%d pages found.\r\n", cnt );
    }
  else
    {
      send_to_char( "None found.\r\n", ch );
    }
}
