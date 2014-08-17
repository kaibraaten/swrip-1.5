#include "character.h"
#include "mud.h"
#include "editor.h"

void do_bio( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
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
      StartEditing( ch, ch->pcdata->bio );
      SetEditorDescription( ch, "Your character biography" );
      return;

    case SUB_PERSONAL_BIO:
      STRFREE( ch->pcdata->bio );
      ch->pcdata->bio = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }
}
