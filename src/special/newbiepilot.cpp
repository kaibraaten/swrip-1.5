#include <utility/algorithms.hpp>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

bool spec_newbie_pilot( Character *ch )
{
  std::list<Character*> newbies = Filter(ch->InRoom->Characters(),
                                         [](auto victim)
                                         {
                                           return !IsNpc(victim)
                                             && victim->Position != POS_FIGHTING
                                             && HasDiploma(victim);
                                         });

  for(Character *victim : newbies)
    {
      victim->Echo( "After a brief journey you arrive at Coruscant's Manari Spaceport.\r\n\r\n" );

      CharacterFromRoom( victim );
      CharacterToRoom( victim, GetRoom( ROOM_START_PLAYER ) );

      do_look( victim , "" );

      char buf[MAX_STRING_LENGTH];
      sprintf( buf, "%s steps out and the shuttle quickly returns to the academy.\r\n", victim->Name );
      EchoToRoom( AT_ACTION , ch->InRoom, buf );
    }

  return false;
}

