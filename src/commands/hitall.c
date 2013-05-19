#include "mud.h"

static bool is_legal_kill(CHAR_DATA *ch, CHAR_DATA *vch);

void do_hitall( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  short nvict = 0;
  short nhit = 0;
  short percent;
  char logbuf[MAX_STRING_LENGTH];

  if ( IS_SET(ch->in_room->room_flags, ROOM_SAFE) )
    {
      send_to_char( "You cannot do that here.\r\n", ch);
      return;
    }

  if ( !ch->in_room->first_person )
    {
      send_to_char( "There's no one here!\r\n", ch );
      return;
    }

  percent = IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_hitall];

  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
    {
      vch_next = vch->next_in_room;

      if ( is_same_group(ch, vch) || !is_legal_kill(ch, vch) ||
           !can_see(ch, vch) || is_safe(ch, vch) )
        continue;

      if ( ++nvict > get_level( ch, COMBAT_ABILITY ) / 5 )
        break;

      if ( IS_SET(vch->act, PLR_AFK))
        {
          sprintf( logbuf , "%s just attacked %s with HITALL with an afk flag on!." , ch->name, vch->name );
          log_string( logbuf );
        }

      if ( chance(ch, percent) )
        {
          nhit++;
          global_retcode = one_hit(ch, vch, TYPE_UNDEFINED);
        }
      else
        global_retcode = damage(ch, vch, 0, TYPE_UNDEFINED);
      /* Fireshield, etc. could kill ch too.. :>.. -- Altrag */
      if ( global_retcode == rCHAR_DIED || global_retcode == rBOTH_DIED
           ||   char_died(ch) )
        return;
    }
  if ( !nvict )
    {
      send_to_char( "There's no one here!\r\n", ch );
      return;
    }
  ch->move = UMAX(0, ch->move-nvict*3+nhit);

  if ( nhit )
    learn_from_success(ch, gsn_hitall);
  else
    learn_from_failure(ch, gsn_hitall);
}

static bool is_legal_kill(CHAR_DATA *ch, CHAR_DATA *vch)
{
  if ( IS_NPC(ch) || IS_NPC(vch) )
    return TRUE;
  if ( is_safe(ch,vch) )
    return FALSE;
  return TRUE;
}
