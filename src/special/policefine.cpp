#include <algorithm>
#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_police_fine( Character *ch )
{
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  std::list<Character*> potentialCriminals;
  copy_if(std::begin(ch->InRoom->Characters()),
          std::end(ch->InRoom->Characters()),
          std::begin(potentialCriminals),
          [ch](auto victim)
          {
            return !IsNpc(victim)
              && CanSeeCharacter(ch, victim)
              && NumberBits(1) != 0;
          });

  for(Character *victim : potentialCriminals)
    {
      for (size_t vip = 0 ; vip < MAX_BIT ; vip++ )
        if ( IsBitSet ( ch->VipFlags , 1 << vip ) &&  IsBitSet( victim->PCData->WantedFlags , 1 << vip) )
          {
            char buf[MAX_STRING_LENGTH];
            sprintf( buf , "Hey you're wanted on %s!", WantedFlags[vip] );
            do_say( ch , buf );
            Act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
            Act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
            if( victim->InRoom && victim->InRoom->Area )
              BoostEconomy( victim->InRoom->Area, (victim->Gold)/2 );
            victim->Gold /= 2;
	    RemoveBit( victim->PCData->WantedFlags , 1 << vip );
            return true;
          }

    }

  return false;
}

