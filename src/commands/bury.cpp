#include "character.hpp"
#include "mud.hpp"

void do_bury( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  bool shovel = false;
  short move = 0;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "What do you wish to bury?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    {
      return;
    }

  for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
    {
      if ( obj->ItemType == ITEM_SHOVEL )
	{
	  shovel = true;
	  break;
	}
    }

  obj = GetObjectInListReverse( ch, arg, ch->InRoom->LastContent );

  if ( !obj )
    {
      SendToCharacter( "You can't find it.\r\n", ch );
      return;
    }

  SeparateOneObjectFromGroup(obj);

  if ( !CAN_WEAR(obj, ITEM_TAKE) )
    {
      Act( AT_PLAIN, "You cannot bury $p.", ch, obj, 0, TO_CHAR );
      return;
    }

  switch( ch->InRoom->Sector )
    {
    case SECT_CITY:
    case SECT_INSIDE:
      SendToCharacter( "The floor is too hard to dig through.\r\n", ch );
      return;

    case SECT_WATER_SWIM:
    case SECT_WATER_NOSWIM:
    case SECT_UNDERWATER:
      SendToCharacter( "You cannot bury something here.\r\n", ch );
      return;

    case SECT_AIR:
      SendToCharacter( "What? In the air?!\r\n", ch );
      return;

    default:
      break;
    }

  if ( obj->Weight > (umax(5, (GetCarryCapacityWeight(ch) / 10))) && !shovel )
    {
      SendToCharacter( "You'd need a shovel to bury something that big.\r\n", ch );
      return;
    }

  move = (obj->Weight * 50 * (shovel ? 1 : 5)) / umax(1, GetCarryCapacityWeight(ch));
  move = urange( 2, move, 1000 );

  if ( move > ch->Move )
    {
      SendToCharacter( "You don't have the energy to bury something of that size.\r\n", ch );
      return;
    }

  ch->Move -= move;

  Act( AT_ACTION, "You solemnly bury $p...", ch, obj, NULL, TO_CHAR );
  Act( AT_ACTION, "$n solemnly buries $p...", ch, obj, NULL, TO_ROOM );
  SetBit( obj->Flags, ITEM_BURRIED );
  SetWaitState( ch, urange( 10, move / 2, 100 ) );
}
