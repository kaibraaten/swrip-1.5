#include "character.h"
#include "mud.h"
#include "editor.h"

void do_bio( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Mobs can't set bio's!\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      Bug( "do_bio: no descriptor", 0 );
      return;
    }

  switch( ch->substate )
    {
    default:
      Bug( "do_bio: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      SendToCharacter( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->substate = SUB_PERSONAL_BIO;
      ch->dest_buf = ch;
      StartEditing( ch, ch->pcdata->bio );
      SetEditorDescription( ch, "Your character biography" );
      return;

    case SUB_PERSONAL_BIO:
      FreeMemory( ch->pcdata->bio );
      ch->pcdata->bio = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }
}
