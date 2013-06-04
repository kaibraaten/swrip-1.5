#include "character.h"
#include "mud.h"
#include "editor.h"
#include "help.h"

/*
 * Help editor                                                  -Thoric
 */
void do_hedit( CHAR_DATA *ch, char *argument )
{
  HelpFile *pHelp = NULL;
  char *kludge = NULL;

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor.\r\n", ch );
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
          bug( "hedit: sub_help_edit: NULL ch->dest_buf", 0 );
          stop_editing( ch );
          return;
        }

      kludge = copy_buffer( ch );
      SetHelpText( pHelp, kludge );
      STRFREE( kludge );
      stop_editing( ch );
      return;
    }

  pHelp = GetHelp( ch, argument );

  if ( !pHelp ) /* new help */
    {
      int level = get_trust( ch );
      pHelp = CreateHelp( argument, level );
      AddHelp( pHelp );
    }

  ch->substate = SUB_HELP_EDIT;
  ch->dest_buf = pHelp;
  start_editing( ch, GetHelpText( pHelp ) );
}
