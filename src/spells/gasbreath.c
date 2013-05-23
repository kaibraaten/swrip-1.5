#include "character.h"
#include "mud.h"

ch_ret spell_gas_breath( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  int dam;
  int hpch;
  bool ch_died;

  ch_died = FALSE;

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You fail to breathe.\r\n", ch );
      return rNONE;
    }

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;
      if ( !IS_NPC( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
        continue;

      if ( IS_NPC(ch) ? !IS_NPC(vch) : IS_NPC(vch) )
        {
          hpch = UMAX( 10, ch->hit );
          dam  = number_range( hpch/16+1, hpch/8 );
          if ( saves_breath( level, vch ) )
            dam /= 2;
          if ( is_affected_by(vch, AFF_PROTECT) && IS_EVIL(ch) )
            dam -= (int) (dam / 4);
          if ( damage( ch, vch, dam, sn ) == rCHAR_DIED || char_died(ch) )
            ch_died = TRUE;
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
