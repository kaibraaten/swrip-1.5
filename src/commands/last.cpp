#include <string.h>
#include <ctype.h>
#include <time.h>
#include "mud.hpp"

/*
 * Based on last time modified, show when a player was last on  -Thoric
 */
void do_last( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  char name[MAX_INPUT_LENGTH];
  struct stat fst;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: last <playername>\r\n", ch );
      return;
    }

  strcpy( name, Capitalize(arg) );
  sprintf( buf, "%s%c/%s", PLAYER_DIR, tolower(arg[0]), name );

  if ( stat( buf, &fst ) != -1 )
    {
      Echo( ch, "%s was last on: %s\r", name, ctime( &fst.st_mtime ) );
    }
  else
    {
      Echo( ch, "%s was not found.\r\n", name );
    }
}
