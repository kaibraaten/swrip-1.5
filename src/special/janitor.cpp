#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

bool spec_janitor(std::shared_ptr<Character> mob)
{
    if (!IsAwake(mob))
    {
        return false;
    }

    auto itemsToPickUp = Filter(mob->InRoom->Objects(),
                                [](const auto obj)
                                {
                                    return obj->WearFlags.test(Flag::Wear::Take)
                                           && !obj->Flags.test(Flag::Obj::Burried)
                                           && (obj->ItemType == ITEM_DRINK_CON
                                               || obj->ItemType == ITEM_TRASH
                                               || obj->Cost < 10
                                               || (obj->Prototype->Vnum == OBJ_VNUM_SHOPPING_BAG
                                                   && obj->Objects().empty()));
                                });

    for (const auto &trash : itemsToPickUp)
    {
        Act(AT_ACTION, "$n picks up some trash.", mob, nullptr, nullptr, ActTarget::Room);
        ObjectFromRoom(trash);
        ObjectToCharacter(trash, mob);
        return true;
    }

    return false;
}
