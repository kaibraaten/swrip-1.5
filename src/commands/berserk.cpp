#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_berserk( Character *ch, char *argument )
{
  short percent;
  Affect af;

  if ( !ch->Fighting )
    {
      ch->Echo( "But you aren't fighting!\r\n" );
      return;
    }

  if ( IsAffectedBy(ch, AFF_BERSERK) )
    {
      ch->Echo( "Your rage is already at its peak!\r\n" );
      return;
    }

  percent = IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_berserk];
  SetWaitState(ch, SkillTable[gsn_berserk]->Beats);

  if ( !Chance(ch, percent) )
    {
      ch->Echo( "You couldn't build up enough rage.\r\n" );
      LearnFromFailure(ch, gsn_berserk);
      return;
    }

  af.Type = gsn_berserk;
  /* Hmmm.. 10-20 combat rounds at level 50.. good enough for most mobs,
     and if not they can always go berserk again.. shrug.. maybe even
     too high. -- Altrag */
  af.Duration = GetRandomNumberFromRange(ch->TopLevel/5, ch->TopLevel*2/5);
  /* Hmm.. you get stronger when yer really enraged.. mind over matter
     type thing.. */
  af.Location  = APPLY_STR;
  af.Modifier  = 1;
  af.AffectedBy = AFF_BERSERK;
  AffectToCharacter(ch, &af);
  ch->Echo( "You start to lose control..\r\n" );
  LearnFromSuccess(ch, gsn_berserk);
}
