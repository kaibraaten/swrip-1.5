#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_police_attack( Character *ch )
{
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  std::list<Character*> potentialCriminals = Filter(ch->InRoom->Characters(),
                                                    [ch](auto victim)
                                                    {
                                                      return !IsNpc(victim)
                                                        && CanSeeCharacter(ch, victim)
                                                        && NumberBits(1) != 0;
                                                    });

  for(Character *victim : potentialCriminals)  
    {
      for (size_t vip = 0 ; vip < MAX_BIT ; vip++ )
        {
          if ( IsBitSet ( ch->VipFlags , 1 << vip ) &&  IsBitSet( victim->PCData->WantedFlags , 1 << vip) )
            {
              char buf[MAX_STRING_LENGTH];
              sprintf( buf , "Hey you're wanted on %s!", WantedFlags[vip] );
              do_say( ch , buf );
              RemoveBit( victim->PCData->WantedFlags , 1 << vip );
              HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
              return true;
            }
        }
    }

  return false;
}

