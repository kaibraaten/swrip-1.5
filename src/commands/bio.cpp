#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "pcdata.hpp"

void do_bio( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Mobs can't set bio's!\r\n", ch );
      return;
    }

  if ( !ch->Desc )
    {
      Bug( "do_bio: no descriptor", 0 );
      return;
    }

  switch( ch->SubState )
    {
    default:
      Bug( "do_bio: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      SendToCharacter( "You cannot use this command from within another command.\r\n", ch );
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
