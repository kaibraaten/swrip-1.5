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

  if ( !ch->Desc )
    {
      Bug( "do_description: no descriptor", 0 );
      return;
    }

  switch( ch->SubState )
    {
    default:
      Bug( "do_description: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      SendToCharacter( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->SubState = SUB_PERSONAL_DESC;
      ch->dest_buf = ch;
      StartEditing( ch, ch->Description );
      SetEditorDescription( ch, "Your character description" );
      return;

    case SUB_PERSONAL_DESC:
      FreeMemory( ch->Description );
      ch->Description = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }
}
