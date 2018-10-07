#include <string.h>
#include <ctype.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_emote( Character *ch, std::string argument )
{
  int mobflags = ch->Flags;

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      ch->Echo( "You can't show your emotions.\r\n" );
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Emote what?\r\n" );
      return;
    }

  if ( IsNpc( ch ) )
    {
      RemoveBit( ch->Flags, ACT_SECRETIVE );
    }
  
  std::string buf = argument;
  const char lastCharacter = argument.back();
  
  if ( isalpha(lastCharacter) )
    {
      buf += ".";
    }

  MOBtrigger = false;
  Act( AT_ACTION, "$n $T", ch, NULL, buf.c_str(), TO_ROOM );

  MOBtrigger = false;
  Act( AT_ACTION, "$n $T", ch, NULL, buf.c_str(), TO_CHAR );

  ch->Flags = mobflags;

  if ( ch->InRoom->Flags.test( Flag::Room::LogSpeech ) )
    {
      char logbuf[MAX_STRING_LENGTH];
      sprintf( logbuf, "%s %s (emote)",
               IsNpc( ch ) ? ch->ShortDescr.c_str() : ch->Name.c_str(),
               argument.c_str() );
      AppendToFile( LOG_FILE, logbuf );
    }
}
