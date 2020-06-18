#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#endif

#include "mud.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "repos/shuttlerepository.hpp"

void do_setshuttle( std::shared_ptr<Character> ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  int value = 0;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() || argument.empty() )
    {
      ch->Echo("Usage: setshuttle <shuttle name> <field> <value>\r\n");
      ch->Echo("Fields:\r\n\tfirstroom, lastroom, entrance, delay\r\n");
      ch->Echo("\tname, type, stop, remove shuttle\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <add>\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n");
      ch->Echo("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n");
      return;
    }

  std::shared_ptr<Shuttle> shuttle = Shuttles->FindByName(arg1);

  if (shuttle == nullptr)
    {
      SetCharacterColor( AT_RED, ch );
      ch->Echo("No such shuttle.\r\nValid shuttles:\r\n");
      SetCharacterColor( AT_YELLOW, ch );

      for(std::shared_ptr<Shuttle> s : Shuttles)
	{
          ch->Echo( "Shuttle Name: %s - %s\r\n", s->Name.c_str(),
                    s->Type == SHUTTLE_TURBOCAR ? "Turbocar" :
                    s->Type == SHUTTLE_SPACE ? "Space" :
                    s->Type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
	}

      return;
    }

  value = IsNumber( argument ) ? ToLong( argument ) : -1;

  if (!StrCmp(arg2, "firstroom"))
    {
      if (value > shuttle->Rooms.Last)
        {
          ch->Echo("First room should be less than last room.\r\n");
          return;
        }

      shuttle->Rooms.First = value;
    }
  else if (!StrCmp(arg2, "lastroom"))
    {
      if (value < shuttle->Rooms.First)
        {
          ch->Echo("First room should be less than last room.\r\n");
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
      
      unlink( GetShuttleFilename( shuttle ).c_str() );
      shuttle->Name = argument;
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
      Shuttles->DeleteFromStorage(shuttle);
      ch->Echo("Shuttle Removed.\r\n");
      return;
    }
  else if (!StrCmp(arg2, "stop"))
    {
      std::shared_ptr<ShuttleStop> stop;
      argument = OneArgument(argument, arg1);

      if ( arg1.empty() || argument.empty() )
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

          stop->Name = "Nameless stop";
          stop->RoomVnum = ROOM_VNUM_LIMBO;
          shuttle->Add(stop);
        }
      else
	{
	  if ( arg1.empty() || argument.empty() )
	    {
              ch->Echo("Invalid Param.\r\n");
	      return;
	    }

	  value = IsNumber( arg1 ) ? ToLong( arg1 ) : -1;
          size_t pos = value - 1;

          if( pos < shuttle->Stops().size() )
            {
              stop = shuttle->Stops()[pos];
            }
          else
	    {
              ch->Echo("Invalid Stop\r\n");
	      return;
	    }

	  argument = OneArgument(argument, arg2);

	  if (!StrCmp(arg2, "name"))
	    {
	      stop->Name = argument;
	    }
	  else if (!StrCmp(arg2, "room"))
	    {
	      value = IsNumber( argument ) ? ToLong( argument ) : -1;
	      stop->RoomVnum = value;
	    }
	  else if (!StrCmp(arg2, "remove"))
	    {
              shuttle->Remove(stop);
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
