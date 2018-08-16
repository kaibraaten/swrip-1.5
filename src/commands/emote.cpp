#include <string.h>
#include <ctype.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_emote( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char *plast = NULL;
  int mobflags = ch->Flags;

  if ( !IsNpc(ch) && IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      ch->Echo( "You can't show your emotions.\r\n" );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Emote what?\r\n" );
      return;
    }

  if ( IsNpc( ch ) )
    {
      RemoveBit( ch->Flags, ACT_SECRETIVE );
    }

  for ( plast = argument; !IsNullOrEmpty( plast ); plast++ )
    {
      /* intentionally left empty */
    }

  strcpy( buf, argument );

  if ( isalpha(plast[-1]) )
    {
      strcat( buf, "." );
    }

  MOBtrigger = false;
  Act( AT_ACTION, "$n $T", ch, NULL, buf, TO_ROOM );

  MOBtrigger = false;
  Act( AT_ACTION, "$n $T", ch, NULL, buf, TO_CHAR );

  ch->Flags = mobflags;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s %s (emote)", IsNpc( ch ) ? ch->ShortDescr : ch->Name,
               argument );
      AppendToFile( LOG_FILE, buf );
    }
}
