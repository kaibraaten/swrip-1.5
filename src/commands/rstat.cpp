#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"

void do_rstat( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Object *obj = NULL;
  Character *rch = NULL;
  Exit *pexit = NULL;
  int cnt = 0;
  static const char * const dir_text[] = { "n", "e", "s", "w", "u", "d", "ne", "nw", "se", "sw", "?" };

  OneArgument( argument, arg );

  if ( GetTrustLevel( ch ) < LEVEL_IMMORTAL )
    {
      Area * pArea = NULL;

      if ( !ch->PCData || !(pArea=ch->PCData->Build.Area) )
        {
          SendToCharacter( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( ch->InRoom->Vnum < pArea->VnumRanges.Room.First
           ||  ch->InRoom->Vnum > pArea->VnumRanges.Room.Last )
        {
          SendToCharacter( "You can only rstat within your assigned range.\r\n", ch );
          return;
	}
    }

  if ( !StrCmp( arg, "exits" ) )
    {
      location = ch->InRoom;

      Echo( ch, "Exits for room '%s.' vnum %d\r\n",
                 location->Name,
                 location->Vnum );

      for ( cnt = 0, pexit = location->FirstExit; pexit; pexit = pexit->Next )
        Echo( ch,
	      "%2d) %2s to %-5d.  Key: %d  Flags: %d  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %d  Exit's RoomVnum: %d  Distance: %d\r\n",
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
      return;
    }

  location = IsNullOrEmpty( arg ) ? ch->InRoom : FindLocation( ch, arg );

  if ( !location )
    {
      SendToCharacter( "No such location.\r\n", ch );
      return;
    }

  if ( ch->InRoom != location && IsRoomPrivate( ch, location ) )
    {
      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "That room is private right now.\r\n", ch );
          return;
        }
      else
	{
          SendToCharacter( "Overriding private flag!\r\n", ch );
        }
    }

  Echo( ch, "Name: %s.\r\nArea: %s  Filename: %s.\r\n",
             location->Name,
             location->Area ? location->Area->Name : "None????",
             location->Area ? location->Area->Filename : "None????" );

  Echo( ch,
             "Vnum: %d.  Sector: %s.  Light: %d.  TeleDelay: %d.  TeleVnum: %d  Tunnel: %d.\r\n",
             location->Vnum,
             SectorNames[location->Sector][0],
             location->Light,
             location->TeleDelay,
             location->TeleVnum,
             location->Tunnel );

  Echo( ch, "Room flags: %s\r\n",
             FlagString(location->Flags, RoomFlags) );
  Echo( ch, "Description:\r\n%s", location->Description );

  if ( location->FirstExtraDescription )
    {
      ExtraDescription *ed = NULL;

      SendToCharacter( "Extra description keywords: '", ch );

      for ( ed = location->FirstExtraDescription; ed; ed = ed->Next )
        {
          SendToCharacter( ed->Keyword, ch );

          if ( ed->Next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  SendToCharacter( "Characters:", ch );

  for ( rch = location->FirstPerson; rch; rch = rch->NextInRoom )
    {
      if ( CanSeeCharacter( ch, rch ) )
        {
          SendToCharacter( " ", ch );
          OneArgument( rch->Name, buf );
	  SendToCharacter( buf, ch );
        }
    }

  SendToCharacter( ".\r\nObjects:   ", ch );

  for ( obj = location->FirstContent; obj; obj = obj->NextContent )
    {
      SendToCharacter( " ", ch );
      OneArgument( obj->Name, buf );
      SendToCharacter( buf, ch );
    }
  SendToCharacter( ".\r\n", ch );

  if ( location->FirstExit )
    SendToCharacter( "------------------- EXITS -------------------\r\n", ch );

  for ( cnt = 0, pexit = location->FirstExit; pexit; pexit = pexit->Next )
    Echo( ch,
	  "%2d) %-2s to %-5d.  Key: %d  Flags: %d  Keywords: %s.\r\n",
	  ++cnt,
	  dir_text[pexit->Direction],
	  pexit->ToRoom ? pexit->ToRoom->Vnum : 0,
	  pexit->Key,
	  pexit->Flags,
	  !IsNullOrEmpty( pexit->Keyword ) ? pexit->Keyword : "(none)" );
}
