#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_clan_guard( Character *ch )
{
  Character *victim;
  Character *v_next;
  Clan *clan;
  bool found = false;

  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  clan = GetClan(ch->Name);

  for ( victim = ch->InRoom->FirstPerson; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !CanSeeCharacter( ch, victim ) )
        continue;

      if ( GetTimer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;

      if ( !IsNpc( victim )
	   && IsClanned( victim )
	   && clan
	   && IsAwake(victim)
           && (clan != victim->PCData->ClanInfo.Clan )
           && ( !victim->PCData->ClanInfo.Clan->MainClan
		|| clan != victim->PCData->ClanInfo.Clan->MainClan )
           && ( !clan->MainClan
		|| clan->MainClan != victim->PCData->ClanInfo.Clan ) )
        {
          if(found)
            continue;

          do_yell( ch, "Hey you're not allowed in here!" );
          HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
          return true;
        }
    }

  return false;
}
