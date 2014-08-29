#include "character.h"
#include "mud.h"
#include "clan.h"

bool spec_clan_guard( Character *ch )
{
  Character *victim;
  Character *v_next;
  Clan *clan;
  bool found = false;

  if ( !IsAwake(ch) || ch->fighting )
    return false;

  clan = GetClan(ch->name);

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
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
           && (clan != victim->pcdata->ClanInfo.Clan )
           && ( !victim->pcdata->ClanInfo.Clan->mainclan
		|| clan != victim->pcdata->ClanInfo.Clan->mainclan )
           && ( !clan->mainclan
		|| clan->mainclan != victim->pcdata->ClanInfo.Clan ) )
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
