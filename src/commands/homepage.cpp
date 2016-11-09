#include <string.h>
#include "mud.hpp"
#include "character.hpp"

void do_homepage( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(ch) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      if ( !ch->PCData->HomePage )
        ch->PCData->HomePage = CopyString( "" );

      Echo( ch, "Your homepage is: %s\r\n",
                 ShowTilde( ch->PCData->HomePage ) );
      return;
    }

  if ( !StrCmp( argument, "clear" ) )
    {
      if ( ch->PCData->HomePage )
        FreeMemory(ch->PCData->HomePage);
      ch->PCData->HomePage = CopyString("");
      SendToCharacter( "Homepage cleared.\r\n", ch );
      return;
    }

  if ( strstr( argument, "://" ) )
    strcpy( buf, argument );
  else
    sprintf( buf, "http://%s", argument );

  if ( strlen(buf) > 70 )
    buf[70] = '\0';

  HideTilde( buf );

  if ( ch->PCData->HomePage )
    FreeMemory(ch->PCData->HomePage);

  ch->PCData->HomePage = CopyString(buf);
  SendToCharacter( "Homepage set.\r\n", ch );
}
