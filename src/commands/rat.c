#include "mud.h"
#include "character.h"

void do_rat( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Room *original = NULL;
  int Start = 0;
  int End = 0;
  int vnum = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
      SendToCharacter( "Syntax: rat <start> <end> <command>\r\n", ch );
      return;
    }

  Start = atoi( arg1 ); End = atoi( arg2 );

  if ( Start < 1 || End < Start || Start > End || Start == End || End > 32767 )
    {
      SendToCharacter( "Invalid range.\r\n", ch );
      return;
    }

  if ( !StrCmp( argument, "quit" ) )
    {
      SendToCharacter( "I don't think so!\r\n", ch );
      return;
    }

  original = ch->in_room;

  for ( vnum = Start; vnum <= End; vnum++ )
    {
      if ( (location = GetRoom(vnum)) == NULL )
        continue;

      CharacterFromRoom( ch );
      CharacterToRoom( ch, location );
      Interpret( ch, argument );
    }

  CharacterFromRoom( ch );
  CharacterToRoom( ch, original );
  SendToCharacter( "Done.\r\n", ch );
}
