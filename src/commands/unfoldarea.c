#include "mud.h"

extern bool fBootDb;

/*
 * Dangerous command.  Can be used to install an area that was either:
 *   (a) already installed but removed from area.lst
 *   (b) designed offline
 * The mud will likely crash if:
 *   (a) this area is already loaded
 *   (b) it contains vnums that exist
 *   (c) the area has errors
 *
 * NOTE: Use of this command is not recommended.                -Thoric
 */
void do_unfoldarea( Character *ch, char *argument )
{

  if ( !argument || argument[0] == '\0' )
    {
      SendToCharacter( "Unfold what?\r\n", ch );
      return;
    }

  fBootDb = true;
  load_area_file( last_area, argument );
  fBootDb = false;
}
