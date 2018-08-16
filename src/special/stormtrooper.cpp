#include <algorithm>
#include <vector>
#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "room.hpp"

bool spec_stormtrooper( Character *ch )
{
  if ( !IsAwake(ch) || ch->Fighting )
    return false;

  std::vector<Character*> rebels;
  copy_if(std::begin(ch->InRoom->Characters()),
          std::end(ch->InRoom->Characters()),
          std::begin(rebels),
          [ch](auto victim)
          {
            return CanSeeCharacter(ch, victim)
              && GetTimer(victim, TIMER_RECENTFIGHT) == 0
              && ( ( IsNpc( victim )
                     && ( NiftyIsName( "rebel", victim->Name )
                          || NiftyIsName( "republic", victim->Name ) )
                     && victim->Fighting
                     && GetFightingOpponent( victim ) != ch )
                   || ( !IsNpc( victim ) && IsClanned( victim )
                        && IsAwake(victim)
                        && ( NiftyIsName( "rebel" , victim->PCData->ClanInfo.Clan->Name )
                             || NiftyIsName( "republic", victim->PCData->ClanInfo.Clan->Name ))));
          });

  random_shuffle(std::begin(rebels),
                 std::end(rebels));
  
  for(Character *victim : rebels)
    {
      do_yell( ch, "Die Rebel Scum!" );
      HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
      return true;
    }

  return false;
}
