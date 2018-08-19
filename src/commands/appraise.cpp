#include <string.h>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "protomob.hpp"

static void appraise_all( Character *ch, Character *keeper, char *fixstr );

void do_appraise( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *keeper = nullptr;
  Object *obj = nullptr;
  int cost = 0;
  char *fixstr = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Appraise what?\r\n" );
      return;
    }

  if ( ( keeper = FindFixer( ch ) ) == NULL )
    return;

  switch( keeper->Prototype->RepairShop->ShopType )
    {
    default:
    case SHOP_FIX:
      fixstr  = "repair";
      break;
    case SHOP_RECHARGE:
      fixstr  = "recharge";
      break;
    }

  if ( !StrCmp( arg, "all") )
    {
      appraise_all( ch, keeper, fixstr );
      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      Act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->Reply = keeper;
      return;
    }

  if ( !CanDropObject( ch, obj ) )
    {
      ch->Echo( "You can't let go of it.\r\n" );
      return;
    }

  if ( ( cost = GetRepairCost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
        Act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'", keeper, obj, ch, TO_VICT );
      else
        Act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
      return;
    }

  sprintf( buf,
           "$N tells you, 'It will cost %d credit%s to %s that...'", cost,
           cost == 1 ? "" : "s", fixstr );
  Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
  if ( cost > ch->Gold )
    Act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
         NULL, keeper, TO_CHAR );
}

static void appraise_all( Character *ch, Character *keeper, char *fixstr )
{
  char buf[MAX_STRING_LENGTH], *pbuf=buf;
  int cost = 0, total=0;

  for(const Object *obj : ch->Objects())
    {
      if ( obj->WearLoc  == WEAR_NONE
           &&   CanSeeObject( ch, obj )
           && ( obj->ItemType == ITEM_ARMOR
                ||   obj->ItemType == ITEM_WEAPON
                ||   obj->ItemType == ITEM_DEVICE ) )

        {
          if ( !CanDropObject( ch, obj ) )
            {
              ch->Echo( "You can't let go of %s.\r\n", obj->Name );
            }
          else if ( ( cost = GetRepairCost( keeper, obj ) ) < 0 )
            {
              if (cost != -2)
                Act( AT_TELL,
                     "$n tells you, 'Sorry, I can't do anything with $p.'",
                     keeper, obj, ch, TO_VICT );
              else
		Act( AT_TELL, "$n tells you, '$p looks fine to me!'",
                     keeper, obj, ch, TO_VICT );
            }
          else
            {
              sprintf( buf,
                       "$N tells you, 'It will cost %d credit%s to %s %s'",
                       cost, cost == 1 ? "" : "s", fixstr, obj->Name );
              Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
              total += cost;
            }
        }
    }

  if ( total > 0 )
    {
      ch->Echo("\r\n");
      sprintf( buf,
               "$N tells you, 'It will cost %d credit%s in total.'",
               total, cost == 1 ? "" : "s" );
      Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
      strcpy( pbuf,
              "$N tells you, 'Remember there is a 10% surcharge for repair all.'");
      Act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
    }
}

