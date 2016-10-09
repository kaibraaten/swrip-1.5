#include "mud.h"
#include "character.h"
#include "skill.h"

/*
 * Generic area attack                                          -Thoric
 */
ch_ret spell_area_attack( int sn, int level, Character *ch, void *vo )
{
  Character *vch, *vch_next;
  Skill *skill = GetSkill(sn);
  bool saved;
  bool affects;
  int dam;
  ch_ret retcode;

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ApplySithPenalty( ch );

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      FailedCasting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  affects = (skill->Affects ? true : false);

  if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
    Act( AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, NULL, TO_CHAR );

  if ( !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
    Act( AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, NULL, TO_ROOM );

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;

      if ( !IsNpc( vch ) && IsBitSet( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
        continue;

      if ( vch != ch && ( IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch) ) )
        {
          saved = CheckSavingThrow( sn, level, ch, vch );
          if ( saved && !SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
            {
              FailedCasting( skill, ch, vch, NULL );
              dam = 0;
            }
          else
            if ( skill->Dice )
              dam = ParseDice(ch, level, skill->Dice);
            else
              dam = RollDice( 1, level );
          if ( saved && SPELL_FLAG( skill, SF_SAVE_HALF_DAMAGE ) )
            dam /= 2;
          if ( IsAffectedBy(vch, AFF_PROTECT) && IsEvil(ch) )
            dam -= (int) (dam / 4);

          retcode = InflictDamage( ch, vch, dam, sn );
        }
      if ( retcode == rNONE && affects && !CharacterDiedRecently(ch) && !CharacterDiedRecently(vch) )
        retcode = spell_affectchar( sn, level, ch, vch );

      if ( retcode == rCHAR_DIED || CharacterDiedRecently(ch) )
        {
          break;
	}
    }
  return retcode;
}
