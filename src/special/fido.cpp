#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

bool spec_fido(Character *ch)
{
    if(!IsAwake(ch))
        return false;

    auto corpsesToEat = Filter(ch->InRoom->Objects(),
                               [](const auto corpse)
                               {
                                   return corpse->ItemType == ITEM_CORPSE_NPC;
                               });

    for(auto corpse : corpsesToEat)
    {
        Act(AT_ACTION, "$n savagely devours a corpse.", ch, NULL, NULL, ActTarget::Room);

        auto objectsInCorpse = corpse->Objects();

        for(auto obj : objectsInCorpse)
        {
            ObjectFromObject(obj);
            ObjectToRoom(obj, ch->InRoom);
        }

        ExtractObject(corpse);
        return true;
    }

    return false;
}
