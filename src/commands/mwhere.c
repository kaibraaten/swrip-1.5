#include "character.h"
#include "mud.h"

void do_mwhere( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  bool found;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Mwhere whom?\r\n", ch );
      return;
    }

  set_pager_color( AT_PLAIN, ch );
  found = false;
  for ( victim = first_char; victim; victim = victim->next )
    {
      if ( IsNpc(victim)
           &&   victim->in_room
           &&   NiftyIsName( arg, victim->name ) )
        {
          found = true;
          pager_printf( ch, "[%5d] %-28s [%5d] %s\r\n",
                        victim->pIndexData->vnum,
                        victim->short_descr,
                        victim->in_room->vnum,
                        victim->in_room->name );
        }
    }

  if ( !found )
    act( AT_PLAIN, "You didn't find any $T.", ch, NULL, arg, TO_CHAR );
}
