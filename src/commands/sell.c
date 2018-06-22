#include "character.h"
#include "shop.h"
#include "mud.h"

void do_sell( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *keeper;
  Object *obj;
  int cost;
  bool spice = false;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Sell what?\r\n", ch );
      return;
    }

  if ( ( keeper = FindKeeper( ch ) ) == NULL )
    return;

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      Act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->Reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      SendToCharacter( "You can't let go of it!\r\n", ch );
      return;
    }

  if ( obj->Timer > 0 )
    {
      Act( AT_TELL, "$n tells you, '$p is depreciating in value too quickly...'", keeper, obj, ch, TO_VICT );
      return;
    }

  if ( ( cost = GetObjectCost( ch, keeper, obj, false ) ) <= 0 )
    {
      Act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
      return;
    }

  if( obj->ItemType == ITEM_SPICE )
    spice = true;

  if ( cost > keeper->Gold && ( EconomyHas( ch->InRoom->Area, cost) || spice ) )
    {
      Act( AT_TELL, "$n makes a credit transaction.", keeper, obj, ch, TO_VICT );
      LowerEconomy( ch->InRoom->Area, cost-keeper->Gold );
    }
  if ( !EconomyHas( ch->InRoom->Area, cost ) && !spice )
    {
      Act( AT_ACTION, "$n can not afford $p right now.", keeper, obj, ch, TO_VICT );
      return;
    }

  SeparateOneObjectFromGroup( obj );
  Act( AT_ACTION, "$n sells $p.", ch, obj, NULL, TO_ROOM );
  sprintf( buf, "You sell $p for %d credit%s.",
           cost, cost == 1 ? "" : "s" );
  Act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
  ch->Gold     += cost;
  keeper->Gold -= cost;
  if ( spice )
    BoostEconomy( ch->InRoom->Area, cost * 1.5);
  if ( keeper->Gold < 0 )
    keeper->Gold = 0;

  if ( obj->ItemType == ITEM_TRASH )
    ExtractObject( obj );
  else  if ( IsBitSet( obj->Flags , ITEM_CONTRABAND) )
    {
      long ch_exp;

      ch_exp = umin( obj->Cost*10 , ( GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) )  ) / 10  );
      Echo( ch, "You receive %ld smuggling experience for unloading your contraband.\r\n " , ch_exp );
      GainXP( ch, SMUGGLING_ABILITY, ch_exp );

      if ( obj->ItemType == ITEM_SPICE || obj->ItemType == ITEM_RAWSPICE )
        ExtractObject( obj );
      else
        {
          RemoveBit( obj->Flags , ITEM_CONTRABAND );
          ObjectFromCharacter( obj );
          ObjectToCharacter( obj, keeper );
        }
    }
  else if ( obj->ItemType == ITEM_SPICE || obj->ItemType == ITEM_RAWSPICE )
    ExtractObject( obj );
  else
    {
      ObjectFromCharacter( obj );
      ObjectToCharacter( obj, keeper );
    }

  return;
}
