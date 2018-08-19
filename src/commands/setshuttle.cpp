#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#endif

#include "mud.hpp"
#include "shuttle.hpp"
#include "character.hpp"

void do_setshuttle(Character * ch, char * argument)
{
  char arg1[MIL];
  char arg2[MIL];
  int value = 0;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: setshuttle <shuttle name> <field> <value>\r\n");
      ch->Echo("Fields:\r\n\tfirstroom, lastroom, entrance, delay\r\n");
      ch->Echo("\tname, type, stop, remove shuttle\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <add>\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n");
      return;
    }

  Shuttle *shuttle = Shuttles->FindByName(arg1);

  if (shuttle == nullptr)
    {
      SetCharacterColor( AT_RED, ch );
      ch->Echo("No such shuttle.\r\nValid shuttles:\r\n");
      SetCharacterColor( AT_YELLOW, ch );

      for(const Shuttle *s : Shuttles->Entities())
	{
          ch->Echo("Shuttle Name: %s - %s\r\n", s->Name,
		    s->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
		    s->Type == SHUTTLE_SPACE ? "Space" :
		    s->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
	}

      return;
    }

  value = IsNumber( argument ) ? atoi( argument ) : -1;

  if (!StrCmp(arg2, "firstroom"))
    {
      if (value > shuttle->Rooms.Last)
        {
          ch->Echo("Uh.. First room should be less than last room.\r\n");
          return;
        }

      shuttle->Rooms.First = value;
    }
  else if (!StrCmp(arg2, "lastroom"))
    {
      if (value < shuttle->Rooms.First)
        {
          ch->Echo("Uh.. First room should be less than last room.\r\n");
          return;
        }

      shuttle->Rooms.Last = value;
    }
  else if (!StrCmp(arg2, "entrance"))
    {
      if (value > shuttle->Rooms.Last
          || value < shuttle->Rooms.First )
        {
          ch->Echo("Not within valid range.\r\n");
          return;
        }

      shuttle->Rooms.Entrance = value;
    }
  else if (!StrCmp(arg2, "delay"))
    {
      shuttle->Delay = value;
      shuttle->CurrentDelay = shuttle->Delay;
    }
  else if (!StrCmp(arg2, "name"))
    {
      if(Shuttles->FindByName( argument ) != nullptr)
	{
   ch->Echo("There's already another shuttle with that name.\r\n" );
	  return;
	}
      
      unlink( GetShuttleFilename( shuttle ) );
      
      if (shuttle->Name)
	{
	  FreeMemory(shuttle->Name);
	}

      shuttle->Name = CopyString(argument);
    }
  else if (!StrCmp(arg2, "type"))
    {
      if (!StrCmp(argument, "turbocar"))
	{
	  shuttle->Type = SHUTTLE_TURBOCAR;
	}
      else if (!StrCmp(argument, "space"))
	{
	  shuttle->Type = SHUTTLE_SPACE;
	}
      else if (!StrCmp(argument, "hyperspace"))
	{
	  shuttle->Type = SHUTTLE_HYPERSPACE;
	}
      else
        {
          ch->Echo("Types are: turbocar, space, hyperspace.\r\n");
          return;
        }
    }
  else if (!StrCmp(arg2, "remove"))
    {
      PermanentlyDestroyShuttle(shuttle);
      ch->Echo("Shuttle Removed.\r\n");
      return;
    }
  else if (!StrCmp(arg2, "stop"))
    {
      ShuttleStop * stop = nullptr;
      argument = OneArgument(argument, arg1);

      if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( argument ))
        {
          ch->Echo("Usage: \r\n");
          ch->Echo("\tsetshuttle <shuttle> stop <add>\r\n");
          ch->Echo("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n");
          ch->Echo("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n");
          return;
        }

      if (!StrCmp(arg1, "add"))
        {
          stop = AllocateShuttleStop();

          if ( stop->Name )
	    {
	      FreeMemory( stop->Name );
	    }

          stop->Name = CopyString("Stopless Name");
          stop->RoomVnum = ROOM_VNUM_LIMBO;
          LINK( stop, shuttle->FirstStop, shuttle->LastStop, Next, Previous );

          if (shuttle->CurrentStop == NULL)
	    {
	      shuttle->CurrentStop = shuttle->FirstStop;
	    }
        }
      else
	{
	  int count = 0;

	  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( argument ) )
	    {
       ch->Echo("Invalid Param.\r\n");
	      return;
	    }

	  value = IsNumber( arg1 ) ? atoi( arg1 ) : -1;

	  for (stop = shuttle->FirstStop; stop; stop = stop->Next)
	    {
	      count++;

	      if (value == count)
		{
		  break;
		}
	    }

	  if ( stop == NULL)
	    {
       ch->Echo("Invalid Stop\r\n");
	      return;
	    }

	  argument = OneArgument(argument, arg2);

	  if (!StrCmp(arg2, "name"))
	    {
	      if (stop->Name)
		{
		  FreeMemory(stop->Name);
		}

	      stop->Name = CopyString(argument);
	    }
	  else if (!StrCmp(arg2, "room"))
	    {
	      value = IsNumber( argument ) ? atoi( argument ) : -1;
	      stop->RoomVnum = value;
	    }
	  else if (!StrCmp(arg2, "remove"))
	    {
	      UNLINK(stop, shuttle->FirstStop, shuttle->LastStop, Next, Previous);

	      if (stop->Name)
		{
		  FreeMemory(stop->Name);
		}

	      delete stop;
              ch->Echo("Stop removed.\r\n");
	      return;
	    }
	  else
	    {
              ch->Echo("Invalid Option.\r\n");
	      return;
	    }
	}
    }
  else
    {
      ch->Echo("Unknown field");
      return;
    }

  Shuttles->Save(shuttle);
  ch->Echo("Ok.\r\n");
}

