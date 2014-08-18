#include "character.h"
#include "mud.h"

void do_say( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch = NULL;
  int actflags = ch->act;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Say what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    RemoveBit( ch->act, ACT_SECRETIVE );

  for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
    {
      const char *sbuf = argument;

      if ( vch == ch )
        continue;

      if ( !knows_language(vch, ch->speaking, ch)
	   && ( !IsNpc(ch) || ch->speaking != 0 ) )
        sbuf = Scramble(argument, ch->speaking);

      sbuf = DrunkSpeech( sbuf, ch );

      MOBtrigger = false;
      act( AT_SAY, "$n says '$t'", ch, sbuf, vch, TO_VICT );
    }

  ch->act = actflags;
  MOBtrigger = false;
  act( AT_SAY, "You say '$T'", ch, NULL, DrunkSpeech( argument, ch ), TO_CHAR );

  if ( IsBitSet( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s", IsNpc( ch ) ? ch->short_descr : ch->name,
               argument );
      AppendToFile( LOG_FILE, buf );
    }

  mprog_speech_trigger( argument, ch );

  if ( char_died(ch) )
    return;

  oprog_speech_trigger( argument, ch );

  if ( char_died(ch) )
    return;

  rprog_speech_trigger( argument, ch );
}
