/***************************************************************************
*                   Star Wars: Rise in Power MUD Codebase                  *
*--------------------------------------------------------------------------*
* SWRiP Code Additions and changes from the SWReality and Smaug Code       *
* copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
*--------------------------------------------------------------------------*
* Star Wars Reality Code Additions and changes from the Smaug Code         *
* copyright (c) 1997 by Sean Cooper                                        *
* -------------------------------------------------------------------------*
* Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
*--------------------------------------------------------------------------*
* SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
* SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
* Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
* ------------------------------------------------------------------------ *
* Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
* Chastain, Michael Quan, and Mitchell Tse.                                *
* Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
* Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
* ------------------------------------------------------------------------ *
*			 Shop and repair shop module			   *
****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include <stdarg.h>
#include <sys/stat.h>
#include "mud.h"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

#define COST_EQUATION  (int) (cost*cost_equation( obj ))

float cost_equation( OBJ_DATA *obj )
{
      float count = obj->pIndexData->count;

	count = URANGE( 50, count, 500 );
      
	return (100/(count));
}



#if defined(KEY)
#undef KEY
#endif

#define KEY( literal, field, value )					\
				if ( !strcmp( word, literal ) )	\
				{					\
				    field  = value;			\
				    fMatch = TRUE;			\
				    break;				\
				}


/*
 * Local functions
 */

#define	CD	CHAR_DATA
CD *	find_keeper	args( ( CHAR_DATA *ch ) );
CD *	find_keeper_q	args( ( CHAR_DATA *ch, bool message ) );
CD *	find_fixer	args( ( CHAR_DATA *ch ) );
int	get_cost	args( ( CHAR_DATA *ch, CHAR_DATA *keeper,
				OBJ_DATA *obj, bool fBuy ) );
int 	get_repaircost  args( ( CHAR_DATA *keeper, OBJ_DATA *obj ) );
#undef CD

/*
 * Shopping commands.
 */
CHAR_DATA *find_keeper( CHAR_DATA *ch )
{
  return find_keeper_q( ch, TRUE );
}

CHAR_DATA *find_keeper_q( CHAR_DATA *ch, bool message )
{
    CHAR_DATA *keeper;
    SHOP_DATA *pShop;

    pShop = NULL;
    for ( keeper = ch->in_room->first_person;
	  keeper;
	  keeper = keeper->next_in_room )
	if ( IS_NPC(keeper) && (pShop = keeper->pIndexData->pShop) != NULL )
	    break;

    if ( !pShop )

    {
      if ( message )
	send_to_char( "You can't do that here.\n\r", ch );
      return NULL;
    }


    /*
     * Shop hours.
     */
    if ( pShop->open_hour > pShop->close_hour )
    {
      if( time_info.hour < pShop->open_hour && time_info.hour > pShop->close_hour )
      {
	do_say( keeper, "Sorry, come back later." );
	return NULL;
      }
    }
    else
      if( time_info.hour < pShop->open_hour || time_info.hour > pShop->close_hour )
      {
        if( time_info.hour > pShop->open_hour )
        {
	  do_say( keeper, "Sorry, come back later." );
	  return NULL;
        }
        if ( time_info.hour > pShop->close_hour )
        {
	  do_say( keeper, "Sorry, come back tomorrow." );
	  return NULL;
        }
      }
    if ( !knows_language( keeper, ch->speaking, ch ) )
    {
	do_say( keeper, "I can't understand you." );
	return NULL;
    }

    return keeper;
}

/*
 * repair commands.
 */
CHAR_DATA *find_fixer( CHAR_DATA *ch )
{
    CHAR_DATA *keeper;
    REPAIR_DATA *rShop;

    rShop = NULL;
    for ( keeper = ch->in_room->first_person;
	  keeper;
	  keeper = keeper->next_in_room )
	if ( IS_NPC(keeper) && (rShop = keeper->pIndexData->rShop) != NULL )
	    break;

    if ( !rShop )
    {
	send_to_char( "You can't do that here.\n\r", ch );
	return NULL;
    }

 
    /*
     * Shop hours.
     */
    if ( time_info.hour < rShop->open_hour )
    {
	do_say( keeper, "Sorry, come back later." );
	return NULL;
    }

    if ( time_info.hour > rShop->close_hour )
    {
	do_say( keeper, "Sorry, come back tomorrow." );
	return NULL;
    }

    
    if ( !knows_language( keeper, ch->speaking, ch ) )
    {
	do_say( keeper, "I can't understand you." );
	return NULL;
    }

    return keeper;
}

int get_cost_quit( CHAR_DATA *ch )
{
	
  long cost = 1000;
  int golddem = 100000;
  long gold;
  
  if( !ch )
    return 0;
  
  if( ch->top_level <= 6 )
    return 0;
  
  gold = ch->gold + (IS_NPC(ch) ? 0 : ch->pcdata->bank) + 1;
  
  if( gold < 5000 )
    return 0;
  cost *= gold/golddem;

  return (int) cost;
}

int get_cost( CHAR_DATA *ch, CHAR_DATA *keeper, OBJ_DATA *obj, bool fBuy )
{
    SHOP_DATA *pShop;
    int cost;
    bool richcustomer;
    int profitmod;

    if ( !obj || ( pShop = keeper->pIndexData->pShop ) == NULL )
	return 0;

    if ( ( ch->gold + (IS_NPC(ch) ? 0 : ch->pcdata->bank) ) > (ch->top_level * 1000) )
	richcustomer = TRUE;
    else
	richcustomer = FALSE;

    if ( fBuy )
    {
	cost = (int) (cost * (80 + UMIN(ch->top_level, LEVEL_AVATAR))) / 100;

	profitmod = 13 - get_curr_cha(ch) + (richcustomer ? 15 : 0)
		  + ((URANGE(5,ch->top_level,LEVEL_AVATAR)-20)/2);
	cost = (int) (obj->cost
	     * UMAX( (pShop->profit_sell+1), pShop->profit_buy+profitmod ) )
	     / 100;
    }
    else
    {
	OBJ_DATA *obj2;
	int itype;

	profitmod = get_curr_cha(ch) - 13 - (richcustomer ? 15 : 0);
	cost = 0;
	for ( itype = 0; itype < MAX_TRADE; itype++ )
	{
	    if ( obj->item_type == pShop->buy_type[itype] )
	    {
		cost = (int) (obj->cost
		     * UMIN( (pShop->profit_buy-1),
			      pShop->profit_sell+profitmod) ) / 100;
		break;
	    }
	}
        for ( obj2 = keeper->first_carrying; obj2; obj2 = obj2->next_content )
	{
	    if ( obj->pIndexData == obj2->pIndexData )
	    {
		cost /= (obj2->count+1);
		break;
	    }
	}
    
        cost = UMIN( cost , 2500 );

    }

    if( cost > 0 )
    {
      cost = COST_EQUATION;
      if( cost <= 0 )
        cost = 1;
    }
      

    if ( obj->item_type == ITEM_ARMOR )
      cost = (int) (cost * (obj->value[0]+1) / (obj->value[1]+1) );
    if ( obj->item_type == ITEM_WEAPON )
    {
      cost = (int) (cost * (obj->value[0]+1) / INIT_WEAPON_CONDITION+1);
      cost = (int) (cost * (obj->value[4]+1) / (obj->value[5]+1));
    }
    	
    if ( obj->item_type == ITEM_DEVICE )
	cost = (int) (cost * (obj->value[2]+1) / (obj->value[1]+1));

    return cost;
}

int get_repaircost( CHAR_DATA *keeper, OBJ_DATA *obj )
{
    REPAIR_DATA *rShop;
    int cost;
    int itype;
    bool found;

    if ( !obj || ( rShop = keeper->pIndexData->rShop ) == NULL )
	return 0;

    cost = 0;
    found = FALSE;
    for ( itype = 0; itype < MAX_FIX; itype++ )
    {
	if ( obj->item_type == rShop->fix_type[itype] )
	{
	    cost = (int) (obj->cost * rShop->profit_fix / 100);
	    found = TRUE;
	    break;
	}
    }

    if ( !found )
      cost = -1;

    if ( cost == 0 )
      cost = 1;

    if ( found && cost > 0 )
    {
      switch (obj->item_type)
      {
	case ITEM_ARMOR:
	  if (obj->value[0] >= obj->value[1])
	    cost = -2;
	  else
	    cost *= (obj->value[1] - obj->value[0]);
	  break;
	case ITEM_WEAPON:
	  if (INIT_WEAPON_CONDITION == obj->value[0])
	    cost = -2;
	  else
	    cost *= (INIT_WEAPON_CONDITION - obj->value[0]);
	  break;
	case ITEM_DEVICE:
	  if (obj->value[2] >= obj->value[1])
	    cost = -2;
	  else
	    cost *= (obj->value[1] - obj->value[2]);
      }
    }

    return cost;
}



void do_buy( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    int maxgold;

    argument = one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "Buy what?\n\r", ch );
	return;
    }

    if ( IS_SET(ch->in_room->room_flags, ROOM_PET_SHOP) )
    {
	char buf[MAX_STRING_LENGTH];
	CHAR_DATA *pet;
	ROOM_INDEX_DATA *pRoomIndexNext;
	ROOM_INDEX_DATA *in_room;

	if ( IS_NPC(ch) )
	    return;

	pRoomIndexNext = get_room_index( ch->in_room->vnum + 1 );
	if ( !pRoomIndexNext )
	{
	    bug( "Do_buy: bad pet shop at vnum %d.", ch->in_room->vnum );
	    send_to_char( "Sorry, you can't buy that here.\n\r", ch );
	    return;
	}

	in_room     = ch->in_room;
	ch->in_room = pRoomIndexNext;
	pet         = get_char_room( ch, arg );
	ch->in_room = in_room;

	if ( pet == NULL || !IS_NPC( pet ) || !IS_SET(pet->act, ACT_PET) )
	{
	    send_to_char( "Sorry, you can't buy that here.\n\r", ch );
	    return;
	}

	if ( IS_SET(ch->act, PLR_BOUGHT_PET) )
	{
	    send_to_char( "You already bought one pet this level.\n\r", ch );
	    return;
	}

	if ( ch->gold < 10 * pet->top_level * pet->top_level )
	{
	    send_to_char( "You can't afford it.\n\r", ch );
	    return;
	}

	if ( ch->top_level < pet->top_level )
	{
	    send_to_char( "You're not ready for this pet.\n\r", ch );
	    return;
	}

	maxgold = 10 * pet->top_level * pet->top_level;
	ch->gold	-= maxgold;
	boost_economy( ch->in_room->area, maxgold );
	pet		= create_mobile( pet->pIndexData );
//	SET_BIT(ch->act, PLR_BOUGHT_PET);
	SET_BIT(pet->act, ACT_PET);
	SET_BIT(pet->affected_by, AFF_CHARM);

	argument = one_argument( argument, arg );
	if ( arg[0] != '\0' )
	{
	    sprintf( buf, "%s %s", pet->name, arg );
	    STRFREE( pet->name );
	    pet->name = STRALLOC( buf );
	}

	sprintf( buf, "%sA neck tag says 'I belong to %s'.\n\r",
	    pet->description, ch->name );
	STRFREE( pet->description );
	pet->description = STRALLOC( buf );

	if( ch->pcdata )
	  ch->pcdata->pet = pet;

	char_to_room( pet, ch->in_room );
	add_follower( pet, ch );
	send_to_char( "Enjoy your pet.\n\r", ch );
    	act( AT_ACTION, "$n bought $N as a pet.", ch, NULL, pet, TO_ROOM );
	return;
    }
    else
    {
	CHAR_DATA *keeper;
	OBJ_DATA *obj;
	int cost;
	int noi = 1;		/* Number of items */
	sh_int mnoi = 20;	/* Max number of items to be bought at once */

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
	  send_to_char( "Buy what?\n\r", ch );
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
	    send_to_char( "You can't carry that many items.\n\r", ch );
	    return;
	}

	if ( ch->carry_weight + ( get_obj_weight( obj ) * noi )
		+ (noi > 1 ? 2 : 0) > can_carry_w( ch ) )
	{
	    send_to_char( "You can't carry that much weight.\n\r", ch );
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
	     * set to the number bought.		-Thoric
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


void do_list( CHAR_DATA *ch, char *argument )
{
    if ( IS_SET(ch->in_room->room_flags, ROOM_PET_SHOP) )
    {
	ROOM_INDEX_DATA *pRoomIndexNext;
	CHAR_DATA *pet;
	bool found;

	pRoomIndexNext = get_room_index( ch->in_room->vnum + 1 );
	if ( !pRoomIndexNext )
	{
	    bug( "Do_list: bad pet shop at vnum %d.", ch->in_room->vnum );
	    send_to_char( "You can't do that here.\n\r", ch );
	    return;
	}

	found = FALSE;
	for ( pet = pRoomIndexNext->first_person; pet; pet = pet->next_in_room )
	{
	    if ( IS_SET(pet->act, ACT_PET) && IS_NPC(pet) )
	    {
		if ( !found )
		{
		    found = TRUE;
		    send_to_char( "Pets for sale:\n\r", ch );
		}
		ch_printf( ch, "[%2d] %8d - %s\n\r",
			pet->top_level,
			10 * pet->top_level * pet->top_level,
			pet->short_descr );
	    }
	}
	if ( !found )
	    send_to_char( "Sorry, we're out of pets right now.\n\r", ch );
	return;
    }
    else
    {
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *keeper;
	OBJ_DATA *obj;
	int cost;
	int oref = 0;
	bool found;

	one_argument( argument, arg );

	if ( ( keeper = find_keeper( ch ) ) == NULL )
	    return;

	found = FALSE;
	for ( obj = keeper->last_carrying; obj; obj = obj->prev_content )
	{
	    if ( obj->wear_loc == WEAR_NONE
	    &&   can_see_obj( ch, obj ) )
	    {
	       oref++;
	       if ( ( cost = get_cost( ch, keeper, obj, TRUE ) ) > 0
	       && ( arg[0] == '\0' || nifty_is_name( arg, obj->name ) ) )
	       {
		 if (keeper->home != NULL)
		 cost = obj->cost;
		if ( !found )
		{
		    found = TRUE;
		    send_to_char( "[Price] {ref} Item\n\r", ch );
		}
		ch_printf( ch, "[%5d] {%3d} %s%s.\n\r",
		    cost, oref, capitalize( obj->short_descr ),
		    IS_SET(obj->extra_flags, ITEM_HUTT_SIZE) ? " (hutt size)" :
		    ( IS_SET(obj->extra_flags, ITEM_LARGE_SIZE) ? " (large)" :
		    ( IS_SET(obj->extra_flags, ITEM_HUMAN_SIZE) ? " (medium)" :
		    ( IS_SET(obj->extra_flags, ITEM_SMALL_SIZE) ? " (small)" :
		    "" ) ) ) );
	       }
	    }
	}

	if ( !found )
	{
	    if ( arg[0] == '\0' )
		send_to_char( "You can't buy anything here.\n\r", ch );
	    else
		send_to_char( "You can't buy that here.\n\r", ch );
	}
	return;
    }
}


void do_sell( CHAR_DATA *ch, char *argument )
{
    char buf[MAX_STRING_LENGTH];
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *keeper;
    OBJ_DATA *obj;
    int cost;
    bool spice = FALSE;

    one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "Sell what?\n\r", ch );
	return;
    }

    if ( ( keeper = find_keeper( ch ) ) == NULL )
	return;

    if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
	act( AT_TELL, "$n tells you 'You don't have that item.'",
		keeper, NULL, ch, TO_VICT );
	ch->reply = keeper;
	return;
    }

    if ( !can_drop_obj( ch, obj ) )
    {
	send_to_char( "You can't let go of it!\n\r", ch );
	return;
    }

    if ( obj->timer > 0 )
    {
	act( AT_TELL, "$n tells you, '$p is depreciating in value too quickly...'", keeper, obj, ch, TO_VICT );
	return;
    }

    if ( ( cost = get_cost( ch, keeper, obj, FALSE ) ) <= 0 )
    {
	act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
	return;
    }

    if( obj->item_type == ITEM_SPICE )
      spice = TRUE;

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
       
       ch_exp = UMIN( obj->cost*10 , ( exp_level( ch->skill_level[SMUGGLING_ABILITY]+1) - exp_level( ch->skill_level[SMUGGLING_ABILITY])  ) / 10  );
       ch_printf( ch, "You receive %ld smuggling experience for unloading your contraband.\n\r " , ch_exp );
       gain_exp( ch, ch_exp , SMUGGLING_ABILITY );
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



void do_value( CHAR_DATA *ch, char *argument )
{
    char buf[MAX_STRING_LENGTH];
    CHAR_DATA *keeper;
    OBJ_DATA *obj;
    int cost;

    if ( argument[0] == '\0' )
    {
	send_to_char( "Value what?\n\r", ch );
	return;
    }

    if ( ( keeper = find_keeper( ch ) ) == NULL )
	return;

    if ( ( obj = get_obj_carry( ch, argument ) ) == NULL )
    {
	act( AT_TELL, "$n tells you 'You don't have that item.'",
		keeper, NULL, ch, TO_VICT );
	ch->reply = keeper;
	return;
    }

    if ( !can_drop_obj( ch, obj ) )
    {
	send_to_char( "You can't let go of it!\n\r", ch );
	return;
    }

    if ( ( cost = get_cost( ch, keeper, obj, FALSE ) ) <= 0 )
    {
	act( AT_ACTION, "$n looks uninterested in $p.", keeper, obj, ch, TO_VICT );
	return;
    }

    sprintf( buf, "$n tells you 'I'll give you %d credits for $p.'", cost );
    act( AT_TELL, buf, keeper, obj, ch, TO_VICT );
    ch->reply = keeper;

    return;
}

/*
 * Repair a single object. Used when handling "repair all" - Gorog
 */
void repair_one_obj( CHAR_DATA *ch, CHAR_DATA *keeper, OBJ_DATA *obj,
                 char *arg, int maxgold, char *fixstr, char*fixstr2 )
{
   char buf[MAX_STRING_LENGTH];
   int cost;

   if ( !can_drop_obj( ch, obj ) )
       ch_printf( ch, "You can't let go of %s.\n\r", obj->name );
   else if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
   {
       if (cost != -2)
       act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'", 
            keeper, obj, ch, TO_VICT );
       else
	  act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
   }
               /* "repair all" gets a 10% surcharge - Gorog */

   else if ( (cost = strcmp("all",arg) ? cost : 11*cost/10) > ch->gold )
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
            send_to_char( "For some reason, you think you got ripped off...\n\r", ch);
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

void do_repair( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *keeper;
    OBJ_DATA *obj;
    char *fixstr;
    char *fixstr2;
    int maxgold;

    if ( argument[0] == '\0' )
    {
	send_to_char( "Repair what?\n\r", ch );
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

    if ( !strcmp( argument, "all" ) )
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

    repair_one_obj( ch, keeper, obj, argument, maxgold, fixstr, fixstr2); }

void appraise_all( CHAR_DATA *ch, CHAR_DATA *keeper, char *fixstr )
{
    OBJ_DATA *obj;
    char buf[MAX_STRING_LENGTH], *pbuf=buf;
    int cost, total=0;

    for ( obj = ch->first_carrying; obj != NULL ; obj = obj->next_content )
    {
        if ( obj->wear_loc  == WEAR_NONE
        &&   can_see_obj( ch, obj )
        && ( obj->item_type == ITEM_ARMOR
        ||   obj->item_type == ITEM_WEAPON
        ||   obj->item_type == ITEM_DEVICE ) )
        
	{
            if ( !can_drop_obj( ch, obj ) )
              ch_printf( ch, "You can't let go of %s.\n\r", obj->name );
            else if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
            {
               if (cost != -2)
               act( AT_TELL,
                    "$n tells you, 'Sorry, I can't do anything with $p.'",
                    keeper, obj, ch, TO_VICT );
               else
               act( AT_TELL, "$n tells you, '$p looks fine to me!'",
                    keeper, obj, ch, TO_VICT );
            }
            else 
            {
            sprintf( buf,
            "$N tells you, 'It will cost %d credit%s to %s %s'",
            cost, cost == 1 ? "" : "s", fixstr, obj->name );
            act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
            total += cost;
            }
        }
    }
    if ( total > 0 )
    {
       send_to_char ("\n\r", ch);
       sprintf( buf,
          "$N tells you, 'It will cost %d credit%s in total.'",
          total, cost == 1 ? "" : "s" );
       act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
       strcpy( pbuf,
       "$N tells you, 'Remember there is a 10% surcharge for repair all.'");
       act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
    }
}
	

void do_appraise( CHAR_DATA *ch, char *argument )
{
    char buf[MAX_STRING_LENGTH];
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *keeper;
    OBJ_DATA *obj;
    int cost;
    char *fixstr;

    one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "Appraise what?\n\r", ch );
	return;
    }

    if ( ( keeper = find_fixer( ch ) ) == NULL )
	return;

    switch( keeper->pIndexData->rShop->shop_type )
    {
	default:
	case SHOP_FIX:
	  fixstr  = "repair";
	  break;
	case SHOP_RECHARGE:
	  fixstr  = "recharge";
	  break;
    }

    if ( !strcmp( arg, "all") )
    {
    appraise_all( ch, keeper, fixstr );
    return;
    }

    if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
	act( AT_TELL, "$n tells you 'You don't have that item.'",
		keeper, NULL, ch, TO_VICT );
	ch->reply = keeper;
	return;
    }

    if ( !can_drop_obj( ch, obj ) )
    {
	send_to_char( "You can't let go of it.\n\r", ch );
	return;
    }

    if ( ( cost = get_repaircost( keeper, obj ) ) < 0 )
    {
      if (cost != -2)
	act( AT_TELL, "$n tells you, 'Sorry, I can't do anything with $p.'", keeper, obj, ch, TO_VICT );
      else
	act( AT_TELL, "$n tells you, '$p looks fine to me!'", keeper, obj, ch, TO_VICT );
      return;
    }

    sprintf( buf,
       "$N tells you, 'It will cost %d credit%s to %s that...'", cost,
       cost == 1 ? "" : "s", fixstr );
    act( AT_TELL, buf, ch, NULL, keeper, TO_CHAR );
    if ( cost > ch->gold )
      act( AT_TELL, "$N tells you, 'Which I see you can't afford.'", ch,
	 NULL, keeper, TO_CHAR );

    return;
}


/* ------------------ Shop Building and Editing Section ----------------- */


void do_makeshop( CHAR_DATA *ch, char *argument )
{
    SHOP_DATA *shop;
    sh_int vnum;
    MOB_INDEX_DATA *mob;

    if ( !argument || argument[0] == '\0' )
    {
	send_to_char( "Usage: makeshop <mobvnum>\n\r", ch );
	return;
    }

    vnum = atoi( argument );
    
    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !can_medit(ch, mob) )
      return;

    if ( mob->pShop )
    {
	send_to_char( "This mobile already has a shop.\n\r", ch );
	return;
    }

    CREATE( shop, SHOP_DATA, 1 );

    LINK( shop, first_shop, last_shop, next, prev );
    shop->keeper	= vnum;
    shop->profit_buy	= 120;
    shop->profit_sell	= 90;
    shop->open_hour	= 0;
    shop->close_hour	= 23;
    mob->pShop		= shop;
    send_to_char( "Done.\n\r", ch );
    return;
}


void do_shopset( CHAR_DATA *ch, char *argument )
{
    SHOP_DATA *shop;
    MOB_INDEX_DATA *mob, *mob2;
    char arg1[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    sh_int vnum;
    int value;
    
    argument = one_argument( argument, arg1 );
    argument = one_argument( argument, arg2 );

    if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
	send_to_char( "Usage: shopset <mob vnum> <field> value\n\r", ch );
	send_to_char( "\n\rField being one of:\n\r", ch );
	send_to_char( "  buy0 buy1 buy2 buy3 buy4 buy sell open close keeper\n\r", ch );
	return;
    }

    vnum = atoi( arg1 );

    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !can_medit(ch, mob) )
      return;

    if ( !mob->pShop )
    {
	send_to_char( "This mobile doesn't keep a shop.\n\r", ch );
	return;
    }
    shop = mob->pShop;
    value = atoi( argument );

    if ( !str_cmp( arg2, "buy0" ) )
    {
	if ( !is_number(argument) )
	    value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	shop->buy_type[0] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "buy1" ) )
    {
	if ( !is_number(argument) )
	    value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	shop->buy_type[1] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "buy2" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	shop->buy_type[2] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "buy3" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	shop->buy_type[3] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "buy4" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	shop->buy_type[4] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "buy" ) )
    {
	if ( value <= (shop->profit_sell+5) || value > 1000 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	shop->profit_buy = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "sell" ) )
    {
	if ( value < 0 || value >= (shop->profit_buy-5) )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	shop->profit_sell = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "open" ) )
    {
	if ( value < 0 || value > 23 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	shop->open_hour = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "close" ) )
    {
	if ( value < 0 || value > 23 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	shop->close_hour = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "keeper" ) )
    {
	if ( (mob2 = get_mob_index(vnum)) == NULL )
	{
	    send_to_char( "Mobile not found.\n\r", ch );
	    return;
	}
	if ( !can_medit(ch, mob) )
	    return;
	if ( mob2->pShop )
	{
	    send_to_char( "That mobile already has a shop.\n\r", ch );
	    return;
	}
	mob->pShop  = NULL;
	mob2->pShop = shop;
	shop->keeper = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    do_shopset( ch, "" );
    return;
}


void do_shopstat( CHAR_DATA *ch, char *argument )
{
    SHOP_DATA *shop;
    MOB_INDEX_DATA *mob;
    sh_int vnum;
    
    if ( argument[0] == '\0' )
    {
	send_to_char( "Usage: shopstat <keeper vnum>\n\r", ch );
	return;
    }

    vnum = atoi( argument );
    
    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !mob->pShop )
    {
	send_to_char( "This mobile doesn't keep a shop.\n\r", ch );
	return;
    }
    shop = mob->pShop;

    ch_printf( ch, "Keeper: %d  %s\n\r", shop->keeper, mob->short_descr );
    ch_printf( ch, "buy0 [%s]  buy1 [%s]  buy2 [%s]  buy3 [%s]  buy4 [%s]\n\r",
		o_types[shop->buy_type[0]],
		o_types[shop->buy_type[1]],
		o_types[shop->buy_type[2]],
		o_types[shop->buy_type[3]],
		o_types[shop->buy_type[4]] );
    ch_printf( ch, "Profit:  buy %3d%%  sell %3d%%\n\r",
			shop->profit_buy,
			shop->profit_sell );
    ch_printf( ch, "Hours:   open %2d  close %2d\n\r",
			shop->open_hour,
			shop->close_hour );
    return;
}


void do_shops( CHAR_DATA *ch, char *argument )
{
    SHOP_DATA *shop;

    if ( !first_shop )
    {
	send_to_char( "There are no shops.\n\r", ch );
	return;
    }

    set_char_color( AT_NOTE, ch );
    for ( shop = first_shop; shop; shop = shop->next )
	ch_printf( ch, "Keeper: %5d Buy: %3d Sell: %3d Open: %2d Close: %2d Buy: %2d %2d %2d %2d %2d\n\r",
		shop->keeper,	   shop->profit_buy, shop->profit_sell,
		shop->open_hour,   shop->close_hour,
		shop->buy_type[0], shop->buy_type[1],
		shop->buy_type[2], shop->buy_type[3], shop->buy_type[4] );
    return;
}


/* -------------- Repair Shop Building and Editing Section -------------- */


void do_makerepair( CHAR_DATA *ch, char *argument )
{
    REPAIR_DATA *repair;
    sh_int vnum;
    MOB_INDEX_DATA *mob;

    if ( !argument || argument[0] == '\0' )
    {
	send_to_char( "Usage: makerepair <mobvnum>\n\r", ch );
	return;
    }

    vnum = atoi( argument );
    
    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !can_medit(ch, mob) )
      return;

    if ( mob->rShop )
    {
	send_to_char( "This mobile already has a repair shop.\n\r", ch );
	return;
    }

    CREATE( repair, REPAIR_DATA, 1 );

    LINK( repair, first_repair, last_repair, next, prev );
    repair->keeper	= vnum;
    repair->profit_fix	= 100;
    repair->shop_type	= SHOP_FIX;
    repair->open_hour	= 0;
    repair->close_hour	= 23;
    mob->rShop		= repair;
    send_to_char( "Done.\n\r", ch );
    return;
}


void do_repairset( CHAR_DATA *ch, char *argument )
{
    REPAIR_DATA *repair;
    MOB_INDEX_DATA *mob, *mob2;
    char arg1[MAX_INPUT_LENGTH];
    char arg2[MAX_INPUT_LENGTH];
    sh_int vnum;
    int value;
    
    argument = one_argument( argument, arg1 );
    argument = one_argument( argument, arg2 );

    if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
	send_to_char( "Usage: repairset <mob vnum> <field> value\n\r", ch );
	send_to_char( "\n\rField being one of:\n\r", ch );
	send_to_char( "  fix0 fix1 fix2 profit type open close keeper\n\r", ch );
	return;
    }

    vnum = atoi( arg1 );

    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !can_medit(ch, mob) )
      return;

    if ( !mob->rShop )
    {
	send_to_char( "This mobile doesn't keep a repair shop.\n\r", ch );
	return;
    }
    repair = mob->rShop;
    value = atoi( argument );

    if ( !str_cmp( arg2, "fix0" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	repair->fix_type[0] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "fix1" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	repair->fix_type[1] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "fix2" ) )
    {
	if ( !is_number(argument) )
	  value = get_otype(argument);
	if ( value < 0 || value > MAX_ITEM_TYPE )
	{
	    send_to_char( "Invalid item type!\n\r", ch );
	    return;
	}
	repair->fix_type[2] = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "profit" ) )
    {
	if ( value < 1 || value > 1000 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	repair->profit_fix = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "type" ) )
    {
	if ( value < 1 || value > 2 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	repair->shop_type = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "open" ) )
    {
	if ( value < 0 || value > 23 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	repair->open_hour = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "close" ) )
    {
	if ( value < 0 || value > 23 )
	{
	    send_to_char( "Out of range.\n\r", ch );
	    return;
	}
	repair->close_hour = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( !str_cmp( arg2, "keeper" ) )
    {
	if ( (mob2 = get_mob_index(vnum)) == NULL )
	{
	  send_to_char( "Mobile not found.\n\r", ch );
	  return;
	}
	if ( !can_medit(ch, mob) )
	  return;
	if ( mob2->rShop )
	{
	  send_to_char( "That mobile already has a repair shop.\n\r", ch );
	  return;
	}
	mob->rShop  = NULL;
	mob2->rShop = repair;
	repair->keeper = value;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    do_repairset( ch, "" );
    return;
}


void do_repairstat( CHAR_DATA *ch, char *argument )
{
    REPAIR_DATA *repair;
    MOB_INDEX_DATA *mob;
    sh_int vnum;
    
    if ( argument[0] == '\0' )
    {
	send_to_char( "Usage: repairstat <keeper vnum>\n\r", ch );
	return;
    }

    vnum = atoi( argument );
    
    if ( (mob = get_mob_index(vnum)) == NULL )
    {
	send_to_char( "Mobile not found.\n\r", ch );
	return;
    }

    if ( !mob->rShop )
    {
	send_to_char( "This mobile doesn't keep a repair shop.\n\r", ch );
	return;
    }
    repair = mob->rShop;

    ch_printf( ch, "Keeper: %d  %s\n\r", repair->keeper, mob->short_descr );
    ch_printf( ch, "fix0 [%s]  fix1 [%s]  fix2 [%s]\n\r",
			o_types[repair->fix_type[0]],
			o_types[repair->fix_type[1]],
			o_types[repair->fix_type[2]] );
    ch_printf( ch, "Profit: %3d%%  Type: %d\n\r",
			repair->profit_fix,
			repair->shop_type );
    ch_printf( ch, "Hours:   open %2d  close %2d\n\r",
			repair->open_hour,
			repair->close_hour );
    return;
}


void do_repairshops( CHAR_DATA *ch, char *argument )
{
    REPAIR_DATA *repair;

    if ( !first_repair )
    {
	send_to_char( "There are no repair shops.\n\r", ch );
	return;
    }

    set_char_color( AT_NOTE, ch );
    for ( repair = first_repair; repair; repair = repair->next )
	ch_printf( ch, "Keeper: %5d Profit: %3d Type: %d Open: %2d Close: %2d Fix: %2d %2d %2d\n\r",
		repair->keeper,	     repair->profit_fix, repair->shop_type,
		repair->open_hour,   repair->close_hour,
		repair->fix_type[0], repair->fix_type[1], repair->fix_type[2] );
    return;
}

/*This is the command used to buy a contract from a vendor to place a player
owned vendor
*/
void do_buyvendor (CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *keeper;
  OBJ_DATA *deed;
  char buf[MAX_STRING_LENGTH];
  char buf1[MAX_STRING_LENGTH];
  char strsave[MAX_INPUT_LENGTH];
  struct stat fst;

  if (IS_NPC(ch))
    return;

  if ( !str_cmp( argument, "yes" ) )
  {
    sprintf( buf, "%s/%s", VENDOR_DIR, capitalize( ch->name ) );
    remove( buf );
  }
  
    sprintf( strsave, "%s/%s", VENDOR_DIR, capitalize( ch->name ) );

    	if ( stat( strsave, &fst ) != -1 )
    	{
		send_to_char( "You already have a shop!\n\r", ch);
		send_to_char( "If you want to buy one anyway, type buyvendor yes.\n\r", ch);
		send_to_char( "Your old one will be deleted.\n\r", ch);
		return;
	}
  

  if (  (keeper = find_keeper_q( ch, FALSE ) )  == NULL  )
  {
    send_to_char ("There is no one to buy that from!\n\r", ch);
    return;
  }

  if ( ch->gold < COST_BUY_VENDOR )
     {
         sprintf(buf1, "%s says, You are too poor!\n\r", keeper->name);
         send_to_char (buf1, ch);
         return;
     }

if ( (ch->top_level) < LEVEL_BUY_VENDOR )
	{
		sprintf (buf1, "you must be at least %d level.\n\r", LEVEL_BUY_VENDOR);
		send_to_char (buf1, ch);
		return;
	}

if ( (get_obj_index (OBJ_VNUM_DEED) ) == NULL )
	{
		bug ("BUYVENDOR: Deed is missing!");
		return;
	}

deed = create_object ( get_obj_index(OBJ_VNUM_DEED), 0);
obj_to_char (deed, ch);
send_to_char_color ("&bVery well, you may have a contract for a vendor.\n\r", ch);
ch->gold = ch->gold - COST_BUY_VENDOR;

}


/*this is the command that places the vendor at the specified location*/
void do_placevendor (CHAR_DATA *ch, char *argument)
{
char strsave[MAX_INPUT_LENGTH];
struct stat fst;
CHAR_DATA *vendor;
MOB_INDEX_DATA *temp;
OBJ_DATA *obj;
char vnum1[MAX_INPUT_LENGTH];
char buf [MAX_INPUT_LENGTH];

if (  find_keeper_q (ch, FALSE) )
{
send_to_char ("A vendor is already here!\n\r",ch);
return;
}

if ( IS_NPC(ch) )
	return;



/* better way to do this? what if they have another object called deed?*/
  if ( ( obj = get_obj_carry( ch, "deed" ) ) == NULL )
	{
	    send_to_char( "You do not have a deed!.\n\r", ch );
	    return;
	}

  if (obj->pIndexData->vnum != OBJ_VNUM_DEED)
	{
	    send_to_char( "You do not have a deed!.\n\r", ch );
	    return;
	}

	if (!IS_SET(ch->in_room->room_flags, ROOM_PLR_SHOP) )
	{
		send_to_char( "You need to find a free shop.\n\r", ch);
		return;
	}

        sprintf( strsave, "%s/%s", VENDOR_DIR, capitalize( ch->name ) );

    	if ( stat( strsave, &fst ) != -1 )
    	{
		send_to_char( "You already have a shop!\n\r", ch);
		return;
	}



if ( (temp = get_mob_index (MOB_VNUM_VENDOR) ) == NULL )
{
	log_string ("do_placevendor: no vendor vnum");
	return;
}

char_to_room( create_mobile( temp ), ch->in_room );
vendor = get_char_room(ch, temp->player_name);

sprintf (buf, vendor->long_descr, ch->name);
vendor->long_descr =  STRALLOC( buf );

sprintf (buf, "%s", ch->name);

vendor->owner = STRALLOC(buf);
vendor->home = ch->in_room;

save_vendor (vendor);

separate_obj( obj );
extract_obj( obj );

act( AT_ACTION, "$n appears in a swirl of smoke.\n", vendor, NULL, NULL, TO_ROOM );

sprintf(vnum1,"%d", vendor->pIndexData->vnum);
do_makeshop (vendor, vnum1 ); /*makes the vendor a shop.. there has to be a
better way to do it but hell if i know what it is!*/

}



void do_pricevendor (CHAR_DATA *ch, char *argument)
{
CHAR_DATA *vendor;
CHAR_DATA *ch1;
char arg1 [MAX_INPUT_LENGTH];
char arg2 [MAX_INPUT_LENGTH];
char logbuf[MAX_INPUT_LENGTH];
OBJ_DATA *obj;
struct tm *tms;

argument = one_argument (argument, arg1);
argument = one_argument (argument, arg2);

if ( arg1[0] == '\0' )
	{
	    send_to_char("usage:> pricevendor <item> <cost>\n\r",ch);
	    return;
	}

if (arg2[0] == '\0')
	{
		send_to_char("usage:> pricevendor <item> <cost>\n\r",ch);
		return;
	}


if ( ( vendor = find_keeper (ch) ) == NULL )
{
return;
}

if ( !(vendor->owner) )
  return;

if ( (ch1 = get_char_room(ch, vendor->owner)) == NULL )
{
send_to_char ("This isnt your vendor!\n\r",ch);
return;
}
if ( str_cmp( ch1->name, vendor->owner ) )
	{
          send_to_char ("Trying to steal huh?\n\r",ch);
 	  tms = localtime(&current_time);
 	  tms->tm_hour += 24;
	  ch->pcdata->release_date = mktime(tms);
	  ch->pcdata->helled_by = STRALLOC("VendorCheat");
	  act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
	  char_from_room(ch);
	  char_to_room(ch, get_room_index(6));
	  act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
	  do_look(ch, "auto");
	  ch_printf(ch, "The immortals are not pleased with your actions.\n\r"
            "You shall remain in hell for 24 Hours.\n\r");
	  save_char_obj(ch);	/* used to save ch, fixed by Thoric 09/17/96 */
          sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->name);
          log_string( logbuf );
	  return;
	}

if ( ch->fighting)
{
send_to_char ("Not while you fightZ!\n\r",ch);
return;
}

if ( (obj  = get_obj_carry( vendor, arg1 )) != NULL)
	{
		obj->cost = atoi (arg2);
		send_to_char("The price has been changed\n\r",ch);
		save_vendor(vendor);
		return;
	}


send_to_char("He doesnt have that item!\n\r",ch);
save_vendor(vendor);
return;

}


void do_collectgold (CHAR_DATA *ch, char *argument)
{
CHAR_DATA *vendor;
CHAR_DATA *ch1;
long gold;
char buf [MAX_INPUT_LENGTH];
char logbuf [MAX_INPUT_LENGTH];
char name[MAX_INPUT_LENGTH];
  struct tm *tms;

if ( ( vendor = find_keeper (ch) ) == NULL )
{
return;
}

if (vendor->owner == NULL)
	{
		send_to_char("thats not a vendor!\n\r",ch);
		return;
    }

sprintf(name, "%s", vendor->owner);

if ( (ch1 = get_char_room(ch, vendor->owner)) == NULL )
	{
		send_to_char ("Trying to steal huh?\n\r",ch);
		return;
	}
if ( str_cmp( ch1->name, vendor->owner ) )
	{
          send_to_char ("Trying to steal huh?\n\r",ch);
 	  tms = localtime(&current_time);
 	  tms->tm_hour += 24;
	  ch->pcdata->release_date = mktime(tms);
	  ch->pcdata->helled_by = STRALLOC("VendorCheat");
	  act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
	  char_from_room(ch);
	  char_to_room(ch, get_room_index(6));
	  act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
	  do_look(ch, "auto");
	  ch_printf(ch, "The immortals are not pleased with your actions.\n\r"
            "You shall remain in hell for 24 Hours.\n\r");
	  save_char_obj(ch);	/* used to save ch, fixed by Thoric 09/17/96 */
          sprintf( logbuf , "%s just tried to abuse the vendor bug!" , ch->name);
          log_string( logbuf );
	  return;
	}


if ( !(ch == ch1) )
{
sprintf (buf, "collectgold: %s and ch1 = %s\n\r", name, ch1->name);
log_string (buf);

send_to_char ("This isnt your vendor!\n\r",ch);
return;
}

if ( ch->fighting)
{
send_to_char ("Not while you fightZ!\n\r",ch);
return;
}

gold = vendor->gold;
gold -= (gold * VENDOR_FEE);
if( vendor->in_room && vendor->in_room->area )
  boost_economy( vendor->in_room->area, vendor->gold);
vendor->gold = 0;
ch->gold += gold;

send_to_char_color ("&GYour vendor gladly hands over his earnings minus a small fee of course..\n\r",ch);
act( AT_ACTION, "$n hands over some money.\n\r", vendor, NULL, NULL, TO_ROOM );
}


/* Write vendor to file */
void fwrite_vendor( FILE *fp, CHAR_DATA *mob )
{
  if ( !IS_NPC( mob ) || !fp )
	return;
  fprintf( fp, "Vnum     %d\n", mob->pIndexData->vnum );
  if (mob->gold > 0)
  fprintf (fp, "Gold     %d\n",mob->gold);
  if ( mob->home )
  fprintf( fp, "Home     %d\n", mob->home->vnum );
  if (mob->owner != NULL )
  fprintf (fp, "Owner     %s~\n", mob->owner );
  if ( QUICKMATCH( mob->short_descr, mob->pIndexData->short_descr) == 0 )
  	fprintf( fp, "Short	    %s~\n", mob->short_descr );
  fprintf( fp, "Position   %d\n", mob->position );
  fprintf( fp, "Flags   %d\n",   mob->act );
fprintf( fp, "END\n" );

  return;
}


/* read vendor from file */
CHAR_DATA *  fread_vendor( FILE *fp )
{
  CHAR_DATA *mob = NULL;

  char *word;
  bool fMatch;
  int inroom = 0;
  ROOM_INDEX_DATA *pRoomIndex = NULL;
  CHAR_DATA *victim;
  CHAR_DATA *vnext;
char buf [MAX_INPUT_LENGTH];
char vnum1 [MAX_INPUT_LENGTH];
  word   = feof( fp ) ? "END" : fread_word( fp );
  if ( !strcmp(word, "Vnum") )
  {
    int vnum;

    vnum = fread_number( fp );
    mob = create_mobile(  get_mob_index(vnum));
    if ( !mob )
    {
	for ( ; ; )
		{
	  word   = feof( fp ) ? "END" : fread_word( fp );
	  if ( !strcmp( word, "END" ) )
		break;
        }
	bug("Fread_mobile: No index data for vnum %d", vnum );
	return NULL;
    }
  }
  else
  {
	for ( ; ; )
		{
	  word   = feof( fp ) ? "END" : fread_word( fp );
	  if ( !strcmp( word, "END" ) )
		break;
        }
	extract_char(mob, TRUE);
	bug("Fread_vendor: Vnum not found", 0 );
	return NULL;
  }
  for ( ; ;) {
       word   = feof( fp ) ? "END" : fread_word( fp );
       fMatch = FALSE;
       switch ( UPPER(word[0]) ) {
	case '*':
           fMatch = TRUE;
           fread_to_eol( fp );
           break;
	case '#':
		if ( !strcmp( word, "#OBJECT" ) )
			{
			fread_obj ( mob, fp, OS_CARRY );
			}
			break;
	case 'D':
		KEY( "Description", mob->description, fread_string(fp));
		break;
	case 'E':

		if ( !strcmp( word, "END" ) )
		{
		if ( inroom == 0 )
			inroom = ROOM_VNUM_VENSTOR;
		mob->home = get_room_index(inroom);
		pRoomIndex = get_room_index( inroom );
		if ( !pRoomIndex )
			{
			pRoomIndex = get_room_index( ROOM_VNUM_VENSTOR );
			mob->home = get_room_index( ROOM_VNUM_VENSTOR );
		    }

	  mob->in_room = pRoomIndex;
	  /* the following code is to make sure no more then one player owned vendor
	  is in the room - meckteck */
	  for ( victim = mob->in_room->first_person; victim; victim = vnext )
			{
		vnext = victim->next_in_room;
		if (victim->home != NULL)
		{
		extract_char( victim, TRUE);
        break;
		}

           }

		char_to_room(mob, pRoomIndex);
		sprintf(vnum1,"%d", mob->pIndexData->vnum);
         do_makeshop (mob, vnum1 );
		sprintf (buf, mob->long_descr, mob->owner);
         mob->long_descr =  STRALLOC( buf );
		 mob->hit = 10000;
		 mob->max_hit = 10000;
		return mob;
		}
		break;
 	case 'F':
		KEY( "Flags", mob->act, fread_number(fp));
		break;
	case 'G':
	KEY("Gold", mob->gold, fread_number(fp));
	break;
   case 'H':
	  KEY("Home", inroom, fread_number(fp) );
     break;
	case 'L':
		break;
	case 'N':
		break;
	case 'O':
		KEY ("Owner", mob->owner, fread_string (fp) );
		break;
	case 'P':
		KEY( "Position", mob->position, fread_number( fp ) );
		break;
	case 'S':
		KEY( "Short", mob->short_descr, fread_string(fp));
		break;
	}
	if ( !fMatch )
	{
	   bug ( "Fread_mobile: no match.", 0 );
	   bug ( word, 0 );
	}
  }
  return NULL;
}




void save_vendor( CHAR_DATA *ch )
{
    char strsave[MAX_INPUT_LENGTH];
    FILE *fp;

    if ( !ch )
    {
	bug( "Save_char_obj: null ch!", 0 );
	return;
    }

    de_equip_char( ch );


    sprintf( strsave, "%s%s",VENDOR_DIR, capitalize( ch->owner ) );

    if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
	perror( strsave );
	bug( "Save_vendor: fopen", 0 );
    }
    else
    {
	bool ferr;

	fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);
	fprintf( fp, "#VENDOR\n"		);
	fwrite_vendor( fp, ch );

	if ( ch->first_carrying )
	fwrite_obj( ch, ch->last_carrying, fp, 0, OS_CARRY );

	fprintf(fp, "#END\n" );
	ferr = ferror(fp);
	fclose( fp );
	if (ferr)
	{
	  perror(strsave);
	  bug("Error writing temp file for %s -- not copying", strsave);
	}
    }

    re_equip_char( ch );
    return;
}

