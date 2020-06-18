#include "mud.hpp"
#include "board.hpp"
#include "character.hpp"
#include "repos/boardrepository.hpp"

void do_bset( std::shared_ptr<Character> ch, std::string argument )
{
  std::shared_ptr<Board> board;
  std::string arg1;
  std::string arg2;
  int value = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo( "Usage: bset <board name> <field> value\r\n" );
      ch->Echo( "\r\nField being one of:\r\n" );
      ch->Echo( "  vnum read post remove maxpost name type\r\n" );
      ch->Echo( "  read_group post_group extra_readers extra_removers\r\n" );
      return;
    }

  value = strtol( argument.c_str(), nullptr, 10 );
  board = GetBoard( arg1 );

  if( board == nullptr )
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
      if ( argument.empty() )
        {
          ch->Echo( "No group specified.\r\n" );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	board->ReadGroup.erase();
      else
        board->ReadGroup = argument;

      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "post_group" ) )
    {
      if ( argument.empty() )
        {
          ch->Echo( "No group specified.\r\n" );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
        board->PostGroup.erase();
      else
        board->PostGroup = argument;

      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "extra_removers" ) )
    {
      if ( argument.empty() )
        {
          ch->Echo( "No names specified.\r\n" );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
          board->ExtraRemovers.erase();
	}
      else
	{
          board->ExtraRemovers += " " + argument;
        }
      
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "extra_readers" ) )
    {
      if ( argument.empty() )
        {
          ch->Echo( "No names specified.\r\n" );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
          board->ExtraReaders.erase();
	}
      else
	{
          board->ExtraReaders += " " + argument;
        }
      
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if ( argument.empty() )
        {
          ch->Echo( "No name specified.\r\n" );
          return;
        }

      if( GetBoard( argument ) )
	{
	  ch->Echo( "There's already another board with that name.\r\n" );
	  return;
	}
      
      unlink( GetBoardFilename( board ).c_str() );
      board->Name = argument;
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
      if(!StrCmp(argument, "mail"))
        {
          value = BOARD_MAIL;
        }
      else if(!StrCmp(argument, "note"))
        {
          value = BOARD_NOTE;
        }
      
      if ( value < 0 || value > 1 )
        {
          ch->Echo( "Value out of range. Type \"mail\" or \"note\"\r\n" );
          return;
        }

      board->Type = value;
      Boards->Save(board);
      ch->Echo( "Done.\r\n" );
      return;
    }

  do_bset( ch, "" );
}

