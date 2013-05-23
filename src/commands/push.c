#include "character.h"
#include "mud.h"

void do_push( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Push what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_here( ch, arg ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, arg, TO_CHAR );
      return;
    }

  pullorpush( ch, obj, FALSE );
}
