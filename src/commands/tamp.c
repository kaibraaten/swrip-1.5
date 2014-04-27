#include "character.h"
#include "mud.h"

void do_tamp( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Tamp what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = get_obj_carry( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }

  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      send_to_char( "You can't tamp that.\r\n", ch );
      return;
    }

  if ( !IS_SET( pipe_obj->value[3], PIPE_TAMPED ) )
    {
      act( AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, TO_ROOM );
      SET_BIT( pipe_obj->value[3], PIPE_TAMPED );
      return;
    }

  send_to_char( "It doesn't need tamping.\r\n", ch );
}
