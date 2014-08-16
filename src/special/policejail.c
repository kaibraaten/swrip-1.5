#include "character.h"
#include "mud.h"

bool spec_police_jail( Character *ch )
{

  ROOM_INDEX_DATA *jail = NULL;
  Character *victim;
  Character *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !is_awake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IsNpc(victim) )
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

            if( 1 << vip == VIP_ADARI )
              jail = get_room_index( ROOM_JAIL_ADARI );
	    else if( 1 << vip == VIP_MON_CALAMARI )
              switch ( number_range(1,4) )
                {
                case 1:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_1 );
                  break;
                case 2:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_2 );
                  break;
                case 3:
                  jail = get_room_index( ROOM_JAIL_QUARREN_1 );
                  break;
                case 4:
                  jail = get_room_index( ROOM_JAIL_QUARREN_2 );
                  break;
                }

            if ( jail )
              {
                REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
                act( AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n escorts you to jail.",   ch, NULL, victim, TO_VICT    );
                char_from_room( victim );
                char_to_room( victim , jail );
              }

            return true;
          }
    }

  return false;
}
