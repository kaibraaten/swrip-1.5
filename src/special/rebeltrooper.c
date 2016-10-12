#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_rebel_trooper( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !CanSeeCharacter( ch, victim ) )
        continue;

      if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( ( IsNpc( victim ) && NiftyIsName( "imperial" , victim->Name )
             && victim->Fighting && GetFightingOpponent( victim ) != ch ) ||
           ( !IsNpc( victim ) && IsClanned( victim ) && IsAwake(victim)
             && NiftyIsName( "empire" , victim->PCData->ClanInfo.Clan->Name ) ) )
        {
          do_yell( ch, "Long live the Rebel Alliance!" );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }
    }

  return false;
}
