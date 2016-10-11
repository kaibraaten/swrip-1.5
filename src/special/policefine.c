#include "character.h"
#include "mud.h"

bool spec_police_fine( Character *ch )
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
      for ( vip = 0 ; vip <= 31 ; vip++ )
        if ( IsBitSet ( ch->vip_flags , 1 << vip ) &&  IsBitSet( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", PlanetFlags[vip] );
            do_say( ch , buf );
            Act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
            Act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
            if( victim->in_room && victim->in_room->Area )
              BoostEconomy( victim->in_room->Area, (victim->gold)/2 );
            victim->gold /= 2;
	    RemoveBit( victim->pcdata->wanted_flags , 1 << vip );
            return true;
          }

    }

  return false;
}
