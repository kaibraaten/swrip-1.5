#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_savearea( Character *ch, char *argument )
{
  Area *tarea = NULL;
  char filename[256];

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
       ||  ( IsNullOrEmpty( argument ) && !ch->PCData->Build.Area) )
    {
      SendToCharacter( "You don't have an assigned area to save.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      tarea = ch->PCData->Build.Area;
    }
  else
    {
      bool found = false;

      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "You can only save your own area.\r\n", ch );
          return;
        }

      for ( found = false, tarea = FirstBuild; tarea; tarea = tarea->Next )
        {
          if ( !StrCmp( tarea->Filename, argument ) )
            {
              found = true;
              break;
            }
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
  if ( !IsBitSet(tarea->Status, AREA_LOADED ) )
    {
      SendToCharacter( "Your area is not loaded!\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", BUILD_DIR, tarea->Filename );
  FoldArea( tarea, filename, false );
  SendToCharacter( "Done.\r\n", ch );
}
