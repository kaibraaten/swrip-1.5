#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "log.hpp"

void do_description( Character *ch, std::string argument )
{
  if ( IsNpc( ch ) )
    {
      ch->Echo( "Monsters are too dumb to do that!\r\n" );
      return;
    }

  if ( !ch->Desc )
    {
      Log->Bug( "do_description: no descriptor" );
      return;
    }

  switch( ch->SubState )
    {
    default:
      Log->Bug( "do_description: illegal substate (%d)", ch->SubState );
      return;

    case SUB_RESTRICTED:
      ch->Echo( "You cannot use this command from within another command.\r\n" );
      return;

    case SUB_NONE:
      ch->SubState = SUB_PERSONAL_DESC;
      StartEditing( ch, ch->Description, nullptr, do_description );
      SetEditorDesc( ch, "Your character description" );
      return;

    case SUB_PERSONAL_DESC:
      ch->Description = CopyEditBuffer( ch );
      StopEditing( ch );
      return;
    }
}

