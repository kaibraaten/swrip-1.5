#include <ctype.h>
#include "mud.h"
#include "character.h"

void do_name( Character *ch, char *argument )
{
  char fname[1024];
  struct stat fst;
  Character *tmp;
  char buf[MAX_STRING_LENGTH];

  if ( IsAuthed(ch) || ch->pcdata->auth_state != 2)
    {
      SendToCharacter("Huh?\r\n", ch);
      return;
    }

  argument[0] = CharToUppercase(argument[0]);

  if (!IsNameAcceptable(argument))
    {
      SendToCharacter("Illegal name, try another.\r\n", ch);
      return;
    }

  if (!StrCmp(ch->name, argument))
    {
      SendToCharacter("That's already your name!\r\n", ch);
      return;
    }

  for ( tmp = first_char; tmp; tmp = tmp->next )
    {
      if (!StrCmp(argument, tmp->name))
        break;
    }

  if ( tmp )
    {
      SendToCharacter("That name is already taken.  Please choose another.\r\n", ch);
      return;
    }

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(argument[0]),
           Capitalize( argument ) );
  if ( stat( fname, &fst ) != -1 )
    {
      SendToCharacter("That name is already taken.  Please choose another.\r\n", ch);
      return;
    }

  FreeMemory( ch->name );
  ch->name = CopyString( argument );
  sprintf( buf, "%s the %s",ch->name,
           RaceTable[ch->race].race_name );
  set_title( ch, buf );

  SendToCharacter("Your name has been changed.  Please apply again.\r\n", ch);
  ch->pcdata->auth_state = 1;
}
