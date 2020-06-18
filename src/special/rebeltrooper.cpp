#include <utility/algorithms.hpp>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_rebel_trooper( std::shared_ptr<Character> ch )
{
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  std::vector<Character*> imperials(std::begin(ch->InRoom->Characters()),
                                    std::end(ch->InRoom->Characters()));
  
  imperials = Filter(imperials,
                     [ch](auto victim)
                     {
                       return CanSeeCharacter(ch, victim)
                         && GetTimer(victim, TIMER_RECENTFIGHT) == 0
                         && (( IsNpc( victim ) && NiftyIsName( "imperial" , victim->Name )
                               && victim->Fighting && GetFightingOpponent( victim ) != ch )
                             || ( !IsNpc( victim ) && IsClanned( victim ) && IsAwake(victim)
                                  && NiftyIsName( "empire" , victim->PCData->ClanInfo.Clan->Name )));
                     });

  for(Character *victim : RandomizeOrder(imperials))
    {
      do_yell( ch, "Long live the Rebel Alliance!" );
      HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
      return true;
    }

  return false;
}

