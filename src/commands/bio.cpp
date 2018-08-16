#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "pcdata.hpp"
#include "log.hpp"

void do_bio( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      ch->Echo( "Mobs can't set bio's!\r\n" );
      return;
    }

  switch( ch->SubState )
    {
    default:
      Log->Bug("do_bio: illegal substate");
      return;

    case SUB_RESTRICTED:
      ch->Echo( "You cannot use this command from within another command.\r\n" );
      return;

    case SUB_NONE:
      ch->SubState = SUB_PERSONAL_BIO;
      ch->dest_buf = ch;
      StartEditing( ch, ch->PCData->Bio );
      SetEditorDescription( ch, "Your character biography" );
      return;

    case SUB_PERSONAL_BIO:
      FreeMemory( ch->PCData->Bio );
      ch->PCData->Bio = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }
}
