#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

void do_circle( Character *ch, std::string argument )
{
  std::string arg;
  Character *victim = NULL;
  Object *obj = NULL;
  int percent = 0;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo( "You can't concentrate enough for that.\r\n" );
      return;
    }

  OneArgument( argument, arg );

  if ( ch->Mount )
    {
      ch->Echo( "You can't circle while mounted.\r\n" );
      return;
    }

  if ( arg.empty() )
    {
      ch->Echo( "Circle around whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "How can you sneak up on yourself?\r\n" );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL
       || ( obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE
	    && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_VIBRO_BLADE ) )
    {
      ch->Echo( "You need to wield a piercing or stabbing weapon.\r\n" );
      return;
    }

  if ( !ch->Fighting )
    {
      ch->Echo( "You can't circle when you aren't fighting.\r\n" );
      return;
    }

  if ( !victim->Fighting )
    {
      ch->Echo( "You can't circle around a person who is not fighting.\r\n" );
      return;
    }

  if ( victim->NumFighting < 2 )
    {
      Act( AT_PLAIN, "You can't circle around them without a distraction.",
           ch, NULL, victim, TO_CHAR );
      return;
    }

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 16)
    + (GetCurrentLuck(victim) - 13);

  SetWaitState( ch, SkillTable[gsn_circle]->Beats );

  if ( percent < (IsNpc(ch) ? (GetAbilityLevel( ch, HUNTING_ABILITY ) * 1.5) : ch->PCData->Learned[gsn_circle]) )
    {
      LearnFromSuccess( ch, gsn_circle );
      global_retcode = HitMultipleTimes( ch, victim, gsn_circle );
    }
  else
    {
      LearnFromFailure( ch, gsn_circle );
      global_retcode = InflictDamage( ch, victim, 0, gsn_circle );
    }
}
