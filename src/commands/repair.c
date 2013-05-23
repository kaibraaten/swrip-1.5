#include "shops.h"
#include "mud.h"
#include "character.h"

static void repair_one_obj( CHAR_DATA *ch, CHAR_DATA *keeper, OBJ_DATA *obj,
			    char *arg, int maxgold, char *fixstr, char *fixstr2 );

void do_repair( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *keeper;
  OBJ_DATA *obj;
  char *fixstr;
  char *fixstr2;
  int maxgold;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Repair what?\r\n", ch );
      return;
    }

  if ( ( keeper = find_fixer( ch ) ) == NULL )
    return;

  maxgold = keeper->top_level * 10;
  switch( keeper->pIndexData->rShop->shop_type )
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

  if ( !str_cmp( argument, "all" ) )
    {
      for ( obj = ch->first_carrying; obj ; obj = obj->next_content )
        {
          if ( obj->wear_loc  == WEAR_NONE
               &&   can_see_obj( ch, obj )
               && ( obj->item_type == ITEM_ARMOR
		    ||   obj->item_type == ITEM_WEAPON
                    ||   obj->item_type == ITEM_DEVICE ) )
            repair_one_obj( ch, keeper, obj, argument, maxgold,
                            fixstr, fixstr2);
        }
      return;
    }

  if ( ( obj = get_obj_carry( ch, argument ) ) == NULL )
    {
      act( AT_TELL, "$n tells you 'You don't have that item.'",
           keeper, NULL, ch, TO_VICT );
      ch->reply = keeper;
      return;
    }

  repair_one_obj( ch, keeper, obj, argument, maxgold, fixstr, fixstr2);
}

static void repair_one_obj( CHAR_DATA *ch, CHAR_DATA *keeper, OBJ_DATA *obj,
			    char *arg, int maxgold, char *fixstr, char*fixstr2 )
{
  char buf[MAX_STRING_LENGTH];
  int cost;

  if ( !can_drop_obj( ch, obj ) )
    ch_printf( ch, "You can't let go of %s.\r\n", obj->name );
  else if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
        act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'",
             keeper, obj, ch, TO_VICT );
      else
        act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
    }
  /* "repair all" gets a 10% surcharge - Gorog */

  else if ( (cost = str_cmp("all",arg) ? cost : 11*cost/10) > ch->gold )
    {
      sprintf( buf,
               "$N tells you, 'It will cost %d credit%s to %s %s...'", cost,
               cost == 1 ? "" : "s", fixstr, obj->name );
      act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
      act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
           NULL, keeper, TO_CHAR );
    }
  else
    {
      sprintf( buf, "$n gives $p to $N, who quickly %s it.", fixstr2 );
      act( AT_ACTION, buf, ch, obj, keeper, TO_ROOM );
      sprintf( buf, "$N charges you %d credit%s to %s $p.",
               cost, cost == 1 ? "" : "s", fixstr );
      act( AT_ACTION, buf, ch, obj, keeper, TO_CHAR );
      ch->gold     -= cost;
      keeper->gold += cost;
      if ( keeper->gold < 0 )
        keeper->gold = 0;
      else
        if ( keeper->gold > maxgold )
          {
            boost_economy( keeper->in_room->area, keeper->gold - maxgold/2 );
            keeper->gold = maxgold/2;
            act( AT_ACTION, "$n puts some credits into a large safe.", keeper,
                 NULL, NULL, TO_ROOM );
          }

      switch ( obj->item_type )
        {
        default:
          send_to_char( "For some reason, you think you got ripped off...\r\n", ch);
          break;
        case ITEM_ARMOR:
          obj->value[0] = obj->value[1];
          break;
        case ITEM_WEAPON:
          obj->value[0] = INIT_WEAPON_CONDITION;
          break;
        case ITEM_DEVICE:
          obj->value[2] = obj->value[1];
          break;
        }

      oprog_repair_trigger( ch, obj );
    }
}
