#include "mud.h"
#include "character.h"

void do_aassign( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Area *tarea, *tmp;

  if ( IsNpc( ch ) )
    return;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Syntax: aassign <filename.are>\r\n", ch );
      return;
    }

  if ( !StrCmp( "none", argument )
       ||   !StrCmp( "null", argument )
       ||   !StrCmp( "clear", argument ) )
    {
      ch->pcdata->area = NULL;
      assign_area( ch );

      if ( !ch->pcdata->area )
        send_to_char( "Area pointer cleared.\r\n", ch );
      else
        send_to_char( "Originally assigned area restored.\r\n", ch );
      return;
    }

  sprintf( buf, "%s", argument );
  tarea = NULL;

  if ( GetTrustLevel(ch) >= LEVEL_GREATER
       ||  (IsName( buf, ch->pcdata->bestowments )
            &&   GetTrustLevel(ch) >= sysdata.level_modify_proto) )
    for ( tmp = first_area; tmp; tmp = tmp->next )
      if ( !StrCmp( buf, tmp->filename ) )
        {
          tarea = tmp;
          break;
        }

  if ( !tarea )
    for ( tmp = first_build; tmp; tmp = tmp->next )
      if ( !StrCmp( buf, tmp->filename ) )
        {
          /*            if ( GetTrustLevel(ch) >= sysdata.level_modify_proto  */
          if ( GetTrustLevel(ch) >= LEVEL_GREATER
               ||   IsName( tmp->filename, ch->pcdata->bestowments ) )
            {
              tarea = tmp;
              break;
            }
          else
            {
              send_to_char( "You do not have permission to use that area.\r\n", ch );
              return;
            }
        }

  if( !StrCmp( buf, "this" ) )
    {
      tarea = ch->in_room->area;
    }

  if ( !tarea )
    {
      if ( GetTrustLevel(ch) >= sysdata.level_modify_proto )
        send_to_char( "No such area. Use 'zones'.\r\n", ch );
      else
        send_to_char( "No such area. Use 'newzones'.\r\n", ch );
      return;
    }
  ch->pcdata->area = tarea;
  ch_printf( ch, "Assigning you: %s\r\n", tarea->name );
}
