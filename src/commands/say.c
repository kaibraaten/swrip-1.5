#include "character.h"
#include "mud.h"

void do_say( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *vch = NULL;
  int actflags = ch->act;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Say what?\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if ( is_npc( ch ) )
    REMOVE_BIT( ch->act, ACT_SECRETIVE );

  for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
    {
      const char *sbuf = argument;

      if ( vch == ch )
        continue;

      if ( !knows_language(vch, ch->speaking, ch)
	   && ( !is_npc(ch) || ch->speaking != 0 ) )
        sbuf = scramble(argument, ch->speaking);

      sbuf = drunk_speech( sbuf, ch );

      MOBtrigger = FALSE;
      act( AT_SAY, "$n says '$t'", ch, sbuf, vch, TO_VICT );
    }

  ch->act = actflags;
  MOBtrigger = FALSE;
  act( AT_SAY, "You say '$T'", ch, NULL, drunk_speech( argument, ch ), TO_CHAR );

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s", is_npc( ch ) ? ch->short_descr : ch->name,
               argument );
      append_to_file( LOG_FILE, buf );
    }

  mprog_speech_trigger( argument, ch );

  if ( char_died(ch) )
    return;

  oprog_speech_trigger( argument, ch );

  if ( char_died(ch) )
    return;

  rprog_speech_trigger( argument, ch );
}
