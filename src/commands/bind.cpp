#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

static bool aff_paralysis( Character *ch, Character *victim );

void do_bind( Character *ch , char *argument )
{
  Character *victim = nullptr;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Bind whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "Suicide is a mortal sin.\r\n" );
      return;
    }

  if ( IsBitSet(victim->Flags, PLR_AFK))
    {
      Log->Info( "%s just bound %s with an afk flag on!." , ch->Name, victim->Name );
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
      ch->Echo( "You are a little busy!\r\n" );
      return;
    }

  ch->Alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( IsNpc(victim) || GetRandomPercent() > ch->PCData->Learned[gsn_bind] )
    {
      ch->Echo( "You fail.\r\n" );
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

