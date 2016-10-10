#include <string.h>
#include "character.h"
#include "mud.h"

void do_astat( Character *ch, char *argument )
{
  Area *tarea = NULL;
  bool proto = false;
  bool found= false;
  char filename_buf[MAX_INPUT_LENGTH];
  char *filename = filename_buf;

  if( !StrCmp( argument, "this" ) )
    {
      strcpy( filename, ch->in_room->Area->filename );
    }
  else
    {
      strcpy( filename, argument );
    }

  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !StrCmp( tarea->filename, filename ) )
      {
        found = true;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !StrCmp( tarea->filename, filename ) )
        {
          found = true;
          proto = true;
          break;
        }

  if ( !found )
    {
      if ( !IsNullOrEmpty( filename ) )
        {
          SendToCharacter( "Area not found. Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->in_room->Area;
        }
    }

  Echo( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->name,
             tarea->filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      Echo( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->max_players,
                 tarea->illegal_pk,
                 tarea->gold_looted );
      if ( tarea->high_economy )
        Echo( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->high_economy,
                   tarea->low_economy );
      else
        Echo( ch, "Area economy: %d credits.\r\n",
                   tarea->low_economy );
      if ( tarea->planet )
        Echo( ch, "Planet: %s.\r\n",
                   tarea->planet->name );
      Echo( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->mdeaths,
                 tarea->mkills,
                 tarea->pdeaths,
                 tarea->pkills );
    }
  Echo( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->author,
             tarea->age,
             tarea->nplayer );
  Echo( ch, "Area flags: %s\r\n", FlagString(tarea->flags, area_flags) );
  Echo( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->VnumRanges.FirstRoom,
	     tarea->VnumRanges.LastRoom );
  Echo( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->VnumRanges.FirstObject,
             tarea->VnumRanges.LastObject );
  Echo( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->VnumRanges.FirstMob,
             tarea->VnumRanges.LastMob );
  Echo( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->LevelRanges.LowSoft,
             tarea->LevelRanges.HighSoft,
             tarea->LevelRanges.LowHard,
             tarea->LevelRanges.HighHard );
  Echo( ch, "Resetmsg: %s\r\n", tarea->resetmsg ? tarea->resetmsg
             : "(default)" ); /* Rennard */
  Echo( ch, "Reset frequency: %d minutes.\r\n",
             tarea->reset_frequency ? tarea->reset_frequency : 15 );
}
