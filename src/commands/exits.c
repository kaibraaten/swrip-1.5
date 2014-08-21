#include <string.h>
#include "mud.h"
#include "character.h"

void do_exits( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Exit *pexit;
  bool found;
  bool fAuto;

  SetCharacterColor( AT_EXITS, ch );
  buf[0] = '\0';
  fAuto  = !StrCmp( argument, "auto" );

  if ( IsBlind( ch ) )
    {
      Echo( ch, "You can't see a thing!\r\n" );
      return;
    }

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
                           Capitalize( GetDirectionName(pexit->vdir) ) );
                }
              else if ( IsBitSet(pexit->exit_info, EX_WINDOW) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (window)\r\n",
			   Capitalize( GetDirectionName(pexit->vdir) ) );
                }
              else if ( IsBitSet(pexit->exit_info, EX_xAUTO) )
                {
                  sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                           Capitalize( pexit->keyword ),
                           IsRoomDark( pexit->to_room )
                           ?  "Too dark to tell"
                           : pexit->to_room->name );
                }
              else
                sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                         Capitalize( GetDirectionName(pexit->vdir) ),
                         IsRoomDark( pexit->to_room )
                         ?  "Too dark to tell"
                         : pexit->to_room->name );
            }
          else
            {
              sprintf( buf + strlen(buf), " %s",
                       Capitalize( GetDirectionName(pexit->vdir) ) );
            }
        }
    }

  if ( !found )
    strcat( buf, fAuto ? " none.\r\n" : "None.\r\n" );
  else if ( fAuto )
    strcat( buf, ".\r\n" );

  SendToCharacter( buf, ch );
}
