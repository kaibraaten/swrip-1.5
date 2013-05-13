#include "mud.h"

ch_ret spell_call_lightning( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  int dam;
  bool ch_died;
  ch_ret retcode;

  if ( !IS_OUTSIDE(ch) )
    {
      send_to_char( "You must be out of doors.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( weather_info.sky < SKY_RAINING )
    {
      send_to_char( "You need bad weather.\r\n", ch );
      return rSPELL_FAILED;
    }

  dam = dice(level/4, 8);

  send_to_char("You feel the hatred grow within you!\r\n", ch);
  ch->alignment = ch->alignment - 100;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  sith_penalty( ch );

  set_char_color( AT_MAGIC, ch );
  send_to_char( "Lightning strikes your foes!\r\n", ch );
  act( AT_MAGIC, "$n calls Lightning to strike $s foes!",
       ch, NULL, NULL, TO_ROOM );

  ch_died = FALSE;
  for ( vch = first_char; vch; vch = vch_next )
    {
      vch_next  = vch->next;
      if ( !vch->in_room )
        continue;
      if ( vch->in_room == ch->in_room )
	{
          if ( !IS_NPC( vch ) && IS_SET( vch->act, PLR_WIZINVIS )
               &&    vch->pcdata->wizinvis >= LEVEL_IMMORTAL )
            continue;

          if ( vch != ch && ( IS_NPC(ch) ? !IS_NPC(vch) : IS_NPC(vch) ) )
            retcode = damage( ch, vch, saves_spell_staff( level, vch ) ? dam/2 : dam, sn );
          if ( retcode == rCHAR_DIED || char_died(ch) )
            ch_died = TRUE;
          continue;
        }

      if ( !ch_died
           &&   vch->in_room->area == ch->in_room->area
           &&   IS_OUTSIDE(vch)
           &&   IS_AWAKE(vch) ) {
        set_char_color( AT_MAGIC, vch );
        send_to_char( "Lightning flashes in the sky.\r\n", vch );
      }
    }

  if ( ch_died )
    return rCHAR_DIED;
  else
    return rNONE;
}
