#include "mud.h"
#include "character.h"

void do_kill( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Kill whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) )
    {
      SendToCharacter( "You must MURDER a player.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "You hit yourself.  Ouch!\r\n", ch );
      HitMultipleTimes( ch, ch, TYPE_UNDEFINED );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
    {
      Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      SendToCharacter( "You do the best you can!\r\n", ch );
      return;
    }

  if ( victim->vip_flags != 0 && !IsBitSet( victim->act, ACT_DROID )  )
    ch->alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );
  HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
}
