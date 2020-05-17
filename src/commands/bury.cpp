#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

void do_bury( Character *ch, std::string arg )
{
    if ( arg.empty() )
    {
        ch->Echo( "What do you wish to bury?\r\n" );
        return;
    }

    if ( HasMentalStateToFindObject(ch) )
    {
        return;
    }

    bool shovel = GetFirstObjectOfType(ch, ITEM_SHOVEL );
    Object *obj = GetObjectInListReverse( ch, arg, ch->InRoom->Objects()) ;

    if ( obj == nullptr )
    {
        ch->Echo( "You can't find it.\r\n" );
        return;
    }

    SeparateOneObjectFromGroup(obj);

    if ( !obj->WearFlags.test(Flag::Wear::Take))
    {
        Act( AT_PLAIN, "You cannot bury $p.", ch, obj, 0, TO_CHAR );
        return;
    }

    switch( ch->InRoom->Sector )
    {
    case SECT_CITY:
    case SECT_INSIDE:
        ch->Echo( "The floor is too hard to dig through.\r\n" );
        return;

    case SECT_WATER_SWIM:
    case SECT_WATER_NOSWIM:
    case SECT_UNDERWATER:
        ch->Echo( "You cannot bury something here.\r\n" );
        return;

    case SECT_AIR:
        ch->Echo( "What? In the air?!\r\n" );
        return;

    default:
        break;
    }

    if ( obj->Weight > (umax(5, (GetCarryCapacityWeight(ch) / 10))) && !shovel )
    {
        ch->Echo( "You'd need a shovel to bury something that big.\r\n" );
        return;
    }

    int move = (obj->Weight * 50 * (shovel ? 1 : 5)) / umax(1, GetCarryCapacityWeight(ch));
    move = urange( 2, move, 1000 );

    if ( move > ch->Fatigue.Current )
    {
        ch->Echo( "You don't have the energy to bury something of that size.\r\n" );
        return;
    }

    ch->Fatigue.Current -= move;

    Act( AT_ACTION, "You solemnly bury $p...", ch, obj, NULL, TO_CHAR );
    Act( AT_ACTION, "$n solemnly buries $p...", ch, obj, NULL, TO_ROOM );
    obj->Flags.set(Flag::Obj::Burried);
    SetWaitState( ch, urange( 10, move / 2, 100 ) );
}
