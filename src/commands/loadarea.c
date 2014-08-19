#include "character.h"
#include "mud.h"
#include "reset.h"

void do_loadarea( Character *ch, char *argument )
{
  Area     *tarea;
  char   filename[256];
  int           tmp;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->pcdata
       ||  ( argument[0] == '\0' && !ch->pcdata->area) )
    {
      SendToCharacter( "You don't have an assigned area to load.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    tarea = ch->pcdata->area;
  else
    {
      bool found;

      for ( found = false, tarea = first_build; tarea; tarea = tarea->next )
        if ( !StrCmp( tarea->filename, argument ) )
          {
            found = true;
            break;
	  }
      if ( IsNpc(ch) || ( GetTrustLevel(ch) < LEVEL_GREATER
                           &&   tarea && !IsName( tarea->filename, ch->pcdata->bestowments ) ) )
        {
          SendToCharacter( "You can only load areas you have permission for.\r\n", ch );
          return;
        }
      if ( !found )
        {
          SendToCharacter( "Area not found.\r\n", ch );
          return;
        }
    }

  if ( !tarea )
    {
      SendToCharacter( "No area to load.\r\n", ch );
      return;
    }

  /* Stops char from loading when already loaded - Scryn 8/11 */
  if ( IsBitSet ( tarea->status, AREA_LOADED) )
    {
      SendToCharacter( "Your area is already loaded.\r\n", ch );
      return;
    }
  sprintf( filename, "%s%s", BUILD_DIR, tarea->filename );
  SendToCharacter( "Loading...\r\n", ch );
  load_area_file( tarea, filename );
  SendToCharacter( "Linking exits...\r\n", ch );
  fix_area_exits( tarea );
  if ( tarea->first_reset )
    {
      tmp = tarea->nplayer;
      tarea->nplayer = 0;
      SendToCharacter( "Resetting area...\r\n", ch );
      ResetArea( tarea );
      tarea->nplayer = tmp;
    }
  SendToCharacter( "Done.\r\n", ch );
}
