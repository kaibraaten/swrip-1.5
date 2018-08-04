#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"

void do_murder( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Murder whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->Flags, PLR_AFK))
    {
      Log->Info("%s just attacked %s with an afk flag on!." , ch->Name, victim->Name );
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) )
    {
      if ( ch->Master == victim )
        {
          Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }
    }

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "You do the best you can!\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) && IsBitSet( ch->Flags, PLR_NICE ) )
    {
      SendToCharacter( "You feel too nice to do that!\r\n", ch );
      return;
    }

  if ( !IsDroid( victim ) )
    ch->Alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );
  HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
}
