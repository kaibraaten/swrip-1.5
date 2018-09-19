#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "systemdata.hpp"
#include "repos/playerrepository.hpp"

void do_auction(Character *ch, std::string argument)
{
  Object *obj = nullptr;
  std::string arg1;
  std::string arg2;
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument (argument, arg1);

  if (IsNpc(ch)) /* NPC can be extracted at any time and thus can't auction! */
    return;

  if ( !IsBitSet( ch->InRoom->Flags, ROOM_HOTEL )
       && !IsBitSet( ch->InRoom->Flags , ROOM_HOTEL ) )
    {
      SetCharacterColor ( AT_LBLUE, ch );
      ch->Echo( "\r\nYou must go to an auction hall to do that!\r\n" );
      return;
    }

  if ( ( time_info.Hour > 18 || time_info.Hour < 9 ) && auction->Item == NULL )
    {
      SetCharacterColor ( AT_LBLUE, ch );
      ch->Echo( "\r\nThe auctioneer has retired for the evening.\r\n" );
      return;
    }

  if ( arg1.empty() )
    {
      if (auction->Item != NULL)
        {
          obj = auction->Item;
          SetCharacterColor( AT_BLUE, ch );
          
          /* show item data here */
          if (auction->Bet > 0)
            ch->Echo( "Current bid on this item is %d credits.\r\n",auction->Bet );
          else
            ch->Echo("No bids on this item have been received.\r\n");

          SetCharacterColor( AT_LBLUE, ch );
          ch->Echo( "Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
                    obj->Name.c_str(),
                    AOrAn( GetItemTypeName( obj ) ).c_str(),
                    FlagString( obj->Flags, ObjectFlags ).c_str(),
                    obj->Weight,
                    obj->Cost );

          SetCharacterColor( AT_BLUE, ch );
          ch->Echo( "Worn on: %s\r\n",
                    FlagString(obj->WearFlags -1, WearFlags ).c_str() );

          switch ( obj->ItemType )
            {
            case ITEM_ARMOR:
              ch->Echo( "Current armor class is %d (based on current condition).\r\n",
                        obj->Value[OVAL_ARMOR_CONDITION] );
              ch->Echo( "Maximum armor class is %d (based on top condition).\r\n",
                        obj->Value[OVAL_ARMOR_AC] );
              break;

	    default:
	      break;
            }

          for(const Affect *paf : obj->Prototype->Affects())
            {
              ShowAffectToCharacter( ch, paf );
            }

          for(const Affect *paf : obj->Affects())
            {
              ShowAffectToCharacter( ch, paf );
            }
          
          if ( obj->ItemType == ITEM_CONTAINER && !obj->Objects().empty() )
            {
              SetCharacterColor( AT_OBJECT, ch );
              ch->Echo( "Contents:\r\n" );
              ShowObjectListToCharacter( obj->Objects(), ch, true, false );
            }

          if (IsImmortal(ch))
            {
              ch->Echo( "Seller: %s.  Bidder: %s.  Round: %d.\r\n",
                        auction->Seller->Name.c_str(), auction->Buyer->Name.c_str(),
                        (auction->Going + 1));
              ch->Echo( "Time left in round: %d.\r\n", auction->Pulse );
            }

          return;
        }
      else
        {
          SetCharacterColor( AT_LBLUE, ch );
          ch->Echo( "\r\nThere is nothing being auctioned right now. What would you like to auction?\r\n", ch );
          return;
        }
    }

  if ( IsImmortal(ch) && !StrCmp(arg1,"stop"))
    {
      if (auction->Item == NULL)
        {
          ch->Echo("There is no auction to stop.\r\n");
          return;
        }
      else /* stop the auction */
        {
          SetCharacterColor( AT_LBLUE, ch );
          sprintf (buf,"Sale of %s has been stopped by an Immortal.",
                   auction->Item->ShortDescr.c_str());
          TalkAuction (buf);
          ObjectToCharacter (auction->Item, auction->Seller);

          if ( IsBitSet( SysData.SaveFlags, SV_AUCTION ) )
	    PlayerCharacters->Save(auction->Seller);

          auction->Item = NULL;

          if (auction->Buyer != NULL && auction->Buyer != auction->Seller) /* return money to the buyer */
            {
              auction->Buyer->Gold += auction->Bet;
              auction->Buyer->Echo("Your money has been returned.\r\n");
            }
          
          return;
        }
    }

  if (!StrCmp(arg1,"bid") )
    {
      if (auction->Item != NULL)
        {
          int newbet = 0;

          if ( ch == auction->Seller)
            {
              ch->Echo("You can't bid on your own item!\r\n");
              return;
            }

          if ( argument.empty() )
            {
              ch->Echo("Bid how much?\r\n");
              return;
            }

          newbet = ParseBet(auction->Bet, argument);

          if (newbet < auction->Starting)
            {
              ch->Echo("You must place a bid that is higher than the starting bid.\r\n");
              return;
            }

          /* to avoid slow auction, use a bigger amount than 100 if the bet
             is higher up - changed to 100 for our high economy
	  */
          if (newbet < (auction->Bet + 100))
            {
	      ch->Echo("You must at least bid 100 credits over the current bid.\r\n");
              return;
            }

          if (newbet > ch->Gold)
            {
              ch->Echo("You don't have that much money!\r\n");
              return;
            }

          if (newbet > 2000000000)
            {
              ch->Echo("You can't bid over 2 billion credits.\r\n");
              return;
            }

          /* the actual bet is OK! */

          /* return the gold to the last buyer, if one exists */
          if (auction->Buyer != NULL && auction->Buyer != auction->Seller)
            auction->Buyer->Gold += auction->Bet;

          ch->Gold -= newbet; /* substract the gold - important :) */

          if ( IsBitSet( SysData.SaveFlags, SV_AUCTION ) )
            PlayerCharacters->Save(ch);

          auction->Buyer = ch;
          auction->Bet   = newbet;
          auction->Going = 0;
          auction->Pulse = PULSE_AUCTION; /* start the auction over again */

          sprintf (buf,"A bid of %d credits has been received on %s.\r\n",newbet,auction->Item->ShortDescr.c_str());
          TalkAuction (buf);
          return;
        }
      else
        {
          ch->Echo("There isn't anything being auctioned right now.\r\n");
          return;
        }
    }

  /* finally... */
  if ( HasMentalStateToFindObject(ch) )
    return;

  obj = GetCarriedObject (ch, arg1); /* does char have the item ? */

  if (obj == NULL)
    {
      ch->Echo("You aren't carrying that.\r\n");
      return;
    }

  if (obj->Timer > 0)
    {
      ch->Echo("You can't auction objects that are decaying.\r\n");
      return;
    }

  argument = OneArgument (argument, arg2);

  if ( arg2.empty() )
    {
      auction->Starting = 0;
      arg2 = "0";
    }

  if ( !IsNumber(arg2) )
    {
      ch->Echo("You must input a number at which to start the auction.\r\n");
      return;
    }

  if ( std::stoi(arg2) < 0 )
    {
      ch->Echo("You can't auction something for less than 0 credits!\r\n");
      return;
    }

  if (auction->Item == NULL)
    {
      switch (obj->ItemType)
	{
	default:
	  Act(AT_TELL, "You cannot auction $Ts.",ch, NULL, GetItemTypeName (obj), TO_CHAR);
	  return;

	  /* insert any more item types.here... items with a timer MAY NOT BE
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
	  SeparateOneObjectFromGroup(obj);
	  ObjectFromCharacter (obj);

	  if ( IsBitSet( SysData.SaveFlags, SV_AUCTION ) )
	    PlayerCharacters->Save(ch);

	  auction->Item = obj;
	  auction->Bet = 0;
	  auction->Buyer = ch;
	  auction->Seller = ch;
	  auction->Pulse = PULSE_AUCTION;
	  auction->Going = 0;
	  auction->Starting = std::stoi(arg2);

	  if (auction->Starting > 0)
	    auction->Bet = auction->Starting;

	  sprintf (buf, "A new item is being auctioned: %s at %d credits.", obj->ShortDescr.c_str(), auction->Starting);
	  TalkAuction (buf);
	}
    }
  else
    {
      Act(AT_TELL, "Try again later - $p is being auctioned right now!",ch,auction->Item,NULL,TO_CHAR);
      SetWaitState( ch, 1.5 * PULSE_VIOLENCE );
      return;
    }
}
