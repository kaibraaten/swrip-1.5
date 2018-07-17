#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_seduce ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Seduce whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }


  if ( IsAffectedBy(victim, AFF_CHARM) && victim->Master )
    {
      Act( AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->Master, TO_CHAR );
      return;
    }

  if ( IsFollowingInCircle( victim, ch ) )
    {
      SendToCharacter( "Following in loops is not allowed... sorry.\r\n", ch );
      return;
    }


  SetWaitState( ch, SkillTable[gsn_seduce]->Beats );

  if ( victim->TopLevel - GetCurrentCharisma(ch) > ch->PCData->Learned[gsn_seduce] )
    {
      SendToCharacter("You failed.\r\n", ch);
      sprintf(buf, "%s failed to seduce you.", ch->Name);
      SendToCharacter(buf, victim);
      global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
      return;
    }


  if ( victim->Master )
    StopFollowing( victim );

  LearnFromSuccess( ch, gsn_seduce );
  StartFollowing( victim, ch );
}
