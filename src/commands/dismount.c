#include "character.h"
#include "mud.h"
#include "skill.h"

void do_dismount( Character *ch, char *argument )
{
  Character *victim;

  if ( (victim = ch->mount) == NULL )
    {
      SendToCharacter( "You're not mounted.\r\n", ch );
      return;
    }

  SetWaitState( ch, skill_table[gsn_mount]->beats );
  if ( IsNpc(ch) || GetRandomPercent() < ch->pcdata->learned[gsn_mount] )
    {
      Act( AT_SKILL, "You dismount $N.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n skillfully dismounts $N.", ch, NULL, victim, TO_NOTVICT );
      Act( AT_SKILL, "$n dismounts you.  Whew!", ch, NULL, victim, TO_VICT );
      RemoveBit( victim->act, ACT_MOUNTED );
      ch->mount = NULL;
      ch->position = POS_STANDING;
      LearnFromSuccess( ch, gsn_mount );
    }
  else
    {
      Act( AT_SKILL, "You fall off while dismounting $N.  Ouch!", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n falls off of $N while dismounting.", ch, NULL, victim, TO_NOTVICT );
      Act( AT_SKILL, "$n falls off your back.", ch, NULL, victim, TO_VICT );
      LearnFromFailure( ch, gsn_mount );
      RemoveBit( victim->act, ACT_MOUNTED );
      ch->mount = NULL;
      ch->position = POS_SITTING;
      global_retcode = InflictDamage( ch, ch, 1, TYPE_UNDEFINED );
    }
}
