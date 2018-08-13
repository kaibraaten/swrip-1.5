#include <algorithm>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_rebel_trooper( Character *ch )
{
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  std::vector<Character*> imperials;
  copy_if(std::begin(ch->InRoom->Characters()),
          std::end(ch->InRoom->Characters()),
          std::begin(imperials),
          [ch](auto victim)
          {
            return CanSeeCharacter(ch, victim)
              && GetTimer(victim, TIMER_RECENTFIGHT) == 0
              && (( IsNpc( victim ) && NiftyIsName( "imperial" , victim->Name )
                    && victim->Fighting && GetFightingOpponent( victim ) != ch )
                  || ( !IsNpc( victim ) && IsClanned( victim ) && IsAwake(victim)
                       && NiftyIsName( "empire" , victim->PCData->ClanInfo.Clan->Name )));
          });

  random_shuffle(std::begin(imperials),
                 std::end(imperials));
  
  for(Character *victim : imperials)
    {
      do_yell( ch, "Long live the Rebel Alliance!" );
      HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
      return true;
    }

  return false;
}

