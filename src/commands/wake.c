#include "mud.h"
#include "character.h"

void do_wake( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      do_stand( ch, argument );
      return;
    }

  if ( !IsAwake(ch) )
    {
      SendToCharacter( "You are asleep yourself!\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsAwake(victim) )
    {
      Act( AT_PLAIN, "$N is already awake.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsAffectedBy(victim, AFF_SLEEP) || victim->Position < POS_SLEEPING )
    {
      Act( AT_PLAIN, "You can't seem to wake $M!",
	   ch, NULL, victim, TO_CHAR );
      return;
    }

  Act( AT_ACTION, "You wake $M.", ch, NULL, victim, TO_CHAR );
  victim->Position = POS_STANDING;
  Act( AT_ACTION, "$n wakes you.", ch, NULL, victim, TO_VICT );
}
