#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_rescue( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Character *fch;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Rescue whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "You try and rescue yourself, but fail miserably.\r\n", ch );
      return;
    }

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch) && IsNpc(victim) )
    {
      SendToCharacter( "Doesn't need your help!\r\n", ch );
      return;
    }

  if ( ( fch = GetFightingOpponent( victim) ) == NULL )
    {
      SendToCharacter( "They are not fighting right now.\r\n", ch );
      return;
    }

  if ( ch == fch )
    {
      SendToCharacter( "Rescue them from yourself?\r\n", ch );
      return;
    }

  ch->Alignment = ch->Alignment + 5;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
    - (GetCurrentLuck(victim) - 16);

  SetWaitState( ch, SkillTable[gsn_rescue]->Beats );
  if ( !IsNpc(ch) && percent > ch->PCData->Learned[gsn_rescue] )
    {
      SendToCharacter( "You fail the rescue.\r\n", ch );
      Act( AT_SKILL, "$n tries to rescue you!", ch, NULL, victim, TO_VICT   );
      Act( AT_SKILL, "$n tries to rescue $N!", ch, NULL, victim, TO_NOTVICT );
      LearnFromFailure( ch, gsn_rescue );
      return;
    }

  Act( AT_SKILL, "You rescue $N!",  ch, NULL, victim, TO_CHAR    );
  Act( AT_SKILL, "$n rescues you!", ch, NULL, victim, TO_VICT    );
  Act( AT_SKILL, "$n moves in front of $N!",  ch, NULL, victim, TO_NOTVICT );

  ch->Alignment = ch->Alignment + 50;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );

  LearnFromSuccess( ch, gsn_rescue );
  StopFighting( fch, false );
  StopFighting( victim, false );

  if ( ch->Fighting )
    StopFighting( ch, false );

  StartFighting( ch, fch );
  StartFighting( fch, ch );
}
