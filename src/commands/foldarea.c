#include <string.h>
#include "mud.h"
#include "character.h"

void do_foldarea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char arg[MAX_INPUT_LENGTH];
  bool fold_all_areas = false;
  bool found = false;

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Usage: foldarea <filename> [remproto]\r\n", ch );
      return;
    }

  if( !StrCmp( arg, "this" ) )
    {
      strcpy( arg, ch->in_room->area->filename );
    }

  fold_all_areas = !StrCmp( arg, "all" );

  for ( tarea = first_area; tarea; tarea = tarea->next )
    {
      if ( !StrCmp( tarea->filename, arg ) || fold_all_areas )
        {
          if (!StrCmp( argument, "remproto") )
            fold_area( tarea, tarea->filename, true );
          else
            fold_area( tarea, tarea->filename, false );

	  found = true;
        }
    }

  if( found )
    {
      ChPrintf( ch, "Done.\r\n" );
    }
  else
    {
      ChPrintf( ch, "No such area exists.\r\n" );
    }
}
