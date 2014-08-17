#include "mud.h"
#include "character.h"

bool spec_police_attack( Character *ch )
{
  Character *victim;
  Character *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IsNpc(victim) )
        continue;
      if ( !CanSeeCharacter( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < 32 ; vip++ )
        if ( IsBitSet ( ch->vip_flags , 1 << vip ) &&  IsBitSet( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            RemoveBit( victim->pcdata->wanted_flags , 1 << vip );
            multi_hit( ch, victim, TYPE_UNDEFINED );
            return true;
          }

    }

  return false;
}
