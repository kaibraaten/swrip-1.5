#include "character.h"
#include "mud.h"

void do_astat( CHAR_DATA *ch, char *argument )
{
  AREA_DATA *tarea = NULL;
  bool proto = FALSE;
  bool found= FALSE;


  for ( tarea = first_area; tarea; tarea = tarea->next )
    if ( !str_cmp( tarea->filename, argument ) )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    for ( tarea = first_build; tarea; tarea = tarea->next )
      if ( !str_cmp( tarea->filename, argument ) )
        {
          found = TRUE;
          proto = TRUE;
          break;
        }

  if ( !found )
    {
      if ( argument && argument[0] != '\0' )
        {
          send_to_char( "Area not found.  Check 'zones'.\r\n", ch );
          return;
        }
      else
        {
          tarea = ch->in_room->area;
        }
    }

  ch_printf( ch, "Name: %s\r\nFilename: %-20s  Prototype: %s\r\n",
             tarea->name,
             tarea->filename,
             proto ? "yes" : "no" );
  if ( !proto )
    {
      ch_printf( ch, "Max players: %d  IllegalPks: %d  Credits Looted: %d\r\n",
                 tarea->max_players,
                 tarea->illegal_pk,
                 tarea->gold_looted );
      if ( tarea->high_economy )
        ch_printf( ch, "Area economy: %d billion and %d credits.\r\n",
                   tarea->high_economy,
                   tarea->low_economy );
      else
        ch_printf( ch, "Area economy: %d credits.\r\n",
                   tarea->low_economy );
      if ( tarea->planet )
        ch_printf( ch, "Planet: %s.\r\n",
                   tarea->planet->name );
      ch_printf( ch, "Mdeaths: %d  Mkills: %d  Pdeaths: %d  Pkills: %d\r\n",
                 tarea->mdeaths,
                 tarea->mkills,
                 tarea->pdeaths,
                 tarea->pkills );
    }
  ch_printf( ch, "Author: %s\r\nAge: %d   Number of players: %d\r\n",
             tarea->author,
             tarea->age,
             tarea->nplayer );
  ch_printf( ch, "Area flags: %s\r\n", flag_string(tarea->flags, area_flags) );
  ch_printf( ch, "low_room: %5d  hi_room: %d\r\n",
             tarea->low_r_vnum,
	     tarea->hi_r_vnum );
  ch_printf( ch, "low_obj : %5d  hi_obj : %d\r\n",
             tarea->low_o_vnum,
             tarea->hi_o_vnum );
  ch_printf( ch, "low_mob : %5d  hi_mob : %d\r\n",
             tarea->low_m_vnum,
             tarea->hi_m_vnum );
  ch_printf( ch, "soft range: %d - %d.  hard range: %d - %d.\r\n",
             tarea->low_soft_range,
             tarea->hi_soft_range,
             tarea->low_hard_range,
             tarea->hi_hard_range );
  ch_printf( ch, "Resetmsg: %s\r\n", tarea->resetmsg ? tarea->resetmsg
             : "(default)" ); /* Rennard */
  ch_printf( ch, "Reset frequency: %d minutes.\r\n",
             tarea->reset_frequency ? tarea->reset_frequency : 15 );
}
