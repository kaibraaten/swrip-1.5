#include "character.h"
#include "mud.h"

static void Says( Character *speaker, Character *listener, const char *message )
{
  act( AT_SAY, "$n says '$t'", speaker, message, listener, TO_VICT );
}

void do_say( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
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

  if ( IsNpc( ch ) )
    REMOVE_BIT( ch->act, ACT_SECRETIVE );

  SpamTellToBystanders( ch, argument, Says );

  ch->act = actflags;
  MOBtrigger = FALSE;
  act( AT_SAY, "You say '$T'", ch, NULL, drunk_speech( argument, ch ), TO_CHAR );

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s", IsNpc( ch ) ? ch->short_descr : ch->name,
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
