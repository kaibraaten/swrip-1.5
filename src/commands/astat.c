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
      strcpy( filename, ch->in_room->area->filename );
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
      if ( filename && filename[0] != '\0' )
        {
          SendToCharacter( "Area not found. Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->in_room->area;
        }
    }

  ChPrintf( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->name,
             tarea->filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      ChPrintf( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->max_players,
                 tarea->illegal_pk,
                 tarea->gold_looted );
      if ( tarea->high_economy )
        ChPrintf( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->high_economy,
                   tarea->low_economy );
      else
        ChPrintf( ch, "Area economy: %d credits.\r\n",
                   tarea->low_economy );
      if ( tarea->planet )
        ChPrintf( ch, "Planet: %s.\r\n",
                   tarea->planet->name );
      ChPrintf( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->mdeaths,
                 tarea->mkills,
                 tarea->pdeaths,
                 tarea->pkills );
    }
  ChPrintf( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->author,
             tarea->age,
             tarea->nplayer );
  ChPrintf( ch, "Area flags: %s\r\n", FlagString(tarea->flags, area_flags) );
  ChPrintf( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->low_r_vnum,
	     tarea->hi_r_vnum );
  ChPrintf( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->low_o_vnum,
             tarea->hi_o_vnum );
  ChPrintf( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->low_m_vnum,
             tarea->hi_m_vnum );
  ChPrintf( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->low_soft_range,
             tarea->hi_soft_range,
             tarea->low_hard_range,
             tarea->hi_hard_range );
  ChPrintf( ch, "Resetmsg: %s\r\n", tarea->resetmsg ? tarea->resetmsg
             : "(default)" ); /* Rennard */
  ChPrintf( ch, "Reset frequency: %d minutes.\r\n",
             tarea->reset_frequency ? tarea->reset_frequency : 15 );
}
