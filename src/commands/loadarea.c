#include "character.h"
#include "mud.h"
#include "reset.h"
#include "area.h"

void do_loadarea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char filename[256];
  int  tmp = 0;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
       || ( !IsNullOrEmpty( argument ) && !ch->PCData->Build.Area) )
    {
      SendToCharacter( "You don't have an assigned area to load.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      tarea = ch->PCData->Build.Area;
    }
  else
    {
      bool found = false;

      for ( found = false, tarea = FirstBuild; tarea; tarea = tarea->Next )
	{
	  if ( !StrCmp( tarea->Filename, argument ) )
	    {
	      found = true;
	      break;
	    }
	}
      
      if ( IsNpc(ch) || ( GetTrustLevel(ch) < LEVEL_GREATER
                           &&   tarea && !IsName( tarea->Filename, ch->PCData->Bestowments ) ) )
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
  if ( IsBitSet ( tarea->Status, AREA_LOADED) )
    {
      SendToCharacter( "Your area is already loaded.\r\n", ch );
      return;
    }
  sprintf( filename, "%s%s", BUILD_DIR, tarea->Filename );
  SendToCharacter( "Loading...\r\n", ch );
  LoadAreaFile( tarea, filename );
  SendToCharacter( "Linking exits...\r\n", ch );
  FixAreaExits( tarea );
  if ( tarea->FirstReset )
    {
      tmp = tarea->NumberOfPlayers;
      tarea->NumberOfPlayers = 0;
      SendToCharacter( "Resetting area...\r\n", ch );
      ResetArea( tarea );
      tarea->NumberOfPlayers = tmp;
    }
  SendToCharacter( "Done.\r\n", ch );
}
