#include "mud.h"
#include "character.h"

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

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->master )
    {
      Act( AT_PLAIN, "But you'd rather follow $N!", ch, NULL, ch->master, TO_CHAR );
      return;
    }

  if ( victim == ch )
    {
      if ( !ch->master )
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

  if ( ch->master )
    StopFollowing( ch );

  StartFollowing( ch, victim );
}
