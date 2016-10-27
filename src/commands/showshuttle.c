#include "mud.h"
#include "shuttle.h"

void do_showshuttle (Character * ch, char * argument)
{
  ShuttleStop * stop = NULL;
  int count = 0;
  Shuttle * shuttle = GetShuttle(argument);

  if ( !shuttle )
    {
      if ( FirstShuttle == NULL )
        {
          SetCharacterColor( AT_RED, ch );
          SendToCharacter("There are no shuttles currently formed.\r\n", ch);
          return;
        }

      SetCharacterColor( AT_RED, ch );
      SendToCharacter("No such shuttle.\r\nValid shuttles:\r\n", ch);
      SetCharacterColor( AT_SHIP, ch );

      for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
        Echo(ch, "Shuttle Name: %s - %s\r\n", shuttle->Name,
                  shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
                  shuttle->Type == SHUTTLE_SPACE ? "Space" :
                  shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  Echo(ch, "Shuttle Name: %s - %s\r\n", shuttle->Name,
            shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->Type == SHUTTLE_SPACE ? "Space" :
            shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  Echo(ch, "Filename: %s\t\tDelay: %d\r\n", shuttle->Filename, shuttle->Delay );

  Echo(ch, "Start Room: %d\tEnd Room: %d\t\tEntrance: %d\r\n",
       shuttle->Rooms.First, shuttle->Rooms.Last,
       shuttle->Rooms.Entrance);

  SendToCharacter("Stops:\r\n", ch);

  for (stop = shuttle->FirstStop; stop; stop = stop->Next)
    {
      count += 1;
      Echo(ch, "\tStop # %d\r\n", count );
      Echo(ch, "\t\tStop Name: %s (%d)\r\n", stop->Name, stop->RoomVnum );
    }
}
