#include "character.h"
#include "mud.h"

ch_ret spell_earthquake( int sn, int level, Character *ch, void *vo )
{
  Character *vch;
  Character *vch_next;
  bool ch_died;
  ch_ret retcode;
  Skill *skill = get_skilltype(sn);

  ch_died = false;
  retcode = rNONE;

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  SendToCharacter("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  Act( AT_MAGIC, "The earth trembles beneath your feet!", ch, NULL, NULL, TO_CHAR );
  Act( AT_MAGIC, "$n makes the earth tremble and shiver.", ch, NULL, NULL, TO_ROOM );

  for ( vch = first_char; vch; vch = vch_next )
    {
      vch_next  = vch->next;
      if ( !vch->in_room )
        continue;
      if ( vch->in_room == ch->in_room )
        {
          if ( !IsNpc( vch ) && IsBitSet( vch->act, PLR_WIZINVIS )
               && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
	    continue;

          if ( IsAffectedBy(vch, AFF_FLOATING) || IsAffectedBy(vch, AFF_FLYING) )
            continue;

          if  (ch == vch )
            continue;

          retcode = damage( ch, vch, level + RollDice(2, 8), sn );
          if ( retcode == rCHAR_DIED || char_died(ch) )
            {
              ch_died = true;
              continue;
            }
          if ( char_died(vch) )
            continue;
        }

      if ( !ch_died && vch->in_room->area == ch->in_room->area )
        {
          SetCharacterColor( AT_MAGIC, vch );
          SendToCharacter( "The earth trembles and shivers.\r\n", vch );
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
