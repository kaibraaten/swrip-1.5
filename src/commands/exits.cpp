#include <string.h>
#include "mud.h"
#include "character.hpp"

void do_exits( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  Exit *pexit;
  bool found;
  bool fAuto = !StrCmp( argument, "auto" );

  SetCharacterColor( AT_EXITS, ch );

  if ( IsBlind( ch ) )
    {
      Echo( ch, "You can't see a thing!\r\n" );
      return;
    }

  strcpy( buf, fAuto ? "Exits:" : "Obvious exits:\r\n" );

  found = false;
  for ( pexit = ch->InRoom->FirstExit; pexit; pexit = pexit->Next )
    {
      if ( pexit->ToRoom
           &&  !IsBitSet(pexit->Flags, EX_HIDDEN) )
        {
          found = true;
          if ( !fAuto )
            {
              if ( IsBitSet(pexit->Flags, EX_CLOSED) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (closed)\r\n",
                           Capitalize( GetDirectionName(pexit->Direction) ) );
                }
              else if ( IsBitSet(pexit->Flags, EX_WINDOW) )
                {
                  sprintf( buf + strlen(buf), "%-5s - (window)\r\n",
			   Capitalize( GetDirectionName(pexit->Direction) ) );
                }
              else if ( IsBitSet(pexit->Flags, EX_xAUTO) )
                {
                  sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                           Capitalize( pexit->Keyword ),
                           IsRoomDark( pexit->ToRoom )
                           ?  "Too dark to tell"
                           : pexit->ToRoom->Name );
                }
              else
                sprintf( buf + strlen(buf), "%-5s - %s\r\n",
                         Capitalize( GetDirectionName(pexit->Direction) ),
                         IsRoomDark( pexit->ToRoom )
                         ?  "Too dark to tell"
                         : pexit->ToRoom->Name );
            }
          else
            {
              sprintf( buf + strlen(buf), " %s",
                       Capitalize( GetDirectionName(pexit->Direction) ) );
            }
        }
    }

  if ( !found )
    strcat( buf, fAuto ? " none.\r\n" : "None.\r\n" );
  else if ( fAuto )
    strcat( buf, ".\r\n" );

  SendToCharacter( buf, ch );
}
