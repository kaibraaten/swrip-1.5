#include <cstring>
#include <utility/algorithms.hpp>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"

void do_buy( Character *ch, std::string argument )
{
  std::string arg;
  int maxgold = 0;

  argument = OneArgument( argument, arg );

  if ( arg.empty() )
    {
      ch->Echo( "Buy what?\r\n" );
      return;
    }

  if ( IsBitSet(ch->InRoom->Flags, ROOM_PET_SHOP) )
    {
      char buf[MAX_STRING_LENGTH];
      Character *pet = nullptr;
      Room *pRoomIndexNext = nullptr;
      Room *in_room = nullptr;

      if ( IsNpc(ch) )
        return;

      pRoomIndexNext = GetRoom( ch->InRoom->Vnum + 1 );

      if ( !pRoomIndexNext )
        {
          Log->Bug( "Do_buy: bad pet shop at vnum %d.", ch->InRoom->Vnum );
          ch->Echo( "Sorry, you can't buy that here.\r\n" );
          return;
        }

      in_room     = ch->InRoom;
      ch->InRoom = pRoomIndexNext;
      pet         = GetCharacterInRoom( ch, arg );
      ch->InRoom = in_room;

      if ( pet == NULL || !IsNpc( pet ) || !IsBitSet(pet->Flags, ACT_PET) )
        {
          ch->Echo( "Sorry, you can't buy that here.\r\n" );
          return;
        }

      if ( IsBitSet(ch->Flags, PLR_BOUGHT_PET) )
        {
          ch->Echo( "You already bought one pet this level.\r\n" );
          return;
        }

      if ( ch->Gold < 10 * pet->TopLevel * pet->TopLevel )
        {
          ch->Echo( "You can't afford it.\r\n" );
          return;
        }

      if ( ch->TopLevel < pet->TopLevel )
        {
          ch->Echo( "You're not ready for this pet.\r\n" );
          return;
        }

      maxgold = 10 * pet->TopLevel * pet->TopLevel;
      ch->Gold  -= maxgold;
      BoostEconomy( ch->InRoom->Area, maxgold );
      pet               = CreateMobile( pet->Prototype );
      /* SetBit(ch->act, PLR_BOUGHT_PET); */
      SetBit(pet->Flags, ACT_PET);
      SetBit(pet->AffectedBy, AFF_CHARM);

      argument = OneArgument( argument, arg );

      if ( !arg.empty() )
        {
          pet->Name += " " + arg;
        }

      sprintf( buf, "%sA neck tag says 'I belong to %s'.\r\n",
               pet->Description.c_str(), ch->Name.c_str() );
      pet->Description = buf;

      if( ch->PCData )
        ch->PCData->Pet = pet;

      CharacterToRoom( pet, ch->InRoom );
      StartFollowing( pet, ch );
      ch->Echo( "Enjoy your pet.\r\n" );
      Act( AT_ACTION, "$n bought $N as a pet.", ch, NULL, pet, TO_ROOM );
      return;
    }
  else
    {
      Character *keeper = nullptr;
      Object *obj = nullptr;
      int cost = 0;
      int noi = 1;              /* Number of items */
      short mnoi = 20;  /* Max number of items to be bought at once */

      if ( ( keeper = FindKeeper( ch ) ) == NULL )
        return;

      if ( keeper == NULL )
        return;

      maxgold = keeper->TopLevel * 10;

      if ( IsNumber( arg ) )
        {
          noi = ToLong( arg );
          argument = OneArgument( argument, arg );

          if ( noi > mnoi )
            {
              Act( AT_TELL, "$n tells you 'I don't sell that many items at"
                   " once.'", keeper, NULL, ch, TO_VICT );
	      ch->Reply = keeper;
              return;
            }
        }

      obj  = GetCarriedObject( keeper, arg );

      if ( !obj && arg[0] == '#' )
        {
          int onum = 0;
          bool ofound = false;
          int oref = strtol( arg.substr(1).c_str(), nullptr, 10 );

          for(Object *iter : Reverse(keeper->Objects()))
            {
              if ( iter->WearLoc == WEAR_NONE
                   && CanSeeObject( ch, iter ) )
                onum++;

              if ( onum == oref )
                {
                  obj = iter;
                  ofound = true;
                  break;
                }
              else if ( onum > oref )
                {
                  break;
                }
            }

          if (!ofound)
            obj = NULL;
        }

      if ( !obj )
        {
          ch->Echo( "Buy what?\r\n" );
          return;
        }

      cost = GetObjectCost( ch, keeper, obj, true ) * noi;

      if (keeper->Home != NULL && obj->Cost > 0)
        cost= obj->Cost;

      if ( cost <= 0 || !CanSeeObject( ch, obj ) )
	{
          Act( AT_TELL, "$n tells you 'I don't sell that -- try 'list'.'",
               keeper, NULL, ch, TO_VICT );
          ch->Reply = keeper;
          return;
        }

      if ( !IsBitSet( obj->Flags, ITEM_INVENTORY ) && ( noi > 1 ) )
        {
          Interpret( keeper, "laugh" );
          Act( AT_TELL, "$n tells you 'I don't have enough of those in stock"
               " to sell more than one at a time.'", keeper, NULL, ch, TO_VICT );
          ch->Reply = keeper;
          return;
        }

      if ( ch->Gold < cost )
        {
          Act( AT_TELL, "$n tells you 'You can't afford to buy $p.'",
               keeper, obj, ch, TO_VICT );
          ch->Reply = keeper;
          return;
        }

      if ( IsBitSet(obj->Flags, ITEM_PROTOTYPE)
           && GetTrustLevel( ch ) < LEVEL_IMMORTAL )
        {
          Act( AT_TELL, "$n tells you 'This is a only a prototype!  I can't sell you that...'",
               keeper, NULL, ch, TO_VICT );
          ch->Reply = keeper;
          return;
        }

      if ( ch->CarryNumber + GetObjectCount( obj ) > GetCarryCapacityNumber( ch ) )
        {
          ch->Echo( "You can't carry that many items.\r\n" );
          return;
        }

      if ( ch->CarryWeight + ( GetObjectWeight( obj ) * noi )
           + (noi > 1 ? 2 : 0) > GetCarryCapacityWeight( ch ) )
        {
          ch->Echo( "You can't carry that much weight.\r\n" );
          return;
        }

      if ( noi == 1 )
        {
          if ( !IsBitSet( obj->Flags, ITEM_INVENTORY ) || ( keeper->Home != NULL ) )
            SeparateOneObjectFromGroup( obj );

          Act( AT_ACTION, "$n buys $p.", ch, obj, NULL, TO_ROOM );
          Act( AT_ACTION, "You buy $p.", ch, obj, NULL, TO_CHAR );
        }
      else
        {
          char buf[MAX_STRING_LENGTH];
          sprintf( buf, "$n buys %d $p%s.", noi,
                   ( obj->ShortDescr[obj->ShortDescr.size() - 1] == 's'
                     ? "" : "s" ) );
          Act( AT_ACTION, buf, ch, obj, NULL, TO_ROOM );
          sprintf( buf, "You buy %d $p%s.", noi,
                   ( obj->ShortDescr[obj->ShortDescr.size() - 1] == 's'
                     ? "" : "s" ) );
          Act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
          Act( AT_ACTION, "$N puts them into a bag and hands it to you.",
               ch, NULL, keeper, TO_CHAR );
        }

      ch->Gold     -= cost;
      keeper->Gold += cost;

      if ( keeper->Gold > maxgold && keeper->Owner.empty() )
        {
          BoostEconomy( keeper->InRoom->Area, keeper->Gold - maxgold/2 );
          keeper->Gold = maxgold / 2;
          Act( AT_ACTION, "$n puts some credits into a large safe.", keeper, NULL, NULL, TO_ROOM );
        }

      if ( IsBitSet( obj->Flags, ITEM_INVENTORY ) && ( keeper->Home == NULL ) )
        {
          Object *buy_obj = CreateObject( obj->Prototype, obj->Level );

          /*
           * Due to grouped objects and carry limitations in SMAUG
           * The shopkeeper gives you a bag with multiple-buy,
           * and also, only one object needs be created with a count
           * set to the number bought.          -Thoric
           */
          if ( noi > 1 )
	    {
              Object *bag = CreateObject( GetProtoObject( OBJ_VNUM_SHOPPING_BAG ), 1 );
              /* perfect size bag ;) */
              bag->Value[0] = bag->Weight + (buy_obj->Weight * noi);
              buy_obj->Count = noi;
              obj->Prototype->Count += (noi - 1);
              numobjsloaded += (noi - 1);
              ObjectToObject( buy_obj, bag );
              ObjectToCharacter( bag, ch );

              /* vendor snippit. Forces vendor to save after anyone buys anything*/
              if (  keeper->Home != NULL )
                {
                  SaveVendor (keeper);
                  bag->Cost = 0;
                }
            }
          else
            {
              ObjectToCharacter( buy_obj, ch );
            }
          
          /* vendor snippet. Forces vendor to save after anyone buys anything*/
          if (  keeper->Home != NULL )
            {
              SaveVendor (keeper);
              buy_obj->Cost = 0;
            }
        }
      else
        {
          ObjectFromCharacter( obj );
          ObjectToCharacter( obj, ch );

          /* vendor snippet. Forces vendor to save after anyone buys anything*/
          if (  keeper->Home != NULL )
            {
              SaveVendor (keeper);
              obj->Cost = 0;
            }
        }

      return;
    }
}
