#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_beg( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim = nullptr;
  int percent = 0, xp = 0;
  int amount = 0;

  if ( IsNpc (ch) )
    return;

  if ( ch->Mount )
    {
      ch->Echo( "You can't do that while mounted.\r\n" );
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Beg for money from whom?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "That's pointless.\r\n" );
      return;
    }

  if ( ch->InRoom->Flags.test( Flag::Room::Safe ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo( "This isn't a good place to do that.\r\n" );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo( "Interesting combat technique.\r\n" );
      return;
    }

  if ( victim->Position == POS_FIGHTING )
    {
      ch->Echo( "They're a little busy right now.\r\n" );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      ch->Echo( "In your dreams or what?\r\n" );
      return;
    }

  if ( victim->Position <= POS_SLEEPING )
    {
      ch->Echo( "You might want to wake them first...\r\n" );
      return;
    }

  if ( !IsNpc( victim ) )
    {
      ch->Echo( "You beg them for money.\r\n" );
      Act( AT_ACTION, "$n begs you to give $s some change.", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n begs $N for change.",  ch, NULL, victim, TO_NOTVICT );
      return;
    }

  SetWaitState( ch, SkillTable[gsn_beg]->Beats );
  percent  = GetRandomPercent() + GetAbilityLevel( ch, SMUGGLING_ABILITY ) + victim->TopLevel;

  if ( percent > ch->PCData->Learned[gsn_beg]  )
    {
      /*
       * Failure.
       */
      ch->Echo( "You beg them for money but don't get any!\r\n" );
      Act( AT_ACTION, "$n is really getting on your nerves with all this begging!", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n begs $N for money.",  ch, NULL, victim, TO_NOTVICT );

      if ( victim->Alignment < 0 && victim->TopLevel >= ch->TopLevel + 5 )
        {
          sprintf( buf, "%s is an annoying beggar and needs to be taught a lesson!",
                   ch->Name.c_str() );
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      LearnFromFailure( ch, gsn_beg );

      return;
    }

  Act( AT_ACTION, "$n begs $N for money.",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_ACTION, "$n begs you for money!", ch, NULL, victim, TO_VICT    );

  amount = umin( victim->Gold , GetRandomNumberFromRange(1, 10) );

  if ( amount <= 0 )
    {
      do_look( victim, ch->Name );
      do_say( victim, "Sorry I have nothing to spare.\r\n" );
      LearnFromFailure( ch, gsn_beg );
      return;
    }

  ch->Gold     += amount;
  victim->Gold -= amount;
  ch->Echo( "%s gives you %d credits.\r\n", victim->ShortDescr.c_str(), amount );
  LearnFromSuccess( ch, gsn_beg );
  xp = umin( amount*10 , ( GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) + 1) - GetRequiredXpForLevel( GetAbilityLevel( ch, SMUGGLING_ABILITY ) )  )  );
  xp = umin( xp , ComputeXP( ch, victim ) );
  GainXP( ch, SMUGGLING_ABILITY, xp );
  ch->Echo( "&WYou gain %d smuggling experience points!\r\n", xp );
  Act( AT_ACTION, "$N gives $n some money.",  ch, NULL, victim, TO_NOTVICT );
  Act( AT_ACTION, "You give $n some money.", ch, NULL, victim, TO_VICT    );
}
