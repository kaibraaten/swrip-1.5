#include "mud.h"
#include "character.h"

void do_flee( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *was_in;
  ROOM_INDEX_DATA *now_in;
  char buf[MAX_STRING_LENGTH];
  int attempt;
  short door;
  EXIT_DATA *pexit;

  if ( !who_fighting( ch ) )
    {
      if ( ch->position == POS_FIGHTING )
        {
          if ( ch->mount )
            ch->position = POS_MOUNTED;
          else
            ch->position = POS_STANDING;
        }
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ch->move <= 0 )
    {
      send_to_char( "You're too exhausted to flee from combat!\r\n", ch );
      return;
    }

  /* No fleeing while stunned. - Narn */
  if ( ch->position < POS_FIGHTING )
    return;

  was_in = ch->in_room;
  for ( attempt = 0; attempt < 8; attempt++ )
    {

      door = number_door( );
      if ( ( pexit = get_exit(was_in, door) ) == NULL
           ||   !pexit->to_room
           || ( IS_SET(pexit->exit_info, EX_CLOSED)
                &&   !is_affected_by( ch, AFF_PASS_DOOR ) )
           || ( is_npc(ch)
                &&   IS_SET(pexit->to_room->room_flags, ROOM_NO_MOB) ) )
        continue;

      if ( !permsneak(ch) )
        {
          affect_strip ( ch, gsn_sneak );
          REMOVE_BIT   ( ch->affected_by, AFF_SNEAK );
        }
      if ( ch->mount && ch->mount->fighting )
        stop_fighting( ch->mount, TRUE );
      move_char( ch, pexit, 0 );

      mprog_entry_trigger( ch );
      if ( char_died(ch) )
        return;

      rprog_enter_trigger( ch );
      if ( char_died(ch) )
        return;

      mprog_greet_trigger( ch );
      if ( char_died(ch) )
        return;

      oprog_greet_trigger( ch );
      if ( char_died(ch) )
        return;

      if ( ( now_in = ch->in_room ) == was_in )
        continue;

      ch->in_room = was_in;
      act( AT_FLEE, "$n runs for cover!", ch, NULL, NULL, TO_ROOM );
      ch->in_room = now_in;
      act( AT_FLEE, "$n glances around for signs of pursuit.", ch, NULL, NULL, TO_ROOM );
      sprintf(buf, "You run for cover!");
      send_to_char( buf, ch );

      stop_fighting( ch, TRUE );
      return;
    }

  sprintf(buf, "You attempt to run for cover!");
  send_to_char( buf, ch );
}
