#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_stormtrooper( Character *ch )
{
  Character *victim;
  Character *v_next;

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  for ( victim = ch->in_room->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !CanSeeCharacter( ch, victim ) )
        continue;

      if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( ( IsNpc( victim )
	     && ( NiftyIsName( "rebel", victim->name )
		  || NiftyIsName( "republic", victim->name ) )
             && victim->fighting
	     && GetFightingOpponent( victim ) != ch )
	   || ( !IsNpc( victim ) && IsClanned( victim )
		&& IsAwake(victim)
		&& ( NiftyIsName( "rebel" , victim->pcdata->ClanInfo.Clan->Name )
		     || NiftyIsName( "republic", victim->pcdata->ClanInfo.Clan->Name ) ) ) )
        {
          do_yell( ch, "Die Rebel Scum!" );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }

    }

  return false;
}
