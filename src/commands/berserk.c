#include "mud.h"
#include "character.h"
#include "skill.h"

void do_berserk( Character *ch, char *argument )
{
  short percent;
  Affect af;

  if ( !ch->fighting )
    {
      SendToCharacter( "But you aren't fighting!\r\n", ch );
      return;
    }

  if ( IsAffectedBy(ch, AFF_BERSERK) )
    {
      SendToCharacter( "Your rage is already at its peak!\r\n", ch );
      return;
    }

  percent = IsNpc(ch) ? 80 : ch->pcdata->learned[gsn_berserk];
  SetWaitState(ch, SkillTable[gsn_berserk]->Beats);
  if ( !Chance(ch, percent) )
    {
      SendToCharacter( "You couldn't build up enough rage.\r\n", ch);
      LearnFromFailure(ch, gsn_berserk);
      return;
    }
  af.Type = gsn_berserk;
  /* Hmmm.. 10-20 combat rounds at level 50.. good enough for most mobs,
     and if not they can always go berserk again.. shrug.. maybe even
     too high. -- Altrag */
  af.Duration = GetRandomNumberFromRange(ch->top_level/5, ch->top_level*2/5);
  /* Hmm.. you get stronger when yer really enraged.. mind over matter
     type thing.. */
  af.Location  = APPLY_STR;
  af.Modifier  = 1;
  af.AffectedBy = AFF_BERSERK;
  AffectToCharacter(ch, &af);
  SendToCharacter( "You start to lose control..\r\n", ch );
  LearnFromSuccess(ch, gsn_berserk);
}
