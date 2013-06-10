#include "mud.h"
#include "character.h"

static void PacifyPerson( void *element, void *userData );

void do_peace( Character *ch, char *argument )
{
  act( AT_IMMORT, "$n booms, 'PEACE!'", ch, NULL, NULL, TO_ROOM );
  List_ForEach( ch->in_room->People, PacifyPerson, NULL );
  ch_printf( ch, "Ok.\r\n" );
}

static void PacifyPerson( void *element, void *userData )
{
  Character *person = (Character*) element;

  if ( person->fighting )
    {
      stop_fighting( person, TRUE );
      do_sit( person, "" );
    }

  stop_hating( person );
  stop_hunting( person );
  stop_fearing( person );
}
