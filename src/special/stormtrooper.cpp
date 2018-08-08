#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

bool spec_stormtrooper( Character *ch )
{
  Character *victim = NULL;
  Character *v_next = NULL;

  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->NextInRoom;

      if ( !CanSeeCharacter( ch, victim ) )
        continue;

      if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( ( IsNpc( victim )
	     && ( NiftyIsName( "rebel", victim->Name )
		  || NiftyIsName( "republic", victim->Name ) )
             && victim->Fighting
	     && GetFightingOpponent( victim ) != ch )
	   || ( !IsNpc( victim ) && IsClanned( victim )
		&& IsAwake(victim)
		&& ( NiftyIsName( "rebel" , victim->PCData->ClanInfo.Clan->Name )
		     || NiftyIsName( "republic", victim->PCData->ClanInfo.Clan->Name ) ) ) )
        {
          do_yell( ch, "Die Rebel Scum!" );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }

    }

  return false;
}

