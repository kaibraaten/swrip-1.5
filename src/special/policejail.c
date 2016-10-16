#include "character.h"
#include "mud.h"

bool spec_police_jail( Character *ch )
{

  Room *jail = NULL;
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
      for ( vip = 0 ; vip < MAX_BIT ; vip++ )
        if ( IsBitSet ( ch->VipFlags , 1 << vip ) &&  IsBitSet( victim->PCData->WantedFlags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", PlanetFlags[vip] );
            do_say( ch , buf );

            if( 1 << vip == VIP_ADARI )
              jail = GetRoom( ROOM_JAIL_ADARI );
	    else if( 1 << vip == VIP_MON_CALAMARI )
              switch ( GetRandomNumberFromRange(1,4) )
                {
                case 1:
                  jail = GetRoom( ROOM_JAIL_MON_CALAMARI_1 );
                  break;
                case 2:
                  jail = GetRoom( ROOM_JAIL_MON_CALAMARI_2 );
                  break;
                case 3:
                  jail = GetRoom( ROOM_JAIL_QUARREN_1 );
                  break;
                case 4:
                  jail = GetRoom( ROOM_JAIL_QUARREN_2 );
                  break;
                }

            if ( jail )
              {
                RemoveBit( victim->PCData->WantedFlags , 1 << vip );
                Act( AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, TO_NOTVICT );
                Act( AT_ACTION, "$n escorts you to jail.",   ch, NULL, victim, TO_VICT    );
                CharacterFromRoom( victim );
                CharacterToRoom( victim , jail );
              }

            return true;
          }
    }

  return false;
}
