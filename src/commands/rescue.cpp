#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_rescue( Character *ch, std::string arg )
{
  Character *victim = NULL;
  Character *fch = NULL;
  int percent = 0;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo("You can't concentrate enough for that.\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ch->Echo("Rescue whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("You try and rescue yourself, but fail miserably.\r\n");
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo("You can't do that while mounted.\r\n");
      return;
    }

  if ( !IsNpc(ch) && IsNpc(victim) )
    {
      ch->Echo("Doesn't need your help!\r\n");
      return;
    }

  if ( ( fch = GetFightingOpponent( victim) ) == NULL )
    {
      ch->Echo("They are not fighting right now.\r\n");
      return;
    }

  if ( ch == fch )
    {
      ch->Echo("Rescue them from yourself?\r\n");
      return;
    }

  ch->Alignment += 5;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
    - (GetCurrentLuck(victim) - 16);

  SetWaitState( ch, SkillTable[gsn_rescue]->Beats );

  if ( !IsNpc(ch) && percent > ch->PCData->Learned[gsn_rescue] )
    {
      ch->Echo("You fail the rescue.\r\n");
      Act( AT_SKILL, "$n tries to rescue you!", ch, NULL, victim, TO_VICT   );
      Act( AT_SKILL, "$n tries to rescue $N!", ch, NULL, victim, TO_NOTVICT );
      LearnFromFailure( ch, gsn_rescue );
      return;
    }

  Act( AT_SKILL, "You rescue $N!",  ch, NULL, victim, TO_CHAR    );
  Act( AT_SKILL, "$n rescues you!", ch, NULL, victim, TO_VICT    );
  Act( AT_SKILL, "$n moves in front of $N!",  ch, NULL, victim, TO_NOTVICT );

  ch->Alignment += 50;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );

  LearnFromSuccess( ch, gsn_rescue );
  StopFighting( fch, false );
  StopFighting( victim, false );

  if ( ch->Fighting )
    StopFighting( ch, false );

  StartFighting( ch, fch );
  StartFighting( fch, ch );
}
