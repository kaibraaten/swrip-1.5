#include "character.h"
#include "mud.h"

bool spec_police( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !is_awake(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( is_npc(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < 32 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            ROOM_INDEX_DATA *jail = NULL;

            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );

            if ( ch->top_level >= victim->top_level )
              multi_hit( ch, victim, TYPE_UNDEFINED );
            else if( 1 << vip == VIP_ADARI )
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
                  jail = get_room_index( ROOM_JAIL_QUARREN_2 );
                  break;
                case 4:
                  jail = get_room_index( ROOM_JAIL_QUARREN_1 );
                  break;
                }
            else
              {
                act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
                if( victim->in_room && victim->in_room->area )
                  boost_economy( victim->in_room->area, (victim->gold)/2 );
                victim->gold /= 2;
              }

            if ( jail )
              {
                REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
                act( AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n escorts you to jail.",   ch, NULL, victim, TO_VICT    );
                char_from_room( victim );
                char_to_room( victim , jail );
              }
            return TRUE;
          }

    }

  return FALSE;
}
