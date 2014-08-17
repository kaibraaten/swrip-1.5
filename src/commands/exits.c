#include <string.h>
#include "mud.h"
#include "character.h"

void do_exits( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Exit *pexit;
  bool found;
  bool fAuto;

  set_char_color( AT_EXITS, ch );
  buf[0] = '\0';
  fAuto  = !StrCmp( argument, "auto" );

  if ( !check_blind( ch ) )
    return;

  strcpy( buf, fAuto ? "Exits:" : "Obvious exits:\r\n" );

  found = false;
  for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
    {
      if ( pexit->to_room
           &&  !IsBitSet(pexit->exit_info, EX_HIDDEN) )
        {
          found = true;
          if ( !fAuto )
            {
              if ( IsBitSet(pexit->exit_info, EX_CLOSED) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (closed)\r\n",
                           Capitalize( get_dir_name(pexit->vdir) ) );
                }
              else if ( IsBitSet(pexit->exit_info, EX_WINDOW) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (window)\r\n",
			   Capitalize( get_dir_name(pexit->vdir) ) );
                }
              else if ( IsBitSet(pexit->exit_info, EX_xAUTO) )
                {
                  sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                           Capitalize( pexit->keyword ),
                           room_is_dark( pexit->to_room )
                           ?  "Too dark to tell"
                           : pexit->to_room->name );
                }
              else
                sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                         Capitalize( get_dir_name(pexit->vdir) ),
                         room_is_dark( pexit->to_room )
                         ?  "Too dark to tell"
                         : pexit->to_room->name );
            }
          else
            {
              sprintf( buf + strlen(buf), " %s",
                       Capitalize( get_dir_name(pexit->vdir) ) );
            }
        }
    }

  if ( !found )
    strcat( buf, fAuto ? " none.\r\n" : "None.\r\n" );
  else if ( fAuto )
    strcat( buf, ".\r\n" );

  send_to_char( buf, ch );
}
