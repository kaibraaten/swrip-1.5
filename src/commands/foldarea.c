#include "mud.h"

void do_foldarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea = NULL;
  char arg[MAX_INPUT_LENGTH];
  bool fold_all_areas = false;
  bool found = false;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: foldarea <filename> [remproto]\r\n", ch );
      return;
    }

  fold_all_areas = !str_cmp( arg, "all" );

  for ( tarea = first_area; tarea; tarea = tarea->next )
    {
      if ( !str_cmp( tarea->filename, arg ) || fold_all_areas )
        {
          if (!str_cmp( argument, "remproto") )
            fold_area( tarea, tarea->filename, TRUE );
          else
            fold_area( tarea, tarea->filename, FALSE );

	  found = true;
        }
    }

  if( found )
    {
      ch_printf( ch, "Done.\r\n" );
    }
  else
    {
      ch_printf( ch, "No such area exists.\r\n" );
    }
}
