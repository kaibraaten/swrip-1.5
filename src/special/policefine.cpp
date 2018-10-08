#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_police_fine( Character *ch )
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
      for (size_t vip = 0; vip < Flag::MAX; vip++ )
        {
          if( ch->VipFlags.test( vip ) && victim->PCData->WantedOn.test( vip ) )
            {
              char buf[MAX_STRING_LENGTH];
              sprintf( buf , "Hey you're wanted on %s!", WantedFlags[vip] );
              do_say( ch , buf );
              Act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
              Act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
              if( victim->InRoom && victim->InRoom->Area )
                BoostEconomy( victim->InRoom->Area, (victim->Gold)/2 );

              victim->Gold /= 2;
              victim->PCData->WantedOn.reset( vip );
              return true;
            }
        }
    }

  return false;
}

