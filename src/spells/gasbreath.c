#include "character.h"
#include "mud.h"

ch_ret spell_gas_breath( int sn, int level, Character *ch, void *vo )
{
  Character *vch;
  Character *vch_next;
  int dam;
  int hpch;
  bool ch_died;

  ch_died = false;

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "You fail to breathe.\r\n", ch );
      return rNONE;
    }

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;
      if ( !is_npc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
        continue;

      if ( is_npc(ch) ? !is_npc(vch) : is_npc(vch) )
        {
          hpch = UMAX( 10, ch->hit );
          dam  = number_range( hpch/16+1, hpch/8 );
          if ( saves_breath( level, vch ) )
            dam /= 2;
          if ( is_affected_by(vch, AFF_PROTECT) && is_evil(ch) )
            dam -= (int) (dam / 4);
          if ( damage( ch, vch, dam, sn ) == rCHAR_DIED || char_died(ch) )
            ch_died = true;
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
