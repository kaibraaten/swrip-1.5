#include "mud.hpp"
#include "character.hpp"

void do_follow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Follow whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master )
    {
      Act( AT_PLAIN, "But you'd rather follow $N!", ch, NULL, ch->Master, TO_CHAR );
      return;
    }

  if ( victim == ch )
    {
      if ( !ch->Master )
        {
          SendToCharacter( "You already follow yourself.\r\n", ch );
          return;
        }
      StopFollowing( ch );
      return;
    }

  if ( IsFollowingInCircle( ch, victim ) )
    {
      SendToCharacter( "Following in loops is not allowed... sorry.\r\n", ch );
      return;
    }

  if ( ch->Master )
    StopFollowing( ch );

  StartFollowing( ch, victim );
}
