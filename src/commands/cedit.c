#include "mud.h"
#include "character.h"

/*
 * Command editor/displayer/save/delete                         -Thoric
 */
void do_cedit( Character *ch, char *argument )
{
  Command *command;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  SetCharacterColor( AT_IMMORT, ch );

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Syntax: cedit save\r\n", ch );
      if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
          SendToCharacter( "Syntax: cedit <command> create [code]\r\n", ch );
          SendToCharacter( "Syntax: cedit <command> delete\r\n", ch );
          SendToCharacter( "Syntax: cedit <command> show\r\n", ch );
          SendToCharacter( "Syntax: cedit <command> [field]\r\n", ch );
          SendToCharacter( "\r\nField being one of:\r\n", ch );
          SendToCharacter( "  level position log code\r\n", ch );
        }

      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg1, "save" ) )
    {
      save_commands();
      SendToCharacter( "Saved.\r\n", ch );
      return;
    }

  command = GetCommand( arg1 );

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM && !StrCmp( arg2, "create" ) )
    {
      if ( command )
        {
          SendToCharacter( "That command already exists!\r\n", ch );
          return;
        }

      AllocateMemory( command, Command, 1 );
      command->name = CopyString( arg1 );
      command->level = GetTrustLevel(ch);

      if ( *argument )
        OneArgument(argument, arg2);
      else
        sprintf( arg2, "do_%s", arg1 );

      command->do_fun = skill_function( arg2 );
      AddCommand( command );
      SendToCharacter( "Command added.\r\n", ch );

      if ( command->do_fun == skill_notfound )
        {
          ChPrintf( ch, "Code %s not found.  Set to no code.\r\n", arg2 );
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
      SendToCharacter( "Command not found.\r\n", ch );
      return;
    }
  else
    if ( command->level > GetTrustLevel(ch) )
      {
        SendToCharacter( "You cannot touch this command.\r\n", ch );
        return;
      }

  if ( arg2[0] == '\0' || !StrCmp( arg2, "show" ) )
    {
      ChPrintf( ch, "Command:  %s\r\nLevel:    %d\r\nPosition: %d\r\nLog:      %d\r\nCode:     %s\r\n",
                 command->name, command->level, command->position, command->log,
                 command->fun_name);

      if ( command->userec.num_uses )
        SendTimer(&command->userec, ch);

      return;
    }

  if ( GetTrustLevel(ch) <= LEVEL_SUB_IMPLEM )
    {
      do_cedit( ch, "" );
      return;
    }

  if ( !StrCmp( arg2, "delete" ) )
    {
      UnlinkCommand( command );
      FreeCommand( command );
      SendToCharacter( "Deleted.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "code" ) )
    {
      DO_FUN *fun = skill_function( argument );

      if ( StringPrefix( "do_", argument ) || fun == skill_notfound )
        {
	  SendToCharacter( "Code not found.\r\n", ch );
          return;
        }

      command->do_fun = fun;
      FreeMemory( command->fun_name );
      command->fun_name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "level" ) )
    {
      int level = atoi( argument );

      if ( level < 0 || level > GetTrustLevel(ch) )
        {
          SendToCharacter( "Level out of range.\r\n", ch );
          return;
        }
      command->level = level;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "log" ) )
    {
      int log_type = atoi( argument );

      if ( log_type < 0 || log_type > LOG_COMM )
        {
          SendToCharacter( "Log out of range.\r\n", ch );
          return;
        }

      command->log = log_type;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "position" ) )
    {
      int position = atoi( argument );

      if ( position < 0 || position > POS_DRAG )
	{
          SendToCharacter( "Position out of range.\r\n", ch );
          return;
        }
      command->position = position;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      bool relocate;

      OneArgument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
          SendToCharacter( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != command->name[0] )
        {
          UnlinkCommand( command );
          relocate = true;
        }
      else
        relocate = false;
      if ( command->name )
        FreeMemory( command->name );
      command->name = CopyString( arg1 );
      if ( relocate )
        AddCommand( command );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_cedit( ch, "" );
}
