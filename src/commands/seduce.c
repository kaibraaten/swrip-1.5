#include "character.h"
#include "mud.h"
#include "skill.h"

void do_seduce ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Seduce whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }


  if ( IsAffectedBy(victim, AFF_CHARM) && victim->master )
    {
      Act( AT_PLAIN, "But he'd rather follow $N!", ch, NULL, victim->master, TO_CHAR );
      return;
    }

  if ( IsFollowingInCircle( victim, ch ) )
    {
      SendToCharacter( "Following in loops is not allowed... sorry.\r\n", ch );
      return;
    }


  SetWaitState( ch, skill_table[gsn_seduce]->beats );

  if ( victim->top_level - GetCurrentCharisma(ch) > ch->pcdata->learned[gsn_seduce] )
    {
      SendToCharacter("You failed.\r\n", ch);
      sprintf(buf, "%s failed to seduce you.", ch->name);
      SendToCharacter(buf, victim);
      global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
      return;
    }


  if ( victim->master )
    StopFollowing( victim );

  LearnFromSuccess( ch, gsn_seduce );
  StartFollowing( victim, ch );
}
