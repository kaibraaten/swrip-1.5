#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

bool spec_janitor( Character *ch )
{
    if ( !IsAwake(ch) )
        return false;

    auto itemsToPickUp = Filter(ch->InRoom->Objects(),
                                [](const auto obj)
                                {
                                    return obj->WearFlags.test(Flag::Wear::Take)
                                    && !obj->Flags.test(Flag::Obj::Burried)
                                    && (obj->ItemType == ITEM_DRINK_CON
                                        || obj->ItemType == ITEM_TRASH
                                        || obj->Cost < 10
                                        || (obj->Prototype->Vnum == OBJ_VNUM_SHOPPING_BAG
                                            && obj->Objects().empty() ));
                                });

    for(auto trash : itemsToPickUp)
    {
        Act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
        ObjectFromRoom( trash );
        ObjectToCharacter( trash, ch );
        return true;
    }

    return false;
}
