#include "character.h"
#include "mud.h"

void do_showplanet( Character *ch, char *argument )
{
  PLANET_DATA *planet;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showplanet <planet>\r\n", ch );
      return;
    }

  planet = get_planet( argument );

  if ( !planet )
    {
      send_to_char( "No such planet.\r\n", ch );
      return;
    }

  ch_printf( ch, "%s\r\nFilename: %s\r\nStarsystem: %s\r\n",
             planet->name,
             planet->filename,
             planet->spaceobject ? planet->spaceobject->name : "None");
}
