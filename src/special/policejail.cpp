#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

bool spec_police_jail(Character *ch)
{
    if(!IsAwake(ch) || ch->Fighting)
        return false;

    auto potentialCriminals = Filter(ch->InRoom->Characters(),
                                     [ch](auto victim)
                                     {
                                         return !IsNpc(victim)
                                             && CanSeeCharacter(ch, victim)
                                             && NumberBits(1) != 0;
                                     });

    for(auto victim : potentialCriminals)
    {
        for(size_t vip = 0; vip < Flag::MAX; vip++)
        {
            if(ch->VipFlags.test(vip) && victim->PCData->WantedOn.test(vip))
            {
                std::shared_ptr<Room> jail;
                char buf[MAX_STRING_LENGTH];

                sprintf(buf, "Hey you're wanted on %s!", WantedFlags[vip]);
                do_say(ch, buf);

                if(vip == Flag::Wanted::Adari)
                    jail = GetRoom(ROOM_JAIL_ADARI);
                else if(vip == Flag::Wanted::MonCalamari)
                    switch(GetRandomNumberFromRange(1, 4))
                    {
                    case 1:
                        jail = GetRoom(ROOM_JAIL_MON_CALAMARI_1);
                        break;
                    case 2:
                        jail = GetRoom(ROOM_JAIL_MON_CALAMARI_2);
                        break;
                    case 3:
                        jail = GetRoom(ROOM_JAIL_QUARREN_1);
                        break;
                    case 4:
                        jail = GetRoom(ROOM_JAIL_QUARREN_2);
                        break;
                    }

                if(jail)
                {
                    victim->PCData->WantedOn.reset(vip);
                    Act(AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, ActTarget::NotVict);
                    Act(AT_ACTION, "$n escorts you to jail.", ch, NULL, victim, ActTarget::Vict);
                    CharacterFromRoom(victim);
                    CharacterToRoom(victim, jail);
                }

                return true;
            }
        }
    }

    return false;
}

