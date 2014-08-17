#include "mud.h"
#include "character.h"

/*
 * Command editor/displayer/save/delete                         -Thoric
 */
void do_cedit( Character *ch, char *argument )
{
  CMDTYPE *command;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  set_char_color( AT_IMMORT, ch );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: cedit save\r\n", ch );
      if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
          send_to_char( "Syntax: cedit <command> create [code]\r\n", ch );
          send_to_char( "Syntax: cedit <command> delete\r\n", ch );
          send_to_char( "Syntax: cedit <command> show\r\n", ch );
          send_to_char( "Syntax: cedit <command> [field]\r\n", ch );
          send_to_char( "\r\nField being one of:\r\n", ch );
          send_to_char( "  level position log code\r\n", ch );
        }

      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg1, "save" ) )
    {
      save_commands();
      send_to_char( "Saved.\r\n", ch );
      return;
    }

  command = find_command( arg1 );

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM && !StrCmp( arg2, "create" ) )
    {
      if ( command )
        {
          send_to_char( "That command already exists!\r\n", ch );
          return;
        }

      CREATE( command, CMDTYPE, 1 );
      command->name = CopyString( arg1 );
      command->level = GetTrustLevel(ch);

      if ( *argument )
        OneArgument(argument, arg2);
      else
        sprintf( arg2, "do_%s", arg1 );

      command->do_fun = skill_function( arg2 );
      add_command( command );
      send_to_char( "Command added.\r\n", ch );

      if ( command->do_fun == skill_notfound )
        {
          ch_printf( ch, "Code %s not found.  Set to no code.\r\n", arg2 );
          command->fun_name = CopyString( "" );
        }
      else
        {
          command->fun_name = CopyString( arg2 );
        }

      return;
    }

  if ( !command )
    {
      send_to_char( "Command not found.\r\n", ch );
      return;
    }
  else
    if ( command->level > GetTrustLevel(ch) )
      {
        send_to_char( "You cannot touch this command.\r\n", ch );
        return;
      }

  if ( arg2[0] == '\0' || !StrCmp( arg2, "show" ) )
    {
      ch_printf( ch, "Command:  %s\r\nLevel:    %d\r\nPosition: %d\r\nLog:      %d\r\nCode:     %s\r\n",
                 command->name, command->level, command->position, command->log,
                 command->fun_name);

      if ( command->userec.num_uses )
        sStopTimer(&command->userec, ch);

      return;
    }

  if ( GetTrustLevel(ch) <= LEVEL_SUB_IMPLEM )
    {
      do_cedit( ch, "" );
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      unlink_command( command );
      free_command( command );
      send_to_char( "Deleted.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "code" ) )
    {
      DO_FUN *fun = skill_function( argument );

      if ( StringPrefix( "do_", argument ) || fun == skill_notfound )
        {
	  send_to_char( "Code not found.\r\n", ch );
          return;
        }

      command->do_fun = fun;
      DISPOSE( command->fun_name );
      command->fun_name = CopyString( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "level" ) )
    {
      int level = atoi( argument );

      if ( level < 0 || level > GetTrustLevel(ch) )
        {
          send_to_char( "Level out of range.\r\n", ch );
          return;
        }
      command->level = level;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "log" ) )
    {
      int log_type = atoi( argument );

      if ( log_type < 0 || log_type > LOG_COMM )
        {
          send_to_char( "Log out of range.\r\n", ch );
          return;
        }

      command->log = log_type;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "position" ) )
    {
      int position = atoi( argument );

      if ( position < 0 || position > POS_DRAG )
	{
          send_to_char( "Position out of range.\r\n", ch );
          return;
        }
      command->position = position;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      bool relocate;

      OneArgument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
          send_to_char( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != command->name[0] )
        {
          unlink_command( command );
          relocate = true;
        }
      else
        relocate = false;
      if ( command->name )
        DISPOSE( command->name );
      command->name = CopyString( arg1 );
      if ( relocate )
        add_command( command );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_cedit( ch, "" );
}
