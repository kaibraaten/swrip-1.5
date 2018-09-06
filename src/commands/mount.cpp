#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_mount( Character *ch, std::string argument )
{
  Character *victim = NULL;

  if ( !IsNpc(ch)
       && ch->PCData->Learned[gsn_mount] <= 0  )
    {
      ch->Echo("I don't think that would be a good idea...\r\n");
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo("You're already mounted!\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
    {
      ch->Echo("You can't find that here.\r\n");
      return;
    }

  if ( !IsNpc(victim) || !IsBitSet(victim->Flags, ACT_MOUNTABLE ) )
    {
      ch->Echo("You can't mount that!\r\n");
      return;
    }

  if ( IsBitSet(victim->Flags, ACT_MOUNTED ) )
    {
      ch->Echo("That mount already has a rider.\r\n");
      return;
    }

  if ( victim->Position < POS_STANDING )
    {
      ch->Echo("Your mount must be standing.\r\n");
      return;
    }

  if ( victim->Position == POS_FIGHTING || victim->Fighting )
    {
      ch->Echo("Your mount is moving around too much.\r\n");
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
