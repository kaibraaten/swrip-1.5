#include "character.h"
#include "mud.h"

void do_savearea( Character *ch, char *argument )
{
  Area     *tarea;
  char   filename[256];

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      SendToCharacter( "You don't have an assigned area to save.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "You can only save your own area.\r\n", ch );
          return;
        }
      for ( found = false, tarea = first_build; tarea; tarea = tarea->next )
        if ( !StrCmp( tarea->filename, argument ) )
          {
            found = true;
            break;
          }
      if ( !found )
        {
          SendToCharacter( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      SendToCharacter( "No area to save.\r\n", ch );
      return;
    }

  /* Ensure not wiping out their area with save before load - Scryn 8/11 */
  if ( !IsBitSet(tarea->status, AREA_LOADED ) )
    {
      SendToCharacter( "Your area is not loaded!\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  fold_area( tarea, filename, false );
  SendToCharacter( "Done.\r\n", ch );
}
