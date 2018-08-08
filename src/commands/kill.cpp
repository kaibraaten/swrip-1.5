#include "mud.hpp"
#include "character.hpp"

void do_kill( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Kill whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( !IsNpc(victim) )
    {
      ch->Echo("You must MURDER a player.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("You hit yourself.  Ouch!\r\n");
      HitMultipleTimes( ch, ch, TYPE_UNDEFINED );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
    {
      Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo("You do the best you can!\r\n");
      return;
    }

  if ( victim->VipFlags != 0 && !IsDroid( victim ) )
    ch->Alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );
  HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
}


