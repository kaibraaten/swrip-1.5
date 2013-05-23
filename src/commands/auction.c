#include <string.h>
#include "mud.h"
#include "character.h"

void do_auction (CHAR_DATA *ch, char *argument)
{
  OBJ_DATA *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = one_argument (argument, arg1);

  if (is_npc(ch)) /* NPC can be extracted at any time and thus can't auction! */
    return;

  if ( !IS_SET( ch->in_room->room_flags , ROOM_HOTEL ) && !IS_SET( ch->in_room->room_flags , ROOM_HOTEL ) )
    {
      set_char_color ( AT_LBLUE, ch );
      send_to_char ( "\r\nYou must go to an auction hall to do that!\r\n", ch );
      return;
    }

  if ( ( time_info.hour > 18 || time_info.hour < 9 ) && auction->item == NULL )
    {
      set_char_color ( AT_LBLUE, ch );
      send_to_char ( "\r\nThe auctioneer has retired for the evening...\r\n", ch );
      return;
    }

  if (arg1[0] == '\0')
    {
      if (auction->item != NULL)
        {
          AFFECT_DATA *paf;
          obj = auction->item;

          /* show item data here */
          if (auction->bet > 0)
            sprintf (buf, "Current bid on this item is %d credits.\r\n",auction->bet);
          else
            sprintf (buf, "No bids on this item have been received.\r\n");
          set_char_color ( AT_BLUE, ch );
          send_to_char (buf,ch);
          /*          spell_identify (0, LEVEL_HERO - 1, ch, auction->item); */

          sprintf( buf,
                   "Object '%s' is %s, special properties: %s %s.\r\nIts weight is %d, value is %d.\r\n",
                   obj->name,
                   aoran( item_type_name( obj ) ),
                   extra_bit_name( obj->extra_flags ),
                   magic_bit_name( obj->magic_flags ),
                   obj->weight,
                   obj->cost );
          set_char_color( AT_LBLUE, ch );
          send_to_char( buf, ch );

          sprintf( buf, "Worn on: %s\r\n",
                   flag_string(obj->wear_flags -1, wear_flags ) );
          send_to_char( buf, ch );

          set_char_color( AT_BLUE, ch );

          switch ( obj->item_type )
            {

            case ITEM_ARMOR:
              ch_printf( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->value[0] );
              ch_printf( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->value[1] );
              break;
            }

          for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
	    showaffect( ch, paf );

          for ( paf = obj->first_affect; paf; paf = paf->next )
            showaffect( ch, paf );
          if ( ( obj->item_type == ITEM_CONTAINER ) && ( obj->first_content ) )
            {
              set_char_color( AT_OBJECT, ch );
              send_to_char( "Contents:\r\n", ch );
              show_list_to_char( obj->first_content, ch, TRUE, FALSE );
            }

          if (IS_IMMORTAL(ch))
            {
              sprintf(buf, "Seller: %s.  Bidder: %s.  Round: %d.\r\n",
                      auction->seller->name, auction->buyer->name,
                      (auction->going + 1));
              send_to_char(buf, ch);
              sprintf(buf, "Time left in round: %d.\r\n", auction->pulse);
              send_to_char(buf, ch);
            }
          return;
        }
      else
        {
          set_char_color ( AT_LBLUE, ch );
          send_to_char ( "\r\nThere is nothing being auctioned right now.  What would you like to auction?\r\n", ch );
          return;
        }
    }

  if ( IS_IMMORTAL(ch) && !str_cmp(arg1,"stop"))
    {
      if (auction->item == NULL)
        {
          send_to_char ("There is no auction to stop.\r\n",ch);
          return;
        }
      else /* stop the auction */
        {
          set_char_color ( AT_LBLUE, ch );
          sprintf (buf,"Sale of %s has been stopped by an Immortal.",
                   auction->item->short_descr);
          talk_auction (buf);
          obj_to_char (auction->item, auction->seller);
          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
	    save_char_obj(auction->seller);
          auction->item = NULL;
          if (auction->buyer != NULL && auction->buyer != auction->seller) /* return money to the buyer */
            {
              auction->buyer->gold += auction->bet;
              send_to_char ("Your money has been returned.\r\n",auction->buyer);
            }
          return;
        }
    }

  if (!str_cmp(arg1,"bid") )
    {
      if (auction->item != NULL)
        {
          int newbet;

          if ( ch == auction->seller)
            {
              send_to_char("You can't bid on your own item!\r\n", ch);
              return;
            }

          /* make - perhaps - a bet now */
          if (argument[0] == '\0')
            {
              send_to_char ("Bid how much?\r\n",ch);
              return;
            }

          newbet = parsebet (auction->bet, argument);
          /*        ch_printf( ch, "Bid: %d\r\n",newbet);       */

          if (newbet < auction->starting)
            {
              send_to_char("You must place a bid that is higher than the starting bet.\r\n", ch);
              return;
            }

          /* to avoid slow auction, use a bigger amount than 100 if the bet
             is higher up - changed to 100 for our high economy
	  */

          if (newbet < (auction->bet + 100))
            {
	      send_to_char ("You must at least bid 10000 credits over the current bid.\r\n",ch);
              return;
            }

          if (newbet > ch->gold)
            {
              send_to_char ("You don't have that much money!\r\n",ch);
              return;
            }

          if (newbet > 2000000000)
            {
              send_to_char("You can't bid over 2 billion credits.\r\n", ch);
              return;
            }

          /* the actual bet is OK! */

          /* return the gold to the last buyer, if one exists */
          if (auction->buyer != NULL && auction->buyer != auction->seller)
            auction->buyer->gold += auction->bet;

          ch->gold -= newbet; /* substract the gold - important :) */
          if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
            save_char_obj(ch);
          auction->buyer = ch;
          auction->bet   = newbet;
          auction->going = 0;
          auction->pulse = PULSE_AUCTION; /* start the auction over again */

          sprintf (buf,"A bid of %d credits has been received on %s.\r\n",newbet,auction->item->short_descr);
          talk_auction (buf);
          return;


        }
      else
        {
          send_to_char ("There isn't anything being auctioned right now.\r\n",ch);
          return;
        }
    }

  /* finally... */
  if ( ms_find_obj(ch) )
    return;

  obj = get_obj_carry (ch, arg1); /* does char have the item ? */

  if (obj == NULL)
    {
      send_to_char ("You aren't carrying that.\r\n",ch);
      return;
    }

  if (obj->timer > 0)
    {
      send_to_char ("You can't auction objects that are decaying.\r\n", ch);
      return;
    }

  argument = one_argument (argument, arg2);

  if (arg2[0] == '\0')
    {
      auction->starting = 0;
      strcpy(arg2, "0");
    }

  if ( !is_number(arg2) )
    {
      send_to_char("You must input a number at which to start the auction.\r\n", ch);
      return;
    }

  if ( atoi(arg2) < 0 )
    {
      send_to_char("You can't auction something for less than 0 credits!\r\n", ch);
      return;
    }

  if (auction->item == NULL)
    {
      switch (obj->item_type)
	{
	default:
	  act (AT_TELL, "You cannot auction $Ts.",ch, NULL, item_type_name (obj), TO_CHAR);
	  return;

	  /* insert any more item types here... items with a timer MAY NOT BE
	     AUCTIONED!
	  */
	case ITEM_LIGHT:
	case ITEM_TREASURE:
	case ITEM_RARE_METAL:
	case ITEM_CRYSTAL:
	case ITEM_BOOK:
	case ITEM_FABRIC:
	case ITEM_ARMOR:
	case ITEM_CONTAINER:
	  separate_obj(obj);
	  obj_from_char (obj);

	  if ( IS_SET( sysdata.save_flags, SV_AUCTION ) )
	    save_char_obj(ch);

	  auction->item = obj;
	  auction->bet = 0;
	  auction->buyer = ch;
	  auction->seller = ch;
	  auction->pulse = PULSE_AUCTION;
	  auction->going = 0;
	  auction->starting = atoi(arg2);

	  if (auction->starting > 0)
	    auction->bet = auction->starting;

	  sprintf (buf, "A new item is being auctioned: %s at %d credits.", obj->short_descr, auction->starting);
	  talk_auction (buf);
	}
    }
  else
    {
      act (AT_TELL, "Try again later - $p is being auctioned right now!",ch,auction->item,NULL,TO_CHAR);
      WAIT_STATE( ch, 1.5 * PULSE_VIOLENCE );
      return;
    }
}
