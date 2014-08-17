#include "character.h"
#include "mud.h"

void do_light( Character *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Light what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      send_to_char( "You can't light that.\r\n", ch );
      return;
    }
  if ( !IsBitSet( pipe_obj->value[3], PIPE_LIT ) )
    {
      if ( pipe_obj->value[1] < 1 )
        {
          act( AT_ACTION, "You try to light $p, but it's empty.", ch, pipe_obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to light $p, but it's empty.", ch, pipe_obj, NULL, TO_ROOM );
          return;
        }
      act( AT_ACTION, "You carefully light $p.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n carefully lights $p.", ch, pipe_obj, NULL, TO_ROOM );
      SetBit( pipe_obj->value[3], PIPE_LIT );
      return;
    }
  send_to_char( "It's already lit.\r\n", ch );
}
