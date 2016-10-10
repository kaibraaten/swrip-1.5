#include "character.h"
#include "mud.h"

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

      if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
          SendToCharacter( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( ch->in_room->Vnum < pArea->VnumRanges.FirstRoom
           ||  ch->in_room->Vnum > pArea->VnumRanges.LastRoom )
        {
          SendToCharacter( "You can only rstat within your assigned range.\r\n", ch );
          return;
	}
    }

  if ( !StrCmp( arg, "exits" ) )
    {
      location = ch->in_room;

      Echo( ch, "Exits for room '%s.' vnum %d\r\n",
                 location->Name,
                 location->Vnum );

      for ( cnt = 0, pexit = location->FirstExit; pexit; pexit = pexit->next )
        Echo( ch,
	      "%2d) %2s to %-5d.  Key: %d  Flags: %d  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %d  Exit's RoomVnum: %d  Distance: %d\r\n",
	      ++cnt,
	      dir_text[pexit->vdir],
	      pexit->to_room ? pexit->to_room->Vnum : 0,
	      pexit->key,
	      pexit->exit_info,
	      pexit->keyword,
	      !IsNullOrEmpty( pexit->description )
	      ? pexit->description : "(none).\r\n",
	      pexit->rexit ? pexit->rexit->vnum : 0,
	      pexit->rvnum,
	      pexit->distance );
      return;
    }

  location = IsNullOrEmpty( arg ) ? ch->in_room : FindLocation( ch, arg );

  if ( !location )
    {
      SendToCharacter( "No such location.\r\n", ch );
      return;
    }

  if ( ch->in_room != location && IsRoomPrivate( ch, location ) )
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
             location->Area ? location->Area->name : "None????",
             location->Area ? location->Area->filename : "None????" );

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

      for ( ed = location->FirstExtraDescription; ed; ed = ed->next )
        {
          SendToCharacter( ed->keyword, ch );

          if ( ed->next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  SendToCharacter( "Characters:", ch );

  for ( rch = location->FirstPerson; rch; rch = rch->next_in_room )
    {
      if ( CanSeeCharacter( ch, rch ) )
        {
          SendToCharacter( " ", ch );
          OneArgument( rch->name, buf );
	  SendToCharacter( buf, ch );
        }
    }

  SendToCharacter( ".\r\nObjects:   ", ch );

  for ( obj = location->FirstContent; obj; obj = obj->next_content )
    {
      SendToCharacter( " ", ch );
      OneArgument( obj->name, buf );
      SendToCharacter( buf, ch );
    }
  SendToCharacter( ".\r\n", ch );

  if ( location->FirstExit )
    SendToCharacter( "------------------- EXITS -------------------\r\n", ch );

  for ( cnt = 0, pexit = location->FirstExit; pexit; pexit = pexit->next )
    Echo( ch,
	  "%2d) %-2s to %-5d.  Key: %d  Flags: %d  Keywords: %s.\r\n",
	  ++cnt,
	  dir_text[pexit->vdir],
	  pexit->to_room ? pexit->to_room->Vnum : 0,
	  pexit->key,
	  pexit->exit_info,
	  !IsNullOrEmpty( pexit->keyword ) ? pexit->keyword : "(none)" );
}
