#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_emote( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char *plast = NULL;
  int actflags = ch->act;

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_NO_EMOTE) )
    {
      SendToCharacter( "You can't show your emotions.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Emote what?\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    {
      RemoveBit( ch->act, ACT_SECRETIVE );
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

  ch->act = actflags;

  if ( IsBitSet( ch->in_room->Flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s %s (emote)", IsNpc( ch ) ? ch->short_descr : ch->name,
               argument );
      AppendToFile( LOG_FILE, buf );
    }
}
