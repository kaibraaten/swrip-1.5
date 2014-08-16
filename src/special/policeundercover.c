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
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Got you!" );
            do_say( ch , buf );
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            multi_hit( ch, victim, TYPE_UNDEFINED );
            return true;
          }
    }

  return false;
}
