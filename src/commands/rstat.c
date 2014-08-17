#include "character.h"
#include "mud.h"

void do_rstat( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  OBJ_DATA *obj = NULL;
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
          send_to_char( "You must have an assigned area to goto.\r\n", ch );
          return;
        }

      if ( ch->in_room->vnum < pArea->low_r_vnum
           ||  ch->in_room->vnum > pArea->hi_r_vnum )
        {
          send_to_char( "You can only rstat within your assigned range.\r\n", ch );
          return;
	}
    }

  if ( !StrCmp( arg, "exits" ) )
    {
      location = ch->in_room;

      ch_printf( ch, "Exits for room '%s.' vnum %d\r\n",
                 location->name,
                 location->vnum );

      for ( cnt = 0, pexit = location->first_exit; pexit; pexit = pexit->next )
        ch_printf( ch,
                   "%2d) %2s to %-5d.  Key: %d  Flags: %d  Keywords: '%s'.\r\nDescription: %sExit links back to vnum: %d  Exit's RoomVnum\
: %d  Distance: %d\r\n",
                   ++cnt,
                   dir_text[pexit->vdir],
                   pexit->to_room ? pexit->to_room->vnum : 0,
                   pexit->key,
                   pexit->exit_info,
                   pexit->keyword,
                   pexit->description[0] != '\0'
                   ? pexit->description : "(none).\r\n",
                   pexit->rexit ? pexit->rexit->vnum : 0,
                   pexit->rvnum,
                   pexit->distance );
      return;
    }

  location = ( arg[0] == '\0' ) ? ch->in_room : find_location( ch, arg );

  if ( !location )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( ch->in_room != location && room_is_private( ch, location ) )
    {
      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
      else
	{
          send_to_char( "Overriding private flag!\r\n", ch );
        }
    }

  ch_printf( ch, "Name: %s.\r\nArea: %s  Filename: %s.\r\n",
             location->name,
             location->area ? location->area->name : "None????",
             location->area ? location->area->filename : "None????" );

  ch_printf( ch,
             "Vnum: %d.  Sector: %d.  Light: %d.  TeleDelay: %d.  TeleVnum: %d  Tunnel: %d.\r\n",
             location->vnum,
             location->sector_type,
             location->light,
             location->tele_delay,
             location->tele_vnum,
             location->tunnel );

  ch_printf( ch, "Room flags: %s\r\n",
             FlagString(location->room_flags, room_flags) );
  ch_printf( ch, "Description:\r\n%s", location->description );

  if ( location->first_extradesc )
    {
      ExtraDescription *ed = NULL;

      send_to_char( "Extra description keywords: '", ch );

      for ( ed = location->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );

          if ( ed->next )
            send_to_char( " ", ch );
        }

      send_to_char( "'.\r\n", ch );
    }

  send_to_char( "Characters:", ch );

  for ( rch = location->first_person; rch; rch = rch->next_in_room )
    {
      if ( CanSeeCharacter( ch, rch ) )
        {
          send_to_char( " ", ch );
          OneArgument( rch->name, buf );
	  send_to_char( buf, ch );
        }
    }

  send_to_char( ".\r\nObjects:   ", ch );

  for ( obj = location->first_content; obj; obj = obj->next_content )
    {
      send_to_char( " ", ch );
      OneArgument( obj->name, buf );
      send_to_char( buf, ch );
    }
  send_to_char( ".\r\n", ch );

  if ( location->first_exit )
    send_to_char( "------------------- EXITS -------------------\r\n", ch );

  for ( cnt = 0, pexit = location->first_exit; pexit; pexit = pexit->next )
    ch_printf( ch,
               "%2d) %-2s to %-5d.  Key: %d  Flags: %d  Keywords: %s.\r\n",
               ++cnt,
               dir_text[pexit->vdir],
               pexit->to_room ? pexit->to_room->vnum : 0,
               pexit->key,
               pexit->exit_info,
               pexit->keyword[0] != '\0' ? pexit->keyword : "(none)" );
}
