#include "character.h"
#include "mud.h"
#include "editor.h"

void do_bio( CHAR_DATA *ch, char *argument )
{
  if ( is_npc( ch ) )
    {
      send_to_char( "Mobs can't set bio's!\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      bug( "do_bio: no descriptor", 0 );
      return;
    }

  switch( ch->substate )
    {
    default:
      bug( "do_bio: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      send_to_char( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->substate = SUB_PERSONAL_BIO;
      ch->dest_buf = ch;
      start_editing( ch, ch->pcdata->bio );
      return;

    case SUB_PERSONAL_BIO:
      STRFREE( ch->pcdata->bio );
      ch->pcdata->bio = copy_buffer( ch );
      stop_editing( ch );
      return;
    }
}
