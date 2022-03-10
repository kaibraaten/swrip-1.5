#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

bool spec_fido(std::shared_ptr<Character> mob)
{
    if(!IsAwake(mob))
        return false;

    auto corpsesToEat = Filter(mob->InRoom->Objects(),
                               [](const auto &corpse)
                               {
                                   return corpse->ItemType == ITEM_CORPSE_NPC;
                               });

    for(const auto &corpse : corpsesToEat)
    {
        Act(AT_ACTION, "$n savagely devours a corpse.", mob, nullptr, nullptr, ActTarget::Room);

        auto objectsInCorpse = corpse->Objects();

        for(const auto &obj : objectsInCorpse)
        {
            ObjectFromObject(obj);
            ObjectToRoom(obj, mob->InRoom);
        }

        ExtractObject(corpse);
        return true;
    }

    return false;
}
