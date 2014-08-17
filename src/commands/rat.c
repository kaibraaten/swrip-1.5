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

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Syntax: rat <start> <end> <command>\r\n", ch );
      return;
    }

  Start = atoi( arg1 ); End = atoi( arg2 );

  if ( Start < 1 || End < Start || Start > End || Start == End || End > 32767 )
    {
      send_to_char( "Invalid range.\r\n", ch );
      return;
    }

  if ( !str_cmp( argument, "quit" ) )
    {
      send_to_char( "I don't think so!\r\n", ch );
      return;
    }

  original = ch->in_room;

  for ( vnum = Start; vnum <= End; vnum++ )
    {
      if ( (location = get_room_index(vnum)) == NULL )
        continue;

      char_from_room( ch );
      char_to_room( ch, location );
      interpret( ch, argument );
    }

  char_from_room( ch );
  char_to_room( ch, original );
  send_to_char( "Done.\r\n", ch );
}
