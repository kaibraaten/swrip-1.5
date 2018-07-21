#include "mud.hpp"
#include "shuttle.hpp"

void do_showshuttle (Character * ch, char * argument)
{
  ShuttleStop * stop = NULL;
  int count = 0;
  Shuttle * shuttle = Shuttles->FindByName(argument);

  if ( !shuttle )
    {
      if (Shuttles->Count() == 0)
        {
          SetCharacterColor( AT_RED, ch );
          SendToCharacter("There are no shuttles currently formed.\r\n", ch);
          return;
        }

      SetCharacterColor( AT_RED, ch );
      SendToCharacter("No such shuttle.\r\nValid shuttles:\r\n", ch);
      SetCharacterColor( AT_SHIP, ch );

      for(const Shuttle *s : Shuttles->Entities())
        {
          Echo(ch, "Shuttle Name: %s - %s\r\n", s->Name,
               s->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
               s->Type == SHUTTLE_SPACE ? "Space" :
               s->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
        }

      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  Echo(ch, "Shuttle Name: %s - %s\r\n", shuttle->Name,
            shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->Type == SHUTTLE_SPACE ? "Space" :
            shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  Echo(ch, "Delay: %d\r\n", shuttle->Delay );

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
