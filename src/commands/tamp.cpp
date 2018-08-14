#include "character.hpp"
#include "mud.hpp"
#include "object.hpp"

void do_tamp( Character *ch, char *argument )
{
  Object *pipe_obj = nullptr;
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Tamp what?\r\n");
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( (pipe_obj = GetCarriedObject( ch, arg )) == NULL )
    {
      ch->Echo("You aren't carrying that.\r\n");
      return;
    }

  if ( pipe_obj->ItemType != ITEM_PIPE )
    {
      ch->Echo("You can't tamp that.\r\n");
      return;
    }

  if ( !IsBitSet( pipe_obj->Value[3], PIPE_TAMPED ) )
    {
      Act( AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, TO_ROOM );
      SetBit( pipe_obj->Value[3], PIPE_TAMPED );
      return;
    }

  ch->Echo("It doesn't need tamping.\r\n");
}

