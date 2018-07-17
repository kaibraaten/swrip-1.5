#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

bool spec_police_attack( Character *ch )
{
  Character *victim = NULL;
  Character *v_next = NULL;
  int vip = 0;
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

      for ( vip = 0 ; vip < MAX_BIT ; vip++ )
        if ( IsBitSet ( ch->VipFlags , 1 << vip ) &&  IsBitSet( victim->PCData->WantedFlags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", WantedFlags[vip] );
            do_say( ch , buf );
            RemoveBit( victim->PCData->WantedFlags , 1 << vip );
            HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
            return true;
          }

    }

  return false;
}
