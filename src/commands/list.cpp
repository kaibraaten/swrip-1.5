#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"

void do_list( Character *ch, char *argument )
{
  if ( IsBitSet(ch->InRoom->Flags, ROOM_PET_SHOP) )
    {
      const Room *pRoomIndexNext = GetRoom( ch->InRoom->Vnum + 1 );

      if ( !pRoomIndexNext )
        {
          Log->Bug( "Do_list: bad pet shop at vnum %d.", ch->InRoom->Vnum );
          ch->Echo("You can't do that here.\r\n");
          return;
        }

      bool found = false;

      for ( const Character *pet : pRoomIndexNext->Characters() )
        {
          if ( IsBitSet(pet->Flags, ACT_PET) && IsNpc(pet) )
            {
              if ( !found )
                {
                  found = true;
                  ch->Echo("Pets for sale:\r\n");
                }
       ch->Echo("[%2d] %8d - %s\r\n",
                         pet->TopLevel,
                         10 * pet->TopLevel * pet->TopLevel,
                         pet->ShortDescr );
            }
        }

      if ( !found )
        {
          ch->Echo("Sorry, we're out of pets right now.\r\n");
        }

      return;
    }
  else
    {
      char arg[MAX_INPUT_LENGTH];
      Character *keeper;
      Object *obj;
      int cost;
      int oref = 0;
      bool found;

      OneArgument( argument, arg );

      if ( ( keeper = FindKeeper( ch ) ) == NULL )
        return;

      found = false;
      for ( obj = keeper->LastCarrying; obj; obj = obj->PreviousContent )
        {
          if ( obj->WearLoc == WEAR_NONE
               &&   CanSeeObject( ch, obj ) )
            {
              oref++;
              if ( ( cost = GetObjectCost( ch, keeper, obj, true ) ) > 0
                   && ( IsNullOrEmpty( arg ) || NiftyIsName( arg, obj->Name ) ) )
                {
                  if (keeper->Home != NULL)
                    cost = obj->Cost;
                  if ( !found )
                    {
                      found = true;
                      ch->Echo("[Price] {ref} Item\r\n");
                    }
                  ch->Echo("[%5d] {%3d} %s%s.\r\n",
                             cost, oref, Capitalize( obj->ShortDescr ),
                             IsBitSet(obj->Flags, ITEM_HUTT_SIZE) ? " (hutt size)" :
                             ( IsBitSet(obj->Flags, ITEM_LARGE_SIZE) ? " (large)" :
			       ( IsBitSet(obj->Flags, ITEM_HUMAN_SIZE) ? " (medium)" :
                                 ( IsBitSet(obj->Flags, ITEM_SMALL_SIZE) ? " (small)" :
                                   "" ) ) ) );
                }
            }
        }

      if ( !found )
        {
          if ( IsNullOrEmpty( arg ) )
            ch->Echo("You can't buy anything here.\r\n");
          else
            ch->Echo("You can't buy that here.\r\n");
        }
      
      return;
    }
}


