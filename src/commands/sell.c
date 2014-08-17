#include "character.h"
#include "shops.h"
#include "mud.h"

void do_sell( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *keeper;
  OBJ_DATA *obj;
  int cost;
  bool spice = false;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Sell what?\r\n", ch );
      return;
    }

  if ( ( keeper = FindKeeper( ch ) ) == NULL )
    return;

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      send_to_char( "You can't let go of it!\r\n", ch );
      return;
    }

  if ( obj->timer > 0 )
    {
      act( AT_TELL, "$n tells you, '$p is depreciating in value too quickly...'", keeper, obj, ch, TO_VICT );
      return;
    }

  if ( ( cost = GetObjectCost( ch, keeper, obj, false ) ) <= 0 )
    {
      act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
      return;
    }

  if( obj->item_type == ITEM_SPICE )
    spice = true;

  if ( cost > keeper->gold && ( economy_has( ch->in_room->area, cost) || spice ) )
    {
      act( AT_TELL, "$n makes a credit transaction.", keeper, obj, ch, TO_VICT );
      lower_economy( ch->in_room->area, cost-keeper->gold );
    }
  if ( !economy_has( ch->in_room->area, cost ) && !spice )
    {
      act( AT_ACTION, "$n can not afford $p right now.", keeper, obj, ch, TO_VICT );
      return;
    }

  separate_obj( obj );
  act( AT_ACTION, "$n sells $p.", ch, obj, NULL, TO_ROOM );
  sprintf( buf, "You sell $p for %d credit%s.",
           cost, cost == 1 ? "" : "s" );
  act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
  ch->gold     += cost;
  keeper->gold -= cost;
  if ( spice )
    boost_economy( ch->in_room->area, cost*1.5);
  if ( keeper->gold < 0 )
    keeper->gold = 0;

  if ( obj->item_type == ITEM_TRASH )
    extract_obj( obj );
  else  if ( IS_SET( obj->extra_flags , ITEM_CONTRABAND) )
    {
      long ch_exp;

      ch_exp = umin( obj->cost*10 , ( exp_level( GetAbilityLevel( ch, SMUGGLING_ABILITY ) + 1) - exp_level( GetAbilityLevel( ch, SMUGGLING_ABILITY ) )  ) / 10  );
      ch_printf( ch, "You receive %ld smuggling experience for unloading your contraband.\r\n " , ch_exp );
      gain_exp( ch, SMUGGLING_ABILITY, ch_exp );

      if ( obj->item_type == ITEM_SPICE || obj->item_type == ITEM_RAWSPICE )
        extract_obj( obj );
      else
        {
          REMOVE_BIT( obj->extra_flags , ITEM_CONTRABAND );
          obj_from_char( obj );
          obj_to_char( obj, keeper );
        }
    }
  else if ( obj->item_type == ITEM_SPICE || obj->item_type == ITEM_RAWSPICE )
    extract_obj( obj );
  else
    {
      obj_from_char( obj );
      obj_to_char( obj, keeper );
    }

  return;
}
