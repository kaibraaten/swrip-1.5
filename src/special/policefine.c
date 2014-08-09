#include "character.h"
#include "mud.h"

bool spec_police_fine( Character *ch )
{
  Character *victim;
  Character *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !is_awake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( is_npc(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip <= 31 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
            act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
            if( victim->in_room && victim->in_room->area )
              boost_economy( victim->in_room->area, (victim->gold)/2 );
            victim->gold /= 2;
	    REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            return true;
          }

    }

  return false;
}
