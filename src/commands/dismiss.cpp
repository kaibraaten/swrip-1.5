#include "character.hpp"
#include "mud.hpp"

void do_dismiss( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Dismiss whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( IsAffectedBy( victim, AFF_CHARM )
       && IsNpc( victim )
       && victim->Master == ch )
    {
      StopFollowing( victim );
      StopHating( victim );
      StopHunting( victim );
      StopFearing( victim );
      Act( AT_ACTION, "$n dismisses $N.", ch, NULL, victim, TO_NOTVICT );
      Act( AT_ACTION, "You dismiss $N.", ch, NULL, victim, TO_CHAR );
    }
  else
    {
      ch->Echo( "You cannot dismiss them.\r\n" );
    }
}

