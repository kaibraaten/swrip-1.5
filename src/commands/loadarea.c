#include "character.h"
#include "mud.h"
#include "reset.h"

void do_loadarea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char filename[256];
  int  tmp = 0;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
       || ( !IsNullOrEmpty( argument ) && !ch->PCData->area) )
    {
      SendToCharacter( "You don't have an assigned area to load.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      tarea = ch->PCData->area;
    }
  else
    {
      bool found = false;

      for ( found = false, tarea = first_build; tarea; tarea = tarea->next )
	{
	  if ( !StrCmp( tarea->filename, argument ) )
	    {
	      found = true;
	      break;
	    }
	}
      
      if ( IsNpc(ch) || ( GetTrustLevel(ch) < LEVEL_GREATER
                           &&   tarea && !IsName( tarea->filename, ch->PCData->bestowments ) ) )
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
  LoadAreaFile( tarea, filename );
  SendToCharacter( "Linking exits...\r\n", ch );
  FixAreaExits( tarea );
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
