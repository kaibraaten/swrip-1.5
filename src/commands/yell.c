#include "character.h"
#include "mud.h"

void do_yell( Character *ch, char *argument )
{
  if (IsNotAuthed(ch))
    {
      send_to_char("Huh?\r\n", ch);
      return;
    }

  talk_channel( ch, drunk_speech( argument, ch ), CHANNEL_YELL, "yell" );
}
