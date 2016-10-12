#include "character.h"
#include "mud.h"
#include "skill.h"

void do_beg( Character *ch, char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  int percent, xp;
  int amount;

  if ( IsNpc (ch) ) return;

  argument = OneArgument( argument, arg1 );

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Beg for money from whom?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( victim->Position == POS_FIGHTING )
    {
      SendToCharacter( "They're a little busy right now.\r\n" , ch );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      SendToCharacter( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->Position <= POS_SLEEPING )
    {
      SendToCharacter( "You might want to wake them first...\r\n" , ch );
      return;
    }

  if ( !IsNpc( victim ) )
    {
      SendToCharacter( "You beg them for money.\r\n", ch );
      Act( AT_ACTION, "$n begs you to give $s some change.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n begs $N for change.\r\n",  ch, NULL, victim, TO_NOTVICT );
      return;
    }

  SetWaitState( ch, SkillTable[gsn_beg]->Beats );
  percent  = GetRandomPercent() + GetAbilityLevel( ch, SMUGGLING_ABILITY ) + victim->TopLevel;

  if ( percent > ch->PCData->learned[gsn_beg]  )
    {
      /*
       * Failure.
       */
      SendToCharacter( "You beg them for money but don't get any!\r\n", ch );
      Act( AT_ACTION, "$n is really getting on your nerves with all this begging!\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n begs $N for money.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if ( victim->Alignment < 0 && victim->TopLevel >= ch->TopLevel+5 )
        {
          sprintf( buf, "%s is an annoying beggar and needs to be taught a lesson!", ch->Name );
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      LearnFromFailure( ch, gsn_beg );

      return;
    }


  Act( AT_ACTION, "$n begs $N for money.\r\n",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_ACTION, "$n begs you for money!\r\n", ch, NULL, victim, TO_VICT    );

  amount = umin( victim->Gold , GetRandomNumberFromRange(1, 10) );
  if ( amount <= 0 )
    {
      do_look( victim , ch->Name );
      do_say( victim , "Sorry I have nothing to spare.\r\n" );
      LearnFromFailure( ch, gsn_beg );
      return;
    }

  ch->Gold     += amount;
  victim->Gold -= amount;
  Echo( ch, "%s gives you %d credits.\r\n", victim->ShortDescr , amount );
  LearnFromSuccess( ch, gsn_beg );
  xp = umin( amount*10 , ( GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) )  )  );
  xp = umin( xp , ComputeXP( ch, victim ) );
  GainXP( ch, SMUGGLING_ABILITY, xp );
  Echo( ch, "&WYou gain %ld smuggling experience points!\r\n", xp );
  Act( AT_ACTION, "$N gives $n some money.\r\n",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_ACTION, "You give $n some money.\r\n", ch, NULL, victim, TO_VICT    );
}
