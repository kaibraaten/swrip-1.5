#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_mount( Character *ch, char *argument )
{
  Character *victim = NULL;

  if ( !IsNpc(ch)
       &&   ch->PCData->Learned[gsn_mount] <= 0  )
    {
      SendToCharacter(
                   "I don't think that would be a good idea...\r\n", ch );
      return;
    }

  if ( ch->Mount )
    {
      SendToCharacter( "You're already mounted!\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) || !IsBitSet(victim->Flags, ACT_MOUNTABLE ) )
    {
      SendToCharacter( "You can't mount that!\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->Flags, ACT_MOUNTED ) )
    {
      SendToCharacter( "That mount already has a rider.\r\n", ch );
      return;
    }

  if ( victim->Position < POS_STANDING )
    {
      SendToCharacter( "Your mount must be standing.\r\n", ch );
      return;
    }

  if ( victim->Position == POS_FIGHTING || victim->Fighting )
    {
      SendToCharacter( "Your mount is moving around too much.\r\n", ch );
      return;
    }

  SetWaitState( ch, SkillTable[gsn_mount]->Beats );
  if ( IsNpc(ch) || GetRandomPercent() < ch->PCData->Learned[gsn_mount] )
    {
      SetBit( victim->Flags, ACT_MOUNTED );
      ch->Mount = victim;
      Act( AT_SKILL, "You mount $N.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n skillfully mounts $N.", ch, NULL, victim, TO_NOTVICT );
      Act( AT_SKILL, "$n mounts you.", ch, NULL, victim, TO_VICT );
      LearnFromSuccess( ch, gsn_mount );
      ch->Position = POS_MOUNTED;
    }
  else
    {
      Act( AT_SKILL, "You unsuccessfully try to mount $N.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n unsuccessfully attempts to mount $N.", ch, NULL, victim, TO_NOTVICT );
      Act( AT_SKILL, "$n tries to mount you.", ch, NULL, victim, TO_VICT );
      LearnFromFailure( ch, gsn_mount );
    }
}
