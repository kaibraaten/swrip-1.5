#include "character.h"
#include "mud.h"

void do_loadarea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char   filename[256];
  int           tmp;

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      send_to_char( "You don't have an assigned area to load.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      for ( found = FALSE, tarea = first_build; tarea; tarea = tarea->next )
        if ( !str_cmp( tarea->filename, argument ) )
          {
            found = TRUE;
            break;
	  }
      if ( IS_NPC(ch) || ( get_trust(ch) < LEVEL_GOD
                           &&   tarea && !is_name( tarea->filename, ch->pcdata->bestowments ) ) )
        {
          send_to_char( "You can only load areas you have permission for.\r\n", ch );
          return;
        }
      if ( !found )
        {
          send_to_char( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      send_to_char( "No area to load.\r\n", ch );
      return;
    }

  /* Stops char from loading when already loaded - Scryn 8/11 */
  if ( IS_SET ( tarea->status, AREA_LOADED) )
    {
      send_to_char( "Your area is already loaded.\r\n", ch );
      return;
    }
  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  send_to_char( "Loading...\r\n", ch );
  load_area_file( tarea, filename );
  send_to_char( "Linking exits...\r\n", ch );
  fix_area_exits( tarea );
  if ( tarea->first_reset )
    {
      tmp = tarea->nplayer;
      tarea->nplayer = 0;
      send_to_char( "Resetting area...\r\n", ch );
      reset_area( tarea );
      tarea->nplayer = tmp;
    }
  send_to_char( "Done.\r\n", ch );
}
