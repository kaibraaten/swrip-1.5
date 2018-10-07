#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_scatter( Character *ch, std::string arg )
{
  Character *victim = nullptr;
  Room *pRoomIndex = nullptr;

  SetCharacterColor( AT_IMMORT, ch );

  if ( arg.empty() )
    {
      ch->Echo("Scatter whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("It's called teleport. Try it.\r\n");
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo("You haven't the power to succeed against them.\r\n");
      return;
    }

  for ( ; ; )
    {
      pRoomIndex = GetRoom( GetRandomNumberFromRange( MIN_VNUM, MAX_VNUM ) );

      if ( pRoomIndex
	   && !pRoomIndex->Flags.test( Flag::Room::Private )
	   && !pRoomIndex->Flags.test( Flag::Room::Prototype )
	   && !pRoomIndex->Flags.test( Flag::Room::Spacecraft ) )
	{
	  break;
	}
    }

  if ( victim->Fighting )
    StopFighting( victim, true );

  Act( AT_MAGIC, "With the sweep of an arm, $n flings $N to the winds.",
       ch, NULL, victim, TO_NOTVICT );
  Act( AT_MAGIC, "With the sweep of an arm, $n flings you to the astral winds.",
       ch, NULL, victim, TO_VICT );
  Act( AT_MAGIC, "With the sweep of an arm, you fling $N to the astral winds.",
       ch, NULL, victim, TO_CHAR );
  CharacterFromRoom( victim );
  CharacterToRoom( victim, pRoomIndex );
  victim->Position = POS_RESTING;
  Act( AT_MAGIC, "$n staggers forth from a sudden gust of wind, and collapses.",
       victim, NULL, NULL, TO_ROOM );
  do_look( victim, "auto" );
}
