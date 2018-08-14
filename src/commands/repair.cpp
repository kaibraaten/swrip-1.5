#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

static void repair_one_obj( Character *ch, Character *keeper, Object *obj,
			    char *arg, int maxgold, const char *fixstr, const char *fixstr2 );

void do_repair( Character *ch, char *argument )
{
  Character *keeper = nullptr;
  Object *obj = nullptr;
  const char *fixstr = nullptr;
  const char *fixstr2 = nullptr;
  int maxgold = 0;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Repair what?\r\n");
      return;
    }

  if ( ( keeper = FindFixer( ch ) ) == NULL )
    return;

  maxgold = keeper->TopLevel * 10;

  switch( keeper->Prototype->RepairShop->ShopType )
    {
    default:
    case SHOP_FIX:
      fixstr  = "repair";
      fixstr2 = "repairs";
      break;

    case SHOP_RECHARGE:
      fixstr  = "recharge";
      fixstr2 = "recharges";
      break;
    }

  if ( !StrCmp( argument, "all" ) )
    {
      for ( obj = ch->FirstCarrying; obj ; obj = obj->NextContent )
        {
          if ( obj->WearLoc  == WEAR_NONE
               &&   CanSeeObject( ch, obj )
               && ( obj->ItemType == ITEM_ARMOR
		    ||   obj->ItemType == ITEM_WEAPON
                    ||   obj->ItemType == ITEM_DEVICE ) )
            repair_one_obj( ch, keeper, obj, argument, maxgold,
                            fixstr, fixstr2);
        }
      return;
    }

  if ( ( obj = GetCarriedObject( ch, argument ) ) == NULL )
    {
      Act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->Reply = keeper;
      return;
    }

  repair_one_obj( ch, keeper, obj, argument, maxgold, fixstr, fixstr2);
}

static void repair_one_obj( Character *ch, Character *keeper, Object *obj,
			    char *arg, int maxgold, const char *fixstr, const char *fixstr2 )
{
  char buf[MAX_STRING_LENGTH];
  int cost = 0;

  if ( !CanDropObject( ch, obj ) )
    ch->Echo("You can't let go of %s.\r\n", obj->Name );
  else if ( ( cost = GetRepairCost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
        Act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'",
             keeper, obj, ch, TO_VICT );
      else
        Act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
    }
  /* "repair all" gets a 10% surcharge - Gorog */

  else if ( (cost = StrCmp("all",arg) ? cost : 11*cost/10) > ch->Gold )
    {
      sprintf( buf,
               "$N tells you, 'It will cost %d credit%s to %s %s...'", cost,
               cost == 1 ? "" : "s", fixstr, obj->Name );
      Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
      Act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
           NULL, keeper, TO_CHAR );
    }
  else
    {
      sprintf( buf, "$n gives $p to $N, who quickly %s it.", fixstr2 );
      Act( AT_ACTION, buf, ch, obj, keeper, TO_ROOM );
      sprintf( buf, "$N charges you %d credit%s to %s $p.",
               cost, cost == 1 ? "" : "s", fixstr );
      Act( AT_ACTION, buf, ch, obj, keeper, TO_CHAR );
      ch->Gold     -= cost;
      keeper->Gold += cost;
      if ( keeper->Gold < 0 )
        keeper->Gold = 0;
      else
        if ( keeper->Gold > maxgold )
          {
            BoostEconomy( keeper->InRoom->Area, keeper->Gold - maxgold/2 );
            keeper->Gold = maxgold/2;
            Act( AT_ACTION, "$n puts some credits into a large safe.", keeper,
                 NULL, NULL, TO_ROOM );
          }

      switch ( obj->ItemType )
        {
        default:
          ch->Echo("For some reason, you think you got ripped off...\r\n");
          break;
        case ITEM_ARMOR:
          obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];
          break;
        case ITEM_WEAPON:
          obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
          break;
        case ITEM_DEVICE:
          obj->Value[OVAL_DEVICE_CHARGES] = obj->Value[OVAL_DEVICE_MAX_CHARGES];
          break;
        }

      ObjProgRepairTrigger( ch, obj );
    }
}

