#include "character.hpp"
#include "mud.hpp"

void do_tamp( Character *ch, char *argument )
{
  Object *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Tamp what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      SendToCharacter( "You aren't carrying that.\r\n", ch );
      return;
    }

  if ( pipe_obj->ItemType != ITEM_PIPE )
    {
      SendToCharacter( "You can't tamp that.\r\n", ch );
      return;
    }

  if ( !IsBitSet( pipe_obj->Value[3], PIPE_TAMPED ) )
    {
      Act( AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, TO_ROOM );
      SetBit( pipe_obj->Value[3], PIPE_TAMPED );
      return;
    }

  SendToCharacter( "It doesn't need tamping.\r\n", ch );
}
