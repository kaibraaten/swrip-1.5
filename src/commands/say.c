#include "character.hpp"
#include "mud.h"

void do_say( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch = NULL;
  int mobflags = ch->Flags;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Say what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SILENCE ) )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    RemoveBit( ch->Flags, ACT_SECRETIVE );

  for ( vch = ch->InRoom->FirstPerson; vch; vch = vch->NextInRoom )
    {
      const char *sbuf = argument;

      if ( vch == ch )
        continue;

      if ( !CharacterKnowsLanguage(vch, ch->Speaking, ch)
	   && ( !IsNpc(ch) || ch->Speaking != 0 ) )
        sbuf = Scramble(argument, ch->Speaking);

      sbuf = DrunkSpeech( sbuf, ch );

      MOBtrigger = false;
      Act( AT_SAY, "$n says '$t'", ch, sbuf, vch, TO_VICT );
    }

  ch->Flags = mobflags;
  MOBtrigger = false;
  Act( AT_SAY, "You say '$T'", ch, NULL, DrunkSpeech( argument, ch ), TO_CHAR );

  if ( IsBitSet( ch->InRoom->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s: %s", IsNpc( ch ) ? ch->ShortDescr : ch->Name,
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
