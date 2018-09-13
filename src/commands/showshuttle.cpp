#include "mud.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "repos/shuttlerepository.hpp"

void do_showshuttle( Character *ch, std::string argument )
{
  const Shuttle *shuttle = Shuttles->FindByName(argument);

  if ( shuttle == nullptr )
    {
      if (Shuttles->Count() == 0)
        {
          SetCharacterColor( AT_RED, ch );
          ch->Echo("There are no shuttles currently formed.\r\n");
          return;
        }

      SetCharacterColor( AT_RED, ch );
      ch->Echo("No such shuttle.\r\nValid shuttles:\r\n");
      SetCharacterColor( AT_SHIP, ch );

      for(const Shuttle *s : Shuttles->Entities())
        {
          ch->Echo( "Shuttle Name: %s - %s\r\n", s->Name.c_str(),
                    s->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
                    s->Type == SHUTTLE_SPACE ? "Space" :
                    s->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
        }

      return;
    }

  SetCharacterColor( AT_YELLOW, ch );
  ch->Echo("Shuttle Name: %s - %s\r\n", shuttle->Name.c_str(),
            shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
            shuttle->Type == SHUTTLE_SPACE ? "Space" :
            shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
  ch->Echo("Delay: %d\r\n", shuttle->Delay );

  ch->Echo("Start Room: %d\tEnd Room: %d\t\tEntrance: %d\r\n",
       shuttle->Rooms.First, shuttle->Rooms.Last,
       shuttle->Rooms.Entrance);

  ch->Echo("Stops:\r\n");

  int count = 0;
  
  for(const ShuttleStop *stop : shuttle->Stops())
    {
      ch->Echo("\tStop # %d\r\n", ++count );
      ch->Echo("\t\tStop Name: %s (%d)\r\n", stop->Name.c_str(), stop->RoomVnum );
    }
}
