#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#endif

#include "mud.hpp"
#include "shuttle.hpp"
#include "character.hpp"

void do_setshuttle(Character * ch, char * argument)
{
  Shuttle *shuttle = NULL;
  char arg1[MIL];
  char arg2[MIL];
  int value = 0;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: setshuttle <shuttle name> <field> <value>\r\n", ch);
      SendToCharacter( "Fields:\r\n\tfirstroom, lastroom, entrance, delay\r\n", ch);
      SendToCharacter( "\tname, type, stop, remove shuttle\r\n", ch);\
      SendToCharacter("\tsetshuttle <shuttle> stop <add>\r\n",ch);
      SendToCharacter("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
      SendToCharacter("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
      return;
    }

  shuttle = GetShuttle(arg1);

  if ( !shuttle )
    {
      SetCharacterColor( AT_RED, ch );
      SendToCharacter("No such shuttle.\r\nValid shuttles:\r\n", ch);
      SetCharacterColor( AT_YELLOW, ch );

      for ( shuttle = FirstShuttle; shuttle; shuttle = shuttle->Next )
	{
	  Echo(ch, "Shuttle Name: %s - %s\r\n", shuttle->Name,
		    shuttle->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
		    shuttle->Type == SHUTTLE_SPACE ? "Space" :
		    shuttle->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
	}

      return;
    }

  value = IsNumber( argument ) ? atoi( argument ) : -1;

  if (!StrCmp(arg2, "firstroom"))
    {
      if (value > shuttle->Rooms.Last)
        {
          SendToCharacter("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }

      shuttle->Rooms.First = value;
    }
  else if (!StrCmp(arg2, "lastroom"))
    {
      if (value < shuttle->Rooms.First)
        {
          SendToCharacter("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }

      shuttle->Rooms.Last = value;
    }
  else if (!StrCmp(arg2, "entrance"))
    {
      if (value > shuttle->Rooms.Last
          || value < shuttle->Rooms.First )
        {
          SendToCharacter("Not within valid range.\r\n", ch);
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
      if( GetShuttle( argument ) )
	{
	  Echo( ch, "There's already another shuttle with that name.\r\n" );
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
          SendToCharacter("Types are: turbocar, space, hyperspace.\r\n", ch);
          return;
        }
    }
  else if (!StrCmp(arg2, "remove"))
    {
      DestroyShuttle(shuttle);
      SendToCharacter("Shuttle Removed.\r\n", ch);
      return;
    }
  else if (!StrCmp(arg2, "stop"))
    {
      ShuttleStop * stop = NULL;
      argument = OneArgument(argument, arg1);

      if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( argument ))
        {
          SendToCharacter("Usage: \r\n",ch);
          SendToCharacter("\tsetshuttle <shuttle> stop <add>\r\n",ch);
          SendToCharacter("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
          SendToCharacter("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
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
	      SendToCharacter("Invalid Param.\r\n", ch);
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
	      SendToCharacter("Invalid Stop\r\n", ch);
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

	      FreeMemory(stop);
	      SendToCharacter("Stop removed.\r\n", ch);
	      return;
	    }
	  else
	    {
	      SendToCharacter("Invalid Option.\r\n", ch);
	      return;
	    }
	}
    }
  else
    {
      SendToCharacter("Unknown field", ch);
      return;
    }

  SaveShuttle(shuttle, 0);
  SendToCharacter("Ok.\r\n", ch);
}
