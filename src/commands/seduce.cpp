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
      ch->Echo("Seduce whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }


  if ( IsAffectedBy(victim, AFF_CHARM) && victim->Master )
    {
      Act( AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->Master, TO_CHAR );
      return;
    }

  if ( IsFollowingInCircle( victim, ch ) )
    {
      ch->Echo("Following in loops is not allowed... sorry.\r\n");
      return;
    }


  SetWaitState( ch, SkillTable[gsn_seduce]->Beats );

  if ( victim->TopLevel - GetCurrentCharisma(ch) > ch->PCData->Learned[gsn_seduce] )
    {
      ch->Echo("You failed.\r\n");
      sprintf(buf, "%s failed to seduce you.", ch->Name);
      victim->Echo(buf);
      global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
      return;
    }


  if ( victim->Master )
    StopFollowing( victim );

  LearnFromSuccess( ch, gsn_seduce );
  StartFollowing( victim, ch );
}

