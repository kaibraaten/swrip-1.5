#include "character.h"
#include "mud.h"

bool spec_police_undercover( Character *ch )
{
  Character *victim;
  Character *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IsNpc(victim) )
        continue;
      if ( !CanSeeCharacter( ch, victim ) )
        continue;
      if ( NumberBits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < MAX_BIT ; vip++ )
        if ( IsBitSet ( ch->vip_flags , 1 << vip ) &&  IsBitSet( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Got you!" );
            do_say( ch , buf );
            RemoveBit( victim->pcdata->wanted_flags , 1 << vip );
            HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
            return true;
          }
    }

  return false;
}
