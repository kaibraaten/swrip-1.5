#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"

void do_murder( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = nullptr;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Murder whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("Suicide is a mortal sin.\r\n");
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
      ch->Echo("You do the best you can!\r\n");
      return;
    }

  if ( !IsNpc( victim ) && IsBitSet( ch->Flags, PLR_NICE ) )
    {
      ch->Echo("You feel too nice to do that!\r\n");
      return;
    }

  if ( !IsDroid( victim ) )
    ch->Alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );
  HitMultipleTimes( ch, victim, TYPE_UNDEFINED );
}

