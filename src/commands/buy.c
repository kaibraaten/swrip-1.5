#include <string.h>
#include "shops.h"
#include "mud.h"
#include "character.h"

void do_buy( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int maxgold;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Buy what?\r\n", ch );
      return;
    }

  if ( IS_SET(ch->in_room->room_flags, ROOM_PET_SHOP) )
    {
      char buf[MAX_STRING_LENGTH];
      Character *pet;
      ROOM_INDEX_DATA *pRoomIndexNext;
      ROOM_INDEX_DATA *in_room;

      if ( is_npc(ch) )
        return;

      pRoomIndexNext = get_room_index( ch->in_room->vnum + 1 );

      if ( !pRoomIndexNext )
        {
          bug( "Do_buy: bad pet shop at vnum %d.", ch->in_room->vnum );
          send_to_char( "Sorry, you can't buy that here.\r\n", ch );
          return;
        }

      in_room     = ch->in_room;
      ch->in_room = pRoomIndexNext;
      pet         = get_char_room( ch, arg );
      ch->in_room = in_room;

      if ( pet == NULL || !is_npc( pet ) || !IS_SET(pet->act, ACT_PET) )
        {
          send_to_char( "Sorry, you can't buy that here.\r\n", ch );
          return;
        }

      if ( IS_SET(ch->act, PLR_BOUGHT_PET) )
        {
          send_to_char( "You already bought one pet this level.\r\n", ch );
          return;
        }

      if ( ch->gold < 10 * pet->top_level * pet->top_level )
        {
          send_to_char( "You can't afford it.\r\n", ch );
          return;
        }

      if ( ch->top_level < pet->top_level )
        {
          send_to_char( "You're not ready for this pet.\r\n", ch );
          return;
        }

      maxgold = 10 * pet->top_level * pet->top_level;
      ch->gold  -= maxgold;
      boost_economy( ch->in_room->area, maxgold );
      pet               = create_mobile( pet->pIndexData );
      /* SET_BIT(ch->act, PLR_BOUGHT_PET); */
      SET_BIT(pet->act, ACT_PET);
      SET_BIT(pet->affected_by, AFF_CHARM);

      argument = one_argument( argument, arg );

      if ( arg[0] != '\0' )
        {
          sprintf( buf, "%s %s", pet->name, arg );
          STRFREE( pet->name );
          pet->name = STRALLOC( buf );
        }

      sprintf( buf, "%sA neck tag says 'I belong to %s'.\r\n",
               pet->description, ch->name );
      STRFREE( pet->description );
      pet->description = STRALLOC( buf );

      if( ch->pcdata )
        ch->pcdata->pet = pet;

      char_to_room( pet, ch->in_room );
      add_follower( pet, ch );
      send_to_char( "Enjoy your pet.\r\n", ch );
      act( AT_ACTION, "$n bought $N as a pet.", ch, NULL, pet, TO_ROOM );
      return;
    }
  else
    {
      Character *keeper;
      OBJ_DATA *obj;
      int cost;
      int noi = 1;              /* Number of items */
      short mnoi = 20;  /* Max number of items to be bought at once */

      if ( ( keeper = find_keeper( ch ) ) == NULL )
        return;

      if ( keeper == NULL )
        return;

      maxgold = keeper->top_level * 10;

      if ( is_number( arg ) )
        {
          noi = atoi( arg );
          argument = one_argument( argument, arg );
          if ( noi > mnoi )
            {
              act( AT_TELL, "$n tells you 'I don't sell that many items at"
                   " once.'", keeper, NULL, ch, TO_VICT );
	      ch->reply = keeper;
              return;
            }
        }

      obj  = get_obj_carry( keeper, arg );

      if ( !obj && arg[0] == '#' )
        {
          int onum, oref;
          bool ofound = FALSE;

          onum =0;
          oref = atoi(arg+1);
          for ( obj = keeper->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->wear_loc == WEAR_NONE
                   &&   can_see_obj( ch, obj ) )
                onum++;
              if ( onum == oref )
                {
                  ofound = TRUE;
                  break;
                }
              else if ( onum > oref )
                break;
            }
          if (!ofound)
            obj = NULL;
        }

      if ( !obj )
        {
          send_to_char( "Buy what?\r\n", ch );
          return;
        }


      cost = ( get_cost( ch, keeper, obj, TRUE ) * noi );

      if (keeper->home != NULL && obj->cost > 0)
        cost= obj->cost;


      if ( cost <= 0 || !can_see_obj( ch, obj ) )
	{
          act( AT_TELL, "$n tells you 'I don't sell that -- try 'list'.'",
               keeper, NULL, ch, TO_VICT );
          ch->reply = keeper;
          return;
        }

      if ( !IS_OBJ_STAT( obj, ITEM_INVENTORY ) && ( noi > 1 ) )
        {
          interpret( keeper, "laugh" );
          act( AT_TELL, "$n tells you 'I don't have enough of those in stock"
               " to sell more than one at a time.'", keeper, NULL, ch, TO_VICT );
          ch->reply = keeper;
          return;
        }

      if ( ch->gold < cost )
        {
          act( AT_TELL, "$n tells you 'You can't afford to buy $p.'",
               keeper, obj, ch, TO_VICT );
          ch->reply = keeper;
          return;
        }

      if ( IS_SET(obj->extra_flags, ITEM_PROTOTYPE)
           && get_trust( ch ) < LEVEL_IMMORTAL )
        {
          act( AT_TELL, "$n tells you 'This is a only a prototype!  I can't sell you that...'",
               keeper, NULL, ch, TO_VICT );
          ch->reply = keeper;
          return;
        }

      if ( ch->carry_number + get_obj_number( obj ) > can_carry_n( ch ) )
        {
          send_to_char( "You can't carry that many items.\r\n", ch );
          return;
        }

      if ( ch->carry_weight + ( get_obj_weight( obj ) * noi )
           + (noi > 1 ? 2 : 0) > can_carry_w( ch ) )
        {
          send_to_char( "You can't carry that much weight.\r\n", ch );
          return;
        }

      if ( noi == 1 )
        {
          if ( !IS_OBJ_STAT( obj, ITEM_INVENTORY ) || ( keeper->home != NULL ) )
            separate_obj( obj );
          act( AT_ACTION, "$n buys $p.", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You buy $p.", ch, obj, NULL, TO_CHAR );
        }
      else
        {
          sprintf( arg, "$n buys %d $p%s.", noi,
                   ( obj->short_descr[strlen(obj->short_descr)-1] == 's'
                     ? "" : "s" ) );
          act( AT_ACTION, arg, ch, obj, NULL, TO_ROOM );
          sprintf( arg, "You buy %d $p%s.", noi,
                   ( obj->short_descr[strlen(obj->short_descr)-1] == 's'
                     ? "" : "s" ) );
          act( AT_ACTION, arg, ch, obj, NULL, TO_CHAR );
          act( AT_ACTION, "$N puts them into a bag and hands it to you.",
               ch, NULL, keeper, TO_CHAR );
        }

      ch->gold     -= cost;
      keeper->gold += cost;

      if ( ( keeper->gold > maxgold ) && (keeper->owner == NULL ))
        {
          boost_economy( keeper->in_room->area, keeper->gold - maxgold/2 );
          keeper->gold = maxgold/2;
          act( AT_ACTION, "$n puts some credits into a large safe.", keeper, NULL, NULL, TO_ROOM );
        }

      if ( IS_OBJ_STAT( obj, ITEM_INVENTORY ) && ( keeper->home == NULL ) )
        {
          OBJ_DATA *buy_obj, *bag;

          buy_obj = create_object( obj->pIndexData, obj->level );

          /*
           * Due to grouped objects and carry limitations in SMAUG
           * The shopkeeper gives you a bag with multiple-buy,
           * and also, only one object needs be created with a count
           * set to the number bought.          -Thoric
           */
          if ( noi > 1 )
	    {
              bag = create_object( get_obj_index( OBJ_VNUM_SHOPPING_BAG ), 1 );
              /* perfect size bag ;) */
              bag->value[0] = bag->weight + (buy_obj->weight * noi);
              buy_obj->count = noi;
              obj->pIndexData->count += (noi - 1);
              numobjsloaded += (noi - 1);
              obj_to_obj( buy_obj, bag );
              obj_to_char( bag, ch );

              /* vendor snippit. Forces vendor to save after anyone buys anything*/
              if (  keeper->home != NULL )
                {
                  save_vendor (keeper);
                  bag->cost = 0;
                }
            }
          else
            obj_to_char( buy_obj, ch );

          /* vendor snippit. Forces vendor to save after anyone buys anything*/
          if (  keeper->home != NULL )
            {
              save_vendor (keeper);
              buy_obj->cost = 0;
            }
        }
      else
        {
          obj_from_char( obj );
          obj_to_char( obj, ch );

          /* vendor snippit. Forces vendor to save after anyone buys anything*/
          if (  keeper->home != NULL )
            {
              save_vendor (keeper);
              obj->cost = 0;
            }
        }

      return;
    }
}
