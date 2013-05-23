#include "character.h"
#include "mud.h"

ch_ret spell_earthquake( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  bool ch_died;
  ch_ret retcode;
  SKILLTYPE *skill = get_skilltype(sn);

  ch_died = FALSE;
  retcode = rNONE;

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );


  act( AT_MAGIC, "The earth trembles beneath your feet!", ch, NULL, NULL, TO_CHAR );
  act( AT_MAGIC, "$n makes the earth tremble and shiver.", ch, NULL, NULL, TO_ROOM );

  for ( vch = first_char; vch; vch = vch_next )
    {
      vch_next  = vch->next;
      if ( !vch->in_room )
        continue;
      if ( vch->in_room == ch->in_room )
        {
          if ( !is_npc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
               && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
	    continue;

          if ( is_affected_by(vch, AFF_FLOATING) || is_affected_by(vch, AFF_FLYING) )
            continue;

          if  (ch == vch )
            continue;

          retcode = damage( ch, vch, level + dice(2, 8), sn );
          if ( retcode == rCHAR_DIED || char_died(ch) )
            {
              ch_died = TRUE;
              continue;
            }
          if ( char_died(vch) )
            continue;
        }

      if ( !ch_died && vch->in_room->area == ch->in_room->area )
        {
          set_char_color( AT_MAGIC, vch );
          send_to_char( "The earth trembles and shivers.\r\n", vch );
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
