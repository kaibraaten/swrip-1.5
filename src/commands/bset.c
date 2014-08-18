#include "mud.h"

void do_bset( Character *ch, char *argument )
{
  Board *board = NULL;
  bool found = false;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int value = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
      send_to_char( "Usage: bset <board filename> <field> value\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  vnum read post remove maxpost filename type\r\n", ch );
      send_to_char( "  read_group post_group extra_readers extra_removers\r\n", ch );
      return;
    }

  value = atoi( argument );

  for ( board = first_board; board; board = board->next )
    {
      if ( !StrCmp( arg1, board->note_file ) )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      send_to_char( "Board not found.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "vnum" ) )
    {
      if ( !get_obj_index(value) )
        {
          send_to_char( "No such object.\r\n", ch );
          return;
        }

      board->board_obj = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "read" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          send_to_char( "Value out of range.\r\n", ch );
          return;
        }

      board->min_read_level = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "read_group" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "No group specified.\r\n", ch );
          return;
        }

      FreeMemory( board->read_group );

      if ( !StrCmp( argument, "none" ) )
	board->read_group = CopyString( "" );
      else
        board->read_group = CopyString( argument );

      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "post_group" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "No group specified.\r\n", ch );
          return;
        }

      FreeMemory( board->post_group );

      if ( !StrCmp( argument, "none" ) )
        board->post_group = CopyString( "" );
      else
        board->post_group = CopyString( argument );

      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "extra_removers" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "No names specified.\r\n", ch );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
	  buf[0] = '\0';
	}
      else
	{
	  sprintf( buf, "%s %s", board->extra_removers, argument );
	}

      FreeMemory( board->extra_removers );
      board->extra_removers = CopyString( buf );
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "extra_readers" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "No names specified.\r\n", ch );
          return;
        }

      if ( !StrCmp( argument, "none" ) )
	{
	  buf[0] = '\0';
	}
      else
	{
	  sprintf( buf, "%s %s", board->extra_readers, argument );
	}

      FreeMemory( board->extra_readers );
      board->extra_readers = CopyString( buf );
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "No filename specified.\r\n", ch );
          return;
        }

      FreeMemory( board->note_file );
      board->note_file = CopyString( argument );
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "post" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          send_to_char( "Value out of range.\r\n", ch );
          return;
        }

      board->min_post_level = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "remove" ) )
    {
      if ( value < 0 || value > MAX_LEVEL )
        {
          send_to_char( "Value out of range.\r\n", ch );
          return;
        }

      board->min_remove_level = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "maxpost" ) )
    {
      if ( value < 1 || value > 1000 )
        {
          send_to_char( "Value out of range.\r\n", ch );
          return;
        }

      board->max_posts = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }
  if ( !StrCmp( arg2, "type" ) )
    {
      if ( value < 0 || value > 1 )
        {
          send_to_char( "Value out of range.\r\n", ch );
          return;
        }

      board->type = value;
      WriteBoardFile();
      send_to_char( "Done.\r\n", ch );
      return;
    }

  do_bset( ch, "" );
}
