#include "character.h"
#include "mud.h"

void do_tamp( Character *ch, char *argument )
{
  Object *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Tamp what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      SendToCharacter( "You aren't carrying that.\r\n", ch );
      return;
    }

  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      SendToCharacter( "You can't tamp that.\r\n", ch );
      return;
    }

  if ( !IsBitSet( pipe_obj->value[3], PIPE_TAMPED ) )
    {
      act( AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, TO_ROOM );
      SetBit( pipe_obj->value[3], PIPE_TAMPED );
      return;
    }

  SendToCharacter( "It doesn't need tamping.\r\n", ch );
}
