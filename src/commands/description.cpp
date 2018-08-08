#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "log.hpp"

void do_description( Character *ch, char *argument )
{
  if ( IsNpc( ch ) )
    {
      ch->Echo( "Monsters are too dumb to do that!\r\n" );
      return;
    }

  if ( !ch->Desc )
    {
      Log->Bug( "do_description: no descriptor", 0 );
      return;
    }

  switch( ch->SubState )
    {
    default:
      Log->Bug( "do_description: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      ch->Echo( "You cannot use this command from within another command.\r\n" );
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

