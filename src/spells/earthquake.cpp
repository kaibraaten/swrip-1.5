#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

ch_ret spell_earthquake( int sn, int level, Character *ch, void *vo )
{
  Character *vch = NULL;
  Character *vch_next = NULL;
  bool ch_died = false;
  ch_ret retcode = rNONE;
  Skill *skill = GetSkill(sn);

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      FailedCasting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  ch->Echo("You feel the hatred grow within you!\r\n");
  ch->Alignment = ch->Alignment - 100;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );
  ApplySithPenalty( ch );


  Act( AT_MAGIC, "The earth trembles beneath your feet!", ch, NULL, NULL, TO_CHAR );
  Act( AT_MAGIC, "$n makes the earth tremble and shiver.", ch, NULL, NULL, TO_ROOM );

  for ( vch = FirstCharacter; vch; vch = vch_next )
    {
      vch_next  = vch->Next;
      if ( !vch->InRoom )
        continue;
      if ( vch->InRoom == ch->InRoom )
        {
          if ( !IsNpc( vch ) && IsBitSet( vch->Flags, PLR_WIZINVIS )
               && vch->PCData->WizInvis >= LEVEL_IMMORTAL )
	    continue;

          if ( IsAffectedBy(vch, AFF_FLOATING) || IsAffectedBy(vch, AFF_FLYING) )
            continue;

          if  (ch == vch )
            continue;

          retcode = InflictDamage( ch, vch, level + RollDice(2, 8), sn );
          if ( retcode == rCHAR_DIED || CharacterDiedRecently(ch) )
            {
              ch_died = true;
              continue;
            }
          if ( CharacterDiedRecently(vch) )
            continue;
        }

      if ( !ch_died && vch->InRoom->Area == ch->InRoom->Area )
        {
          SetCharacterColor( AT_MAGIC, vch );
          vch->Echo("The earth trembles and shivers.\r\n");
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
