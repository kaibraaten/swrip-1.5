#include "mud.h"
#include "shuttle.h"

void do_showshuttle (Character * ch, char * argument)
{
  ShuttleStop * stop = NULL;
  int count = 0;
  Shuttle * shuttle = GetShuttle(argument);

  if ( !shuttle )
    {
      if ( first_shuttle == NULL )
        {
          SetCharacterColor( AT_RED, ch );
          SendToCharacter("There are no shuttles currently formed.\r\n", ch);
          return;
        }
      SetCharacterColor( AT_RED, ch );
      SendToCharacter("No such shuttle.\r\nValid shuttles:\r\n", ch);
      SetCharacterColor( AT_SHIP, ch );
      for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
        ChPrintf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
                  shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
                  shuttle->type == SHUTTLE_SPACE ? "Space" :
                  shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  ChPrintf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
            shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->type == SHUTTLE_SPACE ? "Space" :
            shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  ChPrintf(ch, "Filename: %s\t\tDelay: %d\r\n", shuttle->filename, shuttle->delay );

  ChPrintf(ch, "Start Room: %d\tEnd Room: %d\t\tEntrance: %d\r\n",
            shuttle->room.first, shuttle->room.last,
            shuttle->room.entrance);

  SendToCharacter("Stops:\r\n", ch);
  for (stop = shuttle->first_stop; stop; stop = stop->next)
    {
      count += 1;
      ChPrintf(ch, "\tStop # %d\r\n", count );
      ChPrintf(ch, "\t\tStop Name: %s (%d)\r\n", stop->stop_name, stop->room );
    }
}
