#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"

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
      ch->Echo( "Usage: bset <board name> <field> value\r\n" );
      ch->Echo( "\r\nField being one of:\r\n" );
      ch->Echo( "  vnum read post remove maxpost name type\r\n" );
      ch->Echo( "  read_group post_group extra_readers extra_removers\r\n" );
      return;
    }

  value = atoi( argument );

  board = GetBoard( arg1 );

  if( !board )
    {
      ch->Echo( "Board not found.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "vnum" ) )
    {
      if ( !GetProtoObject(value) )
        {
          ch->Echo( "No such object.\r\n" );
          return;
        }

      board->BoardObject = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "read" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "Value out of range.\r\n" );
          return;
        }

      board->MinReadLevel = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "read_group" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "No group specified.\r\n" );
          return;
        }

      FreeMemory( board->ReadGroup );

      if ( !StrCmp( argument, "none" ) )
	board->ReadGroup = CopyString( "" );
      else
        board->ReadGroup = CopyString( argument );

      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "post_group" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "No group specified.\r\n" );
          return;
        }

      FreeMemory( board->PostGroup );

      if ( !StrCmp( argument, "none" ) )
        board->PostGroup = CopyString( "" );
      else
        board->PostGroup = CopyString( argument );

      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "extra_removers" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "No names specified.\r\n" );
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
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "extra_readers" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "No names specified.\r\n" );
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
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          ch->Echo( "No name specified.\r\n" );
          return;
        }

      if( GetBoard( argument ) )
	{
	  ch->Echo( "There's already another board with that name.\r\n" );
	  return;
	}
      
      unlink( GetBoardFilename( board ) );
      FreeMemory( board->Name );
      board->Name = CopyString( argument );
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "post" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "Value out of range.\r\n" );
          return;
        }

      board->MinPostLevel = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "remove" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          ch->Echo( "Value out of range.\r\n" );
          return;
        }

      board->MinRemoveLevel = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "maxpost" ) )
    {
      if ( value < 1 || value > 1000 )
        {
          ch->Echo( "Value out of range.\r\n" );
          return;
        }

      board->MaxPosts = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }
  if ( !StrCmp( arg2, "type" ) )
    {
      if ( value < 0 || value > 1 )
        {
          ch->Echo( "Value out of range.\r\n" );
          return;
        }

      board->Type = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  do_bset( ch, "" );
}

