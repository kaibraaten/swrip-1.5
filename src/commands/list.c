#include "character.h"
#include "shops.h"
#include "mud.h"

void do_list( Character *ch, char *argument )
{
  if ( IsBitSet(ch->InRoom->Flags, ROOM_PET_SHOP) )
    {
      Room *pRoomIndexNext;
      Character *pet;
      bool found;

      pRoomIndexNext = GetRoom( ch->InRoom->Vnum + 1 );
      if ( !pRoomIndexNext )
        {
          Bug( "Do_list: bad pet shop at vnum %d.", ch->InRoom->Vnum );
          SendToCharacter( "You can't do that here.\r\n", ch );
          return;
        }

      found = false;
      for ( pet = pRoomIndexNext->FirstPerson; pet; pet = pet->next_in_room )
        {
          if ( IsBitSet(pet->Flags, ACT_PET) && IsNpc(pet) )
            {
              if ( !found )
                {
                  found = true;
                  SendToCharacter( "Pets for sale:\r\n", ch );
                }
	      Echo( ch, "[%2d] %8d - %s\r\n",
                         pet->TopLevel,
                         10 * pet->TopLevel * pet->TopLevel,
                         pet->ShortDescr );
            }
        }
      if ( !found )
        SendToCharacter( "Sorry, we're out of pets right now.\r\n", ch );
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
      for ( obj = keeper->last_carrying; obj; obj = obj->prev_content )
        {
          if ( obj->wear_loc == WEAR_NONE
               &&   CanSeeObject( ch, obj ) )
            {
              oref++;
              if ( ( cost = GetObjectCost( ch, keeper, obj, true ) ) > 0
                   && ( IsNullOrEmpty( arg ) || NiftyIsName( arg, obj->Name ) ) )
                {
                  if (keeper->Home != NULL)
                    cost = obj->cost;
                  if ( !found )
                    {
                      found = true;
                      SendToCharacter( "[Price] {ref} Item\r\n", ch );
                    }
                  Echo( ch, "[%5d] {%3d} %s%s.\r\n",
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
            SendToCharacter( "You can't buy anything here.\r\n", ch );
          else
            SendToCharacter( "You can't buy that here.\r\n", ch );
        }
      
      return;
    }
}
