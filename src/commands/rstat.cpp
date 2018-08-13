#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_rstat( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Object *obj = NULL;
  int cnt = 0;
  static const char * const dir_text[] = { "n", "e", "s", "w", "u", "d", "ne", "nw", "se", "sw", "?" };

  OneArgument( argument, arg );

  if ( GetTrustLevel( ch ) < LEVEL_IMMORTAL )
    {
      Area * pArea = NULL;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          ch->Echo("You must have an assigned area to goto.\r\n");
          return;
        }

      if ( ch->InRoom->Vnum < pArea->VnumRanges.Room.First
           ||  ch->InRoom->Vnum > pArea->VnumRanges.Room.Last )
        {
          ch->Echo("You can only rstat within your assigned range.\r\n");
          return;
	}
    }

  if ( !StrCmp( arg, "exits" ) )
    {
      location = ch->InRoom;

      ch->Echo("Exits for room '%s.' vnum %d\r\n",
                 location->Name,
                 location->Vnum );
      cnt = 0;

      for(const Exit *pexit : location->Exits())
        {
          ch->Echo("%2d) %2s to %-5d.  Key: %d  Flags: %d  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %d  Exit's RoomVnum: %d  Distance: %d\r\n",
                   ++cnt,
                   dir_text[pexit->Direction],
                   pexit->ToRoom ? pexit->ToRoom->Vnum : 0,
                   pexit->Key,
                   pexit->Flags,
                   pexit->Keyword,
                   !IsNullOrEmpty( pexit->Description )
                   ? pexit->Description : "(none).\r\n",
                   pexit->ReverseExit ? pexit->ReverseExit->Vnum : 0,
                   pexit->ReverseVnum,
                   pexit->Distance );
        }
      
      return;
    }

  location = IsNullOrEmpty( arg ) ? ch->InRoom : FindLocation( ch, arg );

  if ( !location )
    {
      ch->Echo("No such location.\r\n");
      return;
    }

  if ( ch->InRoom != location && IsRoomPrivate( ch, location ) )
    {
      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          ch->Echo("That room is private right now.\r\n");
          return;
        }
      else
	{
          ch->Echo("Overriding private flag!\r\n");
        }
    }

  ch->Echo("Name: %s.\r\nArea: %s  Filename: %s.\r\n",
             location->Name,
             location->Area ? location->Area->Name : "None????",
             location->Area ? location->Area->Filename : "None????" );

  ch->Echo("Vnum: %d.  Sector: %s.  Light: %d.  TeleDelay: %d.  TeleVnum: %d  Tunnel: %d.\r\n",
           location->Vnum,
           SectorNames[location->Sector][0],
           location->Light,
           location->TeleDelay,
           location->TeleVnum,
           location->Tunnel );

  ch->Echo("Room flags: %s\r\n",
        FlagString(location->Flags, RoomFlags).c_str() );
  ch->Echo("Description:\r\n%s", location->Description );

  if ( location->FirstExtraDescription )
    {
      ExtraDescription *ed = NULL;

      ch->Echo("Extra description keywords: '");

      for ( ed = location->FirstExtraDescription; ed; ed = ed->Next )
        {
          ch->Echo(ed->Keyword);

          if ( ed->Next )
            ch->Echo(" ");
        }

      ch->Echo("'.\r\n");
    }

  ch->Echo("Characters:");

  for(const Character *rch : location->Characters())
    {
      if ( CanSeeCharacter( ch, rch ) )
        {
          ch->Echo(" ");
          OneArgument( rch->Name, buf );
          ch->Echo(buf);
        }
    }

  ch->Echo(".\r\nObjects:   ");

  for ( obj = location->FirstContent; obj; obj = obj->NextContent )
    {
      ch->Echo(" ");
      OneArgument( obj->Name, buf );
      ch->Echo(buf);
    }
  ch->Echo(".\r\n");

  if ( !location->Exits().empty() )
    {
      ch->Echo("------------------- EXITS -------------------\r\n");
    }
  
  cnt = 0;

  for(const Exit *pexit : location->Exits())
    {
      ch->Echo("%2d) %-2s to %-5d.  Key: %d  Flags: %d  Keywords: %s.\r\n",
               ++cnt,
               dir_text[pexit->Direction],
               pexit->ToRoom ? pexit->ToRoom->Vnum : 0,
               pexit->Key,
               pexit->Flags,
               !IsNullOrEmpty( pexit->Keyword ) ? pexit->Keyword : "(none)" );
    }
}

