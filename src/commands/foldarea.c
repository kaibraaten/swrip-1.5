#include "mud.h"

void do_foldarea( Character *ch, char *argument )
{
  AREA_DATA *tarea = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: foldarea <filename> [remproto]\r\n", ch );
      return;
    }

  for ( tarea = first_area; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) )
        {
          send_to_char( "Folding...\r\n", ch );

          if (!str_cmp( argument, "remproto") )
            fold_area( tarea, tarea->filename, TRUE );
          else
            fold_area( tarea, tarea->filename, FALSE );

          send_to_char( "Done.\r\n", ch );
          return;
        }
    }

  send_to_char( "No such area exists.\r\n", ch );
}
