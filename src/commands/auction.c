#include <string.h>
#include "mud.h"
#include "character.h"

void do_auction (Character *ch, char *argument)
{
  Object *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument (argument, arg1);

  if (IsNpc(ch)) /* NPC can be extracted at any time and thus can't auction! */
    return;

  if ( !IsBitSet( ch->in_room->room_flags , ROOM_HOTEL ) && !IsBitSet( ch->in_room->room_flags , ROOM_HOTEL ) )
    {
      SetCharacterColor ( AT_LBLUE, ch );
      SendToCharacter ( "\r\nYou must go to an auction hall to do that!\r\n", ch );
      return;
    }

  if ( ( time_info.hour > 18 || time_info.hour < 9 ) && auction->item == NULL )
    {
      SetCharacterColor ( AT_LBLUE, ch );
      SendToCharacter ( "\r\nThe auctioneer has retired for the evening...\r\n", ch );
      return;
    }

  if (arg1[0] == '\0')
    {
      if (auction->item != NULL)
        {
          Affect *paf;
          obj = auction->item;

          /* show item data here */
          if (auction->bet > 0)
            sprintf (buf, "Current bid on this item is %d credits.\r\n",auction->bet);
          else
            sprintf (buf, "No bids on this item have been received.\r\n");
          SetCharacterColor ( AT_BLUE, ch );
          SendToCharacter (buf,ch);
          /*          spell_identify (0, LEVEL_AVATAR - 1, ch, auction->item); */

          sprintf( buf,
                   "Object '%s' is %s, special properties: %s %s.\r\nIts weight is %d, value is %d.\r\n",
                   obj->name,
                   AOrAn( item_type_name( obj ) ),
                   FlagString( obj->extra_flags, object_flags ),
                   FlagString( obj->magic_flags, mag_flags ),
                   obj->weight,
                   obj->cost );
          SetCharacterColor( AT_LBLUE, ch );
          SendToCharacter( buf, ch );

          sprintf( buf, "Worn on: %s\r\n",
                   FlagString(obj->wear_flags -1, wear_flags ) );
          SendToCharacter( buf, ch );

          SetCharacterColor( AT_BLUE, ch );

          switch ( obj->item_type )
            {

            case ITEM_ARMOR:
              ChPrintf( ch, "Current armor class is %d. ( based on current condition )\r\n", obj->value[0] );
              ChPrintf( ch, "Maximum armor class is %d. ( based on top condition )\r\n", obj->value[1] );
              break;
            }

          for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
	    showaffect( ch, paf );

          for ( paf = obj->first_affect; paf; paf = paf->next )
            showaffect( ch, paf );
          if ( ( obj->item_type == ITEM_CONTAINER ) && ( obj->first_content ) )
            {
              SetCharacterColor( AT_OBJECT, ch );
              SendToCharacter( "Contents:\r\n", ch );
              ShowObjectListToCharacter( obj->first_content, ch, true, false );
            }

          if (IsImmortal(ch))
            {
              sprintf(buf, "Seller: %s.  Bidder: %s.  Round: %d.\r\n",
                      auction->seller->name, auction->buyer->name,
                      (auction->going + 1));
              SendToCharacter(buf, ch);
              sprintf(buf, "Time left in round: %d.\r\n", auction->pulse);
              SendToCharacter(buf, ch);
            }
          return;
        }
      else
        {
          SetCharacterColor ( AT_LBLUE, ch );
          SendToCharacter ( "\r\nThere is nothing being auctioned right now.  What would you like to auction?\r\n", ch );
          return;
        }
    }

  if ( IsImmortal(ch) && !StrCmp(arg1,"stop"))
    {
      if (auction->item == NULL)
        {
          SendToCharacter ("There is no auction to stop.\r\n",ch);
          return;
        }
      else /* stop the auction */
        {
          SetCharacterColor ( AT_LBLUE, ch );
          sprintf (buf,"Sale of %s has been stopped by an Immortal.",
                   auction->item->short_descr);
          TalkAuction (buf);
          obj_to_char (auction->item, auction->seller);
          if ( IsBitSet( sysdata.save_flags, SV_AUCTION ) )
	    save_char_obj(auction->seller);
          auction->item = NULL;
          if (auction->buyer != NULL && auction->buyer != auction->seller) /* return money to the buyer */
            {
              auction->buyer->gold += auction->bet;
              SendToCharacter ("Your money has been returned.\r\n",auction->buyer);
            }
          return;
        }
    }

  if (!StrCmp(arg1,"bid") )
    {
      if (auction->item != NULL)
        {
          int newbet;

          if ( ch == auction->seller)
            {
              SendToCharacter("You can't bid on your own item!\r\n", ch);
              return;
            }

          /* make - perhaps - a bet now */
          if (argument[0] == '\0')
            {
              SendToCharacter ("Bid how much?\r\n",ch);
              return;
            }

          newbet = ParseBet (auction->bet, argument);
          /*        ChPrintf( ch, "Bid: %d\r\n",newbet);       */

          if (newbet < auction->starting)
            {
              SendToCharacter("You must place a bid that is higher than the starting bet.\r\n", ch);
              return;
            }

          /* to avoid slow auction, use a bigger amount than 100 if the bet
             is higher up - changed to 100 for our high economy
	  */

          if (newbet < (auction->bet + 100))
            {
	      SendToCharacter ("You must at least bid 10000 credits over the current bid.\r\n",ch);
              return;
            }

          if (newbet > ch->gold)
            {
              SendToCharacter ("You don't have that much money!\r\n",ch);
              return;
            }

          if (newbet > 2000000000)
            {
              SendToCharacter("You can't bid over 2 billion credits.\r\n", ch);
              return;
            }

          /* the actual bet is OK! */

          /* return the gold to the last buyer, if one exists */
          if (auction->buyer != NULL && auction->buyer != auction->seller)
            auction->buyer->gold += auction->bet;

          ch->gold -= newbet; /* substract the gold - important :) */
          if ( IsBitSet( sysdata.save_flags, SV_AUCTION ) )
            save_char_obj(ch);
          auction->buyer = ch;
          auction->bet   = newbet;
          auction->going = 0;
          auction->pulse = PULSE_AUCTION; /* start the auction over again */

          sprintf (buf,"A bid of %d credits has been received on %s.\r\n",newbet,auction->item->short_descr);
          TalkAuction (buf);
          return;


        }
      else
        {
          SendToCharacter ("There isn't anything being auctioned right now.\r\n",ch);
          return;
        }
    }

  /* finally... */
  if ( ms_find_obj(ch) )
    return;

  obj = GetCarriedObject (ch, arg1); /* does char have the item ? */

  if (obj == NULL)
    {
      SendToCharacter ("You aren't carrying that.\r\n",ch);
      return;
    }

  if (obj->timer > 0)
    {
      SendToCharacter ("You can't auction objects that are decaying.\r\n", ch);
      return;
    }

  argument = OneArgument (argument, arg2);

  if (arg2[0] == '\0')
    {
      auction->starting = 0;
      strcpy(arg2, "0");
    }

  if ( !IsNumber(arg2) )
    {
      SendToCharacter("You must input a number at which to start the auction.\r\n", ch);
      return;
    }

  if ( atoi(arg2) < 0 )
    {
      SendToCharacter("You can't auction something for less than 0 credits!\r\n", ch);
      return;
    }

  if (auction->item == NULL)
    {
      switch (obj->item_type)
	{
	default:
	  Act(AT_TELL, "You cannot auction $Ts.",ch, NULL, item_type_name (obj), TO_CHAR);
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

	  if ( IsBitSet( sysdata.save_flags, SV_AUCTION ) )
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
	  TalkAuction (buf);
	}
    }
  else
    {
      Act(AT_TELL, "Try again later - $p is being auctioned right now!",ch,auction->item,NULL,TO_CHAR);
      SetWaitState( ch, 1.5 * PULSE_VIOLENCE );
      return;
    }
}
