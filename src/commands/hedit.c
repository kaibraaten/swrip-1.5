#include "character.h"
#include "mud.h"
#include "editor.h"
#include "help.h"

/*
 * Help editor                                                  -Thoric
 */
void do_hedit( CHAR_DATA *ch, char *argument )
{
  HELP_DATA *pHelp;

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
      if ( (pHelp = (HELP_DATA*)ch->dest_buf) == NULL )
        {
          bug( "hedit: sub_help_edit: NULL ch->dest_buf", 0 );
          stop_editing( ch );
          return;
        }

      STRFREE( pHelp->text );
      pHelp->text = copy_buffer( ch );
      stop_editing( ch );
      return;
    }

  if ( (pHelp = get_help( ch, argument )) == NULL )     /* new help */
    {
      int level = get_trust( ch );
      pHelp = create_help( argument, level );
      add_help( pHelp );
    }

  ch->substate = SUB_HELP_EDIT;
  ch->dest_buf = pHelp;
  start_editing( ch, pHelp->text );
}
