#include "mud.h"

void do_bstat( Character *ch, char *argument )
{
  Board *board = NULL;
  bool found = false;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: bstat <board filename>\r\n", ch );
      return;
    }

  for ( board = first_board; board; board = board->Next )
    {
      if ( !StrCmp( arg, board->NoteFile ) )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      SendToCharacter( "Board not found.\r\n", ch );
      return;
    }

  Echo( ch, "%-12s Vnum: %5d Read: %2d Post: %2d Rmv: %2d Max: %2d Posts: %d Type: %d\r\n",
             board->NoteFile,   board->BoardObject,
             board->MinReadLevel,      board->MinPostLevel,
             board->MinRemoveLevel, board->MaxPosts,
             board->NumberOfPosts, board->Type );

  Echo( ch, "Read_group: %-15s Post_group: %-15s \r\nExtra_readers: %-10s\r\n",
             board->ReadGroup, board->PostGroup, board->ExtraReaders );
}
