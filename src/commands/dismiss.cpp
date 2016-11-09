#include "character.hpp"
#include "mud.hpp"

void do_dismiss( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Dismiss whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
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
      SendToCharacter( "You cannot dismiss them.\r\n", ch );
    }
}
