#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

static bool aff_paralysis( Character *ch, Character *victim );

void do_bind ( Character *ch , std::string argument )
{
  Character *victim;
  char logbuf[MAX_STRING_LENGTH];

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Bind whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
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
      sprintf( logbuf , "%s just bound %s with an afk flag on!." , ch->Name, victim->Name );
      LogPrintf( logbuf );
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
      SendToCharacter( "You are a little busy!\r\n", ch );
      return;
    }

  ch->Alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( IsNpc(victim) || GetRandomPercent() > ch->PCData->Learned[gsn_bind] )
    {
      SendToCharacter( "You fail.\r\n", ch );
      return;
    }

  if( victim->Position != POS_STUNNED )
    return;

  Act( AT_YELLOW, "$n binds you up!",  ch, NULL, victim, TO_VICT    );
  Act( AT_YELLOW, "You bind $N up.", ch, NULL, victim, TO_CHAR    );
  Act( AT_BLUE, "$n quickly binds $N, leaving $M helpless!", ch, NULL, victim, TO_NOTVICT );
  aff_paralysis( ch, victim );
  LearnFromSuccess( ch, gsn_bind );
}

static bool aff_paralysis( Character *ch, Character *victim )
{
  Affect af;

  if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
    {
      af.Type      = gsn_stun;
      af.Location  = APPLY_AC;
      af.Modifier  = 20;
      af.Duration  = 30;
      af.AffectedBy = AFF_PARALYSIS;
      AffectToCharacter( victim, &af );
      UpdatePosition( victim );

      if ( IsNpc(victim) )
        {
          StartHating( victim, ch );
          StartHunting( victim, ch );
          victim->WasStunned = 10;
        }
    }

  return true;
}
