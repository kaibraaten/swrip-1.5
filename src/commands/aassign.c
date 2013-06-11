#include "mud.h"
#include "character.h"

void do_aassign( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  AREA_DATA *tarea, *tmp;

  if ( IsNpc( ch ) )
    return;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Syntax: aassign <filename.are>\r\n", ch );
      return;
    }

  if ( !str_cmp( "none", argument )
       ||   !str_cmp( "null", argument )
       ||   !str_cmp( "clear", argument ) )
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

  if ( get_trust(ch) >= LEVEL_GREATER
       ||  (is_name( buf, ch->pcdata->bestowments )
            &&   get_trust(ch) >= sysdata.level_modify_proto) )
    for ( tmp = first_area; tmp; tmp = tmp->next )
      if ( !str_cmp( buf, tmp->filename ) )
        {
          tarea = tmp;
          break;
        }

  if ( !tarea )
    for ( tmp = first_build; tmp; tmp = tmp->next )
      if ( !str_cmp( buf, tmp->filename ) )
        {
          /*            if ( get_trust(ch) >= sysdata.level_modify_proto  */
          if ( get_trust(ch) >= LEVEL_GREATER
               ||   is_name( tmp->filename, ch->pcdata->bestowments ) )
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

  if ( !tarea )
    {
      if ( get_trust(ch) >= sysdata.level_modify_proto )
        send_to_char( "No such area.  Use 'zones'.\r\n", ch );
      else
        send_to_char( "No such area.  Use 'newzones'.\r\n", ch );
      return;
    }
  ch->pcdata->area = tarea;
  ch_printf( ch, "Assigning you: %s\r\n", tarea->name );
}
