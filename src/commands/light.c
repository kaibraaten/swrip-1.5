#include "character.h"
#include "mud.h"

void do_light( Character *ch, char *argument )
{
  Object *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Light what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      SendToCharacter( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      SendToCharacter( "You can't light that.\r\n", ch );
      return;
    }
  if ( !IsBitSet( pipe_obj->value[3], PIPE_LIT ) )
    {
      if ( pipe_obj->value[1] < 1 )
        {
          Act( AT_ACTION, "You try to light $p, but it's empty.", ch, pipe_obj, NULL, TO_CHAR );
          Act( AT_ACTION, "$n tries to light $p, but it's empty.", ch, pipe_obj, NULL, TO_ROOM );
          return;
        }
      Act( AT_ACTION, "You carefully light $p.", ch, pipe_obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n carefully lights $p.", ch, pipe_obj, NULL, TO_ROOM );
      SetBit( pipe_obj->value[3], PIPE_LIT );
      return;
    }
  SendToCharacter( "It's already lit.\r\n", ch );
}
