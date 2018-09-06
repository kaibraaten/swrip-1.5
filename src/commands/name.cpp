#include <cctype>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_name( Character *ch, std::string argument )
{
  char fname[1024];
  struct stat fst;
  Character *tmp = nullptr;
  char buf[MAX_STRING_LENGTH];

  if ( IsAuthed(ch) || ch->PCData->AuthState != 2)
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if( argument.empty() )
    {
      ch->Echo( "Change your name to what?\r\n" );
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
      ch->Echo("That name is already taken. Please choose another.\r\n");
      return;
    }

  sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(argument[0]),
           Capitalize( ToLower(argument) ).c_str() );

  if ( stat( fname, &fst ) != -1 )
    {
      ch->Echo("That name is already taken. Please choose another.\r\n");
      return;
    }

  ch->Name = argument;
  sprintf( buf, "%s the %s",ch->Name.c_str(),
           RaceTable[ch->Race].Name );
  SetCharacterTitle( ch, buf );

  ch->Echo("Your name has been changed. Please apply again.\r\n");
  ch->PCData->AuthState = 1;
}
