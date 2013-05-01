#include <string.h>
#include "mud.h"

void do_exits( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  EXIT_DATA *pexit;
  bool found;
  bool fAuto;

  set_char_color( AT_EXITS, ch );
  buf[0] = '\0';
  fAuto  = !str_cmp( argument, "auto" );

  if ( !check_blind( ch ) )
    return;

  strcpy( buf, fAuto ? "Exits:" : "Obvious exits:\r\n" );

  found = FALSE;
  for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
    {
      if ( pexit->to_room
           &&  !IS_SET(pexit->exit_info, EX_HIDDEN) )
        {
          found = TRUE;
          if ( !fAuto )
            {
              if ( IS_SET(pexit->exit_info, EX_CLOSED) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (closed)\r\n",
                           capitalize( get_dir_name(pexit->vdir) ) );
                }
              else if ( IS_SET(pexit->exit_info, EX_WINDOW) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (window)\r\n",
			   capitalize( get_dir_name(pexit->vdir) ) );
                }
              else if ( IS_SET(pexit->exit_info, EX_xAUTO) )
                {
                  sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                           capitalize( pexit->keyword ),
                           room_is_dark( pexit->to_room )
                           ?  "Too dark to tell"
                           : pexit->to_room->name );
                }
              else
                sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                         capitalize( get_dir_name(pexit->vdir) ),
                         room_is_dark( pexit->to_room )
                         ?  "Too dark to tell"
                         : pexit->to_room->name );
            }
          else
            {
              sprintf( buf + strlen(buf), " %s",
                       capitalize( get_dir_name(pexit->vdir) ) );
            }
        }
    }

  if ( !found )
    strcat( buf, fAuto ? " none.\r\n" : "None.\r\n" );
  else if ( fAuto )
    strcat( buf, ".\r\n" );

  send_to_char( buf, ch );
}
