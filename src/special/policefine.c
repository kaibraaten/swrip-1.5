#include "character.hpp"
#include "mud.h"

bool spec_police_fine( Character *ch )
{
  Character *victim;
  Character *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;
      if ( IsNpc(victim) )
        continue;
      if ( !CanSeeCharacter( ch, victim ) )
        continue;
      if ( NumberBits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip <= 31 ; vip++ )
        if ( IsBitSet ( ch->VipFlags , 1 << vip ) &&  IsBitSet( victim->PCData->WantedFlags , 1 << vip) )
          {
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
