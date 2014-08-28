#include "character.h"
#include "mud.h"

bool spec_rebel_trooper( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !CanSeeCharacter( ch, victim ) )
        continue;

      if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( ( IsNpc( victim ) && NiftyIsName( "imperial" , victim->name )
             && victim->fighting && GetFightingOpponent( victim ) != ch ) ||
           ( !IsNpc( victim ) && IsClanned( victim ) && IsAwake(victim)
             && NiftyIsName( "empire" , victim->pcdata->ClanInfo.Clan->name ) ) )
        {
          do_yell( ch, "Long live the Rebel Alliance!" );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }
    }

  return false;
}
