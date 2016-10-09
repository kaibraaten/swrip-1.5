#include "character.h"
#include "mud.h"

void do_say( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch = NULL;
  int actflags = ch->act;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Say what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    RemoveBit( ch->act, ACT_SECRETIVE );

  for ( vch = ch->in_room->first_person; vch; vch = vch->next_in_room )
    {
      const char *sbuf = argument;

      if ( vch == ch )
        continue;

      if ( !CharacterKnowsLanguage(vch, ch->speaking, ch)
	   && ( !IsNpc(ch) || ch->speaking != 0 ) )
        sbuf = Scramble(argument, ch->speaking);

      sbuf = DrunkSpeech( sbuf, ch );

      MOBtrigger = false;
      Act( AT_SAY, "$n says '$t'", ch, sbuf, vch, TO_VICT );
    }

  ch->act = actflags;
  MOBtrigger = false;
  Act( AT_SAY, "You say '$T'", ch, NULL, DrunkSpeech( argument, ch ), TO_CHAR );

  if ( IsBitSet( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s", IsNpc( ch ) ? ch->short_descr : ch->name,
               argument );
      AppendToFile( LOG_FILE, buf );
    }

  MobProgSpeechTrigger( argument, ch );

  if ( CharacterDiedRecently(ch) )
    return;

  ObjProgSpeechTrigger( argument, ch );

  if ( CharacterDiedRecently(ch) )
    return;

  RoomProgSpeechTrigger( argument, ch );
}
