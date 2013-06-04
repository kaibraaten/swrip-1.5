#include <string.h>
#include <ctype.h>
#include <time.h>
#include "mud.h"

/*
 * Based on last time modified, show when a player was last on  -Thoric
 */
void do_last( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  char name[MAX_INPUT_LENGTH];
  struct stat fst;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: last <playername>\r\n", ch );
      return;
    }

  strcpy( name, capitalize(arg) );
  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]), name );

  if ( stat( buf, &fst ) != -1 )
    {
      ch_printf( ch, "%s was last on: %s\r", name, ctime( &fst.st_mtime ) );
    }
  else
    {
      ch_printf( ch, "%s was not found.\r\n", name );
    }
}
