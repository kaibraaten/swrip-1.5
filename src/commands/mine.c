#include "character.h"
#include "mud.h"
#include "skill.h"

void do_mine( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  bool shovel;
  short move;

  if ( ch->PCData->learned[gsn_mine] <= 0 )
    {
      Echo( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "And what will you mine the room with?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  shovel = false;
  for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
    if ( obj->item_type == ITEM_SHOVEL )
      {
        shovel = true;
        break;
      }

  obj = GetObjectInListReverse( ch, arg, ch->InRoom->LastContent );

  if ( !obj )
    {
      SendToCharacter( "You don't see on here.\r\n", ch );
      return;
    }

  SeparateOneObjectFromGroup(obj);

  if ( obj->item_type != ITEM_LANDMINE )
    {
      Act( AT_PLAIN, "That's not a landmine!", ch, obj, 0, TO_CHAR );
      return;
    }

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
      SendToCharacter( "You cannot bury a mine in the water.\r\n", ch );
      return;

    case SECT_AIR:
      SendToCharacter( "What?  Bury a mine in the air?!\r\n", ch );
      return;

    default:
      break;
    }

  if ( obj->weight > (umax(5, (GetCarryCapacityWeight(ch) / 10)))
       &&  !shovel )
    {
      SendToCharacter( "You'd need a shovel to bury something that big.\r\n", ch );
      return;
    }

  move = (obj->weight * 50 * (shovel ? 1 : 5)) / umax(1, GetCarryCapacityWeight(ch));
  move = urange( 2, move, 1000 );
  if ( move > ch->Move )
    {
      SendToCharacter( "You don't have the energy to bury something of that size.\r\n", ch );
      return;
    }
  ch->Move -= move;

  SetBit( obj->Flags, ITEM_BURRIED );
  SetWaitState( ch, urange( 10, move / 2, 100 ) );

  FreeMemory( obj->armed_by );
  obj->armed_by = CopyString ( ch->Name );

  Echo( ch, "You arm and bury %s.\r\n", obj->ShortDescr );
  Act( AT_PLAIN, "$n arms and buries $p.", ch, obj, NULL, TO_ROOM );

  LearnFromSuccess( ch, gsn_mine );
}
