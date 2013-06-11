#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_emote( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char *plast = NULL;
  int actflags = ch->act;

  if ( !IsNpc(ch) && IS_SET(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You can't show your emotions.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Emote what?\r\n", ch );
      return;
    }

  if ( IsNpc( ch ) )
    {
      REMOVE_BIT( ch->act, ACT_SECRETIVE );
    }

  for ( plast = argument; *plast != '\0'; plast++ )
    {
      /* intentionally left empty */
    }

  strcpy( buf, argument );

  if ( isalpha(plast[-1]) )
    {
      strcat( buf, "." );
    }

  MOBtrigger = FALSE;
  act( AT_ACTION, "$n $T", ch, NULL, buf, TO_ROOM );

  MOBtrigger = FALSE;
  act( AT_ACTION, "$n $T", ch, NULL, buf, TO_CHAR );

  ch->act = actflags;

  if ( IS_SET( ch->in_room->room_flags, ROOM_LOGSPEECH ) )
    {
      sprintf( buf, "%s %s (emote)", IsNpc( ch ) ? ch->short_descr : ch->name,
               argument );
      append_to_file( LOG_FILE, buf );
    }
}
