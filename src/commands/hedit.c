#include "character.h"
#include "mud.h"
#include "editor.h"
#include "help.h"

/*
 * Help editor                                                  -Thoric
 */
void do_hedit( Character *ch, char *argument )
{
  HelpFile *pHelp = NULL;

  if ( !ch->desc )
    {
      SendToCharacter( "You have no descriptor.\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;

    case SUB_HELP_EDIT:
      pHelp = (HelpFile*) ch->dest_buf;

      if ( !pHelp )
        {
          Bug( "hedit: sub_help_edit: NULL ch->dest_buf", 0 );
          StopEditing( ch );
          return;
        }

      SetHelpFileTextNoAlloc( pHelp, CopyBuffer( ch ) );
      StopEditing( ch );
      return;
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp ) /* new help */
    {
      int level = GetTrustLevel( ch );
      pHelp = AllocateHelpFile( argument, level );
      AddHelpFile( pHelp );
    }

  ch->substate = SUB_HELP_EDIT;
  ch->dest_buf = pHelp;
  StartEditing( ch, GetHelpFileText( pHelp ) );
  SetEditorDescription( ch, "Help file: %s", GetHelpFileKeyword( pHelp ) );
}
