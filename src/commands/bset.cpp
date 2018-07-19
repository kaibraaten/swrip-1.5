#include "mud.hpp"
#include "board.hpp"

void do_bset( Character *ch, char *argument )
{
  Board *board = NULL;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int value = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Usage: bset <board name> <field> value\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  vnum read post remove maxpost name type\r\n", ch );
      SendToCharacter( "  read_group post_group extra_readers extra_removers\r\n", ch );
      return;
    }

  value = atoi( argument );

  board = GetBoard( arg1 );

  if( !board )
    {
      SendToCharacter( "Board not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "vnum" ) )
    {
      if ( !GetProtoObject(value) )
        {
          SendToCharacter( "No such object.\r\n", ch );
          return;
        }

      board->BoardObject = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "read" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "Value out of range.\r\n", ch );
          return;
        }

      board->MinReadLevel = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "read_group" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "No group specified.\r\n", ch );
          return;
        }

      FreeMemory( board->ReadGroup );

      if ( !StrCmp( argument, "none" ) )
	board->ReadGroup = CopyString( "" );
      else
        board->ReadGroup = CopyString( argument );

      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "post_group" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "No group specified.\r\n", ch );
          return;
        }

      FreeMemory( board->PostGroup );

      if ( !StrCmp( argument, "none" ) )
        board->PostGroup = CopyString( "" );
      else
        board->PostGroup = CopyString( argument );

      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "extra_removers" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "No names specified.\r\n", ch );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
	  buf[0] = '\0';
	}
      else
	{
	  sprintf( buf, "%s %s", board->ExtraRemovers, argument );
	}

      FreeMemory( board->ExtraRemovers );
      board->ExtraRemovers = CopyString( buf );
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "extra_readers" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "No names specified.\r\n", ch );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
	  buf[0] = '\0';
	}
      else
	{
	  sprintf( buf, "%s %s", board->ExtraReaders, argument );
	}

      FreeMemory( board->ExtraReaders );
      board->ExtraReaders = CopyString( buf );
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "No name specified.\r\n", ch );
          return;
        }

      if( GetBoard( argument ) )
	{
	  Echo( ch, "There's already another board with that name.\r\n" );
	  return;
	}
      
      unlink( GetBoardFilename( board ) );
      FreeMemory( board->Name );
      board->Name = CopyString( argument );
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "post" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "Value out of range.\r\n", ch );
          return;
        }

      board->MinPostLevel = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "remove" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          SendToCharacter( "Value out of range.\r\n", ch );
          return;
        }

      board->MinRemoveLevel = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "maxpost" ) )
    {
      if ( value < 1 || value > 1000 )
        {
          SendToCharacter( "Value out of range.\r\n", ch );
          return;
        }

      board->MaxPosts = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }
  if ( !StrCmp( arg2, "type" ) )
    {
      if ( value < 0 || value > 1 )
        {
          SendToCharacter( "Value out of range.\r\n", ch );
          return;
        }

      board->Type = value;
      Boards->Save(board);
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  do_bset( ch, "" );
}
