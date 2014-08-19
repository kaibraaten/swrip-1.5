#include "character.h"
#include "mud.h"
#include "editor.h"

void do_description( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Monsters are too dumb to do that!\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      Bug( "do_description: no descriptor", 0 );
      return;
    }

  switch( ch->substate )
    {
    default:
      Bug( "do_description: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      SendToCharacter( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->substate = SUB_PERSONAL_DESC;
      ch->dest_buf = ch;
      StartEditing( ch, ch->description );
      SetEditorDescription( ch, "Your character description" );
      return;

    case SUB_PERSONAL_DESC:
      FreeMemory( ch->description );
      ch->description = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }
}
