#include "character.h"
#include "mud.h"

void do_savearea( CHAR_DATA *ch, char *argument )
{
  AREA_DATA     *tarea;
  char   filename[256];

  if ( IS_NPC(ch) || get_trust( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      send_to_char( "You don't have an assigned area to save.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      if ( get_trust( ch ) < LEVEL_GOD )
        {
          send_to_char( "You can only save your own area.\r\n", ch );
          return;
        }
      for ( found = FALSE, tarea = first_build; tarea; tarea = tarea->next )
        if ( !str_cmp( tarea->filename, argument ) )
          {
            found = TRUE;
            break;
          }
      if ( !found )
        {
          send_to_char( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      send_to_char( "No area to save.\r\n", ch );
      return;
    }

  /* Ensure not wiping out their area with save before load - Scryn 8/11 */
  if ( !IS_SET(tarea->status, AREA_LOADED ) )
    {
      send_to_char( "Your area is not loaded!\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  fold_area( tarea, filename, FALSE );
  send_to_char( "Done.\r\n", ch );
}
