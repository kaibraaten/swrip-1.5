#include "character.h"
#include "mud.h"

ch_ret spell_spiral_blast( int sn, int level, Character *ch, void *vo )
{
  Character *vch;
  Character *vch_next;
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


  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;
      if ( !IsNpc( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
           && vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
        continue;

      if ( IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch) )
        {
          act( AT_MAGIC, "Swirling colours radiate from $n"
               ", encompassing $N.",
               ch, ch, vch, TO_ROOM );
          act( AT_MAGIC, "Swirling colours radiate from you,"
               " encompassing $N",
               ch, ch, vch , TO_CHAR );

          hpch = UMAX( 10, ch->hit );
          dam  = number_range( hpch/14+1, hpch/7 );
          if ( saves_breath( level, vch ) )
            dam /= 2;
          if ( is_affected_by(vch, AFF_PROTECT) && is_evil(ch) )
            dam -= (int) (dam / 4);

          if ( damage( ch, vch, dam, sn ) == rCHAR_DIED ||
               char_died(ch) )
            ch_died = TRUE;
        }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
