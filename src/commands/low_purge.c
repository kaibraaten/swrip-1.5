#include "character.h"
#include "mud.h"

void do_low_purge( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  OBJ_DATA *obj;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Purge what?\r\n", ch );
      return;
    }

  victim = NULL; obj = NULL;
  if ( ( victim = get_char_room( ch, arg ) ) == NULL
       &&        ( obj    = get_obj_here ( ch, arg ) ) == NULL )
    {
      send_to_char( "You can't find that here.\r\n", ch );
      return;
    }

  if ( obj )
    {
      separate_obj( obj );
      act( AT_IMMORT, "$n purges $p!", ch, obj, NULL, TO_ROOM );
      act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR );
      extract_obj( obj );
      return;
    }

  if ( !is_npc(victim) )
    {
      send_to_char( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You cannot purge yourself!\r\n", ch );
      return;
    }

  act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  act( AT_IMMORT, "You make $N disappear in a puff of smoke!",
       ch, NULL, victim, TO_CHAR );
  extract_char( victim, true );
}
