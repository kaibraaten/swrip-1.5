#include "mud.h"
#include "shuttle.h"

void do_showshuttle (Character * ch, char * argument)
{
  STOP_DATA * stop = NULL;
  int count = 0;
  SHUTTLE_DATA * shuttle = get_shuttle(argument);

  if ( !shuttle )
    {
      if ( first_shuttle == NULL )
        {
          set_char_color( AT_RED, ch );
          send_to_char("There are no shuttles currently formed.\r\n", ch);
          return;
        }
      set_char_color( AT_RED, ch );
      send_to_char("No such shuttle.\r\nValid shuttles:\r\n", ch);
      set_char_color( AT_SHIP, ch );
      for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
        ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
                  shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
                  shuttle->type == SHUTTLE_SPACE ? "Space" :
                  shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
      return;
    }

  set_char_color( AT_YELLOW, ch );
  ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
            shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->type == SHUTTLE_SPACE ? "Space" :
            shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  ch_printf(ch, "Filename: %s\t\tDelay: %d\r\n", shuttle->filename, shuttle->delay );

  ch_printf(ch, "Start Room: %d\tEnd Room: %d\t\tEntrance: %d\r\n",
            shuttle->room.first, shuttle->room.last,
            shuttle->room.entrance);

  send_to_char("Stops:\r\n", ch);
  for (stop = shuttle->first_stop; stop; stop = stop->next)
    {
      count += 1;
      ch_printf(ch, "\tStop # %d\r\n", count );
      ch_printf(ch, "\t\tStop Name: %s (%d)\r\n", stop->stop_name, stop->room );
    }
}
