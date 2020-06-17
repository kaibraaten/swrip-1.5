#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"

void do_list( Character *ch, std::string argument )
{
    if ( ch->InRoom->Flags.test( Flag::Room::PetShop ) )
    {
        auto pRoomIndexNext = GetRoom( ch->InRoom->Vnum + 1 );

        if ( !pRoomIndexNext )
        {
            Log->Bug( "Do_list: bad pet shop at vnum %ld.", ch->InRoom->Vnum );
            ch->Echo("You can't do that here.\r\n");
            return;
        }

        bool found = false;

        for ( const Character *pet : pRoomIndexNext->Characters() )
        {
            if (pet->IsNpc() && pet->Flags.test(Flag::Mob::Pet))
            {
                if ( !found )
                {
                    found = true;
                    ch->Echo("Pets for sale:\r\n");
                }

                ch->Echo("[%2d] %8d - %s\r\n",
                         pet->TopLevel,
                         10 * pet->TopLevel * pet->TopLevel,
                         pet->ShortDescr.c_str() );
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
        std::string arg;
        Character *keeper = nullptr;
        int cost = 0;
        int oref = 0;
        bool found = false;

        OneArgument( argument, arg );

        if ( ( keeper = FindKeeper( ch ) ) == NULL )
            return;

        for(auto obj : keeper->Objects())
        {
            if ( obj->WearLoc == WEAR_NONE
                 &&   CanSeeObject( ch, obj ) )
            {
                oref++;

                if ( ( cost = GetObjectCost( ch, keeper, obj, true ) ) > 0
                     && ( arg.empty() || NiftyIsName( arg, obj->Name ) ) )
                {
                    if (keeper->Home != NULL)
                        cost = obj->Cost;

                    if ( !found )
                    {
                        found = true;
                        ch->Echo("[Price] {ref} Item\r\n");
                    }

                    ch->Echo("[%5d] {%3d} %s%s.\r\n",
                             cost, oref, Capitalize( obj->ShortDescr ).c_str(),
                             obj->Flags.test(Flag::Obj::HuttSize) ? " (hutt size)" :
                             ( obj->Flags.test(Flag::Obj::LargeSize) ? " (large)" :
                               ( obj->Flags.test(Flag::Obj::HumanSize) ? " (medium)" :
                                 ( obj->Flags.test(Flag::Obj::SmallSize) ? " (small)" :
                                   "" ) ) ) );
                }
            }
        }

        if ( !found )
        {
            if ( arg.empty() )
                ch->Echo("You can't buy anything here.\r\n");
            else
                ch->Echo("You can't buy that here.\r\n");
        }

        return;
    }
}
