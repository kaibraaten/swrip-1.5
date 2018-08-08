#include <ctype.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_name( Character *ch, char *argument )
{
  char fname[1024];
  struct stat fst;
  Character *tmp;
  char buf[MAX_STRING_LENGTH];

  if ( IsAuthed(ch) || ch->PCData->AuthState != 2)
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument[0] = CharToUppercase(argument[0]);

  if (!IsNameAcceptable(argument))
    {
      ch->Echo("Illegal name, try another.\r\n");
      return;
    }

  if (!StrCmp(ch->Name, argument))
    {
      ch->Echo("That's already your name!\r\n");
      return;
    }

  for ( tmp = FirstCharacter; tmp; tmp = tmp->Next )
    {
      if (!StrCmp(argument, tmp->Name))
        break;
    }

  if ( tmp )
    {
      ch->Echo("That name is already taken.  Please choose another.\r\n");
      return;
    }

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(argument[0]),
           Capitalize( argument ) );
  if ( stat( fname, &fst ) != -1 )
    {
      ch->Echo("That name is already taken. Please choose another.\r\n");
      return;
    }

  FreeMemory( ch->Name );
  ch->Name = CopyString( argument );
  sprintf( buf, "%s the %s",ch->Name,
           RaceTable[ch->Race].Name );
  SetCharacterTitle( ch, buf );

  ch->Echo("Your name has been changed. Please apply again.\r\n");
  ch->PCData->AuthState = 1;
}

